import 'package:flutter/material.dart';
import 'package:music_app/data/model/MusicModel.dart';
import '../data/repo/service_repo.dart';

class ServiceViewModel extends ChangeNotifier {
  final ServiceRepository _repository;

  ServiceViewModel(this._repository);

  late List<MusicModel> _services = [];
  bool _loading = false;

  List<MusicModel> get services => _services;
  bool get loading => _loading;

  Future<void> loadServices() async {
    _loading = true;
    notifyListeners();

    _services = await _repository.fetchServices();
    _loading = false;
    notifyListeners();
  }
}
