import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../Auth/data/models/user_model.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.userModel,
  });

  final UserModel? userModel;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Container(
              clipBehavior: Clip.hardEdge,
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
                borderRadius: BorderRadius.circular(100),
              ),
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl:
                    'https://as1.ftcdn.net/v2/jpg/04/15/47/46/1000_F_415474633_0Q1hAKF0U1Xiots9CXgzpttuIlJVHGS7.jpg',
                placeholder: (context, url) {
                  return const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  );
                },
                errorWidget: (context, url, error) => Image.asset(
                  'assets/images/profile.png',
                  height: 30,
                  color: Theme.of(context).appBarTheme.titleTextStyle!.color,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.3,
            child: Text(
              userModel?.username!.split(' ')[0] ?? '',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.compass_calibration_rounded,
            size: 20,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.settings,
            size: 20,
          ),
        ),
      ],
    );
  }
}
