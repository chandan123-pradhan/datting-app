import 'package:dating_app/Pages/Login/Bloc/login_event.dart';
import 'package:dating_app/Pages/Login/Bloc/login_repository.dart';
import 'package:dating_app/Pages/Login/Bloc/login_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginRepository? repository;

  LoginBloc({this.repository}) : super(LoginInitialState()) {
    on<LoginEvent>(mapEventToState);
  }

  void mapEventToState(LoginEvent event, Emitter<LoginState> emit) async {
    emit(LoginInitialState());

    if (event is OtpRequestEvent) {
      emit(LoginLoadingState());
      try {
        var model =
        await repository?.requestOtp(mobileNumber: event.mobileNumber);
        if (model?.success == true) {
          emit(LoginSuccessState(model!));
        } else {
          emit(LoginErrorState(model?.message ?? ""));
        }
      } catch (error, _) {
        if (kDebugMode) {
          print(_.toString());
        }
        emit(LoginErrorState(error.toString()));
      }
    }
  }
}
