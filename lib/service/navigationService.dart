
import 'package:flutter/material.dart';
import 'package:flutter_app/routor/route_path.dart';

class NavigationService {
  NavigationService._internal();
  static final NavigationService instance = NavigationService._internal();

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> pushReplacementNamed(String routeName, {Object arguments}){
    return navigatorKey.currentState
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamed(String routeName, {Object argumants}){
    return navigatorKey.currentState.pushNamed(routeName, arguments: argumants);
  }

  void replaceRoute(String routeName, {Object arguments}){
    NavigationService.instance.navigatorKey.currentState
        .pushNamedAndRemoveUntil(routeName, ModalRoute.withName(stampPath), arguments: arguments);
  }

  void popUtil(BuildContext context, String routeName, {Object arguments}){
    NavigationService.instance.navigatorKey.currentState
        .popUntil(ModalRoute.withName(stampPath));
  }

  void goBack({dynamic result}){
    return navigatorKey.currentState.pop(result);
  }
}