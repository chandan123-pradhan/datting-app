// ignore_for_file: must_be_immutable

import 'package:dating_app/Models/base_model.dart';
import 'package:dating_app/Models/register_mobilenumber_model.dart';
import 'package:equatable/equatable.dart';

abstract class OtpState extends Equatable {}

class OtpInitialState extends OtpState {
  @override
  List<Object?> get props => [];
}

class OtpLoadingState extends OtpState {
  @override
  List<Object?> get props => [];
}

class OtpSuccessState extends OtpState {
  final RegisterMobileNumberModel? registerMobileNumberModel;
  OtpSuccessState(this.registerMobileNumberModel);

  @override
  List<Object?> get props => [];
}

class OtpErrorState extends OtpState {
  String errorMessage = "";
  OtpErrorState(this.errorMessage);

  @override
  List<Object?> get props => [];
}

class OtpEmptyState extends OtpState {
  @override
  List<Object?> get props => [];
}
