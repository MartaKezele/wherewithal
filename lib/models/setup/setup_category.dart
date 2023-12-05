import '../models.dart';

class SetupCategory extends Category {
  final List<SetupCategory> subcategories;

  SetupCategory({
    required super.id,
    required super.title,
    required super.transactionType,
    super.categoryReason,
    super.parentCategoryId,
    this.subcategories = const [],
  });
}
