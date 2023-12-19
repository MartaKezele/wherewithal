import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../models/models.dart' as models;

class ProductItemData {
  final XFile? imagefile;
  final TextEditingController titleController;
  final TextEditingController priceController;
  final double? quantity;
  models.Category? category;

  ProductItemData({
    this.imagefile,
    required this.titleController,
    required this.priceController,
    this.quantity,
    this.category,
  });
}
