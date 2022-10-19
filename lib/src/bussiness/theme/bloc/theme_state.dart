// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  final ThemeData theme;
  const ThemeState({required this.theme});

  @override
  List<Object> get props => [theme];

  factory ThemeState.initial() {
    return ThemeState(theme: AppThemes.appThemeData[AppTheme.darkTheme]!);
  }

  ThemeState copyWith({
    ThemeData? theme,
  }) {
    return ThemeState(
      theme: theme ?? this.theme,
    );
  }
}
