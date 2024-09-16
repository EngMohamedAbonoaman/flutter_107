import 'package:flutter/material.dart';
import 'package:todo/widgets/BuildTextField.dart';

import '../shared/AllColors.dart';
import '../shared/AllStrings.dart';
import '../shared/appStyles.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AllColors.primaryColor,
        title: const Text(AllString.AddTaskTitle,style: AppStyle.largeStyle,),

      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BuildTextField(hint: "Enter Task ID...", title: "ID"),
            BuildTextField(hint: "Enter Task Title...", title: "Title"),
            BuildTextField(hint: "Enter Task Details...", title: "Details",size: 40,),
            SizedBox(
              width: double.infinity,
                child:
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: AllColors.primaryColor),
                  onPressed: (){},
                  child: Text("Add",style: AppStyle.largeStyle,),


                  ),
            )
          ],
        ),
      ),
    );
  }
}
