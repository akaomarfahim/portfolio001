// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MyGlobalKey {
  static var item = [homeKey, aboutKey, servicesKey, experienceKey, worksKey, blogsKey, contactKey];

  static final GlobalKey homeKey = GlobalKey();
  static final GlobalKey aboutKey = GlobalKey();
  static final GlobalKey servicesKey = GlobalKey();
  static final GlobalKey experienceKey = GlobalKey();
  static final GlobalKey worksKey = GlobalKey();
  static final GlobalKey blogsKey = GlobalKey();
  static final GlobalKey contactKey = GlobalKey();
}

class MenuItemModel {
  static List<MenuItemModel> items = [
    MenuItemModel(label: 'Home', globalKey: MyGlobalKey.homeKey),
    MenuItemModel(label: 'About', globalKey: MyGlobalKey.aboutKey),
    MenuItemModel(label: 'Services', globalKey: MyGlobalKey.servicesKey),
    MenuItemModel(label: 'Experience', globalKey: MyGlobalKey.experienceKey),
    MenuItemModel(label: 'Works', globalKey: MyGlobalKey.worksKey),
    MenuItemModel(label: 'Blogs', globalKey: MyGlobalKey.blogsKey),
    MenuItemModel(label: 'Contact', globalKey: MyGlobalKey.contactKey),
  ];

  String? label;
  GlobalKey? globalKey;

  MenuItemModel({
    this.label,
    this.globalKey,
  });
}
