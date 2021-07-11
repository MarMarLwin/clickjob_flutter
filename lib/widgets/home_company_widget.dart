import 'package:clickjob/common/constant.dart';
import 'package:clickjob/providers/TopEmployers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeCompanyList extends StatefulWidget {
  const HomeCompanyList({Key? key}) : super(key: key);

  @override
  _HomeCompanyListState createState() => _HomeCompanyListState();
}

class _HomeCompanyListState extends State<HomeCompanyList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    Provider.of<TopEmployers>(context)
        .getTopEmployerList(Constants.sign)
        .then((_) {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final employerData = Provider.of<TopEmployers>(context);
    return Container(
      padding: const EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  'Let\'s join with our top employers',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                'View All',
                style: TextStyle(
                    color: Colors.blueAccent,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.end,
              ),
            ],
          ),
          Container(
              child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: employerData.topEmployers.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, crossAxisSpacing: 5, mainAxisSpacing: 5),
            itemBuilder: (context, index) {
              return GridTile(
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        employerData.topEmployers[index].UploadCompanyLogo!),
                    radius: 80,
                    backgroundColor: Colors.white54,
                  ),
                ),
              );
            },
          )),
        ],
      ),
    );
  }
}
