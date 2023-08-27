import 'package:flutter/material.dart';

import 'package:night_in/components/register_tabs/basic_infos.dart';
import 'package:night_in/components/register_tabs/code_verrif.dart';
import 'package:night_in/components/register_tabs/identity.dart';
import 'package:night_in/components/register_tabs/register_end.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key); // Constructor

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  back() {
    if (_tabController!.index == 0) {
      Navigator.pop(context);
    } else {
      _tabController!.animateTo(_tabController!.index - 1);
    }
  }

  next() {
    if (_tabController!.index == 3) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      _tabController!.animateTo(_tabController!.index + 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: [
          BasicInfos(back: back, next: next),
          CodeVerrif(back: back, next: next),
          Identity(back: back, next: next),
          RegisterEnd(back: back, next: next),
        ],
      ),
    );
  }
}
