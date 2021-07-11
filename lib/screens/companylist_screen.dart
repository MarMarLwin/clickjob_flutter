import 'package:clickjob/common/constant.dart';
import 'package:clickjob/providers/EmployerList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CompanyListScreen extends StatefulWidget {
  const CompanyListScreen({Key? key}) : super(key: key);

  @override
  _CompanyListScreenState createState() => _CompanyListScreenState();
}

class _CompanyListScreenState extends State<CompanyListScreen> {
  late bool isLoading;
  late String searchKeywork;
  late String workingStateID;
  late String industryId;
  late String pageNo;

  @override
  void initState() {
    isLoading = true;
    searchKeywork = '';
    workingStateID = '';
    industryId = '';
    pageNo = '1';
    super.initState();
  }

  @override
  void didChangeDependencies() {
    Provider.of<EmployerList>(context)
        .getEmployers(
            searchKeywork, workingStateID, industryId, pageNo, Constants.sign)
        .then((_) {
      isLoading = false;
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final pageData = Provider.of<EmployerList>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'By Location',
                      filled: true,
                      fillColor: Colors.white70,
                      enabledBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                      focusedBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                      contentPadding:
                          const EdgeInsets.only(top: 30, left: 10, right: 10)),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'By Industry',
                      filled: true,
                      fillColor: Colors.white70,
                      enabledBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                      focusedBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                      contentPadding:
                          const EdgeInsets.only(top: 30, left: 10, right: 10)),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: 'By Company Name',
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
                    Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green),
                        ),
                        onPressed: null,
                        child: Text(
                          'Search',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: isLoading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 5,
                                  mainAxisSpacing: 5),
                          itemCount: pageData.employerList.length,
                          itemBuilder: (context, index) {
                            return GridTile(
                              child: Padding(
                                padding: const EdgeInsets.all(0),
                                child: Container(
                                  margin: const EdgeInsets.all(0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: Colors.blueGrey),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      CircleAvatar(
                                        child: Image(
                                          image: NetworkImage(pageData
                                              .employerList[index]
                                              .UploadCompanyLogo!),
                                        ),
                                        radius: 60,
                                        backgroundColor: Colors.white54,
                                      ),
                                      Text(
                                        pageData
                                            .employerList[index].CompanyName!,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue),
                                      ),
                                      Text(
                                        pageData.employerList[index].Address!,
                                        style: TextStyle(fontSize: 12),
                                        overflow: TextOverflow.ellipsis,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
