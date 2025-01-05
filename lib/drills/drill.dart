import 'package:logger/logger.dart';

var logger = Logger();

class Drill {
  final int drillNo;
  bool isDropDown = true;
  int selectedDistance;
  int putts;
  double success;
  final List<int> distances = [1, 2, 3, 4, 5];
  static const perCent = 100.0;

  Drill(this.drillNo, this.selectedDistance, this.putts, this.success);

  double calculateSuccessRate(int selectedDistancePara, int puttsPara,
      double successPuttsPara, double missedDistanceFeetPara) {
    return (successPuttsPara / puttsPara.toDouble()) * perCent;
  }

  List<int> calculatePotentialSuccess() {
    List<int> potentialSuccess = [];
    for (var i = 0; i < putts + 1; i++) {
      potentialSuccess.add(i);
    }
    return potentialSuccess;
  }

  int howManyDistancesOfADrill() {
    return distances.length;
  }
}

class DrillDistancePutt extends Drill {
  @override
  bool get isDropDown => false;
  @override
  List<int> get distances => [6, 9, 12, 15];
  double clubFeetRatio = 2.83;

  DrillDistancePutt(
      super.drillNo, super.selectedDistance, super.putts, super.success);

  @override
  double calculateSuccessRate(int selectedDistancePara, int puttsPara,
      double successPuttsPara, double missedDistanceFeetPara) {
    //logger.d(puttsPara);
    //logger.d(selectedDistancePara);

    double aResult = (1 -
            ((missedDistanceFeetPara / clubFeetRatio) /
                (puttsPara.toDouble() * selectedDistancePara.toDouble()))) *
        Drill.perCent;

    if (aResult < 0.0) {
      aResult = 0.0;
    }

    return aResult;
  }

  @override
  List<int> calculatePotentialSuccess() {
    List<int> potentialSuccess = [];

    for (var i = 0; i < putts + 1; i++) {
      potentialSuccess.add(i);
    }
    logger.d(potentialSuccess);
    return potentialSuccess;
  }
}
