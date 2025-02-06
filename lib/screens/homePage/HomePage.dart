import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../AuthenticationPage/LoginPage.dart';
import '../../SharedFiles/transitionEffects.dart';
import '../Usage.dart';
import 'Pay.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
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
                  'Meter CIU manager',
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
        child: ListView(
          children: [
            // New Metric Card for Meter Number
            _buildMeterNumberCard('Meter Number', '0202301087128', context),
            _buildMetricCard('Remaining unit', '20.45 KVs'),

            _buildMetricCard('Power Consumption', '1500 W'),
            _buildMetricCard('Energy Consumption', '5.2 kWh'),
            _buildMetricCard('Voltage', '230 V'),
            _buildMetricCard('Current', '6.5 A'),
            _buildMetricCard('Power Factor', '0.98'),


            SizedBox(height: 20),
            Text('Load Profiling & Peak Usage', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            _buildLoadProfileGraph(),
            SizedBox(height: 20),
            Text('Fluctuations Signals', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            _buildFluctuationsGraph(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  // Helper function to create a card for each metric
  Widget _buildMetricCard(String title, String value) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
        subtitle: Text(value, style: TextStyle(fontSize: 18, color: Colors.blueAccent)),
      ),
    );
  }

  // New helper function to create a card for the Meter Number with Row layout
  Widget _buildMeterNumberCard(String title, String meterNumber, BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Row(
          children: [

            Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            Spacer(),
            Text("Link new", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),

          ],
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,  // Ensures widgets are spaced out
          children: [
            InkWell(
              onTap: () {
                _showMeterNumberDialog(context); // Show a dialog or navigate to a new screen
              },
              child: Text(
                meterNumber,
                style: TextStyle(fontSize: 24, color: Colors.blueAccent, decoration: TextDecoration.underline),
              ),
            ),
            // Add other widgets to the row here, for example, an icon or a button:
            IconButton(
              icon: Icon(Icons.edit, color: Colors.blue),
              onPressed: () {
                // Handle edit action (could navigate to a new screen, etc.)
                _showMeterNumberDialog(context); // You can reuse the dialog for editing
              },
            ),
          ],
        ),
      ),
    );
  }

  // Function to show a dialog when clicking the meter number
  void _showMeterNumberDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Update Meter Number"),
          content: Text("Here you can update your meter number."),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close dialog
              },
              child: Text("Close"),
            ),
          ],
        );
      },
    );
  }

  // Bottom Navigation Bar
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
        backgroundColor: Color.fromARGB(255, 24, 146, 154),
        iconSize: 30.0,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        onTap: _onItemTapped,
      ),
    );
  }

  // Navigation logic
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
          page = const DataUsage();
          break;
        default:
          page = const Homepage();
      }

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => page),
            (Route<dynamic> route) => false,
      );
    });
  }

  // Load Profile Graph (LineChart)
  Widget _buildLoadProfileGraph() {
    List<FlSpot> loadProfileData = [
      FlSpot(0, 1.2), // Hour 0
      FlSpot(1, 1.5), // Hour 1
      FlSpot(2, 2.0), // Hour 2
      FlSpot(3, 1.8), // Hour 3
      FlSpot(4, 2.5), // Hour 4
      FlSpot(5, 2.3), // Hour 5
      FlSpot(6, 1.7), // Hour 6
    ];

    return Container(
      height: 200,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: LineChart(
        LineChartData(
          lineBarsData: [
            LineChartBarData(
              spots: loadProfileData,
              isCurved: true,
              color: Colors.blue,
              belowBarData: BarAreaData(show: true, color: Colors.blue.withOpacity(0.2)),
            ),
          ],
          titlesData: FlTitlesData(show: false),
          borderData: FlBorderData(show: true, border: Border.all(color: Colors.black.withOpacity(0.2))),
          minX: 0,
          maxX: 6, // 6 hours
          minY: 0,
          maxY: 3, // Load ranges from 0 to 3 kW
        ),
      ),
    );
  }

  // Fluctuations Signal Graph (LineChart)
  Widget _buildFluctuationsGraph() {
    List<FlSpot> fluctuationsData = [
      FlSpot(0, 1.0), // Hour 0
      FlSpot(1, 1.1), // Hour 1
      FlSpot(2, 0.9), // Hour 2
      FlSpot(3, 1.2), // Hour 3
      FlSpot(4, 1.3), // Hour 4
      FlSpot(5, 1.1), // Hour 5
      FlSpot(6, 1.0), // Hour 6
    ];

    return Container(
      height: 200,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: LineChart(
        LineChartData(
          lineBarsData: [
            LineChartBarData(
              spots: fluctuationsData,
              isCurved: true,
              color: Colors.red,
              belowBarData: BarAreaData(show: true, color: Colors.red.withOpacity(0.2)),
            ),
          ],
          titlesData: FlTitlesData(show: false),
          borderData: FlBorderData(show: true, border: Border.all(color: Colors.black.withOpacity(0.2))),
          minX: 0,
          maxX: 6, // 6 hours
          minY: 0,
          maxY: 1.5, // Fluctuations range from 0 to 1.5
        ),
      ),
    );
  }
}
