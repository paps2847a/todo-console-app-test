import 'dart:io';

void main(List<String> arguments) {
  List<String> todo = [];
  List<bool> estatus = [];
  bool terminar = false;

  print("Bienvenido a la lista de tareas!");

  while (terminar != true) {
    print("Que desea hacer?:");

    print("1 - Agregar tarea a la lista");
    print("2 - Ver la lista completa de tareas");
    print("3 - Eliminar una tarea especifica");
    print("4 - Editar una tarea");
    print("5 - Salir del programa");

    Object? opcion = int.tryParse(stdin.readLineSync().toString());

    switch (opcion) {
      case 1:
        add(todo, estatus);
        break;

      case 2:
        verTareas(todo, estatus);
        break;

      case 3:
        remove(todo, estatus);
        break;

      case 4:
        edit(todo, estatus);
        break;

      case 5:
        print("Adios!");
        terminar = true;

      default:
        print("Opcion no valida");
    }
  }
}

void add(List<String> lista, List<bool> estatus) {
  print("Inserte la tarea nueva:");

  var task = stdin.readLineSync().toString();

  lista.add(task);
  estatus.add(false);
}

bool remove(List<String> lista, List<bool> estatus) {
  print("Elija la tarea que quiere borrar:");

  var count = 0;

  if (lista.isEmpty) {
    print("No hay nada en la  lista!");
    return false;
  } else {
    for (var element in lista) {
      var valor = (estatus[count] == false) ? "Por hacer" : "Hecha";
      print(
          count.toString() + " -" + element + "-" + "estatus: " + valor + "-");
      count++;
    }
  }

  var purificar = int.parse(stdin.readLineSync().toString());

  try {
    int escogido = purificar;

    if (escogido < 0 || escogido >= lista.length) {
      print("Error: El número de tarea no existe!");
      return false;
    } else {
      lista.removeAt(escogido);
      estatus.remove(escogido);

      print("Tarea Borrada");

      return true;
    }
  } on FormatException catch (e) {
    print("Error: La entrada debe ser un número entero!");
    return false;
  }
}

bool edit(List<String> lista, List<bool> estatus) {
  print("Elija el numero de la tarea que quiere editar:");

  var count = 0;

  if (lista.isEmpty) {
    print("No hay nada en la  lista!");
    return false;
  } else {
    for (var element in lista) {
      var valor = (estatus[count] == false) ? "Por hacer" : "Hecha";
      print(
          count.toString() + " -" + element + "-" + "estatus: " + valor + "-");
      count++;
    }
  }

  var purificar = int.parse(stdin.readLineSync().toString());

  try {
    int escogido = purificar;

    if (escogido < 0 || escogido >= lista.length) {
      print("Error: El número de tarea no existe!");
      return false;
    } else {
      print("Inserte la nueva tarea: ");

      lista[escogido] = stdin.readLineSync().toString();

      print("Edicion hecha");

      return true;
    }
  } on FormatException catch (e) {
    print("Error: La entrada debe ser un número entero!");
    return false;
  }
}

void tareaLista(List<String> lista, List<bool> estatus, String tarea) {
  var indice = lista.indexOf(tarea);
  estatus[indice] = true;
}

bool verTareas(List<String> lista, List<bool> estatus) {
  print("Tareas Pendientes:");
  print("\n");

  var count = 0;

  if (lista.isEmpty) {
    print("No hay nada en la  lista!");
    return false;
  } else {
    for (var element in lista) {
      var valor = (estatus[count] == false) ? "Por hacer" : "Hecha";
      print(
          count.toString() + " -" + element + "-" + "estatus: " + valor + "-");
      count++;
    }
  }

  print("\n");
  print("Estas son todas las tareas pendientes.");

  return true;
}
