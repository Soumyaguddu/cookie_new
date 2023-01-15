import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginTopPage extends StatelessWidget {
  const LoginTopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [const
        Text("LOGIN",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0)),
        const SizedBox(height: 16.0 * 2),
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 8,
              child: SvgPicture.asset("assets/icons/login.svg"),
            ),
            const Spacer()
          ],
        ),
        const SizedBox(height: 16.0*2)
      ],
    );
  }
}
