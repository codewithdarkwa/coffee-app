import 'package:flutter/material.dart';

import 'datamanager.dart';

class OrderPage extends StatelessWidget {
  final DataManager dataManager;
  const OrderPage({Key? key, required this.dataManager}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text('This is order page');
  }
}
