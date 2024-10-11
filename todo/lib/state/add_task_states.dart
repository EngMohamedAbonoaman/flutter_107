abstract class AddTaskStates{}
class AddTaskInitialState extends AddTaskStates{}
class AddTaskLoadingState extends AddTaskStates{}
class AddTaskErrorState extends AddTaskStates{
  String error;
  AddTaskErrorState({required this.error});
}
class AddTaskSuccessState extends AddTaskStates{}
