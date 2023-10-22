
import 'package:dating_app/Pages/Settings/Bloc/setting_event.dart';
import 'package:dating_app/Pages/Settings/Bloc/setting_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'setting_repository.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingRepository? repository;

  SettingBloc({this.repository}) : super(SettingInitialState()) {
    on<SettingEvent>(mapEventToState);
  }

  void mapEventToState(SettingEvent event, Emitter<SettingState> emit) async {
    emit(SettingInitialState());

    if (event is GetSettingData) {
      emit(SettingLoadingState());
      try {
        var model =
        await repository?.getSettingData();
        if (model?.success == true) {
          emit(SettingSuccessState(model!));
        } else {
          emit(SettingErrorState(model?.message ?? ""));
        }
      } catch (error, _) {
        if (kDebugMode) {
          print(_.toString());
        }
        emit(SettingErrorState(error.toString()));
      }
    }
  }
}
