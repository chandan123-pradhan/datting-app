import 'package:equatable/equatable.dart';

abstract class EditAccountEvent extends Equatable {}

class GetEditAccountData extends EditAccountEvent {
  @override
  List<Object?> get props => [];
}

class GetInterestEvent extends EditAccountEvent {
  @override
  List<Object?> get props => [];
}
