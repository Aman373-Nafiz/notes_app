// data/models/work_model.dart
import 'package:flutter/material.dart';

class WorkModel {
  final String title;
  final String description;
  final bool isChecked;
  WorkModel({required this.title, required this.description,required this.isChecked});
}

List<WorkModel> aw = [];
