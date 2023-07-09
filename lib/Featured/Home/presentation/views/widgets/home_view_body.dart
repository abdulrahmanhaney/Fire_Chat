import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fire_chat/Core/utils/service_lactor.dart';
import 'package:fire_chat/Featured/Auth/data/models/user_model.dart';
import 'package:fire_chat/Featured/Home/presentation/views/widgets/group_item.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  UserModel? userModel;
  SharedPreferences? sharedPreferences;

  @override
  void initState() {
    super.initState();
    sharedPreferences = getIt.get<SharedPreferences>();
    userModel = UserModel.fromJson(
      jsonDecode(sharedPreferences!.getString('userInfo')!),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Row(
            children: [
              CircleAvatar(
                child: CachedNetworkImage(
                  imageUrl: userModel?.pic ?? 'ergsdreror.png',
                  placeholder: (context, url) {
                    return const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    );
                  },
                  errorWidget: (context, url, error) =>
                      Image.asset('assets/images/profile.png'),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                userModel?.username ?? '',
                style: const TextStyle(
                  fontFamily: 'SofiaPro',
                  fontWeight: FontWeight.bold,
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
        ),
        SliverFillRemaining(
          child: ListView.builder(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return const GroupItem();
            },
          ),
        ),
      ],
    );
  }
}
