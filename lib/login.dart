import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:notebook/home.dart';
import 'package:notebook/pageview.dart';
class login extends StatefulWidget {
   login({super.key});
  @override
  State<login> createState() => _loginState();
}
final GoogleSignIn _googleSignIn=GoogleSignIn();

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Notebook',style: GoogleFonts.gruppo(fontSize: 50,color: Colors.amber)),
                  Center(
                    child: Container(
                      height: 50,
                      width: 250,
                      child: OutlinedButton(
                          style: ButtonStyle(
                            side: MaterialStateProperty.all(BorderSide(color: Colors.amber)),
                          ),
                          onPressed: (){
                            _googleSignIn.signIn().then((value)  {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>pages()));
                              String userName=value!.displayName!;
                              String profilePicture=value.photoUrl!;
                              print(userName);
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height:30 ,
                              child: Image(image: AssetImage('assets/g.png'))),
                          Text('Sign in With Google',style: TextStyle(color: Colors.amber,fontSize: 20)),
                        ],
                      )),
                    ),
                  )

                ],
              )),
    );
  }
}
