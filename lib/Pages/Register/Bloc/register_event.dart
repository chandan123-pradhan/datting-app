import 'package:dating_app/Pages/Register/Model/interest_response_model.dart';
import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {}

class OtpRequestEvent extends RegisterEvent {
  int? mobileNumber;
  OtpRequestEvent(this.mobileNumber);
  @override
  List<Object?> get props => [mobileNumber];
}

class VerifyOtpEvent extends RegisterEvent {
  int? mobileNumber;
  int? otp;
  VerifyOtpEvent(this.mobileNumber,this.otp);
  @override
  List<Object?> get props => [mobileNumber,otp];
}

class RegisterFullNameEvent extends RegisterEvent {
  String? fullName;
  RegisterFullNameEvent(this.fullName);
  @override
  List<Object?> get props => [fullName];
}

class RegisterDobEvent extends RegisterEvent {
  String? dob;
  RegisterDobEvent(this.dob);
  @override
  List<Object?> get props => [dob];
}

class RegisterGenderEvent extends RegisterEvent {
  String? gender;
  RegisterGenderEvent(this.gender);
  @override
  List<Object?> get props => [gender];
}


class RegisterAboutEvent extends RegisterEvent {
  String? about;
  RegisterAboutEvent(this.about);
  @override
  List<Object?> get props => [about];
}



class RegisterJobEvent extends RegisterEvent {
  String? aboutJob;
  RegisterJobEvent(this.aboutJob);
  @override
  List<Object?> get props => [aboutJob];
}

class GetInterestEvent extends RegisterEvent {
  @override
  List<Object?> get props => [];
}

class RegisterStepFourEvent extends RegisterEvent {
  @override
  List<Object?> get props => [];
}

class RegisterStepFiveEvent extends RegisterEvent {
  @override
  List<Object?> get props => [];
}

class RegisterStepSixEvent extends RegisterEvent {
  @override
  List<Object?> get props => [];
}
