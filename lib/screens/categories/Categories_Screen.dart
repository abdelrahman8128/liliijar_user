import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/cubit.dart';
import '../../cubit/states.dart';
import '../../db/db.dart';
import '../../models/product_model.dart';
import 'category_item_builder.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();


}

class _CategoriesState extends State<Categories> {

  @override
  void initState() {
    super.initState();

    cubit.get(context).getCategories();


  }




  @override
  Widget build(BuildContext context) {
    return BlocConsumer<cubit, States>(
      listener: (context, state) {},
      builder: (context, state) {
        return SingleChildScrollView(
          child:
              Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListView.builder(

                    itemBuilder: (context, index) => categoryItemBuilder(cubit.get(context).categories[index],context,index),
                    itemCount: cubit.get(context).categories.length,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),

                ),

              ],

            ),

        );
      },
    );
  }
}
