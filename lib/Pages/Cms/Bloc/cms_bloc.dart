

import 'package:dating_app/Pages/Cms/Bloc/cms_event.dart';
import 'package:dating_app/Pages/Cms/Bloc/cms_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cms_repository.dart';

class CmsBloc extends Bloc<CmsEvent, CmsState> {
  CmsRepository? repository;

  CmsBloc({this.repository}) : super(CmsInitialState()) {
    on<CmsEvent>(mapEventToState);
  }

  void mapEventToState(CmsEvent event, Emitter<CmsState> emit) async {
    emit(CmsInitialState());

    if (event is GetCmsDataEvent) {
      emit(CmsLoadingState());
      try {
        var model =
        await repository?.getCmsData(apiName: event.apiName);
          emit(CmsSuccessState(model));
      } catch (error, _) {
        if (kDebugMode) {
          print(_.toString());
        }
        emit(CmsErrorState(error.toString()));
      }
    }
  }
}
