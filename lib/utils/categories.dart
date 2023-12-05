import '../../models/models.dart' as models;

List<models.Category> categoryFamily(
  models.Category category,
  Iterable<models.Category> allCategories,
) {
  final List<models.Category> children = [category];

  allCategories
      .where((element) => element.parentCategoryId == category.id)
      .forEach((element) {
    children.add(element);
    children.addAll(categoryFamily(element, allCategories));
  });

  return children;
}
