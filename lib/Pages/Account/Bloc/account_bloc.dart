

import 'package:dating_app/Pages/Account/Bloc/account_event.dart';
import 'package:dating_app/Pages/Account/Bloc/account_repository.dart';
import 'package:dating_app/Pages/Account/Bloc/account_state.dart';
import 'package:dating_app/Pages/Register/Model/interest_response_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountRepository? repository;

  AccountBloc({this.repository}) : super(AccountInitialState()) {
    on<AccountEvent>(mapEventToState);
  }

  void mapEventToState(AccountEvent event, Emitter<AccountState> emit) async {
    emit(AccountInitialState());

    if (event is GetAccountData) {
      emit(AccountLoadingState());
      try {
        var model =
        await repository?.getAccountData();
        if (model?.success == true) {
          emit(AccountSuccessState(model!));
        } else {
          emit(AccountErrorState(model?.message ?? ""));
        }
      } catch (error, _) {
        if (kDebugMode) {
          print(_.toString());
        }
        emit(AccountErrorState(error.toString()));
      }
    }
    if (event is GetInterestEvent) {
      emit(AccountLoadingState());
      try {
        InterestResponseModel? interestResponseModel =
        await repository?.getInterestList();
        if (interestResponseModel?.message == "Success") {
          emit(GetInterestSuccessState(interestResponseModel!));
        } else {
          emit(AccountErrorState(interestResponseModel?.message ?? ""));
        }
      } catch (error, _) {
        if (kDebugMode) {
          print(_.toString());
        }
        emit(AccountErrorState(error.toString()));
      }
    }
  }
}
