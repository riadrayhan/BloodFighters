import 'package:blood/Authentication/registration.dart';
import 'package:blood/Dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  late String _email;
  late String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(''),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Lottie.asset(
                  'assets/login.json', // Replace with your animation file path
                  width: 270,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
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
                      SizedBox(height: 6,),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(),
                          hintText: 'Enter Password',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _password = value!;
                        },
                      ),
                      SizedBox(height: 16.0),
                      Row(
                        children: [
                          Text("Not Registrade?"),
                          TextButton(onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen(),));
                          }, child: Text("Registration here")),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: _submit,
                        child: Text('Sign In',style: TextStyle(fontWeight: FontWeight.bold),),
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

      // Retrieve user details from shared preferences
      final prefs = await SharedPreferences.getInstance();
      final name = prefs.getString('name');
      final savedEmail = prefs.getString('email');
      final savedPassword = prefs.getString('password');

      if (savedEmail == _email && savedPassword == _password) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Signin Successfully'),
          ),
        );
        // Navigate to home screen if credentials are valid
        Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard(),));
      } else {
        // Show error message if credentials are invalid
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Invalid email or password'),
          ),
        );

      }
    }
  }
}
