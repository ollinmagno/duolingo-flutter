import 'package:duolingo/src/pages/main_screen/perfil.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;

  final _tabLessons =
      Image.asset('assets/images/bottom_navigation_bar/tab_lessons.png');
  final _tabStories =
      Image.asset('assets/images/bottom_navigation_bar/tab_stories.png');
  final _tabProfile =
      Image.asset('assets/images/bottom_navigation_bar/tab_profile.png');
  final _tabRanking =
      Image.asset('assets/images/bottom_navigation_bar/tab_ranking.png');
  final _tabStore =
      Image.asset('assets/images/bottom_navigation_bar/tab_store.png');

  final _selectedLessons = Image.asset(
      'assets/images/bottom_navigation_bar/tab_lessons_selected.png');
  final _selectedStories = Image.asset(
      'assets/images/bottom_navigation_bar/tab_stories_selected.png');
  final _selectedProfile = Image.asset(
      'assets/images/bottom_navigation_bar/tab_profile_selected.png');
  final _selectedRanking = Image.asset(
      'assets/images/bottom_navigation_bar/tab_ranking_selected.png');
  final _selectedStore =
      Image.asset('assets/images/bottom_navigation_bar/tab_store_selected.png');

  final double _iconSize = 41;
  final double _iconSizeSelected = 53;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
            icon: _currentIndex == 0 ? _selectedLessons : _tabLessons,
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
            icon: _currentIndex == 1 ? _selectedStories : _tabStories,
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
            icon: _currentIndex == 2 ? _selectedProfile : _tabProfile,
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
            icon: _currentIndex == 3 ?_selectedRanking : _tabRanking,
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
            icon: _currentIndex == 4 ? _selectedStore : _tabStore,
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
    );
  }
}
