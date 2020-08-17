import 'package:duolingo/src/pages/main_screen/appbar_home_screen.dart';
import 'package:duolingo/src/pages/main_screen/bottom_navigation.dart';
import 'package:duolingo/src/utils/images.dart';
import 'package:flutter/material.dart';
import 'circle_avatar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _textCirle(String text) {
    return Text(
      text,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    );
  }

  _body() {
    return ListView(
      children: <Widget>[
        SizedBox(height: 38),
        Column(
          children: <Widget>[
            CircleAvatarIndicator(Color(0xFF55acf3), 'assets/images/home_screen/lesson_egg.png'),
            SizedBox(height: 10),
            _textCirle('Introdução'),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    CircleAvatarIndicator(Color(0xFF55acf3), 'assets/images/home_screen/lesson_dialog.png'),
                    SizedBox(height: 10),
                    _textCirle('Saudações'),
                  ],
                ),
                SizedBox(width: 33),
                Column(
                  children: <Widget>[
                    CircleAvatarIndicator(Color(0xFF55acf3), 'assets/images/home_screen/lesson_airplane.png'),
                    SizedBox(height: 10),
                    _textCirle('Viagem'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    CircleAvatarIndicator(Color(0xFF55acf3), 'assets/images/home_screen/lesson_hamburger.png'),
                    SizedBox(height: 10),
                    _textCirle('Cafeteria'),
                  ],
                ),
                SizedBox(width: 33),
                Column(
                  children: <Widget>[
                    CircleAvatarIndicator(Color(0xFF55acf3), 'assets/images/home_screen/lesson_baby.png'),
                    SizedBox(height: 10),
                    _textCirle('Famílias'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 40),
            Row(crossAxisAlignment: CrossAxisAlignment.end, children: <Widget>[
              Expanded(
                child: Container(
                    margin: const EdgeInsets.only(left: 10.0, right: 15.0),
                    child: Divider(
                      color: Colors.black,
                      height: 50,
                    )),
              ),
              Image.asset(
                'assets/images/home_screen/lesson_divisor_castle.png',
                height: 85,
              ),
              Expanded(
                child: Container(
                    margin: const EdgeInsets.only(left: 15.0, right: 10.0),
                    child: Divider(
                      color: Colors.black,
                      height: 50,
                    )),
              ),
            ]),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    int _currentIndex = 0;
    final double _iconSize = 41;
    final double _iconSizeSelected = 53;
    var appBar = AppBarHomeScreen();
    
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(45.0),
        child: appBar,
      ),
      body: _body(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: Image.asset(
          'assets/images/floating_action_button/tab_training_selected.png',
          height: 33,
        ),
        onPressed: () {},
      ),
      bottomNavigationBar: BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
      backgroundColor: Colors.blue,
      iconSize: _iconSize,

      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: IconButton(
            icon: _currentIndex == 0 ? Images.selectedLessons : Images.tabLessons,
            onPressed: () {
              setState(() {
                _currentIndex = 0;
              });
            },
            iconSize: _currentIndex == 0 ? _iconSizeSelected : _iconSize,
          ),
          title: Padding(padding: EdgeInsets.all(0)),
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            icon: _currentIndex == 1 ? Images.selectedStories : Images.tabStories,
            onPressed: () {
              setState(() {
                _currentIndex = 1;
              });
            },
            iconSize: _currentIndex == 1 ? _iconSizeSelected : _iconSize,
          ),
          title: Padding(padding: EdgeInsets.all(0)),
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            icon: _currentIndex == 2 ? Images.selectedProfile : Images.tabProfile,
            onPressed: () {
              setState(() {
                _currentIndex = 2;
              });
            },
            iconSize: _currentIndex == 2 ? _iconSizeSelected : _iconSize,
          ),
          title: Padding(padding: EdgeInsets.all(0)),
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            icon: _currentIndex == 3 ? Images.selectedRanking : Images.tabRanking,
            onPressed: () {
              setState(() {
                _currentIndex = 3;
              });
            },
            iconSize: _currentIndex == 3 ? _iconSizeSelected : _iconSize,
          ),
          title: Padding(padding: EdgeInsets.all(0)),
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            icon: _currentIndex == 4 ? Images.selectedStore : Images.tabStore,
            onPressed: () {
              setState(() {
                _currentIndex = 4;
              });
            },
            iconSize: _currentIndex == 4 ? _iconSizeSelected : _iconSize,
          ),
          title: Padding(padding: EdgeInsets.all(0)),
        ),
      ],
    )
    );
  }
  }

