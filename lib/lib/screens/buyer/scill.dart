import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:maptest/lib/screens/buyer/detail.dart';
import 'package:maptest/lib/screens/buyer/frontpage.dart';


import 'detail.dart';


class scillser extends StatefulWidget {
  const scillser({Key? key}) : super(key: key);

  @override
  State<scillser> createState() => _scillserState();
}

class _scillserState extends State<scillser> {
  @override
  final CollectionReference data = FirebaseFirestore.instance.collection('nistroskills');
  Widget build(BuildContext context) {
    return   Scaffold(
        backgroundColor: Colors.grey.shade500
        ,body:
    StreamBuilder(
        stream:  data.snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot?>StreamSnapshot)
        {    if(StreamSnapshot.hasData){

          return

            ListView.builder(
                itemCount: StreamSnapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  String ant ='N';
                  final DocumentSnapshot documentSnapshot
                  = StreamSnapshot.data!.docs[index];
                  Color  love = Colors.red;
                  Color  lover = Colors.white;
                  Color  lov = lover;

                  return   Column(
                    children: [ SizedBox(height: 7,),
                      Container(
                        decoration: BoxDecoration(borderRadius:
                        BorderRadius.circular(11), border: Border.all(width: 2,color: Colors.orange)),
                        child: MaterialButton(onPressed: () {

                        setState(() {
                          skills = documentSnapshot['skill']??"";

                        });

                 Future.delayed(Duration(seconds: 2));

                        ScaffoldMessenger.of(context).showSnackBar
                          (SnackBar(content: Text(skills)));},
                          child: Card(child: ListTile(title: Row(
                            children: [ Text(documentSnapshot['skill']??""
                              ,style:
                              TextStyle(color: Colors.grey.shade500,),),



                            ],
                          )),),
                        ),
                      ),
                    ],
                  );
                });} else{  return Container();}

        }));
    ;
    ;
  }
}
