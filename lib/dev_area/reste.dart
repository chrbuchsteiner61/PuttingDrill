@override
  Widget build(BuildContext context) {
    final List<ChartData> data = [
      ChartData(date: DateTime(2024, 9, 19), attempts: 5, result: 60),
      ChartData(date: DateTime(2024, 9, 20), attempts: 3, result: 70),
      ChartData(date: DateTime(2024, 9, 21), attempts: 7, result: 89),
      ChartData(date: DateTime(2024, 9, 21), attempts: 5, result: 89),
      ChartData(date: DateTime(2024, 9, 22), attempts: 6, result: 59),
      ChartData(date: DateTime(2024, 9, 23), attempts: 5, result: 60),
      ChartData(date: DateTime(2024, 9, 24), attempts: 7, result: 34),
      ChartData(date: DateTime(2024, 9, 24), attempts: 4, result: 56),
      ChartData(date: DateTime(2024, 9, 25), attempts: 5, result: 67),
      ChartData(date: DateTime(2024, 9, 26), attempts: 5, result: 53),
      ChartData(date: DateTime(2024, 9, 27), attempts: 6, result: 56),
      ChartData(date: DateTime(2024, 9, 27), attempts: 4, result: 64),
      ChartData(date: DateTime(2024, 9, 24), attempts: 7, result: 34),
      ChartData(date: DateTime(2024, 9, 24), attempts: 4, result: 56),
      ChartData(date: DateTime(2024, 9, 25), attempts: 5, result: 67),
      ChartData(date: DateTime(2024, 9, 26), attempts: 5, result: 53),
      ChartData(date: DateTime(2024, 9, 27), attempts: 6, result: 56),
      ChartData(date: DateTime(2024, 9, 27), attempts: 4, result: 64),
      ChartData(date: DateTime(2024, 9, 27), attempts: 5, result: 64),
      ChartData(date: DateTime(2024, 9, 27), attempts: 4, result: 64),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Histogram Chart')),
      body: Center(
        child: HistogramChart(chartData: data),
      ),
    );
  }