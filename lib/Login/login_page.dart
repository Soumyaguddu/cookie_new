import 'package:cookie_new/Login/Component/login_field.dart';
import 'package:cookie_new/Login/Component/login_screen_top_image.dart';
import 'package:cookie_new/widgets/responsive.dart';
import 'package:flutter/material.dart';

import '../background.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackGround(
      child: SingleChildScrollView(
        child: Responsive(
          mobile: MobileLoginScreen(),
          desktop: Row(
            children:  [Expanded(child: LoginTopPage()),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(
                      width: 350,
                      child: LoginPageForm(),
                    ),
                  ],
                ),
              ),],
          ),
        ),
      ),
    );
  }
}

class MobileLoginScreen extends StatelessWidget {
  const MobileLoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const LoginTopPage(),
        Row(
          children: const [
            Spacer(),
            Expanded(
              flex: 8,
              child: LoginPageForm(),
            ),
            Spacer(),
          ],
        ),
      ],
    );
  }
}
