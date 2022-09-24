import 'package:flutter/material.dart';
import 'package:v1douvery/features/admin/models/sales.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class CategoryProductsChart extends StatelessWidget {
  final List<charts.Series<Sales, String>> seriesList;
  const CategoryProductsChart({
    Key? key,
    required this.seriesList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      seriesList,
      animate: true,
    );
  }
}
