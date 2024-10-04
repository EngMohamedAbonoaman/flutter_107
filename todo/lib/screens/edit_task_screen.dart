import 'package:flutter/material.dart';
import 'package:todo/networking/DB.dart';
import 'package:todo/widgets/BuildTextField.dart';

import '../shared/AllColors.dart';
import '../shared/AllStrings.dart';
import '../shared/appStyles.dart';

class EditTaskScreen extends StatefulWidget {
  EditTaskScreen({super.key,required this.task});
  Map<String, dynamic> task;
  @override
  State<EditTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<EditTaskScreen> {
  TextEditingController idController = TextEditingController();

  TextEditingController titleController = TextEditingController();

  TextEditingController detailsController = TextEditingController();

  bool isLoading = false;
  void clearControllers(){
    idController.clear();
    titleController.clear();
    detailsController.clear();

  }
  void setControllers(){
    idController.text = widget.task['id'].toString();
    titleController.text = widget.task['title'];
    detailsController.text = widget.task['description'];
  }

  @override
  void initState() {
    setControllers();
    super.initState();
  }
  @override
  void dispose() {
    clearControllers();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AllColors.primaryColor,
        title: const Text(AllString.EditTaskTitle,style: AppStyle.largeStyle,),

      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BuildTextField(hint: "Enter Task ID...", title: "ID",controller: idController,enabled: false,),
            BuildTextField(hint: "Enter Task Title...", title: "Title",controller: titleController,),
            BuildTextField(hint: "Enter Task Details...", title: "Details",size: 40,controller: detailsController,),
            SizedBox(
              width: double.infinity,
              child:
              isLoading? Center(child: CircularProgressIndicator(),): ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: AllColors.primaryColor),
                onPressed: (){
                  setState(() {
                    isLoading  = true;
                  });
                  DBRepo.update(id: int.parse(idController.text),
                      title: titleController.text,
                      description: detailsController.text,
                      status: 0).then((value){
                    setState(() {
                      isLoading  = false;
                      clearControllers();
                      Navigator.pop(context);
                    });
                  }).catchError((onError){
                    print(onError.toString());
                  });
                },
                child: Text("Edit",style: AppStyle.largeStyle,),


              ),
            )
          ],
        ),
      ),
    );
  }
}
