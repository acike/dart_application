// เฉลย: Task Scheduler

import '../priority_queue.dart';

class Task {
  final String name;
  final DateTime deadline;
  final int importance;

  Task(this.name, this.deadline, this.importance);

  int get priority {
    final int daysLeft = deadline.difference(DateTime.now()).inDays;
    return (daysLeft * importance).clamp(1, 100);
  }

  @override
  String toString() =>
      '$name (deadline: ${deadline.day}/${deadline.month}, importance: $importance)';
}

class TaskScheduler {
  final PriorityQueue<Task> _queue = PriorityQueue<Task>();

  void addTask(Task task) {
    _queue.enqueue(task, task.priority);
    print('Added: ${task.name} (priority: ${task.priority})');
  }

  Task? getNextTask() {
    final Task? next = _queue.dequeue();
    if (next != null) {
      print('Working on: ${next.name}');
    }
    return next;
  }

  Task? peekNextTask() => _queue.peek();
  int get pendingTasks => _queue.size;
}

void main() {
  final TaskScheduler scheduler = TaskScheduler();
  final DateTime now = DateTime.now();

  scheduler.addTask(
    Task('Prepare presentation', now.add(Duration(days: 2)), 2),
  );
  scheduler.addTask(Task('Fix production bug', now.add(Duration(days: 1)), 1));
  scheduler.addTask(Task('Team lunch planning', now.add(Duration(days: 7)), 4));
  scheduler.addTask(Task('Code review', now.add(Duration(days: 3)), 3));
  scheduler.addTask(Task('Update resume', now.add(Duration(days: 14)), 5));

  print('\nWork order by priority:');
  while (scheduler.pendingTasks > 0) {
    scheduler.getNextTask();
  }
}
