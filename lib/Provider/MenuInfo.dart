import 'package:clock_app/Util/Enums.dart';
import 'package:flutter/widgets.dart';

class MenuInfo extends ChangeNotifier {
  MenuType menuType;
  String? title;
  String? imageResource;

  MenuInfo(this.menuType, {this.imageResource, this.title});

  updateMenu(MenuInfo menuInfo) {
    menuType = menuInfo.menuType;
    title = menuInfo.title;
    imageResource = menuInfo.imageResource;

    notifyListeners();
  }
}
