import 'dart:developer';

import 'package:dating_app/utils/event_buss_manager.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketServices{
//here I'm creating an object of the IO.Soeckt class.
IO.Socket? socket;


SocketServices getInstance(){
  return SocketServices();
}


connectSocket(userid) async {
  socket =IO.io(
    'http://209.38.239.249:3081/',
    <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
      'query': {
        'user_id':userid
      }
    },
  );


  socket!.connect();
  socket!.on('connect', (_) {
   
    // showSuccessToast('Socket Connected');
     print('socket connected');
  });


  socket!.on('receive_message', (val) {
    // debugger();
    EventBusManager().eventBus.fire(val);
  });

 


  
}


void sendMessage(Map params){
 socket!.emit('send_message',params);
}

void disconnectSocket(){
  socket!.disconnect();
}
}