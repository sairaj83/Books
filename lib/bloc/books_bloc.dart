import 'package:books/model/books_model.dart';
import 'package:books/repo/api.dart';
import 'package:books/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BooksBloc extends ChangeNotifier {
  bool _isLoading = true;
  bool get isLoading => _isLoading;

  set loading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool _isError = false;
  bool get isError => _isError;

  set error(bool value) {
    _isError = value;
    notifyListeners();
  }

  BookModel _listBooks = BookModel();
  BookModel get listBooks => _listBooks;
  set books(BookModel value) {
    _listBooks = value;
    notifyListeners();
  }

  getBooks() async {
    loading = true;
    http.Response res = await Api().getData(strUrl: getUrlBooks);
    error = false;
    if (res.statusCode == 200) {
      books = bookModelFromJson(res.body);
    } else {
      error = true;
    }
    loading = false;
  }

  sortby() {
    _listBooks.items!.sort((a, b) {
      return a.volumeInfo!.title!.toLowerCase().compareTo(b.volumeInfo!.title!.toLowerCase());
    });
    books = _listBooks;
  }
}
