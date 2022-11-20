// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../app/util/util.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState.initial()) {
    on<ThemeEvent>(switchTheme);
  }
  void switchTheme(ThemeEvent event, Emitter<ThemeState> emitter) {
    if (state.theme == AppThemes.appThemeData[AppTheme.lightTheme]) {
      emitter(
          state.copyWith(theme: AppThemes.appThemeData[AppTheme.darkTheme]!));
    } else {
      emitter(
          state.copyWith(theme: AppThemes.appThemeData[AppTheme.lightTheme]!));
    }
  }

  bool get isLightTheme =>
      state.theme == AppThemes.appThemeData[AppTheme.lightTheme] ? true : false;
}
