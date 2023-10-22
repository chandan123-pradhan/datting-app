
import 'package:dating_app/Pages/ProfileDetail/Bloc/profile_detail_event.dart';
import 'package:dating_app/Pages/ProfileDetail/Bloc/profile_detail_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'profile_detail_repository.dart';

class ProfileDetailBloc extends Bloc<ProfileDetailEvent, ProfileDetailState> {
  ProfileDetailRepository? repository;

  ProfileDetailBloc({this.repository}) : super(ProfileDetailInitialState()) {
    on<ProfileDetailEvent>(mapEventToState);
  }

  void mapEventToState(ProfileDetailEvent event, Emitter<ProfileDetailState> emit) async {
    emit(ProfileDetailInitialState());

    if (event is GetProfileDetailData) {
      emit(ProfileDetailLoadingState());
      try {
        var model =
        await repository?.getProfileDetailData();
        if (model?.success == true) {
          emit(ProfileDetailSuccessState(model!));
        } else {
          emit(ProfileDetailErrorState(model?.message ?? ""));
        }
      } catch (error, _) {
        if (kDebugMode) {
          print(_.toString());
        }
        emit(ProfileDetailErrorState(error.toString()));
      }
    }
  }
}
