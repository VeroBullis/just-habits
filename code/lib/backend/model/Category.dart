import 'package:just_habits/backend/model/ItemType.dart';

import 'Item.dart';

class Category {
  ItemType type;
  String title;
  List<Item> items;

  Category(this.type, this.title, this.items);

  void addItem(Item item) {
    items.add(item);
  }
}