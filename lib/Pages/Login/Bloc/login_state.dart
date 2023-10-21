// ignore_for_file: must_be_immutable

import 'package:dating_app/Models/base_model.dart';
import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {}

class LoginInitialState extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginLoadingState extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginSuccessState extends LoginState {
  final BaseModel? baseModel;
  LoginSuccessState(this.baseModel);

  @override
  List<Object?> get props => [];
}

class LoginErrorState extends LoginState {
  String errorMessage = "";
  LoginErrorState(this.errorMessage);

  @override
  List<Object?> get props => [];
}

class LoginEmptyState extends LoginState {
  @override
  List<Object?> get props => [];
}
