import 'package:flutter/material.dart';

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
              ),
            ],
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
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
