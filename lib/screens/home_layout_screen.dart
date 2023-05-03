import 'package:flutter/material.dart';
import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import '../cubit/bottom_navigation_bar/bottom_navigation_bar_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenLayout extends StatelessWidget {
  const HomeScreenLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BottomNavigationBarCubit, BottomNavigationBarState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color(0xff8d8df7),
          body:context.read<BottomNavigationBarCubit>().screens[context.read<BottomNavigationBarCubit>().currentIndex],

          bottomNavigationBar: FluidNavBar(
            defaultIndex: context.read<BottomNavigationBarCubit>().currentIndex,
            animationFactor: .5,
            onChange: (selectedIndex) {
              context.read<BottomNavigationBarCubit>().changeIndex(selectedIndex);
            },
            style: const FluidNavBarStyle(
                iconSelectedForegroundColor: Colors.black,
                iconBackgroundColor: Colors.transparent,
                barBackgroundColor: Color(0xff4A60BA),
                iconUnselectedForegroundColor: Colors.black
            ),
            icons: [
              FluidNavBarIcon(icon: Icons.home),
              FluidNavBarIcon(icon: Icons.settings),
              FluidNavBarIcon(icon: Icons.person),
            ],
          ),
        );
      },
    );
  }
}
