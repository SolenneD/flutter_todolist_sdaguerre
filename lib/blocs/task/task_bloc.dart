import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todolist_sdaguerre/blocs/task/task_event.dart';
import 'package:flutter_todolist_sdaguerre/blocs/task/task_state.dart';
import 'package:flutter_todolist_sdaguerre/repository/task_repository.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc(TaskState initialState) : super(initialState);

  @override
  Stream<TaskState> mapEventToState(TaskEvent event) async* {
    TaskRepository noteRepository = TaskRepository();

    if (event is AddTask) {
      noteRepository.tasks.add(event.task);
      yield HasValueTaskState(noteRepository.tasks);
    } else if (event is ResetEvent) {
      yield UninitializedTaskState();
    }
  }
}
