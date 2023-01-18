import 'package:flutter/material.dart';

import '../background.dart';
import '../widgets/responsive.dart';
import 'Component/signup_field.dart';
import 'Component/signup_top_image.dart';
class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackGround(
      child: SingleChildScrollView(
        child: Responsive(
          mobile: const MobileSignUpScreen(),
          desktop: Row(
            children:  [const Expanded(child: SignUpTopImage()),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(
                      width: 350,
                      child: SignUpField(),
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
class MobileSignUpScreen extends StatelessWidget {
  const MobileSignUpScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const SignUpTopImage(),
        Row(
          children: const [
            Spacer(),
            Expanded(
              flex: 8,
              child: SignUpField(),
            ),
            Spacer(),
          ],
        ),
      ],
    );
  }
}
