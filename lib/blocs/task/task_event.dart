class TaskEvent {}

class AddTask extends TaskEvent {
  String task;
  AddTask(this.task);
}

class DeleteTask extends TaskEvent {
  int index;
  DeleteTask(this.index);
}

class ResetEvent extends TaskEvent {}
