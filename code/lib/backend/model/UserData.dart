import 'package:just_habits/backend/model/Item.dart';

UserData userData = UserData([]);

class UserData {
  List<Habit> habitList;

  UserData(this.habitList);
}