
import 'package:dating_app/Pages/Edit%20Account/Bloc/edit_account_event.dart';
import 'package:dating_app/Pages/Edit%20Account/Bloc/edit_account_repository.dart';
import 'package:dating_app/Pages/Edit%20Account/Bloc/edit_account_state.dart';
import 'package:dating_app/Pages/Register/Model/interest_response_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditAccountBloc extends Bloc<EditAccountEvent, EditAccountState> {
  EditAccountRepository? repository;

  EditAccountBloc({this.repository}) : super(EditAccountInitialState()) {
    on<EditAccountEvent>(mapEventToState);
  }

  void mapEventToState(EditAccountEvent event, Emitter<EditAccountState> emit) async {
    emit(EditAccountInitialState());

    if (event is GetEditAccountData) {
      emit(EditAccountLoadingState());
      try {
        var model =
        await repository?.getEditAccountData();
        if (model?.success == true) {
          emit(EditAccountSuccessState(model!));
        } else {
          emit(EditAccountErrorState(model?.message ?? ""));
        }
      } catch (error, _) {
        if (kDebugMode) {
          print(_.toString());
        }
        emit(EditAccountErrorState(error.toString()));
      }
    }
    if (event is GetInterestEvent) {
      emit(EditAccountLoadingState());
      try {
        InterestResponseModel? interestResponseModel =
        await repository?.getInterestList();
        if (interestResponseModel?.message == "Success") {
          emit(GetInterestSuccessState(interestResponseModel!));
        } else {
          emit(EditAccountErrorState(interestResponseModel?.message ?? ""));
        }
      } catch (error, _) {
        if (kDebugMode) {
          print(_.toString());
        }
        emit(EditAccountErrorState(error.toString()));
      }
    }
  }
}
