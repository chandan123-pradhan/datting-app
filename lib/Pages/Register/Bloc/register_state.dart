// ignore_for_file: must_be_immutable

import 'package:dating_app/Models/base_model.dart';
import 'package:dating_app/Models/register_mobilenumber_model.dart';
import 'package:dating_app/Models/userdata_model.dart';
import 'package:equatable/equatable.dart';

abstract class RegisterState extends Equatable {}

class RegisterInitialState extends RegisterState {
  @override
  List<Object?> get props => [];
}

class RegisterLoadingState extends RegisterState {
  @override
  List<Object?> get props => [];
}

class RegisterSuccessState extends RegisterState {
  final BaseModel? baseModel;
  RegisterSuccessState(this.baseModel);

  @override
  List<Object?> get  props => [];
}
class RegisterMobileNumberSuccessState extends RegisterState {
  final RegisterMobileNumberModel? registerMobileNumberModel;
  RegisterMobileNumberSuccessState(this.registerMobileNumberModel);

  @override
  List<Object?> get  props => [];
}

class RegisterFullNameSuccessState extends RegisterState {
  final UserDataModel? userDataModel;
  RegisterFullNameSuccessState(this.userDataModel);

  @override
  List<Object?> get  props => [];
}


class RegisterErrorState extends RegisterState {
  String errorMessage = "";
  RegisterErrorState(this.errorMessage);

  @override
  List<Object?> get props => [];
}

class RegisterEmptyState extends RegisterState {
  @override
  List<Object?> get props => [];
}
