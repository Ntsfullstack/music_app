import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/core/config/assets/app_vectors.dart';
import 'package:spotify/presentation/pages/home_page/home_page.dart';
import 'package:spotify/presentation/pages/profile_page/profile_page.dart';
import '../search_page/search_page.dart';
import 'bloc/bottom_navigation_bar_cubit.dart';

class CustomBottomNavBar extends StatelessWidget {
  CustomBottomNavBar({Key? key}) : super(key: key);

  final List<Widget> _pages = [
    HomePage(),
    SearchPage(),
    const Placeholder(child: Center(child: Text('Library'))),
    const ProfilePage(),
  ];

  final List<_CustomBottomNavBarItem> _navItems = [
    _CustomBottomNavBarItem(icon: AppVectors.home, label: 'Home'),
    _CustomBottomNavBarItem(icon: AppVectors.discovery, label: 'Search'),
    _CustomBottomNavBarItem(icon: AppVectors.heart, label: 'Library'),
    _CustomBottomNavBarItem(icon: AppVectors.profile, label: 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          body: IndexedStack(
            index: currentIndex,
            children: _pages,
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                ),
              ],
            ),
            child: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (index) {
                if (index < _pages.length) {
                  context.read<BottomNavCubit>().updateIndex(index);
                }
              },
              items: _navItems.map((item) => item.toBottomNavigationBarItem(
                context,
                isSelected: _navItems.indexOf(item) == currentIndex,
              )).toList(),
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Theme.of(context).primaryColor,
              unselectedItemColor: Colors.grey,
              showSelectedLabels: true,
              showUnselectedLabels: true,
            ),
          ),
        );
      },
    );
  }
}

class _CustomBottomNavBarItem {
  final String icon;
  final String label;

  _CustomBottomNavBarItem({required this.icon, required this.label});

  BottomNavigationBarItem toBottomNavigationBarItem(BuildContext context, {required bool isSelected}) {
    return BottomNavigationBarItem(
      icon: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 30,
            height: 4,
            decoration: BoxDecoration(
              color: isSelected ? Theme.of(context).primaryColor : Colors.transparent,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 4),
          SvgPicture.asset(
            icon,
            color: isSelected ? Theme.of(context).primaryColor : Colors.grey,
          ),
        ],
      ),
      label: label,
    );
  }
}