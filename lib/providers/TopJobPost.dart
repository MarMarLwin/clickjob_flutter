import 'dart:convert';

import 'package:clickjob/common/constant.dart';

import '../models/Post.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;

class TopJobPost with ChangeNotifier {
  List<Post> topJobList = [];

  List<Post> getTopJob() {
    return [...topJobList];
  }

  Future<void> getTopJobList(String sign) async {
    List<Post> dataList = [];
    try {
      var envelop = '''<?xml version="1.0" encoding="utf-8"?>
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
    <GetLatestPosts xmlns="http://tempuri.org/">
      <sign>$sign</sign>
    </GetLatestPosts>
  </soap:Body>
</soap:Envelope>''';

      await http
          .post(
        Uri.parse(Constants.url),
        headers: {
          "Content-Type": "text/xml; charset=utf-8",
          "SOAPAction": "http://tempuri.org/GetLatestPosts",
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
            .findAllElements('GetLatestPostsResult')
            .first
            .children
            .first;

        var jsonData = jsonDecode(responseDataList.text);
        var result = jsonDecode(jsonData["ResponseData"]);
        if (result.length > 0) {
          for (int i = 0; i < result.length; i++) {
            if (result[i] != null) {
              Map<String, dynamic> map = result[i];
              var postData = Post.fromJSON(map);
              dataList.add(postData);
            }
          }
          topJobList = dataList;
          notifyListeners();
        }
      });

      print(topJobList);
    } catch (error) {
      print(error);
      throw (error);
    }
  }
}
