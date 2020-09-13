import 'package:dio/dio.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

class InjectorContainer {
  Injector initialise(Injector injector) {
    injector.map<Dio>((injector) {
      var dio = Dio();
      return dio;
    }, isSingleton: true, key: "DIO_MAIN");
    return injector;
  }
}
