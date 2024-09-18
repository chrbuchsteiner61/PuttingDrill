class Drills {
  final int drillNo;
  int criteria1;
  int numberOfExercises;
  double success;
  final List<int> distances = [1, 2, 3];
  static const perCent = 100.0;

  Drills(this.drillNo, this.criteria1, this.numberOfExercises, this.success);

  double calculateSuccessRate() {
    return (success / numberOfExercises.toDouble()) * perCent;
  }
}

class DrillDistancePutt extends Drills {
  @override
  List<int> get distances => [6, 9, 12];

  DrillDistancePutt(
      super.drillNo, super.numberOfExercises, super.success, super.criteria1);

  @override
  double calculateSuccessRate() {
    return (success / (numberOfExercises.toDouble() * criteria1.toDouble())) *
        Drills.perCent;
  }
}
