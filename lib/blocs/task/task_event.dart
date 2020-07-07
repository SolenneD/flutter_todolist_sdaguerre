class TaskEvent {}

class AddTask extends TaskEvent {
  String task;
  AddTask(this.task);
}

class ResetEvent extends TaskEvent {}
