import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:list/models/todo.dart';

class TodoListItem extends StatelessWidget {
  const TodoListItem({Key? key,  required this.todo}) : super(key: key);
  //construtor para pegar a  entrada do usuario
  //require e usado quando o contrutor não e nulo
  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
      ),


      margin: const EdgeInsets.symmetric(vertical: 2),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(DateFormat('dd/MM/yyyy - HH:mm').format(todo.dateTime),
            style: TextStyle(
                fontSize: 12),
          ),
          Text(
            todo.title,
            style: TextStyle(
              fontSize: 16,
              fontWeight:  FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
