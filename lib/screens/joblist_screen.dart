import 'package:clickjob/screens/job_detail_screen.dart';
import 'package:provider/provider.dart';
import '../common/constant.dart';
import '../providers/JobPostList.dart';
import 'package:flutter/material.dart';

class JobListScreen extends StatefulWidget {
  const JobListScreen({Key? key}) : super(key: key);

  @override
  _JobListScreenState createState() => _JobListScreenState();
}

class _JobListScreenState extends State<JobListScreen> {
  late bool isLoading;
  late String searchKeywork;
  late String workingStateID;
  late String jobCategoryID;
  late String employmentType;
  late String salaryRange;
  late String pageNo;

  @override
  void initState() {
    isLoading = true;
    searchKeywork = '';
    workingStateID = '';
    jobCategoryID = '';
    employmentType = '';
    salaryRange = '';
    pageNo = '1';
    super.initState();
  }

  @override
  void didChangeDependencies() {
    Provider.of<JobPostList>(context)
        .getPostListWithPagination(searchKeywork, workingStateID, jobCategoryID,
            employmentType, salaryRange, pageNo, Constants.sign)
        .then((_) {
      isLoading = false;
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final pageData = Provider.of<JobPostList>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Search Job Here',
                          filled: true,
                          fillColor: Colors.white70,
                          enabledBorder:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          focusedBorder:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          contentPadding: const EdgeInsets.only(
                              top: 30, left: 10, right: 10)),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                ),
                Container(
                  child: isLoading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.white54),
                          ),
                          child: Expanded(
                            child: ListView.separated(
                                physics: const NeverScrollableScrollPhysics(),
                                padding: const EdgeInsets.all(0),
                                shrinkWrap: true,
                                itemBuilder: (ctx, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(
                                        context,
                                        JobDetailScreen.routeName,
                                        arguments:
                                            pageData.postList[index].JobID,
                                      );
                                    },
                                    child: Card(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Hero(
                                              tag: 'companylogo',
                                              child: Image(
                                                image: NetworkImage(pageData
                                                    .postList[index]
                                                    .UploadCompanyLogo!),
                                                fit: BoxFit.fitWidth,
                                                loadingBuilder:
                                                    (context, child, progress) {
                                                  return progress == null
                                                      ? child
                                                      : Container(
                                                          height: 70,
                                                          width: 70,
                                                          child:
                                                              CircularProgressIndicator());
                                                },
                                                height: 70,
                                                width: 70,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  pageData
                                                      .postList[index].Title!,
                                                  style: TextStyle(
                                                      color: Colors.blueAccent,
                                                      fontSize: 15),
                                                ),
                                                Text(
                                                  pageData.postList[index]
                                                      .CompanyName!,
                                                  style: TextStyle(
                                                      color: Colors.green,
                                                      fontSize: 15),
                                                ),
                                                Text(
                                                  pageData
                                                      .postList[index].Address!,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                )
                                              ],
                                            ),
                                          ),
                                          Icon(
                                            Icons.navigate_next,
                                            color: Colors.green,
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder: (ctx, index) {
                                  return SizedBox(
                                    height: 0.5,
                                  );
                                },
                                itemCount: pageData.postList.length),
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
