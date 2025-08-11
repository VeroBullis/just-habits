enum RepeatInterval {day, week, month}

class Repeat {
  RepeatInterval interval;
  int count;

  Repeat(this.interval, this.count);
}