import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/stamptotal.dart';
import 'package:flutter_app/provider/stampProvider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class StampView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    print("stamp");
    final watch = context.watch<StampProvider>();
    watch.stampinfo();

    return Scaffold(
            appBar: AppBar(
              leading: Container(),
              title: const Text("スタンプ状況"),
              centerTitle: true,
            ),
            body: Container(
              child: Column(
                children: _createGrid(context),
              ),
              ),
            );
  }

  List<Widget> _createGrid(BuildContext context){
    return context
        .watch<StampProvider>()
        .loading
        ? _loadingIndicator(context) : _buildContext(context);
  }

  List<Widget> _loadingIndicator(BuildContext context){
    Future.delayed(Duration(seconds: 1),
            () => context.read<StampProvider>().check());

    return [
        Center(
          child: CircularProgressIndicator(
            strokeWidth: 4,
          ),
        ),
    ];
  }

  List<Widget> _buildContext(BuildContext context){
    int total_count = context.read<StampProvider>().stamptotalmodel.stamp_count;
    int base_count = total_count % 10;
    if(base_count == 0){
      base_count = 10;
    }

    return [
      Text(
          total_count.toString() + "個",
          style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold)
      ),
      Expanded(child: StampTotalElement(context: context))
    ];
  }
}

class StampTotalElement extends StatelessWidget{
  final BuildContext context;

  StampTotalElement({
    this.context
  });

  @override
  Widget build(BuildContext context) {
    int total_count = context.read<StampProvider>().stamptotalmodel.stamp_count;
    int base_count = total_count % 10;
    if(base_count == 0){
      base_count = 10;
    }
    return Container(
      child: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(10),
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
        crossAxisCount: 5,
        children: <Widget>[
          if(base_count >= 1) Center(child: FaIcon(FontAwesomeIcons.stamp),),
          if(base_count >= 2) Center(child: FaIcon(FontAwesomeIcons.stamp),),
          if(base_count >= 3) Center(child: FaIcon(FontAwesomeIcons.stamp),),
          if(base_count >= 4) Center(child: FaIcon(FontAwesomeIcons.stamp),),
          if(base_count >= 5) Center(child: FaIcon(FontAwesomeIcons.stamp),),
          if(base_count >= 6) Center(child: FaIcon(FontAwesomeIcons.stamp),),
          if(base_count >= 7) Center(child: FaIcon(FontAwesomeIcons.stamp),),
          if(base_count >= 8) Center(child: FaIcon(FontAwesomeIcons.stamp),),
          if(base_count >= 9) Center(child: FaIcon(FontAwesomeIcons.stamp),),
          if(base_count >= 10) Center(child: FaIcon(FontAwesomeIcons.stamp),),
        ],
      ),
    );
  }
}
