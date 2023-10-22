import 'package:equatable/equatable.dart';

abstract class CmsEvent extends Equatable {}

class GetCmsDataEvent extends CmsEvent {
  String? apiName;
  GetCmsDataEvent(this.apiName);
  @override
  List<Object?> get props => [apiName];
}
