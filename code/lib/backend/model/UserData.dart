import 'package:just_habits/backend/model/Item.dart';

UserData userData = UserData();

class UserData {
  List<Habit> habitList = [];
  List<Goal> goalList = [];
  List<Todo> todoList = [];

  //UserData(this.habitList, this.goalList, this.todoList);

  void addHabit(Habit newHabit) {
    habitList.add(newHabit);
  }

  int getNumHabits() {
    return habitList.length;
  }

  Habit getHabit(int i) {
    return habitList[i];
  }
}