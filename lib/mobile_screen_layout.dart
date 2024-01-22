import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:local/screens/add_post_screen.dart';
import 'package:local/screens/conservations.dart';
import 'package:local/screens/profile_screen.dart';
import 'package:local/screens/search_screen.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  int _page = 0;

  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  void navigationTapped(int page) {
    //Animating Page
    pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        children: [
          Conversations(),
          SearchScreen(),
          AddPostScreen(uid: FirebaseAuth.instance.currentUser!.uid),
          ProfileScreen(uid: FirebaseAuth.instance.currentUser!.uid),
        ],
      ),
      bottomNavigationBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.message_rounded,
                  color: _page == 0
                      ? Colors.white
                      : Color.fromARGB(255, 77, 77, 77)),
              label: '',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.home,
                  color: _page == 1
                      ? Colors.white
                      : Color.fromARGB(255, 77, 77, 77)),
              label: '',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle,
                  color: _page == 2
                      ? Colors.white
                      : Color.fromARGB(255, 77, 77, 77)),
              label: '',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.person,
                  color: _page == 3
                      ? Colors.white
                      : Color.fromARGB(255, 77, 77, 77)),
              label: '',
              backgroundColor: Colors.white),
        ],
        onTap: navigationTapped,
        currentIndex: _page,
      ),
    );
  }
}
