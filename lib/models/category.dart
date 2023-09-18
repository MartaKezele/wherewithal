import 'package:wherewithal/models/enums/transaction_type.dart';

class Category {
  final int id;
  final String title;
  final TransactionType transactionType;
  final List<Sub1category> subcategories;
  final double? budget;

  Category({
    required this.id,
    required this.title,
    required this.transactionType,
    this.subcategories = const [],
    this.budget,
  });
}

class Sub1category {
  final int id;
  final String title;
  final TransactionType transactionType;
  final List<Sub2category> subcategories;
  final double? budget;

  Sub1category({
    required this.id,
    required this.title,
    required this.transactionType,
    this.subcategories = const [],
    this.budget,
  });
}

class Sub2category {
  final int id;
  final String title;
  final TransactionType transactionType;
  final double? budget;

  Sub2category({
    required this.id,
    required this.title,
    required this.transactionType,
    this.budget,
  });
}
