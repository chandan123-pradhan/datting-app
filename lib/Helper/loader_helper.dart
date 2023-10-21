import 'package:dating_app/Configurations/theme_configuration.dart';
import 'package:flutter/material.dart';

class LoaderHelper {
  static pageLoader() {
    return  Center(child: CircularProgressIndicator(color: ThemeConfiguration.primaryColor,));
  }
}
