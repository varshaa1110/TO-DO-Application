# 📱 To-Do List Mobile Application

A fully functional mobile To-Do List application built with **Flutter (Dart)** featuring local storage, task management, and a clean Material Design UI.

## ✨ Features

### 1. **Home Screen**
- Display all tasks in a scrollable list
- Each task shows:
  - Title and description
  - Completion status with checkbox
  - Priority badge (High/Medium/Low)
  - Due date with overdue indicator
- Empty state with helpful message
- Floating action button for quick task creation

### 2. **Task Management**
- **Create Tasks**: Add new tasks with required title and optional description
- **Edit Tasks**: Tap any task to edit its details
- **Complete Tasks**: Toggle completion status with checkbox
- **Delete Tasks**: Remove tasks with confirmation dialog
- **Visual Feedback**: Completed tasks appear with strike-through and faded colors

### 3. **Task Properties**
- **Title** (required)
- **Description** (optional)
- **Priority**: High (Red), Medium (Orange), Low (Green)
- **Due Date**: Date picker with calendar interface
- **Completion Status**: Active or Completed

### 4. **Local Storage**
- Tasks persist after app restart
- Uses **Hive** for fast, local database
- Automatic sorting by completion status, priority, and due date

### 5. **User Interface**
- Modern Material Design
- Intuitive and clean layout
- Color-coded priority badges
- Overdue task highlighting
- Smooth animations and transitions

## 🏗️ Project Structure

```
lib/
├── main.dart                          # App entry point
├── models/
│   └── task.dart                      # Task data model
├── providers/
│   └── task_provider.dart             # State management & storage
└── screens/
    ├── home_screen.dart               # Main task list screen
    └── add_edit_task_screen.dart      # Create/Edit task screen
```

## 🚀 Setup Instructions

### Prerequisites
- Flutter SDK (3.0.0 or higher)
- Dart SDK (3.0.0 or higher)
- Android Studio / Xcode (for emulator)
- Android SDK / iOS SDK

### Installation Steps

1. **Clone or navigate to the project directory**
   ```bash
   cd TO-DO-Application
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate Hive adapters** (for data models)
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

4. **Check Flutter doctor** (ensure setup is complete)
   ```bash
   flutter doctor
   ```

5. **Run the app**
   
   For Android:
   ```bash
   flutter run
   ```
   
   Or select your device/emulator in VS Code and press F5

## 📱 Running on Emulator/Device

### Android Emulator
1. Open Android Studio → AVD Manager
2. Create/Start an Android Virtual Device
3. Run `flutter run` or press F5 in VS Code

### Physical Android Device
1. Enable Developer Options and USB Debugging
2. Connect device via USB
3. Run `flutter devices` to verify connection
4. Run `flutter run`

## 🛠️ Dependencies

- **provider**: State management
- **hive** & **hive_flutter**: Local database
- **path_provider**: File system paths
- **intl**: Date formatting
- **build_runner** & **hive_generator**: Code generation (dev)

## 📋 How to Use

1. **Add a Task**: Tap the blue + button at the bottom right
2. **Fill in Details**:
   - Enter a title (required)
   - Add description (optional)
   - Select priority level
   - Choose due date
3. **Save**: Tap "Add Task" button
4. **Complete Task**: Tap the checkbox on any task
5. **Edit Task**: Tap anywhere on the task card
6. **Delete Task**: Tap the trash icon and confirm

## 🎨 UI Features

- **Priority Badges**: Color-coded borders (Red/Orange/Green)
- **Overdue Tasks**: Display due date in red when overdue
- **Completed Tasks**: Strike-through text and faded appearance
- **Empty State**: Friendly message when no tasks exist
- **Confirmation Dialog**: Safety prompt before deleting

## 🎓 Academic/Demo Ready

This application is:
- ✅ Fully functional and production-ready
- ✅ Well-structured with clean code architecture
- ✅ Commented for easy understanding
- ✅ Suitable for screen recording demonstrations
- ✅ Perfect for academic project submissions
- ✅ Follows Flutter best practices

## 🔧 Troubleshooting

**Issue**: Build errors after cloning
```bash
flutter clean
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

**Issue**: "Hive adapter not registered"
- Ensure you ran the build_runner command
- Check that `task.g.dart` exists in `lib/models/`

**Issue**: App not launching on device
```bash
flutter doctor -v  # Check for issues
flutter devices    # Verify device connection
```

## 📄 License

This project is created for educational purposes.

## 👨‍💻 Author

Built with Flutter & ❤️

---

## 📸 Screenshots

*(Record your own demo video or take screenshots when running the app)*

**Features to showcase:**
- Home screen with tasks
- Adding a new task
- Editing an existing task
- Completing/uncompleting tasks
- Deleting a task with confirmation
- Empty state
- Different priority levels
- Overdue task indicators