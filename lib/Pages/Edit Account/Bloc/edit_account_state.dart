// ignore_for_file: must_be_immutable

import 'package:dating_app/Models/base_model.dart';
import 'package:dating_app/Models/register_mobilenumber_model.dart';
import 'package:dating_app/Models/userdata_model.dart';
import 'package:dating_app/Pages/Register/Model/interest_response_model.dart';
import 'package:equatable/equatable.dart';

abstract class EditAccountState extends Equatable {}

class EditAccountInitialState extends EditAccountState {
  @override
  List<Object?> get props => [];
}

class EditAccountLoadingState extends EditAccountState {
  @override
  List<Object?> get props => [];
}

class EditAccountSuccessState extends EditAccountState {
  final UserDataModel? userDataModel;
  EditAccountSuccessState(this.userDataModel);

  @override
  List<Object?> get props => [];
}

class GetInterestSuccessState extends EditAccountState {
  final InterestResponseModel? interestResponseModel;
  GetInterestSuccessState(this.interestResponseModel);

  @override
  List<Object?> get  props => [interestResponseModel];
}

class EditAccountErrorState extends EditAccountState {
  String errorMessage = "";
  EditAccountErrorState(this.errorMessage);

  @override
  List<Object?> get props => [];
}

class EditAccountEmptyState extends EditAccountState {
  @override
  List<Object?> get props => [];
}
