class TaskState {}

class UninitializedTaskState extends TaskState {}

class HasValueTaskState extends TaskState {
  List<String> tasks;

  HasValueTaskState(this.tasks);
}