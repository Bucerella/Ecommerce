import 'package:ecommerce_riverpod/controller/riverpod_management.dart';
import 'package:ecommerce_riverpod/view/utilities/constants/constants.dart';
import 'package:ecommerce_riverpod/view/utilities/widgets/bottom_navbar.dart';
import 'package:ecommerce_riverpod/controller/bottom_navbar_riverpod.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BaseScaffold extends ConsumerStatefulWidget {
  const BaseScaffold({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BaseScaffoldState();
}

class _BaseScaffoldState extends ConsumerState<BaseScaffold> {
  @override
  void initState() {
    ref.read(productRiverpod).init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var watch = ref.watch(bottomNavbarRiverpod);
    return Scaffold(
      bottomNavigationBar: const BottomNavbar(),
      body: watch.body(),
      appBar: appbarBuilder(watch),
    );
  }

  CupertinoNavigationBar appbarBuilder(BottomNavbarRiverpod watch) {
    return CupertinoNavigationBar(
      middle: Text(
        watch.appBarTitle(),
        style: const TextStyle(
          color: Constants.appColor,
          fontSize: 20.0,
        ),
      ),
    );
  }
}
