import 'importer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CommonBottomBar extends StatefulWidget {
  const CommonBottomBar();

  @override
  State<StatefulWidget> createState() {
    return _CommonBottomBar();
    throw UnimplementedError();
  }

}

class _CommonBottomBar extends State {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context){
    return BottomNavigationBar(
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
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
  }
}