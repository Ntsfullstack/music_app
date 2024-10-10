import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/core/config/assets/app_vectors.dart';
import 'package:spotify/presentation/pages/home_page/home_page.dart';
import 'bloc/bottom_navigation_bar_cubit.dart';

class CustomBottomNavBar extends StatelessWidget {
  CustomBottomNavBar({super.key});

  final List<Widget> _pages = [
    const HomePage(),
    const Placeholder(child: Center(child: Text('Search'))),
    const Placeholder(child: Center(child: Text('Library'))),
    const Placeholder(child: Center(child: Text('Profile'))),
  ];

  final List<BottomNavigationBarItem> _navItems = [
    BottomNavigationBarItem(icon: SvgPicture.asset(AppVectors.home), label: 'Home'),
    BottomNavigationBarItem(icon: SvgPicture.asset(AppVectors.discovery), label: 'Search'),
    BottomNavigationBarItem(icon: SvgPicture.asset(AppVectors.heart), label: 'Library'),
    BottomNavigationBarItem(icon: SvgPicture.asset(AppVectors.profile), label: 'Profile'),
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
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) {
              if (index < _pages.length) {
                context.read<BottomNavCubit>().updateIndex(index);
              }
            },
            items: _navItems,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Theme.of(context).primaryColor,
            unselectedItemColor: Colors.grey,
          ),
        );
      },
    );
  }
}