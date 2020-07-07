import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todolist_sdaguerre/blocs/task/task_bloc.dart';
import 'package:flutter_todolist_sdaguerre/blocs/task/task_event.dart';
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
                return Text('');
              } else if (state is HasValueTaskState) {
                return ListView.builder(
                    itemCount: state.tasks.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.all(8.0),
                        padding: const EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Text(
                                  state.tasks[index],
                                ),
                              ],
                            ),
                            RaisedButton(
                              color: Colors.redAccent,
                              child: Text('SUP.',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16)),
                              onPressed: () {
                                BlocProvider.of<TaskBloc>(context)
                                    .add(DeleteTask(index));
                              },
                            ),
                          ],
                        ),
                      );
                    });
              }
              return Text('error');
            },
          )),
          Container(height: 32.0),
          Container(
            margin: const EdgeInsets.all(20.0),
            child: RaisedButton(
              color: Colors.blueAccent,
              child: Text('Ajouter une tâche',
                  style: TextStyle(color: Colors.white, fontSize: 16)),
              onPressed: () {
                _goFormScreen(context);
              },
            ),
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
