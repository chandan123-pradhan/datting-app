
import 'package:dating_app/Pages/Otp/Bloc/otp_event.dart';
import 'package:dating_app/Pages/Otp/Bloc/otp_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'otp_repository.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  OtpRepository? repository;

  OtpBloc({this.repository}) : super(OtpInitialState()) {
    on<OtpEvent>(mapEventToState);
  }

  void mapEventToState(OtpEvent event, Emitter<OtpState> emit) async {
    emit(OtpInitialState());

    if (event is VerifyOtpEvent) {
      emit(OtpLoadingState());
      try {
        var model =
        await repository?.verifyOtp(mobileNumber: event.mobileNumber,otp: event.otp);
        if (model?.success == true) {
          emit(OtpSuccessState(model!));
        } else {
          emit(OtpErrorState(model?.message ?? ""));
        }
      } catch (error, _) {
        if (kDebugMode) {
          print(_.toString());
        }
        emit(OtpErrorState(error.toString()));
      }
    }
  }
}
