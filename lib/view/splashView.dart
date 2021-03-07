import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/provider/splashProvider.dart';
import 'package:flutter_app/routor/route_path.dart';
import 'package:flutter_app/service/navigationService.dart';
import 'package:provider/provider.dart';

class SplashView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final watch =  context.watch<SplashProvider>();
    return FutureBuilder(
        future: watch.version(),
        builder: (context, snapshot){
          print("start");
          if(snapshot.hasData){
            final data = snapshot.data;
            if (data){
              _routing();
            }
          }
          print("end");
          return Scaffold();
        }
    );
  }

  Future<void> _routing() async {
    print("routing");
    NavigationService service = await NavigationService.instance;
    service.pushReplacementNamed(stampPath);
  }
}