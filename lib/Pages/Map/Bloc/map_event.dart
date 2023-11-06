import 'package:equatable/equatable.dart';

abstract class MapEvent extends Equatable {}

class FetchUserEvent extends MapEvent {
  String? lat;
  String? lang;
  String? km;
  FetchUserEvent(this.lat,this.lang,this.km);
  @override
  List<Object?> get props => [lat,lang,km];
}
