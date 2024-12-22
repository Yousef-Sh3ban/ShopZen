import 'package:base/features/cart/ui/widget/custom_Bottom.dart';
import 'package:base/features/chek_out/ui/widget/address_tile.dart';
import 'package:base/features/home_screen/ui/widget/Custom_Bottom_NavigationBar.dart';
import 'package:flutter/material.dart';

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
        title: const Text('Address'),
        backgroundColor: Colors.white,
        elevation: 0,
        //foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Saved Address',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
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
                  SizedBox(
                    height: 142,
                  ),
                  CustomBottom(
                    text: "Apply",
                    height: 55,
                    width: double.infinity,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
