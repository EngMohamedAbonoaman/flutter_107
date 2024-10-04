import 'package:flutter/material.dart';

import '../shared/appStyles.dart';

class BuildTextField extends StatelessWidget {
   BuildTextField({super.key,required this.hint,required this.title, this.size=10,required this.controller,this.enabled = true});
  String title;
  String hint;
 double size;
 bool enabled;
 TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,style: AppStyle.medStyle.copyWith(color: Colors.black,fontSize: 22),),
          SizedBox(height: 10,),
          TextFormField(

            decoration: InputDecoration(

              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20)
              ),
              contentPadding: EdgeInsets.only(bottom: size,top: size,left: 5),
              hintText: hint,
              enabled: enabled

            ),
            controller: controller,
          )
        ],
      ),
    );
  }
}
