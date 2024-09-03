import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/widgets/buildTextField.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  MyApp({super.key});
  List<String> names = ["item1","item2","item3","item4"];
  void testAlert(BuildContext context) {
    var alert = AlertDialog(
      title: Text("Test"),
      content: Text("Done..!"),
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar:AppBar(
          title: const Text(
            "Login",
            style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
          ),
          leading: Icon(Icons.arrow_back_ios),
        ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Welcome Back",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
                      Text("Sign In to your account ",style: TextStyle(fontSize: 14),),
                      Text("")
                    ],
                  ),
                ),),
            Expanded(
              flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    BuildTextField(title: "Email Address", hint: "Enter your Email..."),
                    BuildTextField(title: "Password", hint: "Enter your Password..."),
                    TextButton(onPressed: (){}, child: Text("forget password ?",style: TextStyle(
                      fontSize: 12,fontWeight: FontWeight.bold,
                      color: Color(0xffEA9459)

                    ),))
                  ],
                )),
            Expanded(child: Container(
              color: Colors.green,
            )),
          ],
        ),
      ),

      ),

    );
  }
}


class A{
  int x;
  A({required this.x});
}