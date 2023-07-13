import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notebook/add.dart';
import 'package:notebook/detail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  final CollectionReference data=
  FirebaseFirestore.instance.collection('data');
  void delete(docId){
  data.doc(docId).delete();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notebook',style: GoogleFonts.gruppo(fontSize: 20)),
            leading: Icon(  CupertinoIcons.book,),
        // actions: [
        //   IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.add))
        // ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        foregroundColor: Colors.amber,
        splashColor: Colors.white,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>add()));
        }, child:Icon(CupertinoIcons.add,size: 40,) ,),
      body: SafeArea(
        child: StreamBuilder(
          stream: data.snapshots(),
          builder: (context,AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (contex, index) {
                    final DocumentSnapshot dataSnap=snapshot.data.docs[index];
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) =>
                                    detail(
                                        title: dataSnap['title'],
                                        sub: dataSnap['notes'])));
                          },
                          child: ListTile(
                            leading: Icon(
                              Icons.note_add, size: 45, color: Colors.amber,),
                            title: Text(dataSnap['title'].toUpperCase(),
                              style: TextStyle(
                                  fontFamily: 'Times New Roman'),),
                            trailing: IconButton(onPressed: (){
                              delete(dataSnap.id);
                            }, icon: Icon(CupertinoIcons.delete)),
                          ),
                        ),
                      ),
                    );
                  });
            }
            else
              {
                return Center(child: CircularProgressIndicator(
                  backgroundColor: Colors.black,
                  color: Colors.amber,
                ));
              }
          }
        ),
      ),
    );
  }
}
