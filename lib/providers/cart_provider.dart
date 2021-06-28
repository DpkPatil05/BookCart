import 'package:book_cart/models/books_model.dart';
import 'package:flutter/cupertino.dart';

class CartProvider with ChangeNotifier {
  BooksModel booksModel = BooksModel(books: []);

  String dropdownValue = 'Select Book';

  void init() {
    booksModel.books = [];
    booksModel.books.add(Book(name: "Science", id: 1));
    booksModel.books.add(Book(name: "Maths", id: 2));
    booksModel.books.add(Book(name: "Chemistry", id: 3));
    booksModel.books.add(Book(name: "Physics", id: 4));
    booksModel.books.add(Book(name: "Biology", id: 5));
  }

  List<String> getBooks() {
    List<String> books = [];
    booksModel.books.forEach((book) {
      books.add(book.name);
    });
    return books;
  }

  void setDropdownValue(String value) {
    dropdownValue = value;
    notifyListeners();
  }
}