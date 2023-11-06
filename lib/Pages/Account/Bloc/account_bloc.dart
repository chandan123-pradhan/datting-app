import 'dart:developer';

import 'package:dating_app/Network/api_provider.dart';
import 'package:dating_app/Pages/Account/Bloc/account_event.dart';
import 'package:dating_app/Pages/Account/Bloc/account_repository.dart';
import 'package:dating_app/Pages/Account/Bloc/account_state.dart';
import 'package:dating_app/Pages/Register/Model/interest_response_model.dart';
import 'package:dating_app/services/get_location_services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountRepository? repository;

  AccountBloc({this.repository}) : super(AccountInitialState()) {
    on<AccountEvent>(mapEventToState);
  }

  void mapEventToState(AccountEvent event, Emitter<AccountState> emit) async {
    emit(AccountInitialState());

    if (event is GetAccountData) {
      emit(AccountLoadingState());
      try {
        var model = await repository?.getAccountData();
        if (model?.success == true) {
          emit(AccountSuccessState(model!));
        } else {
          emit(AccountErrorState(model?.message ?? ""));
        }
      } catch (error, _) {
        if (kDebugMode) {
          print(_.toString());
        }
        emit(AccountErrorState(error.toString()));
      }
    }
    if (event is GetInterestEvent) {
      emit(AccountLoadingState());
      try {
        InterestResponseModel? interestResponseModel =
            await repository?.getInterestList();
        if (interestResponseModel?.message == "Success") {
          emit(GetInterestSuccessState(interestResponseModel!));
        } else {
          emit(AccountErrorState(interestResponseModel?.message ?? ""));
        }
      } catch (error, _) {
        if (kDebugMode) {
          print(_.toString());
        }
        emit(AccountErrorState(error.toString()));
      }
    }
  }

  void updateLocation(context) {
    LocationServices().getCurrentPosition(context).then((value)async{
      List<Placemark> placemarks = await placemarkFromCoordinates(
      value!.latitude,value.longitude
   
        
        );
     
      print(placemarks);
      //  debugger();
       print(placemarks[0].street);
      Map params={
        'location_title':placemarks[0].street,
        'location_city':placemarks[0].locality,
        'location_state':placemarks[0].administrativeArea,
        'location_country':placemarks[0].country,
        'location_pincode':placemarks[0].postalCode,
        'location_lat': value!.latitude.toString(),
        'location_long':value.longitude.toString()
      };

     ApiProvider().updateUserLocation(params);

    });
  }
}
