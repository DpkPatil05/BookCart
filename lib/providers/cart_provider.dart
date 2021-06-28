import 'package:book_cart/models/books_model.dart';
import 'package:flutter/cupertino.dart';

class CartProvider with ChangeNotifier {
  BooksModel booksModel = BooksModel(books: []);

  void init() {
    booksModel.books = [];
    booksModel.books.add(Book(name: "Science", id: 1));
    booksModel.books.add(Book(name: "Maths", id: 2));
    booksModel.books.add(Book(name: "Chemistry", id: 3));
    booksModel.books.add(Book(name: "Physics", id: 4));
    booksModel.books.add(Book(name: "Biology", id: 5));
  }
}