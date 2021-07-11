import 'package:clickjob/providers/JobPost.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';

class JobDetailScreen extends StatefulWidget {
  static const routeName = '/jobDetailScreen';

  const JobDetailScreen({Key? key}) : super(key: key);

  @override
  _JobDetailScreenState createState() => _JobDetailScreenState();
}

class _JobDetailScreenState extends State<JobDetailScreen> {
  late bool isLoading;
  late String jobId;
  late FlutterLocalNotificationsPlugin localNotifications;

  @override
  void initState() {
    isLoading = true;
    jobId = "";
    super.initState();
    var androidInitialize = AndroidInitializationSettings('ic_logo');
    var iOSInitialize = IOSInitializationSettings();
    var initializationSettings = new InitializationSettings(
        android: androidInitialize, iOS: iOSInitialize);
    localNotifications = new FlutterLocalNotificationsPlugin();
    localNotifications.initialize(initializationSettings);
  }

  Future _showNotification() async {
    var androidDetails = new AndroidNotificationDetails('channelId',
        'Apply Job Success', 'Your cv is already sent to company!');
    var iOSDetails = new IOSNotificationDetails();
    var generalNotificationDetails =
        new NotificationDetails(android: androidDetails, iOS: iOSDetails);
    await localNotifications.show(
        0,
        'Job apply success',
        'Your application is already sent to company!',
        generalNotificationDetails);
  }

