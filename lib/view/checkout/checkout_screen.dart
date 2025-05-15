import 'package:flutter/material.dart';
import '../../utils/constants.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final _formKey = GlobalKey<FormState>();

  String shippingName = '';
  String shippingAddress = '';
  String city = '';
  String zip = '';
  String paymentMethod = 'Credit Card';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout', style: AppTextStyles.subHeader),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: AppConstantsColor.primaryColor),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Shipping Address', style: AppTextStyles.subHeader),
              SizedBox(height: 8),
              TextFormField(
                decoration: InputDecoration(labelText: 'Full Name'),
                validator:
                    (val) => val!.isEmpty ? 'Please enter your name' : null,
                onSaved: (val) => shippingName = val!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Address'),
                validator:
                    (val) => val!.isEmpty ? 'Please enter your address' : null,
                onSaved: (val) => shippingAddress = val!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'City'),
                validator:
                    (val) => val!.isEmpty ? 'Please enter your city' : null,
                onSaved: (val) => city = val!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'ZIP Code'),
                validator:
                    (val) => val!.isEmpty ? 'Please enter ZIP code' : null,
                onSaved: (val) => zip = val!,
              ),
              SizedBox(height: 20),

              Text('Payment Method', style: AppTextStyles.subHeader),
              SizedBox(height: 8),
              RadioListTile<String>(
                title: Text('Credit Card'),
                value: 'Credit Card',
                groupValue: paymentMethod,
                onChanged: (val) {
                  setState(() {
                    paymentMethod = val!;
                  });
                },
              ),
              RadioListTile<String>(
                title: Text('PayPal'),
                value: 'PayPal',
                groupValue: paymentMethod,
                onChanged: (val) {
                  setState(() {
                    paymentMethod = val!;
                  });
                },
              ),
              SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppConstantsColor.primaryColor,
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      Navigator.pushReplacementNamed(
                        context,
                        '/order_confirmed',
                      );
                    }
                  },
                  child: Text(
                    'Place Order',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
