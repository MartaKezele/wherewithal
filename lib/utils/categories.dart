import '../../models/models.dart' as models;

List<models.Category> categoryFamily({
  required models.Category category,
  required Iterable<models.Category> allCategories,
  bool transformTitleToHierarchical = false,
}) {
  final List<models.Category> children = [category];

  allCategories
      .where((element) => element.parentCategoryId == category.id)
      .forEach((element) {
    if (transformTitleToHierarchical) {
      element = models.Category(
        id: element.id,
        title: '${category.title} - ${element.title}',
        transactionType: element.transactionType,
        categoryReason: element.categoryReason,
        parentCategoryId: element.parentCategoryId,
      );
    }

    children.addAll(categoryFamily(
      category: element,
      allCategories: allCategories,
      transformTitleToHierarchical: transformTitleToHierarchical,
    ));
  });

  return children;
}

List<models.Category> categoriesWitHierarchicalTitles(
  Iterable<models.Category> allCategories,
) {
  final baseCategories = allCategories.where(
    (element) => element.parentCategoryId == null,
  );

  final categories = <models.Category>[];

  for (final category in baseCategories) {
    categories.addAll(categoryFamily(
      category: category,
      allCategories: allCategories,
      transformTitleToHierarchical: true,
    ));
  }

  return categories;
}
