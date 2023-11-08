import 'package:blood/Authentication/login.dart';
import 'package:blood/Dashboard/dashboard.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


class DonarForm extends StatefulWidget {
  const DonarForm({Key? key}) : super(key: key);

  @override
  State<DonarForm> createState() => _DonarFormState();
}

class _DonarFormState extends State<DonarForm> {

  TextEditingController NameController = TextEditingController();
  TextEditingController EmailController = TextEditingController();
  TextEditingController NumberController = TextEditingController();
  TextEditingController AddressController = TextEditingController();
  TextEditingController BloodController = TextEditingController();
  TextEditingController DateController = TextEditingController();
  TextEditingController Status = TextEditingController();
  TextEditingController Status2 = TextEditingController();
  FocusNode _focusNode = FocusNode();
  FocusNode _focusNode2 = FocusNode();

  XFile? _imageFile;

  @override
  void initState() {
    super.initState();
    _imageFile = null; // Initialize the image file as null
  }

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = pickedFile;
      });
    }
  }
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Donor Form",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Color(0xFFAD1225),
        actions: [Icon(Icons.book,color: Colors.white,)],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            children: [
              Container(
                height: 150,
                width: 150,
                child: ElevatedButton(
                  onPressed: _pickImage,
                  child:  _imageFile == null
                      ? new Text('📷',style: TextStyle(fontSize: 40),)
                      : Container(
                      height: double.infinity,
                      width: double.maxFinite,
                      child: CircleAvatar(backgroundColor: Colors.green,
                        backgroundImage: new FileImage(File(_imageFile!.path)),
                      )),
                ),
              ),
              // ===============pick image ==========//
              SizedBox(height: 10,),
              Container(
                width: MediaQuery.of(context).size.width/1.1,
                margin: EdgeInsets.only(bottom: 3),
                child: TextFormField(
                  controller: NameController,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if(value !.isEmpty){
                      return 'Enter Name';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Name',
                    prefixIcon: Icon(Icons.person_outline_outlined,color: Color(0xE4B40B0B),),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    )
                  ),
                )
              ),
              Container(
                  width: MediaQuery.of(context).size.width/1.1,
                  margin: EdgeInsets.only(bottom: 3),
                  child: TextFormField(
                    controller: EmailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if(value !.isEmpty){
                        return 'Enter email';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email_outlined,color: Color(0xE4B40B0B),),
                        labelText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        )
                    ),
                  )
              ),

              Container(
                  width: MediaQuery.of(context).size.width/1.1,
                  margin: EdgeInsets.only(bottom: 3),
                  child: TextFormField(
                    controller: NumberController,
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if(value !.isEmpty){
                        return 'Enter Number';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.call,color: Color(0xE4B40B0B),),
                        labelText: 'Number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        )
                    ),
                  )
              ),

              Container(
                  width: MediaQuery.of(context).size.width/1.1,
                  margin: EdgeInsets.only(bottom: 3),
                  child: TextFormField(
                    controller: AddressController,
                    keyboardType: TextInputType.streetAddress,
                    validator: (value) {
                      if(value !.isEmpty){
                        return 'Enter Address';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.home,color: Color(0xE4B40B0B),),
                        labelText: 'Address',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        )
                    ),
                  )
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 12),
                      width: MediaQuery.of(context).size.width/2.2,
                      child: TextFormField(
                        controller: BloodController,
                        // obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        validator: (value) {
                          if(value !.isEmpty){
                            return 'Enter Blood Group';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.recycling,color: Color(0xE4B40B0B),),
                            labelText: 'Blood Group',
                            hintText: 'A+',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            )
                        ),
                      )
                  ),


                  Container(
                      margin: EdgeInsets.only(right: 12),
                      width: MediaQuery.of(context).size.width/2.2,
                      child: TextFormField(
                        controller: DateController,
                        keyboardType: TextInputType.datetime,
                        validator: (value) {
                          if(value !.isEmpty){
                            return 'Enter Blood Donation';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.recycling,color: Color(0xE4B40B0B),),
                            labelText: 'Last Donation',
                            hintText: 'Date',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            )
                        ),
                      )
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 6,bottom: 6),
                child: Text("Are you ready to donate blood right now?",style: TextStyle(fontSize: 18,color: Color(
                    0xFD0D1D5D)),),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 12),
                      width: MediaQuery.of(context).size.width/2.2,
                      child: TextFormField(
                          controller: Status,
                          validator: (value) {
                            if(value !.isEmpty){
                              return 'Enter status';
                            }
                          },
                          decoration: InputDecoration(
                            labelText: 'Not Now',
                            hintText: 'Not Now',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                          focusNode: _focusNode,
                          readOnly: true,
                          onTap: () {
                            Status.text = 'Inactive';
                            _focusNode.unfocus();

                          }
                      )
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 12),
                      width: MediaQuery.of(context).size.width/2.2,
                      child: TextFormField(
                          controller: Status2,
                          validator: (value) {
                            if(value !.isEmpty){
                              return 'Enter status';
                            }
                          },
                          decoration: InputDecoration(
                            labelText: 'Yes',
                            hintText: 'Yes',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                          focusNode: _focusNode2,
                          readOnly: true,
                          onTap: () {
                            Status2.text = 'Active';
                            _focusNode2.unfocus();

                          }
                      )
                  ),
                ],
              ),
              
              SizedBox(height: 15,),

              ElevatedButton(
                onPressed: () async {
      setState(() {
        Navigator.push(context, MaterialPageRoute(builder: (context) =>
            SignInScreen(),));
      });
      if (NameController.text.isNotEmpty && EmailController.text.isNotEmpty &&
          NumberController.text.isNotEmpty &&
          AddressController.text.isNotEmpty &&
          BloodController.text.isNotEmpty && DateController.text.isNotEmpty ||
          Status.text.isNotEmpty || Status2.text.isNotEmpty) {
        final imageFile = File(_imageFile!.path);

        final imageStorageRef =
        FirebaseStorage.instance.ref().child('images/${DateTime.now()}.jpg');

        await imageStorageRef.putFile(imageFile);

        final imageUrl = await imageStorageRef.getDownloadURL();

        Map<String, dynamic> data = {
          "name": NameController.text,
          "email": EmailController.text,
          "number": NumberController.text,
          "address": AddressController.text,
          "blood": BloodController.text,
          "date": DateController.text,
          "active": Status.text,
          "Inactive": Status2.text,
          "image_url": imageUrl,
        };

        FirebaseFirestore.instance.collection("test").add(data);
      }
    ScaffoldMessenger.of(context).showSnackBar(
        Navigator.push(context, MaterialPageRoute(builder: (context) => SignInScreen(),)) as SnackBar);
    SnackBar(
      content: Text('Sign up successful!'),
    );
                },
                child: Text(" SUBMIT YOUR FORM ",style: TextStyle(fontSize: 16,wordSpacing: 3),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
