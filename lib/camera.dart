import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class camera extends StatefulWidget {
  const camera({super.key});

  @override
  State<camera> createState() => _cameraState();
}

class _cameraState extends State<camera> {
  late List<CameraDescription> cameras;
  late CameraController cameraController;

  @override
  void initState() {
    startCamera();
    super.initState();
  }

  void startCamera() async {
    cameras = await availableCameras();
    cameraController = CameraController(
      cameras[0],
      ResolutionPreset.high,
      enableAudio: false,
    );
    await cameraController.initialize().then((value) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((e) {
      print(e);
    });
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (cameraController.value.isInitialized) {
      return Scaffold(
          appBar: AppBar(
          title: Text('Notebook',style: GoogleFonts.gruppo(fontSize: 20)),
    leading: Icon(  CupertinoIcons.book,),
    ),
    body: SafeArea(
    child: Stack(
      children: [
        CameraPreview(cameraController),
        GestureDetector(
            onTap: (){
              
            },
            child: button(Icons.flip_camera_ios_outlined, Alignment.bottomLeft)),
        GestureDetector(
            // onTap: (){
            //   CameraController.takePicture().then((Xfile? file) {
            //     if (mounted) {
            //       if (file !=null) {
            //         print('picture saved')
            //       }
            //     }
            //
            //   })
            // },
            child: button(Icons.camera_alt_outlined, Alignment.bottomCenter))


      ],
    )
      ));
    }
    else{
      return SizedBox();
    }

  }
  Widget button(IconData icon,Alignment alignment){
    return  Align(
      alignment: alignment,
      child: Container(
        margin: EdgeInsets.only(
            left: 20,
            bottom: 20
        ),
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow:[ BoxShadow(
              color:Colors.black26,
              offset: Offset(2, 2),
              blurRadius: 10,
            )]
        ),
        child: Center(
            child: Icon(
              // Icons.flip_camera_ios_outlined,
              icon,
              color: Colors.black54,
            )),
      ),
    );

  }
}

