
import 'package:flutter/material.dart';

import '../util.dart' as util;

class CategoryInfo {
  final Category category;
  final Color color;

  CategoryInfo(this.category, this.color);
}

class Category {

  final String name;
  final String iconName;
  final List<Unit> units;
  //
  // const Category(this.name, this.iconName this.units)
  //     : assert(name != null), assert(units != null);

  const Category({
    @required this.name,
    @required this.iconName,
    @required this.units,
  })  : assert(name != null),
        assert(iconName != null),
        assert(units != null);

  factory Category.fromJson(Map <String, dynamic> json) {
    final jsonCategories = json['units'] as List;
    final List units = jsonCategories.map((e) => Unit.fromJson(e)).toList();
    return Category(
      name: json['name'],
      iconName: json['icon_name'],
      units: units,
    );
  }

  get icon => "assets/icons/${iconName.replaceAll(' ', '_').toLowerCase()}.svg";

}

class Unit {

  final String name;
  final double conversion;
  final String description;
  final bool baseUnit;

  const Unit({
    @required this.name,
    @required this.conversion,
    @required this.description,
    @required this.baseUnit,
  })  : assert(name != null),
        assert(conversion != null);

  Unit.fromJson(Map j)
      : assert(j['name'] != null),
        assert(j['conversion'] != null),
        name = j['name'],
        conversion = j['conversion'].toDouble(),
        description = j['description'],
        baseUnit = j['baseUnit'];

  bool get hasDescription => !util.isEmpty(description);

  @override
  String toString() => name;

}
