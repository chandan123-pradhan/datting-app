
import 'dart:developer';

import 'package:dating_app/Pages/Map/Bloc/map_event.dart';
import 'package:dating_app/Pages/Map/Bloc/map_repository.dart';
import 'package:dating_app/Pages/Map/Bloc/map_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapRepository? repository;

  MapBloc({this.repository}) : super(MapInitialState()) {
  on<MapEvent>(mapEventToState);
  }

  void mapEventToState(MapEvent event, Emitter<MapState> emit) async {
    emit(MapInitialState());

    if (event is FetchUserEvent) {
      emit(MapLoadingState());
      try {
        var model =
        await repository?.getNearestUserList(
          lat: event.lat,
          lang: event.lang,
          km: '1000',
        );
        // debugger();
        if (model?.success == true) {
          emit(GetUserListSuccessState(model!));
        } else {
          emit(MapErrorState(model?.message ?? ""));
        }
      } catch (error, _) {
        if (kDebugMode) {
          print(_.toString());
        }
        emit(MapErrorState(error.toString()));
      }
    }
  }
}
