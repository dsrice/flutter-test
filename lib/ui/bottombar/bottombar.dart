import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_app/view_model/common/common_view_model.dart';

import '../importer.dart';

import 'package:flutter/material.dart';
//アプリがファイルを保存可能な場所を取得するライブラリ
import 'package:path_provider/path_provider.dart';

final _fileName = 'editTextField.txt';

class BottomBarView extends StatefulWidget {
  @override
  _BottomBarViewState createState() => _BottomBarViewState();
}

class _BottomBarViewState extends State<BottomBarView> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context){
    final CommonViewModel data = Provider.of<CommonViewModel>(context);
    _selectedIndex = data.getSelectdIndex();

    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.stamp),
          label: "スタンプ",
        ),
        BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.bookOpen),
            label: "記事一覧"
        ),
        BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.userAlt),
            label: "設定"
        ),
      ],
      currentIndex: _selectedIndex,
      onTap:(index) async {
        _selectedIndex = index;
        data.setSelectedIndex(index);
        data.getPageController().animateToPage(index+1, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
      }
    );
  }
}

