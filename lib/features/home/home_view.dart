import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:insights_news/core/utils/colors.dart';
import 'package:insights_news/features/news/news_view.dart';
import 'package:insights_news/features/profile/profile_view.dart';
import 'package:insights_news/features/resources/resources_view.dart';
import 'package:insights_news/features/search/search_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;
  List<Widget> screens = [
    const NewsView(),
    const SearchView(),
    const NotificationView(),
    const ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.sacffoldBG,
        // selectedItemColor: AppColors.lomanda,
        // unselectedItemColor: AppColors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          // BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          // BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Home'),
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.notifications), label: 'Search'),
          // BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile')
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/home.svg'),
              label: 'Home',
              activeIcon: SvgPicture.asset(
                'assets/home.svg',
                colorFilter:
                    ColorFilter.mode(AppColors.lomanda, BlendMode.srcIn),
              )),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/Group.svg'),
              label: 'Home',
              activeIcon: SvgPicture.asset(
                'assets/Group.svg',
                colorFilter:
                    ColorFilter.mode(AppColors.lomanda, BlendMode.srcIn),
              )),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/resource.svg',
                width: 20,
                height: 20,
                colorFilter: ColorFilter.mode(AppColors.grey, BlendMode.srcIn),
              ),
              label: 'Sources',
              activeIcon: SvgPicture.asset(
                'assets/resource.svg',
                width: 20,
                height: 20,
                colorFilter:
                    ColorFilter.mode(AppColors.lomanda, BlendMode.srcIn),
              )),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/Vector.svg'),
              label: 'Vector',
              activeIcon: SvgPicture.asset(
                'assets/Vector.svg',
                colorFilter:
                    ColorFilter.mode(AppColors.lomanda, BlendMode.srcIn),
              )),
        ],
      ),
    );
  }
}
