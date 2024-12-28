// import 'package:animate_do/animate_do.dart';
// import 'package:base/features/cart/ui/widget/custom_Bottom.dart';
// import 'package:base/features/checkout/ui/widget/address_tile.dart';

// import 'package:flutter/material.dart';

// class AddressPage extends StatefulWidget {
//   const AddressPage({super.key});

//   @override
//   _AddressPageState createState() => _AddressPageState();
// }

// class _AddressPageState extends State<AddressPage> {
//   String? selectedAddress;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: FadeInDown(
//           duration: const Duration(milliseconds: 700),
//           child: Row(
//             children: [
//               const SizedBox(
//                 width: 30,
//               ),
//               InkWell(
//                 child: const Icon(
//                   Icons.arrow_back_ios_new,
//                   size: 18,
//                 ),
//                 onTap: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ],
//           ),
//         ),
//         centerTitle: true,
//         title: FadeInDown(duration: const Duration(milliseconds: 700),child: const Text('Address')),
//         forceMaterialTransparency: true,
//         elevation: 0,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'Saved Address',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 8),
//             Expanded(
//               child: FadeIn(
//                 delay: const Duration(milliseconds: 300),
//                 child: ListView(
//                   children: [
//                     AddressTile(
//                       label: 'Home',
//                       address: '925 S Chugach St #APT 10, Alaska 99645',
//                       selected: selectedAddress == 'Home',
//                       onTap: () {
//                         setState(() {
//                           selectedAddress = 'Home';
//                         });
//                       },
//                     ),
//                     AddressTile(
//                       label: 'Office',
//                       address: '2438 6th Ave, Ketchikan, Alaska 99901',
//                       selected: selectedAddress == 'Office',
//                       onTap: () {
//                         setState(() {
//                           selectedAddress = 'Office';
//                         });
//                       },
//                     ),
//                     AddressTile(
//                       label: 'Apartment',
//                       address: '2551 Vista Dr #8301, Juneau, Alaska',
//                       selected: selectedAddress == 'Apartment',
//                       onTap: () {
//                         setState(() {
//                           selectedAddress = 'Apartment';
//                         });
//                       },
//                     ),
//                     AddressTile(
//                       label: 'Parent\'s House',
//                       address: '4821 Ridge Top Cir, Anchorage, Alaska',
//                       selected: selectedAddress == 'Parent\'s House',
//                       onTap: () {
//                         setState(() {
//                           selectedAddress = 'Parent\'s House';
//                         });
//                       },
//                     ),
//                     const SizedBox(
//                       height: 142,
//                     ),
//                     CustomBottom(
//                       text: "Apply",
//                       height: 55,
//                       width: double.infinity,
//                       onPressed: () {},
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:base/features/checkout/ui/widget/address_tile.dart';
import 'package:base/features/cart/ui/widget/custom_Bottom.dart';
//import 'custom_container.dart'; // Import the CustomContainer widget

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  String? selectedAddress;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: FadeInDown(
          duration: const Duration(milliseconds: 700),
          child: Row(
            children: [
              const SizedBox(
                width: 30,
              ),
              InkWell(
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  size: 18,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
        centerTitle: true,
        title: FadeInDown(
            duration: const Duration(milliseconds: 700),
            child: const Text('Address')),
        forceMaterialTransparency: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Saved Address',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 16),
            CustomContainer(
              child: AddressTile(
                label: 'Home',
                address: '925 S Chugach St #APT 10, Alaska 99645',
                selected: selectedAddress == 'Home',
                onTap: () {
                  setState(() {
                    selectedAddress = 'Home';
                  });
                },
              ),
            ),
            const SizedBox(height: 16),
            CustomContainer(
              child: AddressTile(
                label: 'Office',
                address: '2438 6th Ave, Ketchikan, Alaska 99901',
                selected: selectedAddress == 'Office',
                onTap: () {
                  setState(() {
                    selectedAddress = 'Office';
                  });
                },
              ),
            ),
            const SizedBox(height: 16),
            CustomContainer(
              child: AddressTile(
                label: 'Apartment',
                address: '2551 Vista Dr #8301, Juneau, Alaska',
                selected: selectedAddress == 'Apartment',
                onTap: () {
                  setState(() {
                    selectedAddress = 'Apartment';
                  });
                },
              ),
            ),
            const SizedBox(height: 16),
            CustomContainer(
              child: AddressTile(
                label: 'Parent\'s House',
                address: '4821 Ridge Top Cir, Anchorage, Alaska',
                selected: selectedAddress == 'Parent\'s House',
                onTap: () {
                  setState(() {
                    selectedAddress = 'Parent\'s House';
                  });
                },
              ),
            ),
            const SizedBox(
              height: 142,
            ),
            CustomBottom(
              text: "Apply",
              height: 55,
              width: 342,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
