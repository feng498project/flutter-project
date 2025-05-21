import 'dart:io';

void main() {
  final taskManager = TaskManager();
  int? choice;

  do {
    print('\n--- Task Manager ---');
    print('1. Add Task');
    print('2. List Tasks');
    print('3. Exit');
    stdout.write('Enter your choice: ');
    choice = int.tryParse(stdin.readLineSync() ?? '');

    switch (choice) {
      case 1:
        stdout.write('Enter task name: ');
        final name = stdin.readLineSync() ?? '';
        taskManager.addTask(name);
        break;
      case 2:
        taskManager.listTasks();
        break;
      case 3:
        print('Exiting...');
        break;
      default:
        print('Invalid choice.');
    }
  } while (choice != 3);
}

class TaskManager {
  final List<String> _tasks = [];

  void addTask(String task) {
    _tasks.add(task);
    print('Task added: \$task');
  }

  void listTasks() {
    if (_tasks.isEmpty) {
      print('No tasks found.');
    } else {
      print('--- Task List ---');
      for (var i = 0; i < _tasks.length; i++) {
        print('\${i + 1}. \${_tasks[i]}');
      }
    }
  }
}
