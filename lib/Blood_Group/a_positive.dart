import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';


class A_Positive extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Active Fighter'),
      ),
      body: Center(
        child: FilteredDataList(),
      ),
    );
  }
}

class FilteredDataList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('test')
          .where('blood', isEqualTo: 'A+') // Replace with your field and filter value
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot1) {
        if (snapshot1.hasError) {
          return Text('Error: ${snapshot1.error}');
        }

        if (snapshot1.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }

        return ListView.builder(
          // children: snapshot.data!.docs.map((DocumentSnapshot document) {
          //   Map<String, dynamic> data = document.data() as Map<String, dynamic>;
            itemCount: snapshot1.data?.docs.length,
            itemBuilder: (context, index) {
              var document = snapshot1.data?.docs[index];
              var name = document?['name'];
              var email = document?['email'];
              var number = document?['number'];
              var address = document?['address'];
              var blood = document?['blood'];
              var date = document?['date'];
              var active=document?['active'];
              var Inactive=document?['Inactive'];
              var imageUrl = document?['image_url']; // Fetch the image URL
              var documentId = document?.id;
              return Column(
                  children: [
                    Row(
                      children: [
                        Card(
                          child: Row(
                            children: [
                              //==========for profile image=====//
                              Container(
                                height: 100,
                                width: 100,
                                child: CircleAvatar(
                                  radius: 50,
                                  backgroundImage: NetworkImage(imageUrl),
                                ),
                              ),
                              //===========middle part==========//
                              Container(
                                width: 200,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Text(name,style: TextStyle(fontWeight: FontWeight.bold),),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Text(active+Inactive,style: TextStyle(fontWeight: FontWeight.normal,color: Colors.green)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Text(address,style: TextStyle(fontWeight: FontWeight.bold)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Text(date,style: TextStyle(fontWeight: FontWeight.bold),),
                                    ),
                                  ],
                                ),
                              ),
                              //=========end part===============//
                              Column(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    child: CircleAvatar(
                                      radius: 50,
                                      backgroundColor: Color(0xE4B40B0B),
                                      child: Text(blood,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                                      // backgroundImage: NetworkImage("https://cdn-icons-png.flaticon.com/512/5042/5042798.png",),
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: MediaQuery.of(context).size.width/6,
                                    child: IconButton(onPressed: () {
                                      launchUrl(Uri.parse('tel:'+number));
                                    }, icon: Icon(Icons.call,color: Colors.green,),iconSize: 35,),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ]
              );
            });
      },
    );
  }
}
