import 'package:book_cart/models/books_model.dart';
import 'package:flutter/cupertino.dart';

class CartProvider with ChangeNotifier {
  BooksModel booksModel = BooksModel(books: []);
  List<String> selectedBooks = <String>[];
  int totalDiscount = 0, totalPrice = 0;

  void init() {
    booksModel.books = <Book>[];
    selectedBooks = <String>[];

    /// Add books with prices as $8 per book
    booksModel.books.add(Book(
        name: "Science", id: 1, price: 8, selected: false, numberOfCopies: 0));
    booksModel.books.add(Book(
        name: "Maths", id: 2, price: 8, selected: false, numberOfCopies: 0));
    booksModel.books.add(Book(
        name: "Chemistry",
        id: 3,
        price: 8,
        selected: false,
        numberOfCopies: 0));
    booksModel.books.add(Book(
        name: "Physics", id: 4, price: 8, selected: false, numberOfCopies: 0));
    booksModel.books.add(Book(
        name: "Biology", id: 5, price: 8, selected: false, numberOfCopies: 0));
  }

  List<String> getBooks() {
    List<String> books = [];
    booksModel.books.forEach((book) {
      books.add(book.name);
    });
    return books;
  }

  void setDropdownValue(String value) {
    booksModel.books.forEach((book) {
      if (book.name == value) book.selected = true;
    });

    notifyListeners();
  }

  List<String> getSelectedBooks() {
    booksModel.books.forEach((book) {
      if (book.selected && !selectedBooks.contains(book.name))
        selectedBooks.add(book.name);
    });
    return selectedBooks;
  }

  void setNoOfCopies(int count, int index) {
    booksModel.books[index].numberOfCopies = count;
    notifyListeners();
  }
}
