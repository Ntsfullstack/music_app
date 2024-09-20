import 'package:flutter/material.dart';

class CustomTabBarView extends StatelessWidget {
  final TabController tabController;

  const CustomTabBarView({Key? key, required this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        controller: tabController,
        children: const [
          Center(child: Text('Home Page Content')),
          Center(child: Text('Search Page Content')),
          Center(child: Text('Library Page Content')),
          Center(child: Text('Profile Page Content')),
        ],
      ),
    );
  }
}
