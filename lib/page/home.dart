import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todolist_sdaguerre/blocs/task/task_bloc.dart';
import 'package:flutter_todolist_sdaguerre/blocs/task/task_state.dart';

import 'form.dart';

class TodoListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Todo List'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(child: BlocBuilder<TaskBloc, TaskState>(
            builder: (context, state) {
              if (state is UninitializedTaskState) {
                return Text('Unitialized');
              } else if (state is HasValueTaskState) {
                ListView.builder(
                    itemCount: state.tasks.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: <Widget>[
                          Text(state.tasks[index]),
                        ],
                      );
                    });
              }
              return Text('error');
            },
          )),
          Container(height: 32.0),
          RaisedButton(
            color: Colors.blueAccent,
            child: Text('Ajouter une tâche',
                style: TextStyle(color: Colors.white)),
            onPressed: () {
              _goFormScreen(context);
            },
          )
        ],
      ),
    );
  }
}

_goFormScreen(context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return FormScreenPage();
  }));
}
