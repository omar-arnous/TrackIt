import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Category extends Equatable {
  final int? id;
  final String name;
  final int color;
  final IconData icon;

  const Category(
      {this.id, required this.name, required this.color, required this.icon});

  @override
  List<Object?> get props => [id, name, color, icon];
}
