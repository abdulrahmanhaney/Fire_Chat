import 'dart:convert';
import 'package:fire_chat/Core/utils/service_lactor.dart';
import 'package:fire_chat/Featured/Auth/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'groups_list_view.dart';
import 'home_view_custom_app_bar.dart';

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
        CustomAppBar(userModel: userModel),
        const GroupsListView(),
      ],
    );
  }
}
