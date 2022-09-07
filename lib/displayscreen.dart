import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Displayscreen extends StatefulWidget {
  const Displayscreen({Key? key}) : super(key: key);

  @override
  State<Displayscreen> createState() => _DisplayscreenState();
}

class _DisplayscreenState extends State<Displayscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<QuerySnapshot>(
          future: FirebaseFirestore.instance.collection('lastp').get(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data!.docs.length > 0) {
              List<DocumentSnapshot> arrdata = snapshot.data!.docs;
              return Card(
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          height: 1065,
                          color: Colors.green,
                          child: Stack(
                            children: [
                              Image.network(
                                arrdata[index]['sobi'],
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              Positioned(
                                  left: 25,
                                  top: 50,
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    size: 35,
                                  )),
                              Positioned(
                                  left: 525,
                                  top: 50,
                                  child: Icon(
                                    Icons.bookmark_border,
                                    size: 35,
                                  )),
                              Positioned(
                                left: 55,
                                top: 350,
                                child: Column(
                                  children: [
                                    Text(
                                      arrdata[index]['txt1'],
                                      style: TextStyle(
                                          fontSize: 25, color: Colors.black),
                                    ),
                                    Text(
                                      arrdata[index]['txt2'],
                                      style: TextStyle(
                                          fontSize: 25, color: Colors.black),
                                    ),
                                    Text(
                                      arrdata[index]['txt3'],
                                      style: TextStyle(
                                          fontSize: 25, color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                  left: 55,
                                  top: 470,
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
                                        style: TextStyle(color: Colors.black),
                                      ),
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
                                      Text(
                                        "10 min",
                                        style: TextStyle(color: Colors.black),
                                      )
                                    ],
                                  )),
                              Positioned(
                                  left: 0,
                                  right: 0,
                                  top: 530,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(70),
                                    child: Container(
                                      height: 550,
                                      width: double.infinity,
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 40, left: 20, right: 20),
                                        child: Text(
                                          arrdata[index]['txt5'],
                                          style: TextStyle(fontSize: 23),
                                        ),
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            } else {
              return Card();
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.white,
        child: Column(
          children: [
            Icon(
              Icons.favorite,
              color: Colors.red,
            ),
            Text(
              "200",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
