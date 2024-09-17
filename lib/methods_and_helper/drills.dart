class Drills {
  final int drillNo;
  final double criteria1;
  final double numberOfExercises;
  final double success;
  final List<String> distance = ['1', '2', '3'];

  Drills(this.drillNo, this.criteria1,this.numberOfExercises, this.success);

  double calculateSuccessRate() {
    return (success / numberOfExercises) * 100;
  }
}

class DrillThree extends Drills {
  
  @override
  List<String> get distance => ['6', '9', '12'];

  DrillThree(super.drillNo, super.numberOfExercises, super.success, super.criteria1);

  @override
  double calculateSuccessRate() {
    return (success / (numberOfExercises * criteria1)) * 100;
  }
}
