import 'package:ecommerce_riverpod/view/utilities/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grock/grock.dart';

import 'view/base_scaffold/base_scaffold.dart';

void main() => runApp(
      ProviderScope(child: EcommerceRiverpod()),
    );

class EcommerceRiverpod extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.ecommerce,
      theme: ThemeData(primaryColor: Constants.appColor),
      scaffoldMessengerKey: Grock.snackbarMessengerKey,
      home: const BaseScaffold(),
    );
  }
}
