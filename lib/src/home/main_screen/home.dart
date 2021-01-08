import 'package:duolingo/src/home/appbar_home_screen.dart';
import 'package:duolingo/src/home/main_screen/home_screen.dart';
import 'package:duolingo/src/home/main_screen/profile.dart';
import 'package:duolingo/src/home/main_screen/ranking.dart';
import 'package:duolingo/src/home/main_screen/store.dart';
import 'package:duolingo/src/home/main_screen/stories.dart';
import 'package:duolingo/src/utils/images.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> screens = [
    HomeScreen(),
    Profile(),
    Ranking(),
    Store(),
    Stories(),
  ];
  final PageStorageBucket _bucket = PageStorageBucket();
  Widget currentScreen = HomeScreen();

  @override
  Widget build(BuildContext context) {
    const double _iconSize = 41;
    const double _iconSizeSelected = 53;
    final AppBarHomeScreen appBar = AppBarHomeScreen();

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(45),
          child: appBar,
        ),
        body: PageStorage(
          bucket: _bucket,
          child: currentScreen,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {},
          child: Image.asset(
            "assets/images/floating_action_button/tab_training_selected.png",
            height: 33,
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          backgroundColor: Colors.blue,
          iconSize: _iconSize,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: IconButton(
                icon: _currentIndex == 0
                    ? Images.selectedLessons
                    : Images.tabLessons,
                onPressed: () {
                  setState(() {
                    _currentIndex = 0;
                    currentScreen = HomeScreen();
                  });
                },
                iconSize: _currentIndex == 0 ? _iconSizeSelected : _iconSize,
              ),
              title: const Padding(padding: EdgeInsets.all(0)),
            ),
            BottomNavigationBarItem(
              icon: IconButton(
                icon: _currentIndex == 1
                    ? Images.selectedStories
                    : Images.tabStories,
                onPressed: () {
                  setState(() {
                    _currentIndex = 1;
                    currentScreen = Stories();
                  });
                },
                iconSize: _currentIndex == 1 ? _iconSizeSelected : _iconSize,
              ),
              title: const Padding(padding: EdgeInsets.all(0)),
            ),
            BottomNavigationBarItem(
              icon: IconButton(
                icon: _currentIndex == 2
                    ? Images.selectedProfile
                    : Images.tabProfile,
                onPressed: () {
                  setState(() {
                    _currentIndex = 2;
                    currentScreen = Profile();
                  });
                },
                iconSize: _currentIndex == 2 ? _iconSizeSelected : _iconSize,
              ),
              title: const Padding(padding: EdgeInsets.all(0)),
            ),
            BottomNavigationBarItem(
              icon: IconButton(
                icon: _currentIndex == 3
                    ? Images.selectedRanking
                    : Images.tabRanking,
                onPressed: () {
                  setState(() {
                    _currentIndex = 3;
                    currentScreen = Ranking();
                  });
                },
                iconSize: _currentIndex == 3 ? _iconSizeSelected : _iconSize,
              ),
              title: const Padding(padding: EdgeInsets.all(0)),
            ),
            BottomNavigationBarItem(
              icon: IconButton(
                icon:
                    _currentIndex == 4 ? Images.selectedStore : Images.tabStore,
                onPressed: () {
                  setState(() {
                    _currentIndex = 4;
                    currentScreen = Store();
                  });
                },
                iconSize: _currentIndex == 4 ? _iconSizeSelected : _iconSize,
              ),
              title: const Padding(padding: EdgeInsets.all(0)),
            ),
          ],
        ));
  }
}
