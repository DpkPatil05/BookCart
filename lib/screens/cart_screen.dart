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
      body: Consumer<CartProvider>(
        builder: (context, prov, _) {
        return Column(
          children: [
            Expanded(
              flex: 1,
              child: Card(
                color: Palette.secondary,
                child: Text('Select books'),
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DropdownButton<String>(
                    value: prov.dropdownValue,
                    icon: const Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    underline: Container(
                      height: 2,
                      color: Palette.primary,
                    ),
                    onChanged: (String? newValue) {
                      prov.setDropdownValue(newValue!);
                    },
                    items: prov.getBooks()
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: 'Select quantity',
                      labelText: 'Quantity',
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
