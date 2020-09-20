import 'package:flutter/material.dart';

import '../widgets/circle_icon.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F7FB),
      appBar: AppBar(
        backgroundColor: Color(0xFFF4F7FB),
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: Image.asset(
            'images/menu.png',
            width: 44,
            height: 24,
          ),
        ),
        title: const Text(
          'Home',
          style: TextStyle(
            color: Color(0xFF1F2453),
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: IconButton(
              icon: CircleIcon(
                icon: Icons.add,
                fillColor: Color(0xFF97D749),
                iconColor: Colors.white,
                size: 28,
              ),
              onPressed: () => {},
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: <Widget>[
          Card(
            elevation: 0.1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Competetion 2',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Image.asset('images/clock.png'),
                      SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'END DATE',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            '01.02.2020',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            color: Color(0xFF1F2453),
                            fontSize: 26,
                            fontWeight: FontWeight.w500,
                          ),
                          children: [
                            TextSpan(
                              text: '-3.5',
                            ),
                            WidgetSpan(
                              child: Transform.translate(
                                offset: const Offset(0.0, -7.0),
                                child: Text(
                                  ' lb',
                                  style: TextStyle(
                                    color: Color(0xFF1F2453),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 30),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            color: Color(0xFF1F2453),
                            fontSize: 26,
                            fontWeight: FontWeight.w500,
                          ),
                          children: [
                            TextSpan(
                              text: '-1.2',
                            ),
                            WidgetSpan(
                              child: Transform.translate(
                                offset: const Offset(0.0, -7.0),
                                child: Text(
                                  ' %',
                                  style: TextStyle(
                                    color: Color(0xFF1F2453),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(
                          color: Color(0xFF576BC1),
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(
                            text: '90.5',
                          ),
                          TextSpan(
                            text: '\nlb',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon: Image.asset('images/home.png'),
            title: Text('Home'),
            backgroundColor: Color(0xFFF4F6FF),
            icon: Image.asset('images/home_i.png'),
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset('images/weight.png'),
            title: Text('Weight'),
            backgroundColor: Color(0xFFF4F6FF),
            icon: Image.asset('images/weight_i.png'),
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset('images/chat.png'),
            title: Text('Chat'),
            backgroundColor: Color(0xFFF4F6FF),
            icon: Image.asset('images/chat_i.png'),
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset('images/contests.png'),
            title: Text('Contests'),
            backgroundColor: Color(0xFFF4F6FF),
            icon: Image.asset('images/contests_i.png'),
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset('images/food.png'),
            title: Text('Food'),
            backgroundColor: Color(0xFFF4F6FF),
            icon: Image.asset('images/food_i.png'),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
