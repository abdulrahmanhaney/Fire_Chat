import 'package:flutter/material.dart';

import '../../../../../Core/styles/text_styles.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: const Row(
            children: [
              Icon(
                Icons.whatshot,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Fire Chat',
                style: AppTextStyles.s20b,
              ),
            ],
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.camera_alt_rounded)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.rowing)),
          ],
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CircleAvatar(
                  radius: 20,
                  backgroundColor: Theme.of(context).primaryColor,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
