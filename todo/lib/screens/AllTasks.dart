import 'package:flutter/material.dart';
import 'package:todo/networking/DB.dart';
import 'package:todo/screens/edit_task_screen.dart';

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

  List<String> tasks2 = ["task1","task2","task3"];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: DBRepo.myList.length,
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
                    Text("${DBRepo.myList[index]['title']}",style: AppStyle.medStyle.copyWith(color: AllColors.primaryColor),),
                    Text("${DBRepo.myList[index]['description']}",style: AppStyle.smallStyle.copyWith(color: Colors.black),),
                  ],
                ),
                Spacer(),
                IconButton(icon: Icon(Icons.edit,color: AllColors.primaryColor,),onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>EditTaskScreen(task: DBRepo.myList[index] ,)));
                },),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(icon: Icon(Icons.delete,color: AllColors.secondColor,),onPressed: (){
                    DBRepo.delete(id: DBRepo.myList[index]['id']).then((value){
                      print("Task deleted");
                    });
                  },),
                ),
                Icon(  DBRepo.myList[index]['status']==1? Icons.check_box:
                Icons.check_box_outline_blank,color: AllColors.secondColor,),
              ],
            ),
          )
          ,
        ),
      ),
    );
  }
}
