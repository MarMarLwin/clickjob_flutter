import 'dart:convert';
import '../common/constant.dart';
import '../models/Post.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;

class JobPostList with ChangeNotifier {
  late String totalRecord, totalPage, currentPageNo;
  List<Post> postList = [];

  List<Post> getPostList() {
    return [...postList];
  }

  Future<void> getPostListWithPagination(
      String searchKey,
      String workingStateID,
      String jobCategoryID,
      String employmentType,
      String salaryRange,
      String pageNo,
      String sign) async {
    List<Post> dataList = [];
    try {
      var envelop = '''<?xml version="1.0" encoding="utf-8"?>
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
    <GetPosts xmlns="http://tempuri.org/">
      <searchKey>$searchKey</searchKey>
      <workingStateID>$workingStateID</workingStateID>
      <JobCategoryID>$jobCategoryID</JobCategoryID>
      <EmploymentType>$employmentType</EmploymentType>
      <SalaryRange>$salaryRange</SalaryRange>
      <page_no>$pageNo</page_no>
      <sign>$sign</sign>
    </GetPosts>
  </soap:Body>
</soap:Envelope>''';

      var uri = Uri.parse(Constants.url);
      await http
          .post(
        uri,
        headers: {
          "Content-Type": "text/xml; charset=utf-8",
          "SOAPAction": "http://tempuri.org/GetPosts",
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
            parsedXml.findAllElements('GetPostsResult').first.children.first;
        /*.parent
            .children
            .first;*/

        var jsonData = jsonDecode(responseDataList.text);
        var result = jsonDecode(jsonData["ResponseData"]);
        if (result.length > 0) {
          totalRecord = result['totalRecord'];
          totalPage = result['totalPage'];
          currentPageNo = result['currentPageNo'];
          var postData = result['postList'];

          //pageData = PostListWithPignation.fromJSON(result);
          for (int i = 0; i < postData.length; i++) {
            if (postData[i] != null) {
              Map<String, dynamic> map = postData[i];
              var post = Post.fromJSON(map);
              dataList.add(post);
            }
          }
          postList = dataList;
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
