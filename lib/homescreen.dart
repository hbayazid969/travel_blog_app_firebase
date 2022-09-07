import 'package:blog_travel/displayscreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<String> mylist = [
    'Top',
    'Popular',
    'Trending',
    'Editor choice',
    'New',
    'Ongoing'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(top: 5, left: 20),
          child: Image.asset(
            "images/hamburger.png",
            height: 50,
            color: Colors.black,
          ),
        ),
        actions: [
          Icon(
            Icons.search,
            color: Colors.black,
            size: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: CircleAvatar(
              radius: 40,
              child: Icon(Icons.person),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Your Daily",
                    style: GoogleFonts.kalam(
                        color: Colors.black87, fontSize: 24, letterSpacing: 1),
                  ),
                  Text(
                    "Recommendation",
                    style: GoogleFonts.archivoBlack(
                        color: Colors.black, fontSize: 25, letterSpacing: 3),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Expanded(
            flex: 5,
            child: FutureBuilder<QuerySnapshot>(
                future: FirebaseFirestore.instance.collection('story').get(),
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data!.docs.length > 0) {
                    List<DocumentSnapshot> arrdata = snapshot.data!.docs;
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: arrdata.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Displayscreen()));
                            },
                            child: Card(
                              child: Container(
                                margin: EdgeInsets.only(left: 15),
                                child: Stack(
                                  children: [
                                    Image.network(
                                      arrdata[index]['image1'],
                                      height: double.infinity,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                    Positioned(
                                        top: 230,
                                        left: 50,
                                        child: Column(
                                          children: [
                                            Text(
                                              arrdata[index]['txt1'],
                                              style: GoogleFonts.kalam(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  letterSpacing: 1),
                                            ),
                                            Text(
                                              arrdata[index]['txt2'],
                                              style: GoogleFonts.kalam(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  letterSpacing: 1),
                                            ),
                                            Text(
                                              arrdata[index]['txt3'],
                                              style: GoogleFonts.kalam(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  letterSpacing: 1),
                                            ),
                                          ],
                                        )),
                                    Positioned(
                                        top: 338,
                                        left: 50,
                                        child: Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 15,
                                              child: Icon(Icons.person),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              arrdata[index]['txt4'],
                                              style: GoogleFonts.kalam(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  letterSpacing: 1),
                                            ),
                                          ],
                                        )),
                                  ],
                                ),
                                height: 350,
                                width: 300,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                          );
                        });
                  } else {
                    return Column();
                  }
                }),
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: mylist.length,
                itemBuilder: (context, i) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: InkWell(
                        onTap: () {
                          if (mylist[1] == 'Popular') {
                            tops();
                          } else if (mylist[2] == 'Trending') {
                            tops();
                          }
                        },
                        child: Text(
                          mylist[i],
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          Expanded(
            flex: 5,
            child: tops(),
          ),
        ],
      ),
    );
  }

  FutureBuilder<QuerySnapshot<Object?>> tops() {
    return FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance.collection('details').get(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data!.docs.length > 0) {
            List<DocumentSnapshot> arrdata1 = snapshot.data!.docs;
            return ListView.builder(
                itemCount: arrdata1.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.only(
                          top: 10, bottom: 6, left: 12, right: 12),
                      child: Card(
                        elevation: 2,
                        child: Container(
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20, top: 5, bottom: 10),
                                          child: Image.network(
                                            arrdata1[index]['pic1'],
                                            height: 100,
                                            width: 100,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              arrdata1[index]['lekha1'],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              arrdata1[index]['lekha2'],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 15,
                                          child: Icon(Icons.person),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text("Christina"),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        CircleAvatar(
                                          radius: 15,
                                          child: Icon(
                                            Icons.lock_clock,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 6,
                                        ),
                                        Text("10 min")
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ));
                });
          } else {
            return Row();
          }
        });
  }
}
