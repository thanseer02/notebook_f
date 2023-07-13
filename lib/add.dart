import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notebook/home.dart';
class add extends StatefulWidget {
  const add({super.key});

  @override
  State<add> createState() => _addState();
}

class _addState extends State<add> {

  final TextEditingController _titlectrl =TextEditingController();
  final TextEditingController notesctrl =TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void adduser(){
    if (_formKey.currentState!.validate()) {
      String title=_titlectrl.text;
      FirebaseFirestore.instance
          .collection('data')
          .add({'title':_titlectrl.text,'notes':notesctrl.text})
      // .then((value)=>print('user added'))
          .then((value)=>ScaffoldMessenger(child: SnackBar(content: Text('user added sucess'))));
      Navigator.push(context, MaterialPageRoute(builder: (context)=>home()));
      _titlectrl.clear();
    }
  }

  // final CollectionReference data =
  // FirebaseFirestore.instance.collection('data');
  // void senddata(){
  //   final datas ={
  //     'title':'running',
  //     'notes':'running in the morning'
  //   };
  //   data.add(datas);
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notebook',style: GoogleFonts.gruppo(fontSize: 20)),
        leading: IconButton(onPressed: () {
          Navigator.pop(context); },
          icon: Icon(Icons.arrow_back_ios,color: Colors.amber,),),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key:_formKey ,
            child: Column(
              children: [
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextFormField(
                    controller: _titlectrl,
                    validator: (val){
                      if (val==null || val.isEmpty) {
                        return 'please enter a name';
                      }
                      return null;
                    },
                    style: TextStyle(color: Colors.black,),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xffDCDADA),
                        hintText: 'Titte',
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,

                            borderRadius: BorderRadius.circular(20)
                        )
                    ),
                  ),
                ),
                SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                child: TextFormField(
                  controller: notesctrl,
                  validator: (val){
                    if (val==null || val.isEmpty) {
                      return 'please enter a name';
                    }
                    return null;
                  },
                  maxLines: 10,
                  style: TextStyle(color: Colors.black,fontSize: 18),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xffDCDADA),
                      hintText: 'Notes',
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,

                          borderRadius: BorderRadius.circular(20)
                      )
                  ),
                ),
              ),
            ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 150,
                      height: 50,
                      child: OutlinedButton(style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,side: BorderSide(color: Colors.white)),
                          onPressed: (){}, child: Text('Cancel',style: TextStyle(fontSize: 20),)),
                    ),

                    Container(
                      width: 150,
                      height: 50,
                      child: OutlinedButton(style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.amber,side: BorderSide(color: Colors.amber)),
                          onPressed: (){
                          // senddata();
                            adduser();
                          }, child: Text('Add',style: TextStyle(fontSize: 20),)),
                    ),

                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
