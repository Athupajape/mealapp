import 'package:flutter/material.dart';
import '../widgets/category_item.dart';
import '../dummy.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(10),  
      children:DUMMY_CATEGORIES.map((catData) => CategoryItem(
        catData.title,
        catData.color,
        catData.id,
        )).toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent:200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20 ),
    );
  }
}