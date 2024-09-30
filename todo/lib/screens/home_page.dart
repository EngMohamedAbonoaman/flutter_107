import 'package:flutter/material.dart';
import 'package:todo/screens/AllTasks.dart';
import 'package:todo/screens/add_Task.dart';
import 'package:todo/screens/complete.dart';
import 'package:todo/shared/AllColors.dart';
import 'package:todo/shared/AllStrings.dart';
import 'package:todo/shared/appStyles.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List screens = [
    AllTasks(),
    CompleteScreen()
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AllColors.primaryColor,
        title: const Text(AllString.appTitle,style: AppStyle.largeStyle,),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.calendar_month,size: 30,color: AllColors.TextColor,),
          ),

        ],
      ),
      backgroundColor: AllColors.secondColor,
      body: screens[currentIndex],
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add,color: Colors.white,),
        onPressed: (){
           Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddTaskScreen()));
        },
        backgroundColor: AllColors.primaryColor,
      ),
      bottomNavigationBar: BottomNavigationBar(

        items: [
          BottomNavigationBarItem(icon: Icon(Icons.list),label: "All"),
          BottomNavigationBarItem(icon: Icon(Icons.check),label: "Complete"),
        ],
        currentIndex: currentIndex,
        onTap: (selectIndex){
            setState(() {
              currentIndex = selectIndex;
            });
        },

      ),
    );

  }
}
