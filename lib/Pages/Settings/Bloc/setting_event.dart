import 'package:equatable/equatable.dart';

abstract class SettingEvent extends Equatable {}

class GetSettingData extends SettingEvent {
  @override
  List<Object?> get props => [];
}
