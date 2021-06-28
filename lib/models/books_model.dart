import 'dart:convert';

BooksModel booksModelFromJson(String str) => BooksModel.fromJson(json.decode(str));

String booksModelToJson(BooksModel data) => json.encode(data.toJson());

class BooksModel {
  BooksModel({
    required this.books,
  });

  List<Book> books;

  factory BooksModel.fromJson(Map<String, dynamic> json) => BooksModel(
    books: List<Book>.from(json["books"].map((x) => Book.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "books": List<dynamic>.from(books.map((x) => x.toJson())),
  };
}

class Book {
  Book({
    required this.name,
    required this.id,
    required this.price,
    required this.selected,
    required this.numberOfCopies,
  });

  String name;
  int id;
  double price;
  bool selected;
  int numberOfCopies;

  factory Book.fromJson(Map<String, dynamic> json) => Book(
    name: json["name"],
    id: json["id"],
    price: json["price"],
    selected: json["selected"],
    numberOfCopies: json["numberOfCopies"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
    "price": price,
    "selected": selected,
    "numberOfCopies": numberOfCopies,
  };
}
