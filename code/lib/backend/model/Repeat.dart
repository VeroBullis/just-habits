enum RepeatInterval {day, week, month}

class Repeat {
  RepeatInterval interval;
  Set<int> selected;

  Repeat(this.interval, this.selected);
}