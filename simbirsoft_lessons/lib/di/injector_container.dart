import 'package:dio/dio.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

class InjectorContainer {
  Injector initialise(Injector injector) {
    try{
    injector.map<Dio>((injector) {
      var dio = Dio();
      return dio;
    }, isSingleton: true, key: "DIO_MAIN");
    } catch(_){
    }
    return injector;
  }
}
