import 'package:flutter/material.dart';
import 'package:voltro_task/screens/ui/home_screen.dart';
import 'package:voltro_task/screens/ui/search_screen.dart';
import 'package:voltro_task/utils/colors.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key key}) : super(key: key);

  @override
  _BottomNavigationScreenState createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  PageController _pageController;
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: onPageChanged,
          children: <Widget>[
            HomeScreen(),
            SearchScreen(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
            iconSize: 30.0,
            backgroundColor: Theme.of(context).primaryColor,
            selectedIconTheme: IconThemeData(color: whiteColor),
            unselectedIconTheme:
                IconThemeData(color: whiteColor.withOpacity(0.3)),
            elevation: 3,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: '',
              )
            ],
            currentIndex: _page,
            onTap: navigationTapped));
  }

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  void initState() {
    //Future.delayed(Duration(seconds: 2)).then((onValue)=> ExitDialog.adsDialog(context));
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }
}
