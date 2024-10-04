import 'package:flutter/material.dart';

import '../networking/DB.dart';
import '../shared/AllColors.dart';
import '../shared/appStyles.dart';
import 'edit_task_screen.dart';

class CompleteScreen extends StatefulWidget {
  const CompleteScreen({super.key});

  @override
  State<CompleteScreen> createState() => _CompleteScreenState();
}

class _CompleteScreenState extends State<CompleteScreen> {
  List<Map<String,dynamic>> completeTasks = [];
  @override
  void initState() {
   completeTasks =  DBRepo.myList.where((task) => task['status']==1).toList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: completeTasks.length,
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
                    Text("${completeTasks[index]['title']}",style: AppStyle.medStyle.copyWith(color: AllColors.primaryColor),),
                    Text("${completeTasks[index]['description']}",style: AppStyle.smallStyle.copyWith(color: Colors.black),),
                  ],
                ),
                Spacer(),
                IconButton(icon: Icon(Icons.edit,color: AllColors.primaryColor,),onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>EditTaskScreen(task: completeTasks[index] ,)));
                },),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(icon: Icon(Icons.delete,color: AllColors.secondColor,),onPressed: (){
                    DBRepo.delete(id: completeTasks[index]['id']).then((value){
                      print("Task deleted");
                    });
                  },),
                ),
                Icon(  completeTasks[index]['status']==1? Icons.check_box:
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
