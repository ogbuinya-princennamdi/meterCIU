import 'package:flutter/material.dart';
import 'package:meterciu/AuthenticationPage/LoginPage.dart';
import '../../SharedFiles/transitionEffects.dart';
import '../Usage.dart';
import 'HomePage.dart';

class Pay extends StatefulWidget {
  const Pay({super.key});

  @override
  State<Pay> createState() => _PayState();
}

class _PayState extends State<Pay> {
  int _selectedIndex = 0;
  String _selectedPaymentMethod = 'Credit/Debit Card'; // Default payment method
  String _selectedRechargeMethod = 'Wallet'; // Default recharge method
  TextEditingController _amountController = TextEditingController();
  double _balance = 1000.0; // Sample balance for the user (can be dynamic)

  // Sample available payment methods
  List<String> paymentMethods = [
    'Credit/Debit Card',
    'Bank Transfer',
    'Mobile Money',
  ];

  // Sample recharge methods
  List<String> rechargeMethods = [
    'Wallet',
    'Banks',
  ];

  @override
  void initState() {
    super.initState();
    // Ensure that the selected payment method is valid
    if (!paymentMethods.contains(_selectedPaymentMethod)) {
      _selectedPaymentMethod = paymentMethods[0]; // Default to first option if invalid
    }
    // Ensure that the selected recharge method is valid
    if (!rechargeMethods.contains(_selectedRechargeMethod)) {
      _selectedRechargeMethod = rechargeMethods[0]; // Default to first option if invalid
    }
  }

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
                  'Funding Your Wallets',
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
        backgroundColor: const Color.fromARGB(255, 24, 146, 154),
        child: Column(
          children: [
            SizedBox(height: 15),
            GestureDetector(
              child: const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/litmac.png') as ImageProvider,
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  ListTile(
                    leading: const Icon(Icons.email, color: Colors.white),
                    title: const Text(
                      'Bill Forecasting',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.lock, color: Colors.white),
                    title: const Text(
                      'Usage Analytics',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.email, color: Colors.white),
                    title: const Text(
                      'Energy Saving Tips',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.lock, color: Colors.white),
                    title: const Text(
                      'Power Quality Monitoring',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.email, color: Colors.white),
                    title: const Text(
                      'Notifications & Alerts',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Available Balance: \N$_balance',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            // Payment Method Selection
            DropdownButton<String>(
              value: _selectedPaymentMethod,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedPaymentMethod = newValue!;
                });
              },
              items: paymentMethods.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value, style: TextStyle(fontSize: 18),),
                );
              }).toList(),
              hint: Text('Select Payment Method'),
            ),
            SizedBox(height: 20),
            // Amount Input Field
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter Amount',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            // Payment Button
            ElevatedButton(
              onPressed: () {
                double amount = double.tryParse(_amountController.text) ?? 0;
                if (amount > 0 && amount <= _balance) {
                  // Process the payment
                  setState(() {
                    _balance -= amount;
                    _amountController.clear();
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Payment of \N${amount.toStringAsFixed(2)} successful!')),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Invalid amount or insufficient balance')),
                  );
                }
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                  const Color.fromARGB(255, 24, 146, 154),
                ),
              ),
              child: const Text(
                'Fund Account',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            // Recharge Method Dropdown
            DropdownButton<String>(
              value: _selectedRechargeMethod, // Use separate state for recharge method
              onChanged: (String? newValue) {
                setState(() {
                  _selectedRechargeMethod = newValue!;
                });
              },
              items: rechargeMethods.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value,style: TextStyle(fontSize: 18),),
                );
              }).toList(),
              hint: Text('Select Recharge Method'),
            ),
            // Amount Input Field
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter Amount',
                border: OutlineInputBorder(),
                hintStyle: TextStyle(fontSize: 18)

              ),
            ),
            SizedBox(height: 20),
            // Payment Button
            ElevatedButton(
              onPressed: () {
                double amount = double.tryParse(_amountController.text) ?? 0;
                if (amount > 0 && amount <= _balance) {
                  // Process the payment
                  setState(() {
                    _balance -= amount;
                    _amountController.clear();
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Payment of \N${amount.toStringAsFixed(2)} successful!')),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Invalid amount or insufficient balance')),
                  );
                }
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                  const Color.fromARGB(255, 24, 146, 154),
                ),
              ),
              child: const Text(
                'Recharge',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            SizedBox(height: 20),

          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 24, 146, 154),
        borderRadius: const BorderRadius.only(
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
          page = DataUsage();
          break;
        default:
          page = const Homepage();
      }
      Navigator.push(
        context,
        transitionEffect(page: page),
      );
    });
  }
}
