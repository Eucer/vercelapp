import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:v1douvery/common/widgets/loader.dart';
import 'package:v1douvery/features/admin/models/sales.dart';
import 'package:v1douvery/features/admin/screens/adminScreens.dart';
import 'package:v1douvery/features/admin/servicios/adminServices.dart';
import 'package:v1douvery/features/admin/widgests/categoryProductChart.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({Key? key}) : super(key: key);

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  final AdminServices adminServices = AdminServices();
  int? totalSales;
  List<Sales>? earnings;

  @override
  void initState() {
    super.initState();
    getEarnings();
  }

  getEarnings() async {
    var earningData = await adminServices.getEarnings(context);
    totalSales = earningData['totalEarnings'];
    earnings = earningData['sales'];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90),
        child: Column(
          children: [
            AppBar(
              backgroundColor: Color(
                0XFF0D3B66,
              ),
              flexibleSpace: Container(),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        Icon(Icons.admin_panel_settings),
                        Text(
                          'Douvery',
                          style: GoogleFonts.lato(
                            color: Color(0xffFCFCFC),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Admin',
                    style: GoogleFonts.lato(
                      color: Color(0xffFCFCFC),
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              toolbarHeight: 60,
            ),
            ContainerNavOpci(),
          ],
        ),
      ),
      body: earnings == null || totalSales == null
          ? const Loader()
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Column(
                  children: [
                    Text(
                      '\$$totalSales',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 250,
                      child: CategoryProductsChart(seriesList: [
                        charts.Series(
                          id: 'Sales',
                          data: earnings!,
                          domainFn: (Sales sales, _) => sales.label,
                          measureFn: (Sales sales, _) => sales.earning,
                        ),
                      ]),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
