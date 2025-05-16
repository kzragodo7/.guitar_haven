import 'package:flutter/material.dart';
import 'package:guitar_haven/models/delivery_model.dart';

import 'package:guitar_haven/utils/constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<Delivery> deliveries = [
    Delivery(productName: "Acoustic Guitar A1", status: "Delivered"),
    Delivery(productName: "Electric Guitar X9", status: "Shipped"),
  ];

  void markAsReceived(int index) {
    setState(() {
      deliveries[index].received = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: AppConstantsColor.darkBrown,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Your Deliveries", style: AppTextStyles.subHeader),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: deliveries.length,
                itemBuilder: (context, index) {
                  final item = deliveries[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(item.productName),
                      subtitle: Text("Status: ${item.status}"),
                      trailing:
                          item.received
                              ? const Icon(
                                Icons.check_circle,
                                color: Colors.green,
                              )
                              : ElevatedButton(
                                onPressed: () => markAsReceived(index),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromARGB(
                                    255,
                                    248,
                                    131,
                                    96,
                                  ),
                                ),
                                child: const Text("Received"),
                              ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
