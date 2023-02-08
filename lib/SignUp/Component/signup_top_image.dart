import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class SignUpTopImage extends StatelessWidget {
  const SignUpTopImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [const
      Text("Sign Up",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0)),
        Row(

          children: [
            const Spacer(),
            Expanded(
              flex: 3,
              child: SvgPicture.asset("assets/icons/signup.svg"),
            ),
            const Spacer()
          ],
        ),
        const SizedBox(height: 1.0)
      ],
    );
  }
}
