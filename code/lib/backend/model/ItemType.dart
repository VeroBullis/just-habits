enum ItemType {habit, goal, todo, category;

  @override
  String toString() {
    switch (this) {
      case ItemType.habit:
        return "Habit";
      case ItemType.goal:
        return "Goal";
      case ItemType.todo:
        return "To-Do";
      case ItemType.category:
        return "Category";
    }
  }
}