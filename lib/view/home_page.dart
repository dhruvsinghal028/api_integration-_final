import 'dart:math';

import 'package:api_integration/services/remote_services.dart';
import 'package:api_integration/view/read_more.dart';
import 'package:flutter/material.dart';

import '../model/post.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Datum?>? datums;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();

    //fetch data from api
    getData();
  }

  void getData() async {
    datums = await RemoteService().getData();
    if (datums != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(


          "News",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Visibility(
        visible: isLoaded,
        child: ListView.builder(
          itemCount: datums?.length,
          itemBuilder: ((context, index) {
            return Container(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          datums![index]!.date!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          datums![index]!.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          datums![index]!.content,
                          maxLines: 4,
                          style: TextStyle(
                            fontSize: 24,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        FloatingActionButton(
                          child: Icon(
                              color: Colors.grey,
                              Icons.more),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ReadMore(index, datums),
                              ),
                            );
                          },

                        ),
                        Divider(
                          color: Colors.black,
                          height : 2
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
        replacement: CircularProgressIndicator(),
      ),
    );
  }
}
