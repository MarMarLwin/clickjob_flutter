import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeSearch extends StatefulWidget {
  const HomeSearch({Key? key}) : super(key: key);

  @override
  _HomeSearchState createState() => _HomeSearchState();
}

class _HomeSearchState extends State<HomeSearch> {
  @override
  Widget build(BuildContext context) {
    return Container(
        /*margin: const EdgeInsets.only(top: 25),*/
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'images/cover_img.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Image(
                      image: AssetImage('images/logo.png'),
                      height: 80,
                      fit: BoxFit.fitHeight),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Job Title or Keyword ',
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
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'By Location',
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
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'By Job Category',
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
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green)),
                    onPressed: null,
                    child: Text(
                      'Search',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ]),
          ),
        ));
  }
}
