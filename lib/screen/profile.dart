
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import '../../theme.dart';


class Profileedit extends StatefulWidget {
  const Profileedit({Key? key}) : super(key: key);
  @override
  State<Profileedit> createState() => _ProfileeditState();
}

class _ProfileeditState extends State<Profileedit> {

  String imageName = '';
  late File? imageFile;
  final ImagePicker _picker = ImagePicker();





  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text('Home'),
        // ),
        backgroundColor: Mytheme().primary,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [

                const SizedBox(
                  height: 60,
                ),
                const Align(
                    alignment: Alignment.topLeft,
                    child: Text("Set Profile",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color:Colors.white),)),
                const SizedBox(
                  height: 80,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [


                        imageName == ''
                            ? Stack(children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: CircleAvatar(
                              minRadius: 60,
                              maxRadius: 61,
                              child: ClipRRect(
                                  borderRadius:
                                  const BorderRadius.all(Radius.circular(80)),
                                  child: FadeInImage.assetNetwork(
                                      placeholder: 'assets/download.jpeg',
                                      image: "https://firebasestorage.googleapis.com/v0/b/askehs-8a16d.appspot.com/o/images.jpeg?alt=media&token=86157703-245b-4e9c-a90f-9ac7d51b9894&_gl=1*1eyad72*_ga*MTU2ODEwMTc1NC4xNjk2OTEwNzk0*_ga_CW55HF8NVT*MTY5NjkxMDc5My4xLjEuMTY5NjkxMTgzNi4xMC4wLjA."
                                    //fit: BoxFit.cover,
                                  )),
                            ),
                          ),
                          Positioned(
                            right: 1,
                            top: 1,
                            child: InkWell(
                              onTap: () {
                                imagePicker();
                                //              // Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfile(profileresponse!.data)));
                              },
                              child: Container(
                                  height: 68,
                                  width: 68,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(80),
                                  ),
                                  child: Container(
                                    // height: 40,
                                    // width: 40,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.white),
                                        borderRadius: BorderRadius.circular(
                                            60),
                                        color: Mytheme().primary,
                                      ),
                                      child: const Icon(
                                        Icons.camera_alt,
                                        color: Colors.white,
                                      ))),
                            ),
                          ),
                        ])
                            : Stack(children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: CircleAvatar(
                              minRadius: 60,
                              maxRadius: 61,
                              child: ClipRRect(
                                borderRadius:
                                const BorderRadius.all(Radius.circular(80)),
                                child: Container(
                                  padding: const EdgeInsets.all(1.0),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      image: DecorationImage(
                                          image:
                                          FileImage(File(imageFile!.path)),
                                          fit: BoxFit.cover)),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 1,
                            top: 1,
                            child: InkWell(
                              onTap: () {
                                imagePicker();
                                //              // Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfile(profileresponse!.data)));
                              },
                              child: Container(
                                  height: 68,
                                  width: 68,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(80),
                                  ),
                                  child: Container(
                                    // height: 40,
                                    // width: 40,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.white),
                                        borderRadius: BorderRadius.circular(
                                            60),
                                        color: Mytheme().primary,
                                      ),
                                      child: const Icon(
                                        Icons.camera_alt,
                                        color: Colors.white,
                                      ))),
                            ),
                          )
                        ]),



                        const SizedBox(
                          height: 50,
                        ),

                        InkWell(
                          onTap: () async {
                            if(imageFile!=''){
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar( // Show another snackbar
                                  content: Text(
                                    'Profile set',
                                  )));
                            }
else{

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar( // Show another snackbar
    content: Text(
    'Profile is not seleted',
    )));
}

                          },
                          child: Container(

                            height: 50,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            decoration: BoxDecoration(
                              color: Mytheme().primary,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text('Set',

                                style: TextStyle(fontSize: 20,
                                    color: Colors.white,
                                    letterSpacing: 3.0),
                              ),
                            ),

                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }


  imagePicker() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        imageName = image.name.toString();
      });
    }
    cropImage(image!.path);
  }
  cropImage(filePath) async {
    File? croppedImage = await ImageCropper().cropImage(
      sourcePath: filePath!,
      aspectRatioPresets: Platform.isAndroid
          ? [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ]
          : [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio5x3,
        CropAspectRatioPreset.ratio5x4,
        CropAspectRatioPreset.ratio7x5,
        CropAspectRatioPreset.ratio16x9
      ],
      androidUiSettings: const AndroidUiSettings(
          toolbarColor: Color(0xFF2564AF),
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false),

      maxWidth: 1080,
      maxHeight: 1080,
    );
    if (croppedImage != null) {
      imageFile = croppedImage;
      setState(() {});
    }
  }
}