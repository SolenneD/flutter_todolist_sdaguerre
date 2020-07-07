import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todolist_sdaguerre/blocs/task/task_bloc.dart';
import 'package:flutter_todolist_sdaguerre/blocs/task/task_event.dart';
import 'package:flutter_todolist_sdaguerre/page/home.dart';

class FormScreenPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<FormScreenPage> {
  String _name;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    super.dispose();
  }

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name'),
      controller: nameController,
      maxLength: 30,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _name = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ajouter une tâche")),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildName(),
              SizedBox(height: 100),
              RaisedButton(
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
                onPressed: () {
                  if (!_formKey.currentState.validate()) {
                    return;
                  }
                  BlocProvider.of<TaskBloc>(context)
                      .add(AddTask(nameController.text));
                  _formKey.currentState.save();

                  print(_name);
                  _goHomeScreen(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

_goHomeScreen(context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return TodoListPage();
  }));
}
