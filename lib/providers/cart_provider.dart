import 'package:book_cart/models/books_model.dart';
import 'package:flutter/cupertino.dart';

class CartProvider with ChangeNotifier {
  BooksModel books = BooksModel();
}