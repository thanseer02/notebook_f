import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class detail extends StatefulWidget {
   detail({super.key,required this.title,required this.sub});
    var title,sub;
  @override
  State<detail> createState() => _detailState();
}

class _detailState extends State<detail> {
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
        child:Align(
          // alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
                  Text('${widget.title}'.toUpperCase(),style: GoogleFonts.mPlus1(color: Colors.amber,fontSize: 25,),),
                  Divider(
                    color: Colors.amber,
                  ),
                  Text(widget.sub, style: GoogleFonts.mPlus1(color: Colors.amber,fontSize: 18,),),
                ],
              ),
            ),
          ),
        ) ),

    );
  }
}
