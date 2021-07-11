import '../widgets/home_company_widget.dart';
import '../widgets/home_search_widget.dart';
import '../widgets/home_joblist_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              HomeSearch(),
              HomeJobListWidget(),
              HomeCompanyList()
            ],
          ),
        ),
      ),
    );
  }
}
