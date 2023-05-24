import 'package:flutter/material.dart';

import '../auth/signup_view.dart';

class CustomFotter extends StatelessWidget {
  const CustomFotter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(' have not an account? ',
            style: TextStyle(color: Colors.black)),
        const SizedBox(
          width: 4,
        ),
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RegisterScreen()));
          },
          child: const Text('Sign up',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
        )
      ],
    );
  }
}
