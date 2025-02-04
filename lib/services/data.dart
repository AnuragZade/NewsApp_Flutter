import 'package:news_app_using_api/model/category_model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> category = [];

  CategoryModel categoryModel = CategoryModel();

  categoryModel.categoryName = 'Sports';
  categoryModel.image = 'assets/images/Sports.jpg';
  category.add(categoryModel);
  categoryModel = CategoryModel();

  categoryModel.categoryName = 'Business';
  categoryModel.image = 'assets/images/Business.jpg';

  category.add(categoryModel);
  categoryModel = CategoryModel();

  categoryModel.categoryName = 'Health';
  categoryModel.image = 'assets/images/Health.jpg';
  category.add(categoryModel);
  categoryModel = CategoryModel();

  categoryModel.categoryName = 'Entertainment';
  categoryModel.image = 'assets/images/Entertainment.jpg';
  category.add(categoryModel);
  categoryModel = CategoryModel();

  categoryModel.categoryName = 'Generals';
  categoryModel.image = 'assets/images/General.jpg';
  category.add(categoryModel);
  categoryModel = CategoryModel();

  return category;
}
