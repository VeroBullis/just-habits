enum ItemType {habit, goal, todo;

  @override
  String toString() {
    switch (this) {
      case ItemType.habit:
        return "Habit";
      case ItemType.goal:
        return "Goal";
      case ItemType.todo:
        return "To-Do";
    }
  }
}