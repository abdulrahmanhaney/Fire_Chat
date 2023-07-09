import 'package:fire_chat/Core/styles/text_styles.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
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
        SliverFillRemaining(
          child: ListView.builder(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(top: 10, left: 15, right: 15),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(15),
                ),
                height: 70,
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Theme.of(context).primaryColor,
                      radius: 22,
                      child: const CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(
                            'https://as1.ftcdn.net/v2/jpg/04/15/47/46/1000_F_415474633_0Q1hAKF0U1Xiots9CXgzpttuIlJVHGS7.jpg'),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Abdulrahman Hany',
                          style: AppTextStyles.s12b,
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
