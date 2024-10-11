import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/networking/DB.dart';
import 'package:todo/screens/home_page.dart';
import 'package:todo/shared/cach_helper.dart';
import 'package:todo/state/add_task_cubit.dart';
import 'package:todo/state/blocObservable.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider(create: (_)=>AddTaskCubit()..initializeDB())
    ], child: MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
