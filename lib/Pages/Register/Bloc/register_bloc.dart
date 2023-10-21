
import 'package:dating_app/Models/userdata_model.dart';
import 'package:dating_app/Pages/Register/Bloc/register_event.dart';
import 'package:dating_app/Pages/Register/Bloc/register_repository.dart';
import 'package:dating_app/Pages/Register/Bloc/register_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterRepository? repository;

  RegisterBloc({this.repository}) : super(RegisterInitialState()) {
    on<RegisterEvent>(mapEventToState);
  }

  void mapEventToState(RegisterEvent event, Emitter<RegisterState> emit) async {
    emit(RegisterInitialState());

    if (event is OtpRequestEvent) {
      emit(RegisterLoadingState());
      try {
        var model =
        await repository?.requestOtp(mobileNumber: event.mobileNumber);
        if (model?.success == true||model?.message=="Success") {
          emit(RegisterSuccessState(model!));
        } else {
          emit(RegisterErrorState(model?.message ?? ""));
        }
      } catch (error, _) {
        if (kDebugMode) {
          print(_.toString());
        }
        emit(RegisterErrorState(error.toString()));
      }
    }
    if (event is VerifyOtpEvent) {
      emit(RegisterLoadingState());
      try {
        var model =
        await repository?.verifyOtp(mobileNumber: event.mobileNumber,otp: event.otp);
        if (model?.success == true) {
          emit(RegisterMobileNumberSuccessState(model!));
        } else {
          emit(RegisterErrorState(model?.message ?? ""));
        }
      } catch (error, _) {
        if (kDebugMode) {
          print(_.toString());
        }
        emit(RegisterErrorState(error.toString()));
      }
    }

    if (event is RegisterFullNameEvent) {
      emit(RegisterLoadingState());
      try {
        UserDataModel? model =
            await repository?.registerFullName(fullName: event.fullName);
        if (model?.success == true) {
          emit(RegisterFullNameSuccessState(model!));
        } else {
          emit(RegisterErrorState(model?.message ?? ""));
        }
      } catch (error, _) {
        if (kDebugMode) {
          print(_.toString());
        }
        emit(RegisterErrorState(error.toString()));
      }
    }
    if (event is RegisterDobEvent) {
      emit(RegisterLoadingState());
      try {
        UserDataModel? model =
        await repository?.registerDob(dob: event.dob);
        if (model?.success == true) {
          emit(RegisterFullNameSuccessState(model!));
        } else {
          emit(RegisterErrorState(model?.message ?? ""));
        }
      } catch (error, _) {
        if (kDebugMode) {
          print(_.toString());
        }
        emit(RegisterErrorState(error.toString()));
      }
    }
    if (event is RegisterGenderEvent) {
      emit(RegisterLoadingState());
      try {
        UserDataModel? model =
        await repository?.registerGender(gender: event.gender);
        if (model?.success == true) {
          emit(RegisterFullNameSuccessState(model!));
        } else {
          emit(RegisterErrorState(model?.message ?? ""));
        }
      } catch (error, _) {
        if (kDebugMode) {
          print(_.toString());
        }
        emit(RegisterErrorState(error.toString()));
      }
    }
    if (event is RegisterAboutEvent) {
      emit(RegisterLoadingState());
      try {
        UserDataModel? model =
        await repository?.registerAbout(about: event.about);
        if (model?.success == true) {
          emit(RegisterFullNameSuccessState(model!));
        } else {
          emit(RegisterErrorState(model?.message ?? ""));
        }
      } catch (error, _) {
        if (kDebugMode) {
          print(_.toString());
        }
        emit(RegisterErrorState(error.toString()));
      }
    }
    if (event is RegisterJobEvent) {
      emit(RegisterLoadingState());
      try {
        UserDataModel? model =
        await repository?.registerAboutJob(job: event.aboutJob);
        if (model?.success == true) {
          emit(RegisterFullNameSuccessState(model!));
        } else {
          emit(RegisterErrorState(model?.message ?? ""));
        }
      } catch (error, _) {
        if (kDebugMode) {
          print(_.toString());
        }
        emit(RegisterErrorState(error.toString()));
      }
    }
  }
}
