import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Theme.of(context).primaryColor,
      radius: MediaQuery.of(context).size.height * 0.100,
      child: Icon(
        Icons.whatshot_sharp,
        size: 100,
        color: Theme.of(context).cardColor,
      ),
    );
  }
}
