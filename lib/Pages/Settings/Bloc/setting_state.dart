// ignore_for_file: must_be_immutable

import 'package:dating_app/Models/base_model.dart';
import 'package:dating_app/Models/register_mobilenumber_model.dart';
import 'package:dating_app/Models/userdata_model.dart';
import 'package:equatable/equatable.dart';

abstract class SettingState extends Equatable {}

class SettingInitialState extends SettingState {
  @override
  List<Object?> get props => [];
}

class SettingLoadingState extends SettingState {
  @override
  List<Object?> get props => [];
}

class SettingSuccessState extends SettingState {
  final UserDataModel? registerMobileNumberModel;
  SettingSuccessState(this.registerMobileNumberModel);

  @override
  List<Object?> get props => [];
}

class SettingErrorState extends SettingState {
  String errorMessage = "";
  SettingErrorState(this.errorMessage);

  @override
  List<Object?> get props => [];
}

class SettingEmptyState extends SettingState {
  @override
  List<Object?> get props => [];
}
