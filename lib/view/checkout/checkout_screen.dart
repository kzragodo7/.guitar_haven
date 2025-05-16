import 'package:flutter/material.dart';
import '../../utils/constants.dart';
import 'order_confirmed_screen.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final _formKey = GlobalKey<FormState>();

  String name = '';
  String address = '';
  String city = '';
  String zip = '';
  String selectedPayment = 'Credit Card';

  void _placeOrder() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const OrderConfirmedScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        backgroundColor: AppConstantsColor.lightBrown,
        foregroundColor: AppConstantsColor.darkBrown,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text('Shipping Address', style: AppTextStyles.subHeader),
            const SizedBox(height: 8),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  _buildTextField('Name', (val) => name = val),
                  _buildTextField('Address', (val) => address = val),
                  _buildTextField('City', (val) => city = val),
                  _buildTextField(
                    'ZIP Code',
                    (val) => zip = val,
                    inputType: TextInputType.number,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text('Payment Method', style: AppTextStyles.subHeader),
            RadioListTile(
              title: const Text('Credit Card'),
              value: 'Credit Card',
              groupValue: selectedPayment,
              onChanged: (value) {
                setState(() => selectedPayment = value.toString());
              },
            ),
            RadioListTile(
              title: const Text('PayPal'),
              value: 'PayPal',
              groupValue: selectedPayment,
              onChanged: (value) {
                setState(() => selectedPayment = value.toString());
              },
            ),
            const SizedBox(height: 20),
            const Text('Order Summary', style: AppTextStyles.subHeader),
            const ListTile(
              title: Text('Total Items: 3'),
              subtitle: Text('Estimated delivery: 3–5 business days'),
              trailing: Text('\$599.00'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: AppButtonStyle.primary,
              onPressed: _placeOrder,
              child: const Text('Place Order'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
    String label,
    Function(String) onChanged, {
    TextInputType inputType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        keyboardType: inputType,
        validator: (value) => value!.isEmpty ? 'Required' : null,
        onChanged: onChanged,
      ),
    );
  }
}
