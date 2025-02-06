import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:meterciu/AuthenticationPage/LoginPage.dart';

import '../SharedFiles/transitionEffects.dart';
import 'homePage/HomePage.dart';
import 'homePage/Pay.dart';
class DataUsage extends StatefulWidget {
  const DataUsage({super.key});

  @override
  State<DataUsage> createState() => _DataUsageState();
}

class _DataUsageState extends State<DataUsage> {
  int _selectedIndex = 2;
  final List<FlSpot> dataPoints = [
    const FlSpot(0, 30),
    const FlSpot(1, 50),
    const FlSpot(2, 40),
    const FlSpot(3, 70),
    const FlSpot(4, 60),
    const FlSpot(5, 90),
    const FlSpot(6, 80),
  ];
  @override
  Widget build(BuildContext context) {
    // Calculate the minimum and maximum Y values dynamically
    double minY = dataPoints.map((e) => e.y).reduce((a, b) => a < b ? a : b);
    double maxY = dataPoints.map((e) => e.y).reduce((a, b) => a > b ? a : b);

    // Ensure minY and maxY are finite numbers
    minY = minY.isFinite ? minY : 0.0;
    maxY = maxY.isFinite ? maxY : 100.0;
    return  Scaffold(
      appBar:PreferredSize(
        preferredSize: const Size.fromHeight(75),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromARGB(255, 24, 146, 154),
          actions: [
            Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.menu, size: 40, color: Colors.white),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
              },
            ),
            const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.0),
                child: Text(
                  'Meter Usage Trends',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Poppins-Regular',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: PopupMenuButton(
                position: PopupMenuPosition.under,
                iconColor: Colors.white,
                iconSize: 40,
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: InkWell(
                      onTap: () {
                        // Handle settings navigation
                      },
                      child: const Text(
                        'Settings',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Poppins-Regular',
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 24, 146, 154),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 24, 146, 154),
        child: Column(
          children: [
            SizedBox(height: 15,),

            GestureDetector(

              child: const CircleAvatar(
                radius: 60,
                backgroundImage:AssetImage('assets/litmac.png') as ImageProvider,
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  ListTile(
                    leading: const Icon(Icons.email,color: Colors.white,),
                    title: const Text('Bill Forecasting',style: TextStyle(
                      color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18,
                    ),),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.lock,color: Colors.white,),
                    title: const Text('Usage Analytics',style: TextStyle(
                      color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18,
                    ),),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.email,color: Colors.white,),
                    title: const Text('Energy Saving Tips',style: TextStyle(
                      color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18,
                    ),),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.lock,color: Colors.white,),
                    title: const Text('Power Quality Monitoring',style: TextStyle(
                      color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18,
                    ),),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.email,color: Colors.white,),
                    title: const Text('Bill Forecasting',style: TextStyle(
                      color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18,
                    ),),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.lock,color: Colors.white,),
                    title: const Text('Notifications & Alerts',style: TextStyle(
                      color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18,
                    ),),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    transitionEffect(page: LoginPage()),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                      const Color.fromARGB(255, 24, 146, 154)),
                ),
                child: const Text(
                  'Sign Out',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Poppins-Regular',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [

            SizedBox(height: 20),
            // Line chart
            Expanded(
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(
                    show: true,
                    getDrawingHorizontalLine: (value) {
                      return FlLine(
                        color: Colors.grey.withOpacity(0.5),
                        strokeWidth: 1,
                      );
                    },
                    getDrawingVerticalLine: (value) {
                      return FlLine(
                        color: Colors.grey.withOpacity(0.5),
                        strokeWidth: 1,
                      );
                    },
                  ),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          // Custom Y-axis labels (energy usage)
                          if (value == 30) return Text('30');
                          if (value == 50) return Text('50');
                          if (value == 70) return Text('70');
                          if (value == 90) return Text('90');
                          return Text('');
                        },
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          // Custom X-axis labels (time intervals)
                          switch (value.toInt()) {
                            case 0:
                              return Text('0h');
                            case 1:
                              return Text('1h');
                            case 2:
                              return Text('2h');
                            case 3:
                              return Text('3h');
                            case 4:
                              return Text('4h');
                            case 5:
                              return Text('5h');
                            case 6:
                              return Text('6h');
                            default:
                              return Text('');
                          }
                        },
                      ),
                    ),
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(
                      color: Colors.black.withOpacity(0.2),
                      width: 1,
                    ),
                  ),
                  minX: 0,
                  maxX: 6, // X-axis range from 0 to 6 (since we have 7 data points)
                  minY: minY,
                  maxY: maxY,
                  lineBarsData: [
                    LineChartBarData(
                      spots: dataPoints,
                      isCurved: true,
                      color: Colors.blue,
                      belowBarData: BarAreaData(
                        show: true,
                        color: Colors.blue.withOpacity(0.3),
                      ),
                      dotData: FlDotData(show: false), // Hide dots on the line
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 24, 146, 154),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.lock, size: 30.0),
            label: 'Pay',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 30.0),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.data_usage, size: 30.0),
            label: 'Usage',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.transparent,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      Widget page;
      switch (index) {
        case 0:
          page = Pay();
          break;
        case 1:
          page = const Homepage();
          break;
        case 2:
          page = const DataUsage(); // Do not push the same page.
          break;
        default:
          page = const Homepage();
      }
      // Only navigate if the selected page is different from the current one
      if (page != ModalRoute.of(context)?.settings.arguments) {
        Navigator.push(
          context,
          transitionEffect(page: page),
        );
      }
    });
  }
}
