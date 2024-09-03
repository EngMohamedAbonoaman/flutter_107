import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp( MyApp());
}
class MyApp extends StatelessWidget {

  MyApp({super.key});
  List<int> users = [1,2,3,4];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
           body: Column(
             children: [
               Expanded(
                 flex: 1,
                   child: Padding(
                     padding: const EdgeInsets.all(20.0),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Row(

                           children: [
                             Container(
                               width: 60,
                               height: 60,
                               decoration: const BoxDecoration(
                                 image: DecorationImage(
                                   image: AssetImage("assets/images/face.jpg"),
                                   fit: BoxFit.fill
                                 ),
                                   shape: BoxShape.circle
                               ),
                             ),
                             const SizedBox(width: 10,),
                             const Text("Chats",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                             Spacer(),
                             CircleAvatar(
                               child: Icon(Icons.camera_alt,color: Colors.black,),
                               backgroundColor: Colors.grey.withOpacity(0.4),
                             ),
                             SizedBox(width: 10,),
                             CircleAvatar(
                               child: Icon(Icons.edit,color: Colors.black,),
                               backgroundColor: Colors.grey.withOpacity(0.4),
                             ),

                           ],
                         ),
                         TextFormField(
                           decoration: InputDecoration(
                             border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                               borderRadius: BorderRadius.circular(15)
                             ),
                             hintText: "Search",
                             prefixIcon: Icon(Icons.search),
                             filled: true,
                             fillColor: Colors.grey.withOpacity(0.4),
                             contentPadding: EdgeInsets.all(10),

                           ),
                         )
                       ],
                     ),
                   )),
               Expanded(
                 flex: 1,
                   child: Container(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder:(context,index)=> const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage("assets/images/face.jpg"),
                            child: Align(
                                alignment: Alignment(1, 1),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children:[
                                    CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 13,
                                    ),
                                    CircleAvatar(
                                    radius: 8,
                                      backgroundColor: Colors.green,
                                  ),
                              ]
                                ),

                            ),
                          ),
                          Text("Martin",style: TextStyle(fontSize: 13,),)
                        ],
                      ),
                    ),
                  ),
               )),
               Expanded(
                 flex: 3,
                   child: Container(
                      child: ListView.builder(
                        itemCount: 10,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context,index)=>const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 35,
                                backgroundImage: AssetImage("assets/images/face.jpg"),

                              ),
                              SizedBox(width: 10,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  Text("Martin Randolph",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                                  Row(children: [
                                    Text("you:",style: TextStyle(fontSize: 14),),
                                    Text("What's man",style: TextStyle(fontSize: 14),),
                                    Text("9:40 AM",style: TextStyle(fontSize: 14),)

                                  ],)
                                ],
                              ),
                              Spacer(),
                              Icon(Icons.check_circle_outline_outlined,color: Colors.grey,)

                            ],
                          ),
                        ),
                      ),
               )),
             ],
           ),
        ),
      ),
    );
  }
}
