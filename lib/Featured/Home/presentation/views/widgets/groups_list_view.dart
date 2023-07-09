import 'package:flutter/material.dart';

import 'group_item.dart';

class GroupsListView extends StatelessWidget {
  const GroupsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return const GroupItem();
        },
      ),
    );
  }
}
