import 'package:flutter/material.dart';

class NoticeBoard extends StatefulWidget {
  const NoticeBoard({super.key});

  @override
  State<NoticeBoard> createState() => _NoticeBoardState();
}

class _NoticeBoardState extends State<NoticeBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notice Board",style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor:Color(0xFFDC7C7C),
      ),
      body: Center(
        child: Column(
          children: [
            Card(
              elevation: 10,
              child: Container(
                width: MediaQuery.of(context).size.width/1,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text("BLOOD DONATION CAMPAIGN \n\n In observance ofthe 2nd Death anniversary of Late Mr. Imamul KabirShanto, Founder Chairman of Shanto-Mariam University of CreativeTechnology, a blood donation campaign will be held on 30 May 2023(Monday) at Bldg. No. 1, Permanent Campus and City Campus (Lalmatia)from 10:00 a.m. to 4:00 p.m.",textAlign: TextAlign.left,),
                ),
              ),
            ),
            Card(
              elevation: 10,
              child: Container(
                width: MediaQuery.of(context).size.width/1,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text("BLOOD DONATION CAMPAIGN \n\n In observance ofthe 2nd Death anniversary of Late Mr. Imamul KabirShanto, Founder Chairman of Shanto-Mariam University of CreativeTechnology, a blood donation campaign will be held on 30 May 2023(Monday) at Bldg. No. 1, Permanent Campus and City Campus (Lalmatia)from 10:00 a.m. to 4:00 p.m.",textAlign: TextAlign.left,),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
