import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CheckoutPage(),
    );
  }
}

class CheckoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Delivery Address',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text('Home\n925 S Chugach St #APT 10, Alaska 99645'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddressPage(),
                        ),
                      );
                    },
                    child: Text('Change',
                        style: TextStyle(color: Colors.deepPurple)),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Payment Method',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                PaymentMethodWidget(icon: Icons.credit_card, label: 'Card'),
                PaymentMethodWidget(icon: Icons.money, label: 'Cash'),
                PaymentMethodWidget(icon: Icons.apple, label: 'Apple Pay'),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Order Summary',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            OrderSummary(),
            Spacer(),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter promo code',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                  ),
                  onPressed: () {},
                  child: Text('Add'),
                ),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                backgroundColor: Colors.deepPurple,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CongratulationsPage(),
                  ),
                );
              },
              child: Text('Place Order'),
            ),
          ],
        ),
      ),
    );
  }
}

class AddressPage extends StatefulWidget {
  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  String? selectedAddress;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Address'),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Saved Address',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Expanded(
              child: ListView(
                children: [
                  AddressTile(
                    label: 'Home',
                    address: '925 S Chugach St #APT 10, Alaska 99645',
                    selected: selectedAddress == 'Home',
                    onTap: () {
                      setState(() {
                        selectedAddress = 'Home';
                      });
                    },
                  ),
                  AddressTile(
                    label: 'Office',
                    address: '2438 6th Ave, Ketchikan, Alaska 99901',
                    selected: selectedAddress == 'Office',
                    onTap: () {
                      setState(() {
                        selectedAddress = 'Office';
                      });
                    },
                  ),
                  AddressTile(
                    label: 'Apartment',
                    address: '2551 Vista Dr #8301, Juneau, Alaska',
                    selected: selectedAddress == 'Apartment',
                    onTap: () {
                      setState(() {
                        selectedAddress = 'Apartment';
                      });
                    },
                  ),
                  AddressTile(
                    label: 'Parent\'s House',
                    address: '4821 Ridge Top Cir, Anchorage, Alaska',
                    selected: selectedAddress == 'Parent\'s House',
                    onTap: () {
                      setState(() {
                        selectedAddress = 'Parent\'s House';
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                backgroundColor: Colors.deepPurple,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Apply'),
            ),
          ],
        ),
      ),
    );
  }
}

class AddressTile extends StatelessWidget {
  final String label;
  final String address;
  final bool selected;
  final VoidCallback onTap;

  const AddressTile({
    required this.label,
    required this.address,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.location_on, color: Colors.deepPurple),
      title: Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(address),
      trailing: selected
          ? Icon(Icons.circle, color: Colors.green)
          : Icon(Icons.circle_outlined, color: Colors.grey),
      onTap: onTap,
    );
  }
}

class CongratulationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.check_circle, size: 100, color: Colors.green),
              SizedBox(height: 16),
              Text(
                'Congratulations!',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text('Your order has been placed successfully.'),
              SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Back to Checkout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PaymentMethodWidget extends StatelessWidget {
  final IconData icon;
  final String label;

  const PaymentMethodWidget({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Icon(icon, size: 40, color: Colors.deepPurple),
          SizedBox(height: 8),
          Text(label, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}

class OrderSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Sub-total:'),
            Text('\$170.75'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Delivery Fee:'),
            Text('\$20.00'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Discount:'),
            Text('-\$10'),
          ],
        ),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('\$180.99', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }
}
