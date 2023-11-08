import 'package:blood/Authentication/login.dart';
import 'package:blood/Donar/donar_form.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  late String _name;
  late String _email;
  late String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Registration Form',style: TextStyle(color: Color(
            0xDD880202)),),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Lottie.asset(
                  'assets/reg.json', // Replace with your animation file path
                  width: 230,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[

                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Name',
                            border: OutlineInputBorder(),
                            hintText: 'Enter Name'
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _name = value!;
                        },
                      ),
                      SizedBox(height: 4,),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                          hintText: 'Enter Email',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email address';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _email = value!;
                        },
                      ),
                      SizedBox(height: 4,),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(),
                          hintText: 'Enter Password',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a password';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _password = value!;
                        },
                      ),
                      SizedBox(height: 16.0),
                      ElevatedButton(
                        onPressed: () {
                          alert(context);
                          _submit();
                        },
                        child: Text('Sign Up',style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  void _submit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Save user details to shared preferences
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('name', _name);
      prefs.setString('email', _email);
      prefs.setString('password', _password);

      // ScaffoldMessenger.of(context).showSnackBar(
      //     Navigator.push(context, MaterialPageRoute(builder: (context) => DonarForm(),)) as SnackBar);
      SnackBar(
        content: Text('Sign up successful!'),
      );
    }
  }
}
void alert(BuildContext context)async{
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: new Text("Attention Please!!"),
        content: new Text("Do you wanna Donate your blood?"),
        actions: <Widget>[

          new ElevatedButton(
            child: new Text("Not Now"),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SignInScreen(),));
            },
          ),
          SizedBox(width: 40,),
          new ElevatedButton(
            child: new Text("Yes"),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => DonarForm(),));
            },
          ),
        ],
      );
    },
  );
}
