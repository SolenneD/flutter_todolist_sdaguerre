import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todolist_sdaguerre/blocs/task/task_event.dart';
import 'package:flutter_todolist_sdaguerre/blocs/task/task_state.dart';
import 'package:flutter_todolist_sdaguerre/repository/task_repository.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc(TaskState initialState) : super(initialState);

  @override
  Stream<TaskState> mapEventToState(TaskEvent event) async* {
    TaskRepository taskRepository = TaskRepository();

    if (event is AddTask) {
      taskRepository.tasks.add(event.task);
      yield HasValueTaskState(taskRepository.tasks);
    } else if (event is DeleteTask) {
      taskRepository.tasks.removeAt(event.index);
      yield HasValueTaskState(taskRepository.tasks);
    } else if (event is ResetEvent) {
      yield UninitializedTaskState();
    }
  }
}
