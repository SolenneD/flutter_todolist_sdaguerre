class TaskRepository {
  List<String> tasks = [];

  static final TaskRepository _taskRepository = TaskRepository._internal();

  factory TaskRepository() {
    return _taskRepository;
  }

  TaskRepository._internal();
}
