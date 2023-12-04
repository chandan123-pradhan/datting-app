import 'package:dating_app/Network/api_provider.dart';
import 'package:dating_app/Pages/InterestedInYou/models/intrested_in_you_api_response.dart';
import 'package:dating_app/Pages/Messages/models/get_message_list_api_response.dart';
import 'package:get/get.dart';

class DashboardControllers extends GetxController{
  GetMessageListApiResponse? messageListApiResponse;
   IntrestedInYouApiResponse? intrestedInYouApiResponse;
  bool isError=false;
  ApiProvider apiProvider= ApiProvider();
  void getMessageList(){
    apiProvider.getMessageListApiResponse().then((value) {
      if(value!=null){
        messageListApiResponse=value;
        update();
      }else{
isError=true;
   update();
      }
    });
 
  }




  void getIntrestedInYou(){
    Map params={

    };
    ApiProvider().getIntrestedInYou(
params
    ).then((value) {
      intrestedInYouApiResponse=value;
      update();
     // debugger();
    });
  }
}