import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:list/models/todo.dart';
import 'package:list/widgets/todo_list_item.dart';

class TodoListPage extends StatefulWidget {
  TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  //controller para pegar o que o usuario digitar de tarefa
  final TextEditingController todoController = TextEditingController();

  List<Todo> todos = [];

  @override
  Widget build(BuildContext context) {
    //Safe area centralizou toda a area do app
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              //centralizar a row na coluna
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: todoController,
                          decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Adicione uma tarefa',
                          hintText: 'Ex. Estudar flutter',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),

                    //butão desing e função
                    ElevatedButton(
                      onPressed: () {
                        String text = todoController.text;
                        setState(() {
                          Todo newTodo = Todo(
                            title: text,
                            dateTime: DateTime.now(),
                          );
                          todos.add(newTodo);
                        });
                        todoController.clear();

                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        padding: EdgeInsets.all(14),
                      ),
                      child: Icon(
                        Icons.add,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16,),
                //lista de tarefas
                Flexible(
                  child: ListView(
                    //shirnkwrap regula o tamanho da tela da lista
                    shrinkWrap: true,
                    children: [
                      //for para colocar o texto de entrada nas listas
                      for (Todo todo in todos)
                        TodoListItem(
                          todo: todo,
                          onDelete: onDelete,

                        ),

                    ],
                  ),
                ),
                SizedBox(height: 16,),
                Row(
                  children: [
                    Expanded(child: Text(
                        'Você possui ${todos.length} tarefa pendente'
                     )
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        padding: EdgeInsets.all(14),
                      ),
                      child: Text('Limpar tudo'),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  void onDelete(Todo todo){
    setState(() {
      todos.remove(todo);
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Tarefa ${todo.title} foi removida com sucesso!',
        style: TextStyle(
            color: Color(0xff060708),
        ),
          ),
        backgroundColor: Colors.white,
      )
    );
  }
}
