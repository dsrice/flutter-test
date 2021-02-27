import 'importer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CommonBottomBar{

    BottomNavigationBar base = BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.stamp),
            label: "スタンプ"
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
    );
}