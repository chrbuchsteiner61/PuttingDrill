import 'package:logger/logger.dart';

var logger = Logger();

class DrillTheStandard {
  final int drillNo;
  int selectedDistance;
  int numberOfExercises;
  double success;
  final List<int> distances = [1, 2, 3];
  static const perCent = 100.0;

  DrillTheStandard(this.drillNo, this.selectedDistance, this.numberOfExercises,
      this.success);

  double calculateSuccessRate() {
    return (success / numberOfExercises.toDouble()) * perCent;
  }
}

class DrillDistancePutt extends DrillTheStandard {
  @override
  List<int> get distances => [6, 9, 12];
  double clubFeetRatio = 2.9;

  DrillDistancePutt(
      super.drillNo, super.selectedDistance, super.success, super.criteria1);

  @override
  double calculateSuccessRate() {
    double aResult = ( 1 -
        ((success / clubFeetRatio) /
                (numberOfExercises.toDouble() * selectedDistance.toDouble()))) *
            DrillTheStandard.perCent;
    logger.d(aResult);
    return aResult;
  }
}
