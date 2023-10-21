import 'package:equatable/equatable.dart';

abstract class OtpEvent extends Equatable {}

class VerifyOtpEvent extends OtpEvent {
  int? mobileNumber;
  int? otp;
  VerifyOtpEvent(this.mobileNumber,this.otp);
  @override
  List<Object?> get props => [mobileNumber,otp];
}
