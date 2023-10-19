import 'package:flutter/material.dart';
import 'package:mk_mining/views/refer/refer_list.dart';

class ReferListScreen extends StatelessWidget {
  const ReferListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Refer List"),
        centerTitle: false,
      ),
      body: const ReferList());
  }
}