import 'package:flutter/material.dart';
import 'package:mvvm_provider/utils/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar
     (title: const Text('Home')),
     body: Center(child: TextButton(onPressed: () => Utils.showFlushbarErrorMsg(context, "No Internet Connection."), child: const Text('Show Toast', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20))) ),
    );
  }
}