import 'dart:math';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:blood/Authentication/login.dart';
import 'package:blood/Blood_Group/a_positive.dart';
import 'package:blood/Dashboard/ambulance.dart';
import 'package:blood/Dashboard/blog_page.dart';
import 'package:blood/Dashboard/blood_bank.dart';
import 'package:blood/Dashboard/notice_board.dart';
import 'package:blood/Donar/active_donor.dart';
import 'package:circular_menu/circular_menu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import '../Donar/all_donor_list.dart';


class Dashboard extends StatefulWidget {

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xDDB70404),
          centerTitle: true,
          title: Text("DASHBOARD",style: TextStyle(color: Colors.white)),
          actions: [Padding(
            padding: const EdgeInsets.all(5.0),
            child: Icon(Icons.notification_add,color: Colors.white,),
          )],
        ),
        body: Center(
          child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('test').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }
                if (!snapshot.hasData) {
                  return Text('No data available');
                }

                return ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      var document = snapshot.data?.docs[index];
                      var name = document?['name'];
                      var email = document?['email'];
                      var number = document?['number'];
                      var address = document?['address'];
                      var blood = document?['blood'];
                      var date = document?['date'];
                      var imageUrl = document?['image_url']; // Fetch the image URL
                      var documentId = document?.id;


                      return Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: 420,
                                width: MediaQuery.of(context).size.width,
                                color: Colors.red[100],
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 50,
                                          margin: EdgeInsets.only(left: 10),
                                          child: CircleAvatar(
                                            backgroundImage:
                                                NetworkImage(imageUrl),
                                          ),
                                        ),
                                        Container(
                                          height: 50,
                                          margin: EdgeInsets.only(
                                              top: 25, left: 10),
                                          width: MediaQuery.of(context).size.width / 1.5,
                                          child: DefaultTextStyle(
                                            style: TextStyle(
                                                fontFamily: 'Canterbury',
                                                color: Color(0xfd0d1d5d),
                                                wordSpacing: 3,
                                                fontSize: 17),
                                            child: AnimatedTextKit(
                                              repeatForever: true,
                                              animatedTexts: [
                                                TypewriterAnimatedText(
                                                  'Hello! ' + name,
                                                  speed: Duration(
                                                      milliseconds: 400),
                                                ),
                                                TypewriterAnimatedText(
                                                    'Welcome to our new Gladiator',
                                                    speed: Duration(
                                                        milliseconds: 400)),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    //==================//
                                    SizedBox(
                                      height: 50,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 120,
                                          width: 150,
                                          margin: EdgeInsets.only(left: 15),
                                          child: Card(
                                            elevation: 20,
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: 60,
                                                  width: 60,
                                                  child: Ink.image(
                                                      image: NetworkImage(
                                                          "https://cdn-icons-png.flaticon.com/128/1256/1256650.png"),
                                                      fit: BoxFit.cover),
                                                ),
                                                Container(
                                                  height: 40,
                                                  width: 130,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 3, top: 2),
                                                    child: Text('Total Fighter \n${snapshot.data?.docs.length}', style: TextStyle(
                                                          fontWeight: FontWeight.bold,color: Colors.red), textAlign: TextAlign.center,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 120,
                                          width: 150,
                                          margin: EdgeInsets.only(right: 15),
                                          child: Card(
                                            elevation: 20,
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: 60,
                                                  width: 60,
                                                  child: Ink.image(
                                                      image: NetworkImage(
                                                          "https://cdn-icons-png.flaticon.com/128/3159/3159695.png"),
                                                      fit: BoxFit.cover),
                                                ),
                                                Container(
                                                  height: 40,
                                                  width: 140,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 3, top: 2),
                                                    child: Text(
                                                      'Available Fighter \n4 ',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.red),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              //===============header part end here==============//
                              Container(
                                  height: MediaQuery.of(context).size.height / 2,
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.only(top: 300),
                                  child: Card(
                                    elevation: 20,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              height: 110,
                                              width: 100,
                                              margin: EdgeInsets.only(left: 15),
                                              child: Card(
                                                elevation: 20,
                                                child: Column(
                                                  children: [
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.push(context, MaterialPageRoute(builder: (context) => Ambulance(),));
                                                      },
                                                      child: Container(
                                                        height: 60,
                                                        width: 60,
                                                        child: Ink.image(
                                                            image: NetworkImage(
                                                                "https://cdn-icons-png.flaticon.com/128/2869/2869684.png"),
                                                            fit: BoxFit.cover),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 25,
                                                      width: 90,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets.only(left: 3, top: 2),
                                                        child: Text("Ambulance", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
                                                          textAlign: TextAlign.center,
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 110,
                                              width: 100,
                                              margin: EdgeInsets.only(right: 15),
                                              child: Card(
                                                elevation: 20,
                                                child: Column(
                                                  children: [
                                                    TextButton(
                                                      onPressed: () {
                                                        launchUrl(Uri.parse('tel:999'));
                                                      },
                                                      child: Container(
                                                        height: 60,
                                                        width: 60,
                                                        child: Ink.image(
                                                            image: NetworkImage(
                                                                "https://cdn-icons-png.flaticon.com/128/4542/4542762.png"),
                                                            fit: BoxFit.cover),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 25,
                                                      width: 90,
                                                      child: Text(
                                                        "Help Line",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.red),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 110,
                                              width: 100,
                                              margin:
                                                  EdgeInsets.only(right: 15),
                                              child: Card(
                                                elevation: 20,
                                                child: Column(
                                                  children: [
                                                    TextButton(
                                                      onPressed: () {
                                                       Navigator.push(context, MaterialPageRoute(builder: (context) => DonorList(),));
                                                      },
                                                      child: Container(
                                                        height: 60,
                                                        width: 60,
                                                        child: Ink.image(
                                                            image: NetworkImage(
                                                                "https://cdn-icons-png.flaticon.com/128/2862/2862141.png"),
                                                            fit: BoxFit.cover),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 25,
                                                      width: 90,
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(left: 3, top: 2),
                                                        child: Text("Donor List", style: TextStyle(fontWeight: FontWeight.bold,
                                                              color: Colors.red),
                                                          textAlign: TextAlign.center,
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        //================second row==========//
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              height: 110,
                                              width: 100,
                                              margin: EdgeInsets.only(left: 15),
                                              child: Card(
                                                elevation: 20,
                                                child: Column(
                                                  children: [
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.push(context, MaterialPageRoute(builder: (context) => BloogPage(),));
                                                      },
                                                      child: Container(
                                                        height: 60,
                                                        width: 60,
                                                        child: Ink.image(
                                                            image: NetworkImage(
                                                                "https://cdn-icons-png.flaticon.com/128/6114/6114045.png"),
                                                            fit: BoxFit.cover),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 25,
                                                      width: 90,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets.only(left: 3, top: 2),
                                                        child: Text("Blog", style: TextStyle(
                                                              fontWeight: FontWeight.bold, color: Colors.red),
                                                          textAlign: TextAlign.center,
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),

                                            Container(
                                              height: 110,
                                              width: 100,
                                              margin: EdgeInsets.only(right: 15),
                                              child: Card(
                                                elevation: 20,
                                                child: Column(
                                                  children: [
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.push(context, MaterialPageRoute(builder: (context) => Blood_Bank(),));
                                                      },
                                                      child: Container(
                                                        height: 60,
                                                        width: 60,
                                                        child: Ink.image(
                                                            image: NetworkImage(
                                                                "https://cdn-icons-png.flaticon.com/128/1297/1297136.png"),
                                                            fit: BoxFit.cover),
                                                      ),
                                                    ),

                                                    Container(
                                                      height: 25,
                                                      width: 90,
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(left: 3, top: 2),
                                                        child: Text("Blood Bank",
                                                          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),
                                                          textAlign: TextAlign.center,
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),



                                            Container(
                                              height: 110,
                                              width: 100,
                                              margin: EdgeInsets.only(right: 15),
                                              child: Card(
                                                elevation: 20,
                                                child: Column(
                                                  children: [
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.push(context, MaterialPageRoute(builder: (context) => NoticeBoard(),));
                                                      },
                                                      child: Container(
                                                        height: 60,
                                                        width: 60,
                                                        child: Ink.image(
                                                            image: NetworkImage(
                                                                "https://cdn-icons-png.flaticon.com/128/7757/7757460.png"),
                                                            fit: BoxFit.cover),
                                                      ),
                                                    ),

                                                    Container(
                                                      height: 25,
                                                      width: 90,
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(left: 3, top: 2),
                                                        child: Text("Notice Board",
                                                          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),
                                                          textAlign: TextAlign.center,
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        //============second row end==================///
                                        Container(
                                          height: 90,
                                          width: 100,
                                          child: CircularMenu(
                                            startingAngleInRadian: 0.95 * pi,
                                            endingAngleInRadian: 1.99 * pi,
                                            items: [
                                              CircularMenuItem(
                                                  icon: Icons.search,
                                                  iconSize: 20,
                                                  iconColor: Color(0xE4CC4747),
                                                  enableBadge: true,
                                                  badgeLabel: 'A+',
                                                  badgeColor: Color(0xFFC92336),
                                                  badgeTextStyle: TextStyle(
                                                      fontSize: 20,
                                                      color: Color(0xFFFFFFFF),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  color: Color(0x54CB8BEC),
                                                  onTap: () {
                                                    setState(() {

                                                      // Navigator.push(context, MaterialPageRoute(builder: (context) => A_Positive(),));
                                                    });
                                                  }),
                                              CircularMenuItem(
                                                  icon: Icons.search,
                                                  iconSize: 22,
                                                  iconColor: Color(0xE4CC4747),
                                                  enableBadge: true,
                                                  badgeLabel: 'B+',
                                                  badgeColor: Color(0xFFC92336),
                                                  badgeTextStyle: TextStyle(
                                                      fontSize: 20,
                                                      color: Color(0xFFFFFFFF),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  color: Color(0x54CB8BEC),
                                                  onTap: () {
                                                    setState(() {
                                                   //   Navigator.push(context, MaterialPageRoute(builder: (context) => MyFile(),));
                                                    });
                                                  }),
                                              CircularMenuItem(
                                                  iconSize: 22,
                                                  icon: Icons.search,
                                                  iconColor: Color(0xE4CC4747),
                                                  enableBadge: true,
                                                  badgeLabel: 'AB+',
                                                  badgeColor: Color(0xFFC92336),
                                                  badgeTextStyle: TextStyle(
                                                      fontSize: 20,
                                                      color: Color(0xFFFFFFFF),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  color: Color(0x54CB8BEC),
                                                  onTap: () {
                                                  //  Navigator.push(context, MaterialPageRoute(builder: (context) => MyFile(),));
                                                  }),
                                              CircularMenuItem(
                                                  iconSize: 22,
                                                  icon: Icons.search,
                                                  iconColor: Color(0xE4CC4747),
                                                  enableBadge: true,
                                                  badgeLabel: 'A-',
                                                  badgeColor: Color(0xFFC92336),
                                                  badgeTextStyle: TextStyle(
                                                      fontSize: 20,
                                                      color: Color(0xFFFFFFFF),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  color: Color(0x54CB8BEC),
                                                  onTap: () {
                                                    setState(() {
                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => Blood_Bank(),));
                                                    });
                                                  }),
                                              CircularMenuItem(
                                                  iconSize: 22,
                                                  icon: Icons.search,
                                                  iconColor: Color(0xE4CC4747),
                                                  enableBadge: true,
                                                  badgeLabel: 'B-',
                                                  badgeColor: Color(0xFFC92336),
                                                  badgeTextStyle: TextStyle(
                                                      fontSize: 20,
                                                      color: Color(0xFFFFFFFF),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  color: Color(0x54CB8BEC),
                                                  onTap: () {
                                                    setState(() {
                                                      // Navigator.push(context, MaterialPageRoute(builder: (context) => A_Positive(),));
                                                    });
                                                  }),
                                              CircularMenuItem(
                                                  iconSize: 22,
                                                  icon: Icons.search,
                                                  iconColor: Color(0xE4CC4747),
                                                  enableBadge: true,
                                                  badgeLabel: 'AB-',
                                                  badgeColor: Color(0xFFC92336),
                                                  badgeTextStyle: TextStyle(
                                                      fontSize: 20,
                                                      color: Color(0xFFFFFFFF),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  color: Color(0x54CB8BEC),
                                                  onTap: () {
                                                    setState(() {
                                                      // Navigator.push(context, MaterialPageRoute(builder: (context) => A_Positive(),));
                                                    });
                                                  }),
                                              CircularMenuItem(
                                                  iconSize: 22,
                                                  icon: Icons.search,
                                                  iconColor: Color(0xE4CC4747),
                                                  enableBadge: true,
                                                  badgeLabel: 'O+',
                                                  badgeColor: Color(0xFFC92336),
                                                  badgeTextStyle: TextStyle(
                                                      fontSize: 20,
                                                      color: Color(0xFFFFFFFF),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  color: Color(0x54CB8BEC),
                                                  onTap: () {
                                                    setState(() {
                                                      // Navigator.push(context, MaterialPageRoute(builder: (context) => A_Positive(),));
                                                    });
                                                  }),
                                              CircularMenuItem(
                                                  iconSize: 22,
                                                  icon: Icons.search,
                                                  iconColor: Color(0xE4CC4747),
                                                  enableBadge: true,
                                                  badgeLabel: 'O-',
                                                  badgeColor: Color(0xFFC92336),
                                                  badgeTextStyle: TextStyle(
                                                      fontSize: 20,
                                                      color: Color(0xFFFFFFFF),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  color: Color(0x54CB8BEC),
                                                  onTap: () {
                                                    setState(() {
                                                      // Navigator.push(context, MaterialPageRoute(builder: (context) => A_Positive(),));
                                                    });
                                                  }),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  )),
                            ],
                          )
                        ],
                      );
                    });
              }),
        ),
        //=======drawer start ====//
        drawer: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('test').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }
            if (!snapshot.hasData) {
              return Text('No data available');
            }
            var document = snapshot.data?.docs[
                0]; // Assuming you only want data from the first document
            var name = document?['name'];
            var blood = document?['blood'];
            var date = document?['date'];
            var email = document?['email'];
            var number = document?['number'];
            var address = document?['address'];
            var imageUrl = document?['image_url'];

            return Drawer(
              child: ListView(
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: Color(0xDD5D0606),
                    ),
                    child: UserAccountsDrawerHeader(
                      accountName: Text(name + " " + blood,
                          style: TextStyle(fontSize: 14)),
                      accountEmail: Text("Last Donate: " + date,
                          style: TextStyle(fontSize: 12)),
                      currentAccountPicture: CircleAvatar(
                        backgroundImage: NetworkImage(imageUrl),
                      ),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      onTap: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => RequesterList(),));
                      },
                      title: Text("Home"),
                      leading: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.home,color: Colors.red),
                      ),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      onTap: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => RequesterList(),));
                      },
                      title: Text("Contact"),
                      leading: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.contact_page_outlined,color: Colors.red,),
                      ),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      onTap: () {
                     //  Navigator.push(context, MaterialPageRoute(builder: (context) => Active_Donor(),));
                      },
                      title: Text("E-Mail"),
                      leading: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.email_outlined,color: Colors.red),
                      ),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      onTap: () {
                         Navigator.push(context, MaterialPageRoute(builder: (context) => A_Positive(),));
                      },
                      title: Text("Profile"),
                      leading: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.person,color: Colors.red),
                      ),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Active_Donor(),));
                      },
                      title: Text("Active Donor"),
                      leading: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.co_present_outlined,color: Colors.red),
                      ),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => DonorList(),));
                      },
                      title: Text("All Donor List"),
                      leading: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.list_alt_outlined,color: Colors.red),
                      ),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      onTap: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => RequesterList(),));
                      },
                      title: Text("Profile Update"),
                      leading: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.manage_accounts_outlined,color: Colors.red),
                      ),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      onTap: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => RequesterList(),));
                      },
                      title: Text("Logout"),
                      leading: IconButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SignInScreen(),));
                        },
                        icon: Icon(Icons.logout,color: Colors.red),
                      ),
                    ),
                  ),

                  // Add other Card and ListTile items here
                ],
              ),
            );
          },
        ));
  }


//=======drawer end ====//
}
