import 'package:flutter/cupertino.dart';

class WellnessScreen extends StatefulWidget {
  const WellnessScreen({Key? key}) : super(key: key);

  @override
  State<WellnessScreen> createState() => _WellnessScreenState();
}

class _WellnessScreenState extends State<WellnessScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Wellness'));
  }
}
