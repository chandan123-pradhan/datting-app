import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {}

class OtpRequestEvent extends LoginEvent {
  int? mobileNumber;
  OtpRequestEvent(this.mobileNumber);
  @override
  List<Object?> get props => [mobileNumber];
}
