import 'package:flutter/material.dart';
import 'package:guitar_haven/utils/constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile', style: AppTextStyles.subHeader),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: AppConstantsColor.primaryColor),
      ),
      body: Center(
        child: Text(
          'User Profile Screen\nComing Soon!',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            color: AppConstantsColor.darkTextColor,
          ),
        ),
      ),
    );
  }
}
