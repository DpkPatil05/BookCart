import 'package:book_cart/models/books_model.dart';
import 'package:flutter/cupertino.dart';

class CartProvider with ChangeNotifier {
  BooksModel booksModel = BooksModel(books: []);
  List<String> selectedBooks = <String>[];
  double totalDiscount = 0, totalPrice = 0, discountedPrice = 0;

  void init() {
    booksModel.books = <Book>[];
    selectedBooks = <String>[];
    totalPrice = 0;
    totalDiscount = 0;
    discountedPrice = 0;

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

  void calculateTotalDiscount() {
    int _totalBooks = getSelectedBooks().length;
    List<int> _copiesSet = [];

    /// Variety discount
    if (_totalBooks == 2)
      totalDiscount = 5;
    else if (_totalBooks == 3)
      totalDiscount = 10;
    else if (_totalBooks == 4)
      totalDiscount = 20;
    else if (_totalBooks == 5) totalDiscount = 25;

    /// Calculate discount
    booksModel.books.forEach((book) {
      if (book.selected) {
        _copiesSet.add(book.numberOfCopies);
      }
    });

    int _counter = 0;
    _copiesSet.forEach((element) {
      for(int i = _counter; i < _copiesSet.length; i++) {
        if ((element + _copiesSet[i]) % 5 == 0 && _totalBooks == 2)
          totalDiscount = totalDiscount + 5;
        else if ((element + _copiesSet[i]) % 5 == 0 && _totalBooks == 3)
          totalDiscount = totalDiscount + 10;
        else if ((element + _copiesSet[i]) % 5 == 0 && _totalBooks == 4)
          totalDiscount = totalDiscount + 20;
        else if ((element + _copiesSet[i]) % 5 == 0 && _totalBooks == 5)
          totalDiscount = totalDiscount + 25;
      }
      _counter++;
    });

    /// Total minus discounted price
    discountedPrice = totalPrice - (totalPrice * totalDiscount / 100);
    notifyListeners();
  }

  void calculateTotalPriceAndDiscount() {
    totalPrice = 0;
    discountedPrice = 0;

    /// Get Total Price
    booksModel.books.forEach((book) {
      if (book.selected) {
        totalPrice = totalPrice + (book.price * book.numberOfCopies);
      }
    });
    calculateTotalDiscount();
    notifyListeners();
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
      if (book.name == value) {
        book.selected = true;
        book.numberOfCopies = 1;
        notifyListeners();
      }
    });
  }

  List<String> getSelectedBooks() {
    booksModel.books.forEach((book) {
      if (book.selected && !selectedBooks.contains(book.name))
        selectedBooks.add(book.name);
    });
    return selectedBooks;
  }

  void setNoOfCopies(int count, String name) {
    int index = booksModel.books.indexWhere((element) => element.name == name);
    booksModel.books[index].numberOfCopies = count;
    notifyListeners();
  }
}
