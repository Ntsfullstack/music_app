import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemesCubit extends HydratedCubit <ThemeMode> {
  ThemesCubit() : super(ThemeMode.system);

  void changeTheme(ThemeMode themeMode) {
    emit(themeMode);
  }
  ThemeMode? fromJson(Map<String, dynamic> json) {

  }

  @override
  Map<String, dynamic>? toJson(ThemeMode state) {

  }

}