import 'package:equatable/equatable.dart';

abstract class ProfileDetailEvent extends Equatable {}

class GetProfileDetailData extends ProfileDetailEvent {
  @override
  List<Object?> get props => [];
}
