import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodoListPage extends StatefulWidget {
  TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  //controller para pegar o que o usuario digitar de tarefa
  final TextEditingController todoController = TextEditingController();

  List<String> todos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
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
                        todos.add(text);
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
                    for (String todo in todos)
                    ListTile(
                      title: Text(todo),
                      subtitle: Text('07/03/2022'),
                      leading: Icon(Icons.save, size:30,),
                      onTap: (){
                        print('Tarefa: $todo');
                      },

                    )
                  ],
                ),
              ),
              SizedBox(height: 16,),
              Row(
                children: [
                  Expanded(child: Text(
                      'Você possui 0 tarefa pendente'
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
    );
  }
}