  @override
  void didChangeDependencies() {
    jobId = ModalRoute.of(context)!.settings.arguments.toString();
    Provider.of<JobPost>(context).getJobPost(jobId).then((_) {
      isLoading = false;
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final pageData = Provider.of<JobPost>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Job Detail'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: isLoading
                ? Center(child: CircularProgressIndicator())
                : Padding(
                    padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.all(5),
                                child: Column(children: <Widget>[
                                  Hero(
                                    tag: 'companylogo',
                                    child: Card(
                                      child: Image(
                                        image: NetworkImage(pageData
                                            .jobPost.UploadCompanyLogo!),
                                        fit: BoxFit.fitWidth,
                                        loadingBuilder:
                                            (context, child, progress) {
                                          return progress == null
                                              ? child
                                              : Container(
                                                  height: 100,
                                                  width: 100,
                                                  child:
                                                      CircularProgressIndicator());
                                        },
                                        width: 100,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'View Company',
                                    style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontSize: 14,
                                        decoration: TextDecoration.underline),
                                    textAlign: TextAlign.start,
                                  ),
                                ]),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      pageData.jobPost.Title!,
                                      style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.start,
                                      softWrap: true,
                                    ),
                                    Text(
                                      pageData.jobPost.CompanyName!,
                                      style: TextStyle(
                                          color: Colors.green, fontSize: 14),
                                      textAlign: TextAlign.start,
                                      softWrap: true,
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  TextButton(
                                    onPressed: null,
                                    child: Text(
                                      'Save',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    style: ButtonStyle(
                                      padding: MaterialStateProperty.all(
                                          EdgeInsets.zero),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.green),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: null,
                                    child: Text(
                                      'Apply',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    style: ButtonStyle(
                                        padding: MaterialStateProperty.all(
                                            EdgeInsets.zero),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.red)),
                                  ),
                                  TextButton(
                                    onPressed: null,
                                    child: Text(
                                      'Share',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    style: ButtonStyle(
                                      padding: MaterialStateProperty.all(
                                          EdgeInsets.zero),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.blueAccent),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Text(
                                    'Application(s)',
                                    style: TextStyle(fontSize: 14),
                                    textAlign: TextAlign.start,
                                    softWrap: true,
                                  ),
                                  Text(
                                    pageData.jobPost.ApplicantCounts!,
                                    style: TextStyle(fontSize: 14),
                                    textAlign: TextAlign.start,
                                    softWrap: true,
                                  ),
                                ],
                              ),
                              VerticalDivider(
                                color: Colors.blue,
                                thickness: 5,
                              ),
                              Column(
                                children: <Widget>[
                                  Text(
                                    'View(s)',
                                    style: TextStyle(fontSize: 14),
                                    textAlign: TextAlign.start,
                                    softWrap: true,
                                  ),
                                  Text(
                                    pageData.jobPost.ViewCount!,
                                    style: TextStyle(fontSize: 14),
                                    textAlign: TextAlign.start,
                                    softWrap: true,
                                  ),
                                ],
                              ),
                              VerticalDivider(
                                color: Colors.blue,
                                thickness: 5,
                              ),
                              Column(
                                children: <Widget>[
                                  Text(
                                    'Post Active(s)',
                                    style: TextStyle(fontSize: 14),
                                    textAlign: TextAlign.start,
                                    softWrap: true,
                                  ),
                                  Text(
                                    pageData.jobPost.PostTime!,
                                    style: TextStyle(fontSize: 14),
                                    textAlign: TextAlign.start,
                                    softWrap: true,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Text(
                            ' Job Description',
                            style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 14,
                                height: 1.5),
                            textAlign: TextAlign.start,
                            softWrap: false,
                          ),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                pageData.jobPost.JobScope!,
                                style: const TextStyle(
                                  fontSize: 14,
                                  height: 1.5,
                                ),
                                textAlign: TextAlign.start,
                                softWrap: true,
                              ),
                            ),
                          ),
                          Text(
                            'Job Requirements',
                            style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 14,
                                height: 1.5),
                            textAlign: TextAlign.start,
                            softWrap: true,
                          ),
                          Row(
                            children: <Widget>[
                              Flexible(
                                flex: 2,
                                fit: FlexFit.tight,
                                child: Text(
                                  'Experienced Level',
                                  style: TextStyle(fontSize: 14, height: 1.5),
                                  textAlign: TextAlign.start,
                                  softWrap: true,
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Flexible(
                                flex: 3,
                                fit: FlexFit.tight,
                                child: Text(
                                  pageData.jobPost.ExperiencedLevel!,
                                  style: TextStyle(fontSize: 14, height: 1.5),
                                  textAlign: TextAlign.start,
                                  softWrap: true,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Flexible(
                                flex: 2,
                                fit: FlexFit.tight,
                                child: Text(
                                  'Qualification',
                                  style: TextStyle(fontSize: 14, height: 1.5),
                                  textAlign: TextAlign.start,
                                  softWrap: true,
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Flexible(
                                flex: 3,
                                fit: FlexFit.tight,
                                child: Text(
                                  pageData.jobPost.EducationRequirement!,
                                  style: TextStyle(fontSize: 14, height: 1.5),
                                  textAlign: TextAlign.start,
                                  softWrap: true,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Job Details',
                            style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 14,
                                height: 1.5),
                            textAlign: TextAlign.start,
                            softWrap: true,
                          ),
                          Row(
                            children: <Widget>[
                              Flexible(
                                flex: 2,
                                fit: FlexFit.tight,
                                child: Text(
                                  'Gender',
                                  style: TextStyle(fontSize: 14, height: 1.5),
                                  textAlign: TextAlign.start,
                                  softWrap: true,
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Flexible(
                                flex: 3,
                                fit: FlexFit.tight,
                                child: Text(
                                  pageData.jobPost.Gender!,
                                  style: TextStyle(fontSize: 14, height: 1.5),
                                  textAlign: TextAlign.start,
                                  softWrap: true,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Flexible(
                                flex: 2,
                                fit: FlexFit.tight,
                                child: Text(
                                  'Salary',
                                  style: TextStyle(fontSize: 14, height: 1.5),
                                  textAlign: TextAlign.start,
                                  softWrap: true,
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Flexible(
                                flex: 3,
                                fit: FlexFit.tight,
                                child: Text(
                                  pageData.jobPost.SalaryRange!,
                                  style: TextStyle(fontSize: 14, height: 1.5),
                                  textAlign: TextAlign.start,
                                  softWrap: true,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Flexible(
                                flex: 2,
                                fit: FlexFit.tight,
                                child: Text(
                                  'Industry',
                                  style: TextStyle(fontSize: 14, height: 1.5),
                                  textAlign: TextAlign.start,
                                  softWrap: true,
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Flexible(
                                flex: 3,
                                fit: FlexFit.tight,
                                child: Text(
                                  pageData.jobPost.IndustryName!,
                                  style: TextStyle(fontSize: 14, height: 1.5),
                                  textAlign: TextAlign.start,
                                  softWrap: true,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Flexible(
                                flex: 2,
                                fit: FlexFit.tight,
                                child: Text(
                                  'Category',
                                  style: TextStyle(fontSize: 14, height: 1.5),
                                  textAlign: TextAlign.start,
                                  softWrap: true,
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Flexible(
                                flex: 3,
                                fit: FlexFit.tight,
                                child: Text(
                                  pageData.jobPost.JobCategoryName!,
                                  style: TextStyle(fontSize: 14, height: 1.5),
                                  textAlign: TextAlign.start,
                                  softWrap: true,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Flexible(
                                flex: 2,
                                fit: FlexFit.tight,
                                child: Text(
                                  'Employment Type',
                                  style: TextStyle(fontSize: 14, height: 1.5),
                                  textAlign: TextAlign.start,
                                  softWrap: true,
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Flexible(
                                flex: 3,
                                fit: FlexFit.tight,
                                child: Text(
                                  pageData.jobPost.EmploymentType!,
                                  style: TextStyle(fontSize: 14, height: 1.5),
                                  textAlign: TextAlign.start,
                                  softWrap: true,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Address',
                            style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 14,
                                height: 1.5),
                            textAlign: TextAlign.start,
                            softWrap: true,
                          ),
                          Text(
                            pageData.jobPost.Workaddress!,
                            style: TextStyle(fontSize: 14),
                            textAlign: TextAlign.start,
                            softWrap: true,
                          ),
                          ElevatedButton(
                            onPressed: () => _showNotification(),
                            child: Text(
                              'Apply Now',
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.green)),
                          )
                        ]),
                  ),
          ),
        ),
      ),
    );
  }
}
