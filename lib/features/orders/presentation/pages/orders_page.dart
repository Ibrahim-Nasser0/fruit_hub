import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders', style: TextStyle(fontSize: 18.sp)),
      ),
      body: Center(
        child: Text('Orders Feature', style: TextStyle(fontSize: 24.sp)),
      ),
    );
  }
}
