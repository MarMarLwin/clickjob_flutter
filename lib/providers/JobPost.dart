import 'dart:convert';

import 'package:clickjob/common/constant.dart';
import 'package:clickjob/models/Post.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;

class JobPost with ChangeNotifier {
  late Post jobPost;
  String employeeId = "";
  String sign = Constants.sign;
  late String isAlreadyApplied;
  late String isAlreadySaved;
  late String noOfApplicant;

  Future<void> getJobPost(String jobId) async {
    try {
      var envelop = '''<?xml version="1.0" encoding="utf-8"?>
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
    <GetPost xmlns="http://tempuri.org/">
      <JobID>$jobId</JobID>
      <EmployeeID></EmployeeID>
      <sign>${Constants.sign}</sign>
    </GetPost>
  </soap:Body>
</soap:Envelope>''';

      await http
          .post(
        Uri.parse(Constants.url),
        headers: {
          "Content-Type": "text/xml; charset=utf-8",
          "SOAPAction": "http://tempuri.org/GetPost",
          "Host": "43.228.125.24"
        },
        body: utf8.encode(envelop),
        /*encoding: Encoding.getByName("UTF-8")*/
      )
          .then((value) {
        //List<dynamic> result = [];
        var rawXmlResponse = value.body;
        xml.XmlDocument parsedXml = xml.parse(rawXmlResponse);
        var responseDataList =
            parsedXml.findAllElements('GetPostResult').first.children.first;
        /*.parent
            .children
            .first;*/

        var jsonData = jsonDecode(responseDataList.text);
        var result = jsonDecode(jsonData["ResponseData"]);
        if (result.length > 0) {
          isAlreadyApplied = result['IsAlreadyApplied'].toString();
          isAlreadySaved = result['IsAlreadySavedJob'].toString();
          noOfApplicant = result['NoOfApplicant'];
          var post = result['post'];

          if (post != null) {
            Map<String, dynamic> map = post;
            jobPost = Post.fromJSON(map);
          }
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
