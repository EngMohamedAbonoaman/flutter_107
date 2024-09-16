import 'package:flutter/material.dart';

import '../shared/AllColors.dart';
import '../shared/appStyles.dart';

class AllTasks extends StatelessWidget {
 AllTasks({super.key});
  List<Map<String,dynamic>> tasks = [
    {
      'title': "Flutter task",
      'subTitle':"this is Flutter task",

    },
    {
      'title': "Dart task",
      'subTitle':"this is Dart task",

    },
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context,index)=>Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text("${tasks[index]['title']}",style: AppStyle.medStyle.copyWith(color: AllColors.primaryColor),),
                    Text("${tasks[index]['subTitle']}",style: AppStyle.smallStyle.copyWith(color: Colors.black),),
                  ],
                ),
                Spacer(),
                Icon(Icons.edit,color: AllColors.secondColor,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.delete,color: AllColors.secondColor,),
                ),
                Icon(Icons.check_circle_outline_outlined,color: AllColors.secondColor,),
              ],
            ),
          )
          ,
        ),
      ),
    );
  }
}
