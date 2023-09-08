import 'package:flutter_news/models/category_model.dart';

List<CategoryModel> getCategory() {
  List<CategoryModel> category = [];

  CategoryModel categoryModel = CategoryModel();

  categoryModel.title = "Business";
  categoryModel.imageUrl = "assets/pexels-tranmautritam-225502.jpg";
  category.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.title = "Entertanment";
  categoryModel.imageUrl = "assets/pexels-wendy-wei-1190297.jpg";
  category.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.title = " General ";
  categoryModel.imageUrl = "assets/pexels-max-avans-5146462.jpg";
  category.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.title = "Health";
  categoryModel.imageUrl = "assets/pexels-polina-tankilevitch-3872373.jpg";
  category.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.title = "Science";
  categoryModel.imageUrl = "assets/pexels-pavel-danilyuk-8442150.jpg";
  category.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.title = "Sports";
  categoryModel.imageUrl = "assets/pexels-pixabay-46798.jpg";
  category.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.title = "Tecenology";
  categoryModel.imageUrl = "assets/pexels-danny-meneses-943096.jpg";
  category.add(categoryModel);

  return category;
}
