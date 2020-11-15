import 'package:flutter/material.dart';
import 'package:http_hp/models/episodes_page.dart';
import 'package:http_hp/repository/data_repository.dart';

class DataProvider extends ChangeNotifier {
  EpisodePage _episodePage;

  EpisodePage get episodePage => _episodePage;

  List<Result> get episodes => _episodePage.results;

  String _errorMessage;

  String get errorMessage => _errorMessage;

  void getEpisodes() async {
    try {
      _episodePage = await DataRepositoryImpl().getEpisodePage();
    } catch (err) {
      _errorMessage = 'error: ${err.toString()}';
    } finally {
      notifyListeners();
    }
  }
}
