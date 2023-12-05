import 'package:event_bus/event_bus.dart';

class EventBusManager {
  static final EventBus _eventBus = EventBus();

  factory EventBusManager() {
    return _instance;
  }

  static final EventBusManager _instance = EventBusManager._internal();

  EventBusManager._internal();

  EventBus get eventBus => _eventBus;
}
