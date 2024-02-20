class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', todoText: 'Ejercicio matutino', isDone: true ),
      ToDo(id: '02', todoText: 'Comprar alimentos', isDone: true ),
      ToDo(id: '03', todoText: 'Revisar correos electrónicos', ),
      ToDo(id: '04', todoText: 'Reunión de equipo', ),
      ToDo(id: '05', todoText: 'Trabajar en aplicaciones móviles durante 2 horas', ),
      ToDo(id: '06', todoText: 'Cena con Isaac Profe bello', ),
    ];
  }
}