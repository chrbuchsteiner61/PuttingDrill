import 'package:logger/logger.dart';

var logger = Logger();

class Drill {
  final int drillNo;
  bool isDropDown = true;
  int selectedDistance;
  int numberOfExercises;
  double success;
  final List<int> distances = [1, 2, 3];
  static const perCent = 100.0;

  Drill(this.drillNo, this.selectedDistance, this.numberOfExercises,
      this.success);

  double calculateSuccessRate(
      int selectedDistancePara,
      int numberOfExercisesPara,
      double successPuttsPara,
      double missedDistanceFeetPara) {
    return (successPuttsPara / numberOfExercisesPara.toDouble()) * perCent;
  }

  List<int> calculatePotentialSuccess() {
    List<int> potentialSuccess = [];
    for (var i = 0; i < numberOfExercises + 1; i++) {
      potentialSuccess.add(i);
    }
    return potentialSuccess;
  }
}

class DrillDistancePutt extends Drill {
  @override
  bool get isDropDown => false;
  @override
  List<int> get distances => [6, 9, 12];
  double clubFeetRatio = 2.83;

  DrillDistancePutt(super.drillNo, super.selectedDistance,
      super.numberOfExercises, super.success);

  @override
  double calculateSuccessRate(
      int selectedDistancePara,
      int numberOfExercisesPara,
      double successPuttsPara,
      double missedDistanceFeetPara) {
    logger.d(numberOfExercisesPara);
    logger.d(selectedDistancePara);

    double aResult = (1 -
            ((missedDistanceFeetPara / clubFeetRatio) /
                (numberOfExercisesPara.toDouble() *
                    selectedDistancePara.toDouble()))) *
        Drill.perCent;

    if (aResult < 0.0) {
      aResult = 0.0;
    }

    return aResult;
  }

  @override
  List<int> calculatePotentialSuccess() {
    List<int> potentialSuccess = [];

    for (var i = 0; i < numberOfExercises + 1; i++) {
      potentialSuccess.add(i);
    }
    logger.d(potentialSuccess);
    return potentialSuccess;
  }
}
