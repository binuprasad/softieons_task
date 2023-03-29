


import 'dart:developer';

import 'package:get/get.dart';
import 'package:softieones/model/model.dart';
import 'package:softieones/services/home_services.dart';

class Homecontroller extends GetxController{
  

List<ElectronicsModel>products =[];
 @override
  void onInit(){
    
    super.onInit();
    getData();
  }

getData()async{
  final response =await HomeServices().getElectronicsList();
  log(response.toString());
  if(response!= null){
    products = response.toList();
    log(products.first.description);
  }else{
    log('product not found');
  }
  update();
}

}