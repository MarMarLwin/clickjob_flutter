import '../common/constant.dart';
import '../models/Post.dart';
import '../providers/TopJobPost.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeJobListWidget extends StatefulWidget {
  const HomeJobListWidget({Key? key}) : super(key: key);

  @override
  _HomeJobListWidgetState createState() => _HomeJobListWidgetState();
}

class _HomeJobListWidgetState extends State<HomeJobListWidget> {
  late bool isLoading;

  @override
  void initState() {
    isLoading = true;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    Provider.of<TopJobPost>(context).getTopJobList(Constants.sign).then((_) {
      isLoading = false;
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final postData = Provider.of<TopJobPost>(context);
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  'Recent Job For You',
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
            child: isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.blueGrey),
                    ),
                    child: Expanded(
                      child: ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.all(0),
                          shrinkWrap: true,
                          itemBuilder: (ctx, index) {
                            return GestureDetector(
                              onTap: null,
                              child: Card(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image(
                                        image: NetworkImage(postData
                                            .topJobList[index]
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
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            postData.topJobList[index].Title!,
                                            style: TextStyle(
                                                color: Colors.blueAccent,
                                                fontSize: 15),
                                          ),
                                          Text(
                                            postData
                                                .topJobList[index].CompanyName!,
                                            style: TextStyle(
                                                color: Colors.green,
                                                fontSize: 15),
                                          ),
                                          Text(
                                            postData.topJobList[index].Address!,
                                            overflow: TextOverflow.ellipsis,
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
                          itemCount: postData.topJobList.length),
                    ),
                    //child: Image.asset('images/logo.png')
                    //child: ListViewWidget(postData.topJobList)
                  ),
          )
        ],
      ),
    );
  }
}

class ListItem extends StatefulWidget {
  const ListItem({Key? key, required this.postItem}) : super(key: key);
  final Post postItem;

  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Card(
        child: Row(
          children: <Widget>[
            Image.asset('images/logo.png'),
            Column(
              children: <Widget>[
                Text(
                  widget.postItem.Title!,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent),
                  overflow: TextOverflow.ellipsis,
                ),
                Align(
                  child: Text(
                    widget.postItem.CompanyName!,
                    style: TextStyle(fontSize: 16, color: Colors.green),
                    softWrap: true,
                  ),
                  alignment: Alignment.centerLeft,
                ),
                Align(
                  child: Text(
                    widget.postItem.Address!,
                    overflow: TextOverflow.ellipsis,
                  ),
                  alignment: Alignment.centerLeft,
                )
              ],
            ),
            Icon(
              Icons.navigate_next,
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}

class ListViewWidget extends StatelessWidget {
  final List<Post> list;

  ListViewWidget(this.list);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: list.isEmpty
          ? Center(child: Text('No item data'))
          : ListView(
              children: list
                  .map((e) => ListItem(key: ValueKey(e.JobID), postItem: e))
                  .toList()),
    );
  }
}
