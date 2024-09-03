import 'package:flutter/material.dart';

class BuildTextField extends StatelessWidget {
  BuildTextField({super.key,required this.title,required this.hint});
  String title;
  String hint;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          SizedBox(height: 20,),
          TextFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                contentPadding: EdgeInsets.all(15),

                fillColor: Colors.grey.withOpacity(.2) ,
                hintText: hint,
                hintStyle: TextStyle(
                    color: Colors.grey
                )



            ),
          )
        ],
      ),
    );
  }
}
