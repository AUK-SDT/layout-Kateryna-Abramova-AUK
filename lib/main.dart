import 'package:flutter/material.dart';

void main() {
  runApp(const MonobankApp());
}

class MonobankApp extends StatelessWidget {
  const MonobankApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Monobank Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        fontFamily: 'Roboto',
      ),
      home: MonobankHomePage(title: "Monobank"),
    );
  }
}

class MonobankHomePage extends StatelessWidget {
  final String title;

  const MonobankHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildTopBar(context),
            const SizedBox(height: 20),

            buildCreditCard(),
            const SizedBox(height: 30),

            buildSmallCardSwitch(),
            const SizedBox(height: 30),

            _buildActionButtons(),
            const SizedBox(height: 30),

            Expanded(child: buildTransactionHistory()),
          ],
        ),
      ),
    );
  }

  //Top Bar (Avatar, Balance, Stats)
  Widget _buildTopBar(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        spacing: 10,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage("assets/images/avatar.png"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.card_giftcard_rounded,
                      color: Colors.white,
                      size: 28,
                    ),
                    onPressed: () {},
                  ),
                  Text(
                    '100.00 ₴  |',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.pets_rounded,
                      color: Colors.white,
                      size: 28,
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Mono Alert"),
                            content: const Text(
                              "This is an alert about your mono 🐾, because button was pressed",
                            ),
                            actions: [
                              TextButton(
                                child: const Text("Close"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.analytics,
                      color: Colors.white,
                      size: 28,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // this make balance central
            children: [
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.center, // this made it central
                children: [
                  Icon(Icons.energy_savings_leaf, color: Colors.grey),
                  SizedBox(width: 8),
                  Text(
                    'Отримати ліміт 5 000.00 ₴',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
              SizedBox(height: 4),
              Row(
                spacing: 5,
                mainAxisAlignment: .center,
                children: [
                  Icon(Icons.add_circle_rounded, color: Colors.grey),
                  Text(
                    '1 000 000 000.99 ₴',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  //Black Card
  Widget buildCreditCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          colors: [Colors.white12, Colors.black54],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 20,
            top: 20,
            child: Text(
              'monobank',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            left: 88,
            top: 51,
            child: Text(
              'Universal Bank',
              style: TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
          Positioned(
            right: 20,
            bottom: 20,
            child: Image.asset("assets/images/Mastercard_logo.png", width: 50),
          ),
          const Positioned(
            left: 20,
            bottom: 40,
            child: Text(
              '4441 **** **** 9999',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                letterSpacing: 2.0,
              ),
            ),
          ),
          const Positioned(
            left: 20,
            bottom: 20,
            child: Text(
              'KATERYNA ABRAMOVA',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  //Quick Action Buttons
  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildThreeButtons(Icons.credit_card_rounded, 'Переказати ', 'на карту'),
        buildThreeButtons(Icons.sticky_note_2_rounded, 'Платіж ', 'за IBAN'),
        buildThreeButtons(Icons.grid_view_rounded, 'Інші ', 'платежі'),
      ],
    );
  }

  Widget buildThreeButtons(IconData icon, String label, String label2) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: const BoxDecoration(
            color: Color(0xFF2C2C2C),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.white, size: 28),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 13)),
        Text(label2, style: const TextStyle(color: Colors.white, fontSize: 13)),
      ],
    );
  }

  //ransaction History Bottom Sheet
  Widget buildTransactionHistory() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 16.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Операції', style: TextStyle(color: Colors.grey)),

                Container(
                  width: 45,
                  decoration: BoxDecoration(
                    color: Colors.indigo.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    spacing: 3,
                    mainAxisAlignment: .center,
                    children: [
                      Text(
                        'Усі',
                        style: TextStyle(color: Colors.lightBlueAccent),
                        textAlign: .center,
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 10,
                        color: Colors.lightBlueAccent,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          //transactions
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              children: [
                buildTransactionItem(
                  'Сільпо',
                  'Сьогодні, 16:20',
                  '-399.00 ₴',
                  Icons.shopping_cart,
                  Colors.orange,
                ),
                buildTransactionItem(
                  'Термінал mono',
                  'Сьогодні, 9:15',
                  '1 200.00 ₴',
                  Icons.person,
                  Colors.green,
                  isIncome: true,
                ),
                buildTransactionItem(
                  'Аптека АНЦ',
                  '3 Січня, 18:30',
                  '-320.50 ₴',
                  Icons.local_pharmacy,
                  Colors.teal,
                ),
                buildTransactionItem(
                  'EVA',
                  '2 Січня, 17:39',
                  '-920.50 ₴',
                  Icons.local_pharmacy,
                  Colors.deepOrangeAccent,
                ),
                buildTransactionItem(
                  'Термінал mono',
                  '1 Січня, 9:25',
                  '10 000.99 ₴',
                  Icons.person,
                  Colors.green,
                  isIncome: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // rendering transaction row
  Widget buildTransactionItem(
    String title,
    String subtitle,
    String amount,
    IconData icon,
    Color iconColor, {
    bool isIncome = false, //be default false, spend money, not income
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              //circles around logo
              color: iconColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                ),
              ],
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: isIncome ? Colors.green : Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSmallCardSwitch() {
    return Container(
      width: 80,
      height: 20,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        spacing: 3,
        mainAxisAlignment: .center,
        children: [
          Icon(Icons.circle, size: 10, color: Colors.white),
          Icon(Icons.add, size: 10, color: Colors.white),
        ],
      ),
    );
  }
}
