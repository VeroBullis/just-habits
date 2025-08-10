import 'ItemType.dart';

class Item {
  ItemType type;
  String title, note, category;
  bool highlight;

  Item(this.type, this.title, this.note, this.category, this.highlight);
}

class Habit extends Item {
  Habit(super.type, super.title, super.note, super.category, super.highlight);

}

class Goal extends Item {
  Goal(super.type, super.title, super.note, super.category, super.highlight);

}

class Todo extends Item {
  Todo(super.type, super.title, super.note, super.category, super.highlight);

}