import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todolist_sdaguerre/blocs/task/task_state.dart';
import 'package:flutter_todolist_sdaguerre/page/home.dart';

import 'blocs/task/task_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => TaskBloc(UninitializedTaskState()),
        child: MaterialApp(
            debugShowCheckedModeBanner: false, home: TodoListPage()));
  }
}
