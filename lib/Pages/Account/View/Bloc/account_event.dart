import 'package:equatable/equatable.dart';

abstract class AccountEvent extends Equatable {}

class GetAccountData extends AccountEvent {
  @override
  List<Object?> get props => [];
}
