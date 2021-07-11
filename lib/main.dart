import 'package:clickjob/providers/EmployerList.dart';
import 'package:clickjob/providers/JobPost.dart';
import 'package:clickjob/providers/JobPostList.dart';
import 'package:clickjob/providers/TopEmployers.dart';
import 'package:clickjob/providers/TopJobPost.dart';
import 'package:clickjob/screens/job_detail_screen.dart';
import 'package:provider/provider.dart';
import './screens/maintab_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: TopJobPost(),
          ),
          ChangeNotifierProvider.value(
            value: TopEmployers(),
          ),
          ChangeNotifierProvider.value(
            value: JobPostList(),
          ),
          ChangeNotifierProvider.value(
            value: EmployerList(),
          ),
          ChangeNotifierProvider.value(
            value: JobPost(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primarySwatch: Colors.green,
              visualDensity: VisualDensity.adaptivePlatformDensity),
          home: MainTabPage(),
          routes: {JobDetailScreen.routeName: (context) => JobDetailScreen()},
        ));
  }
}
