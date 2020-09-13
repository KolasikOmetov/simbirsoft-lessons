import 'package:flutter/material.dart';
import 'package:simbirsoft_lessons/di/injector_container.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'app.dart';

void main() {
  final injector = InjectorContainer().initialise(Injector.getInjector());
  runApp(App(injector));
}
