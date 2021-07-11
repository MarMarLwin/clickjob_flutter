import 'dart:convert';
import 'package:clickjob/common/constant.dart';
import 'package:clickjob/models/Employer.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;

class EmployerList with ChangeNotifier {
  List<Employer> employerList = [];
  late String totalRecord, totalPage, currentPageNo;
  List<Employer> getEmployerList() {
    return [...employerList];
  }

  Future<void> getEmployers(String searchCompanyName, String workingStateID,
      String industryId, String page_no, String sign) async {
    List<Employer> dataList = [];
    try {
      var envelop = '''<?xml version="1.0" encoding="utf-8"?>
        <soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
          <soap:Body>
            <GetEmployerList xmlns="http://tempuri.org/">
              <searchCompanyName>$searchCompanyName</searchCompanyName>
              <workingStateID>$workingStateID</workingStateID>
              <industryId>$industryId</industryId>
              <page_no>$page_no</page_no>
              <sign>$sign</sign>
            </GetEmployerList>
          </soap:Body>
        </soap:Envelope>''';

      await http
          .post(
        Uri.parse(Constants.url),
        headers: {
          "Content-Type": "text/xml; charset=utf-8",
          "SOAPAction": "http://tempuri.org/GetEmployerList",
          "Host": "43.228.125.24"
        },
        body: utf8.encode(envelop),
        /*encoding: Encoding.getByName("UTF-8")*/
      )
          .then((value) {
        //List<dynamic> result = [];
        var rawXmlResponse = value.body;
        xml.XmlDocument parsedXml = xml.parse(rawXmlResponse);
        var responseDataList = parsedXml
            .findAllElements('GetEmployerListResult')
            .first
            .children
            .first;
        /*.parent
            .children
            .first;*/

        var jsonData = jsonDecode(responseDataList.text);
        var result = jsonDecode(jsonData["ResponseData"]);
        if (result.length > 0) {
          totalRecord = result['totalRecord'];
          totalPage = result['totalPage'];
          currentPageNo = result['currentPageNo'];
          var postData = result['employerList'];

          //pageData = PostListWithPignation.fromJSON(result);
          for (int i = 0; i < postData.length; i++) {
            if (postData[i] != null) {
              Map<String, dynamic> map = postData[i];
              var post = Employer.fromJSON(map);
              dataList.add(post);
            }
          }
          employerList = dataList;
          notifyListeners();
        }
        print(result);
      });
    } catch (error) {
      print(error);
      throw (error);
    }
  }
}
