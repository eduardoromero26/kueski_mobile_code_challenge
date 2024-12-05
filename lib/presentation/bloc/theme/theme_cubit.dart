import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeCubit extends Cubit<bool> {
  ThemeCubit() : super(true) {
    _loadTheme();
  }

  void toggleTheme() async {
    final isLightTheme = !state;
    emit(isLightTheme);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLightTheme', isLightTheme);
  }

  void _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isLightTheme = prefs.getBool('isLightTheme') ?? true;
    emit(isLightTheme);
  }
}