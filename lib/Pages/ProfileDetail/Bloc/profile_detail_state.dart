// ignore_for_file: must_be_immutable

import 'package:dating_app/Models/base_model.dart';
import 'package:dating_app/Models/register_mobilenumber_model.dart';
import 'package:dating_app/Models/userdata_model.dart';
import 'package:equatable/equatable.dart';

abstract class ProfileDetailState extends Equatable {}

class ProfileDetailInitialState extends ProfileDetailState {
  @override
  List<Object?> get props => [];
}

class ProfileDetailLoadingState extends ProfileDetailState {
  @override
  List<Object?> get props => [];
}

class ProfileDetailSuccessState extends ProfileDetailState {
  final UserDataModel? userDataModel;
  ProfileDetailSuccessState(this.userDataModel);

  @override
  List<Object?> get props => [];
}

class ProfileDetailErrorState extends ProfileDetailState {
  String errorMessage = "";
  ProfileDetailErrorState(this.errorMessage);

  @override
  List<Object?> get props => [];
}

class ProfileDetailEmptyState extends ProfileDetailState {
  @override
  List<Object?> get props => [];
}
