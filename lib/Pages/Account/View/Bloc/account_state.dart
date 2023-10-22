// ignore_for_file: must_be_immutable

import 'package:dating_app/Models/base_model.dart';
import 'package:dating_app/Models/register_mobilenumber_model.dart';
import 'package:dating_app/Models/userdata_model.dart';
import 'package:equatable/equatable.dart';

abstract class AccountState extends Equatable {}

class AccountInitialState extends AccountState {
  @override
  List<Object?> get props => [];
}

class AccountLoadingState extends AccountState {
  @override
  List<Object?> get props => [];
}

class AccountSuccessState extends AccountState {
  final UserDataModel? userDataModel;
  AccountSuccessState(this.userDataModel);

  @override
  List<Object?> get props => [];
}

class AccountErrorState extends AccountState {
  String errorMessage = "";
  AccountErrorState(this.errorMessage);

  @override
  List<Object?> get props => [];
}

class AccountEmptyState extends AccountState {
  @override
  List<Object?> get props => [];
}
