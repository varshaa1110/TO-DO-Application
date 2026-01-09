import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/task.dart';

/// Task Provider for state management
/// Handles all task operations and notifies listeners of changes
class TaskProvider extends ChangeNotifier {
  static const String _boxName = 'tasks';
  Box<Task>? _taskBox;
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  /// Get active (incomplete) tasks
  List<Task> get activeTasks =>
      _tasks.where((task) => !task.isCompleted).toList();

  /// Get completed tasks
  List<Task> get completedTasks =>
      _tasks.where((task) => task.isCompleted).toList();

  /// Initialize Hive and load tasks
  Future<void> initializeHive() async {
    await Hive.initFlutter();
    
    // Register adapters
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(TaskAdapter());
    }
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(TaskPriorityAdapter());
    }

    // Open box
    _taskBox = await Hive.openBox<Task>(_boxName);
    _loadTasks();
  }

  /// Load tasks from local storage
  void _loadTasks() {
    if (_taskBox != null) {
      _tasks = _taskBox!.values.toList();
      // Sort by due date, then by priority
      _sortTasks();
      notifyListeners();
    }
  }

  /// Sort tasks by completion status, priority, and due date
  void _sortTasks() {
    _tasks.sort((a, b) {
      // Completed tasks go to bottom
      if (a.isCompleted != b.isCompleted) {
        return a.isCompleted ? 1 : -1;
      }
      
      // Sort by priority (high to low)
      if (a.priority != b.priority) {
        return b.priority.index.compareTo(a.priority.index);
      }
      
      // Sort by due date
      return a.dueDate.compareTo(b.dueDate);
    });
  }

  /// Add a new task
  Future<void> addTask(Task task) async {
    if (_taskBox != null) {
      await _taskBox!.put(task.id, task);
      _tasks.add(task);
      _sortTasks();
      notifyListeners();
    }
  }

  /// Update an existing task
  Future<void> updateTask(Task task) async {
    if (_taskBox != null) {
      await _taskBox!.put(task.id, task);
      final index = _tasks.indexWhere((t) => t.id == task.id);
      if (index != -1) {
        _tasks[index] = task;
        _sortTasks();
        notifyListeners();
      }
    }
  }

  /// Toggle task completion status
  Future<void> toggleTaskCompletion(String taskId) async {
    final task = _tasks.firstWhere((t) => t.id == taskId);
    final updatedTask = task.copyWith(isCompleted: !task.isCompleted);
    await updateTask(updatedTask);
  }

  /// Delete a task
  Future<void> deleteTask(String taskId) async {
    if (_taskBox != null) {
      await _taskBox!.delete(taskId);
      _tasks.removeWhere((task) => task.id == taskId);
      notifyListeners();
    }
  }

  /// Get task by ID
  Task? getTaskById(String id) {
    try {
      return _tasks.firstWhere((task) => task.id == id);
    } catch (e) {
      return null;
    }
  }
}
