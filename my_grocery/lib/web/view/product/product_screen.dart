import 'package:flutter/widgets.dart';
import 'package:my_grocery/web/view/components/main_header.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        const MainHeader(),
        Expanded(
          child: Container(),
        )
      ],
    ));
  }
}
