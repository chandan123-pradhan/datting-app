// ignore_for_file: must_be_immutable

import 'package:dating_app/Models/base_model.dart';
import 'package:dating_app/Models/register_mobilenumber_model.dart';
import 'package:equatable/equatable.dart';

abstract class CmsState extends Equatable {}

class CmsInitialState extends CmsState {
  @override
  List<Object?> get props => [];
}

class CmsLoadingState extends CmsState {
  @override
  List<Object?> get props => [];
}

class CmsSuccessState extends CmsState {
  final RegisterMobileNumberModel? registerMobileNumberModel;
  CmsSuccessState(this.registerMobileNumberModel);

  @override
  List<Object?> get props => [];
}

class CmsErrorState extends CmsState {
  String errorMessage = "";
  CmsErrorState(this.errorMessage);

  @override
  List<Object?> get props => [];
}

class CmsEmptyState extends CmsState {
  @override
  List<Object?> get props => [];
}
