import 'package:flutter/material.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CircleAvatar(
          backgroundColor: Colors.black,
          radius: 100,
          child: Icon(
            Icons.whatshot_sharp,
            size: 100,
          ),
        )
      ],
    );
  }
}
