import 'package:just_habits/backend/model/Item.dart';
import 'package:just_habits/backend/model/Repeat.dart';

import 'UserData.dart';

// user data object
UserData userData = UserData();

// default repeat for habits (every day)
final DEFAULT_REPEAT = Repeat(RepeatInterval.day, {1});

// item object for storing attributes during item creation
Item? newItem;