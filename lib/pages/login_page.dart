import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/circle_icon.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: Container(
              height: 435,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/background.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 287),
                ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: SvgPicture.asset(
                    'images/logo.svg',
                    semanticsLabel: 'Logo',
                  ),
                ),
                SizedBox(height: 40),
                Text(
                  'Lose Da Fat',
                  style: TextStyle(
                    fontSize: 30,
                    color: Color(0xFF1F2453),
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text(
                  'Lose weight with your social circle of friends, family and colleagues',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF1F2453),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30),
                SocialLoginButton(
                  icon: CircleIcon(
                    icon: FontAwesomeIcons.google,
                    fillColor: Color(0xFFF37474),
                    iconColor: Colors.white,
                    size: 34,
                  ),
                  label: 'Sign in with Google',
                ),
                SizedBox(height: 10),
                SocialLoginButton(
                  icon: CircleIcon(
                    icon: FontAwesomeIcons.facebookF,
                    fillColor: Color(0xFF576BC1),
                    iconColor: Colors.white,
                    size: 34,
                  ),
                  label: 'Sign in with Facebook',
                ),
                SizedBox(height: 10),
                SocialLoginButton(
                  icon: CircleIcon(
                    icon: FontAwesomeIcons.apple,
                    fillColor: Color(0xFF1F2453),
                    iconColor: Colors.white,
                    size: 34,
                  ),
                  label: 'Sign in with Apple',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SocialLoginButton extends StatelessWidget {
  final Widget icon;
  final String label;

  const SocialLoginButton({
    Key key,
    @required this.icon,
    @required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          style: BorderStyle.solid,
          width: 1,
          color: Color(0xFFDEE4E9),
        ),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            icon,
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1F2453),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
