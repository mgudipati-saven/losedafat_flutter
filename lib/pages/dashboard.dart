import 'dart:developer';

import 'package:flutter/material.dart';

import '../widgets/ruler.dart';
import '../widgets/gauge.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
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
                Container(
                  width: 400,
                  height: 25,
                  child: Ruler(
                    tickColor: Color(0xFF576BC1),
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
        ),
        Card(
          color: Color(0xFF576BC1),
          elevation: 0.1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 32, 12, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 400,
                  height: 200,
                  child: Gauge(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
