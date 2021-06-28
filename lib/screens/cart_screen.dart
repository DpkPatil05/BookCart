import 'package:book_cart/common/color_palette.dart';
import 'package:book_cart/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  void initState() {
    Provider.of<CartProvider>(context, listen: false).init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Book Cart'),
        backgroundColor: Palette.primary,
      ),
      body: Consumer<CartProvider>(builder: (context, prov, _) {
        return Container(
          child: Column(
            children: [
              Row(
                children: [
                  Card(
                    color: Palette.secondary,
                    child: Text('Select books'),
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
