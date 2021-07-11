import 'dart:convert';
import '../common/constant.dart';
import '../models/Employer.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;

class TopEmployers with ChangeNotifier {
  List<Employer> topEmployers = [];

  List<Employer> getTopEmployer() {
    return [...topEmployers];
  }

  Future<void> getTopEmployerList(String sign) async {
    List<Employer> dataList = [];
    try {
      var envelop = '''<?xml version="1.0" encoding="utf-8"?>
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
    <GetLatestEmoloyerList xmlns="http://tempuri.org/">
      <sign>$sign</sign>
    </GetLatestEmoloyerList>
  </soap:Body>
</soap:Envelope>''';

      await http
          .post(
        Uri.parse(Constants.url),
        headers: {
          "Content-Type": "text/xml; charset=utf-8",
          "SOAPAction": "http://tempuri.org/GetLatestEmoloyerList",
          "Host": "43.228.125.24"
        },
        body: utf8.encode(envelop),
        /*encoding: Encoding.getByName("UTF-8")*/
      )
          .then((value) {
        //List<dynamic> result = [];
        var rawXmlResponse = value.body;
        xml.XmlDocument parsedXml = xml.XmlDocument.parse(rawXmlResponse);
        var responseDataList = parsedXml
            .findAllElements('GetLatestEmoloyerListResult')
            .first
            .children
            .first;

        var jsonData = jsonDecode(responseDataList.text);
        var result = jsonDecode(jsonData["ResponseData"]);
        if (result.length > 0) {
          for (int i = 0; i < result.length; i++) {
            if (result[i] != null) {
              Map<String, dynamic> map = result[i];
              var employerData = Employer.fromJSON(map);
              dataList.add(employerData);
            }
          }
          topEmployers = dataList;
          notifyListeners();
        }
      });

      print(topEmployers);
    } catch (error) {
      print(error);
      throw (error);
    }
  }
}
