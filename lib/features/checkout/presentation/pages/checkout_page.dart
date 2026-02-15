import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout', style: TextStyle(fontSize: 18.sp)),
      ),
      body: Center(
        child: Text('Checkout Feature', style: TextStyle(fontSize: 24.sp)),
      ),
    );
  }
}
