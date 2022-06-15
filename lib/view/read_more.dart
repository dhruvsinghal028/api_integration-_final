import 'package:api_integration/model/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ReadMore extends StatefulWidget {
  final int index;
  List<Datum?>? datums = [];

  ReadMore(this.index, this.datums);
  // const ReadMore({Key? key},this.index) : super(key: key);

  @override
  State<ReadMore> createState() => _ReadMoreState();
}

class _ReadMoreState extends State<ReadMore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        child: Text(
          style : TextStyle(
            color: Colors.teal.shade900,
            fontWeight: FontWeight.bold,
            //fontStyle: FontStyle.Pacifico;
            fontFamily: 'Pacifico',
            fontSize: 20.0,
          ),
          widget.datums![widget.index]!.content,

         // style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),

      ),
    );
  }
}
