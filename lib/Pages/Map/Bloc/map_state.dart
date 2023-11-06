// ignore_for_file: must_be_immutable

import 'package:dating_app/Models/base_model.dart';
import 'package:dating_app/Pages/Map/Model/nearest_user_list_model.dart';
import 'package:equatable/equatable.dart';

abstract class MapState extends Equatable {}

class MapInitialState extends MapState {
  @override
  List<Object?> get props => [];
}

class MapLoadingState extends MapState {
  @override
  List<Object?> get props => [];
}

class GetUserListSuccessState extends MapState {
  final NearestUserListModel? nearestUserListModel;
  GetUserListSuccessState(this.nearestUserListModel);

  @override
  List<Object?> get props => [];
}


class MapErrorState extends MapState {
  String errorMessage = "";
  MapErrorState(this.errorMessage);

  @override
  List<Object?> get props => [];
}

class MapEmptyState extends MapState {
  @override
  List<Object?> get props => [];
}
