import 'package:book_cart/providers/cart_provider.dart';
import 'package:book_cart/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(BookCartApp());
}

class BookCartApp extends StatefulWidget {
  @override
  _BookCartAppState createState() => _BookCartAppState();
}

class _BookCartAppState extends State<BookCartApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()),
      ],
      child: MaterialApp(home: Cart()),
    );
  }
}

