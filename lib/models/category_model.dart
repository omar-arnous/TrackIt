// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';
import 'package:trackit/features/categories/domain/entities/category.dart';

class CategoryModel extends Category {
  const CategoryModel(
      {int? id,
      required String name,
      required IconData icon,
      required int color})
      : super(id: id, name: name, color: color, icon: icon);

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    final iconData = json['icon'];

    return CategoryModel(
      id: json['id'],
      name: json['name'],
      icon: IconData(iconData['codePoint'],
          fontFamily: iconData['fontFamily'],
          fontPackage: iconData['fontPackage']),
      color: json['color'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'color': color,
      'icon': {
        'codePoint': icon.codePoint,
        'fontFamily': icon.fontFamily,
        'fontPackage': icon.fontPackage
      }
    };
  }
}
