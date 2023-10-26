import 'package:flutter/cupertino.dart';

class MyPlansScreen extends StatefulWidget {
  const MyPlansScreen({Key? key}) : super(key: key);

  @override
  State<MyPlansScreen> createState() => _MyPlansScreenState();
}

class _MyPlansScreenState extends State<MyPlansScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('MyPlans'));
  }
}
