import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:genkid/screens/profile_screen.dart';
import 'package:genkid/screens/setting_screen.dart';
import 'package:meta/meta.dart';

import '../../screens/home_screen.dart';
part 'bottom_navigation_bar_state.dart';

class BottomNavigationBarCubit extends Cubit<BottomNavigationBarState> {
  BottomNavigationBarCubit() : super(BottomNavigationBarInitial());



  int currentIndex=0;
  List<Widget>screens=const[
    HomeScreen(),
    SettingScreen(),
    ProfileScreen(),

  ];



  void changeIndex(int index){
    currentIndex=index;
    emit(AppChangeBottomNavigationBarState());
  }
}
