import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodoListPage extends StatelessWidget {
  const TodoListPage({Key? key}) : super(key: key);

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
                    onPressed: () {},
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
              ListView(
                //shirnkwrap regula o tamanho da tela da lista
                shrinkWrap: true,
                children: [
                  ListTile(

                  )
                ],
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
