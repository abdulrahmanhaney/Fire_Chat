import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: MediaQuery.of(context).size.height * 0.100,
      child: const Icon(
        Icons.whatshot_sharp,
        size: 100,
      ),
    );
  }
}
