import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:local/provider/user_provider.dart';
import 'package:local/resources/auth_methods.dart';
import 'package:provider/provider.dart';

class Conversations extends StatefulWidget {
  const Conversations({Key? key}) : super(key: key);

  @override
  _ConversationsState createState() => _ConversationsState();
}

List conversationList = [
  {
    "name": "Maria",
    "imageUrl":
        "https://images.unsplash.com/photo-1427955569621-3e494de2b1d2?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8MTh8fHxlbnwwfHx8fHw%3D",
    "isOnline": true,
    "hasStory": true,
    "message": "okk",
    "time": "5:00 pm"
  },
  {
    "name": "Giorgos",
    "imageUrl":
        "https://images.unsplash.com/photo-1512699057394-81542d1afef2?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8MTZ8fHxlbnwwfHx8fHw%3D",
    "isOnline": false,
    "hasStory": false,
    "message": "Διαβαστηκε",
    "time": "7:00 am"
  },
  {
    "name": "Giannis",
    "imageUrl":
        "https://images.unsplash.com/photo-1510279770292-4b34de9f5c23?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8MTJ8fHxlbnwwfHx8fHw%3D",
    "isOnline": true,
    "hasStory": false,
    "message": "Διαβαστηκε",
    "time": "6:50 am"
  },
  {
    "name": "Natalia",
    "imageUrl":
        "https://images.unsplash.com/photo-1469521669194-babb45599def?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8OXx8fGVufDB8fHx8fA%3D%3D",
    "isOnline": true,
    "hasStory": true,
    "message": "Διαβαστηκε",
    "time": "yesterday"
  },
  {
    "name": "Dimitra",
    "imageUrl":
        "https://images.unsplash.com/photo-1482555670981-4de159d8553b?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGdpcmwlMjBvbiUyMGJlYWNofGVufDB8fDB8fHww",
    "isOnline": false,
    "hasStory": false,
    "message": "Διαβαστηκε ",
    "time": "2nd Feb"
  },
  {
    "name": "Lefteris",
    "imageUrl":
        "https://images.unsplash.com/photo-1507608869274-d3177c8bb4c7?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8NXx8fGVufDB8fHx8fA%3D%3D",
    "isOnline": false,
    "hasStory": true,
    "message": "Διαβαστηκε",
    "time": "28th Jan"
  },
  {
    "name": "Konstantina",
    "imageUrl":
        "https://images.unsplash.com/photo-1460500063983-994d4c27756c?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "isOnline": false,
    "hasStory": false,
    "message": "Διαβαστηκε",
    "time": "25th Jan"
  },
  {
    "name": "Orestis",
    "imageUrl":
        "https://images.unsplash.com/photo-1443428018053-13da55589fed?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "isOnline": false,
    "hasStory": false,
    "message": "in 30'",
    "time": "15th Jan"
  }
];

_conversations(BuildContext context) {
  return Column(
    children: List.generate(conversationList.length, (index) {
      return InkWell(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Row(
            children: <Widget>[
              Container(
                width: 60,
                height: 60,
                child: Stack(
                  children: <Widget>[
                    conversationList[index]['hasStory']
                        ? Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: Colors.blueAccent, width: 3)),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Container(
                                width: 75,
                                height: 75,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            conversationList[index]
                                                ['imageUrl']),
                                        fit: BoxFit.cover)),
                              ),
                            ),
                          )
                        : Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: NetworkImage(
                                        conversationList[index]['imageUrl']),
                                    fit: BoxFit.cover)),
                          ),
                    conversationList[index]['isOnline']
                        ? Positioned(
                            top: 38,
                            left: 42,
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                  color: Color(0xFF66BB6A),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Color(0xFFFFFFFF), width: 3)),
                            ),
                          )
                        : Container()
                  ],
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    conversationList[index]['name'],
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 135,
                    child: Text(
                      conversationList[index]['message'] +
                          " - " +
                          conversationList[index]['time'],
                      style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFF000000).withOpacity(0.7)),
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      );
    }),
  );
}

class _ConversationsState extends State<Conversations> {
  String name = '';
  String fullname = '';
  String photoUrl = '';
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    name = (await AuthMethods().getUsername(uid))!;
    fullname = (await AuthMethods().getFullname(uid))!;
    photoUrl = (await AuthMethods().getPhotoUrl(uid))!;

    setState(() {});
  }

  var userData = {};

  bool isLoading = false;
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    TextEditingController _searchController = new TextEditingController();

    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 15),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                            photoUrl,
                          ),
                          fit: BoxFit.cover)),
                ),
                Text(
                  name + "'s Chats",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Icon(Icons.edit)
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                  color: Color(0xFFe9eaec),
                  borderRadius: BorderRadius.circular(15)),
              child: TextField(
                cursorColor: Color(0xFF000000),
                controller: _searchController,
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Color(0xFF000000).withOpacity(0.5),
                    ),
                    hintText: "Search",
                    border: InputBorder.none),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
            ),
            _conversations(context)
          ],
        ),
      )),
    );
  }
}
