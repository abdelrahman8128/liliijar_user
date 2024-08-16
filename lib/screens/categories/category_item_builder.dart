import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liliijar/models/category_model.dart';

import '../../cubit/cubit.dart';

Widget categoryItemBuilder(CategoryModel model,context,index)
{
  return GestureDetector(
    onTap: () {
      // cubit.get(context).screenIndex=1;
      // cubit.get(context).searchProductsByCategory(model.id);
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),border: Border.all(color: Colors.grey,width: 2)),
    
        height: 60,
    
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Text(model.title??'',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,),maxLines: 1,overflow:TextOverflow.ellipsis ,),
          ],
        ),
      ),
    ),
  );
}