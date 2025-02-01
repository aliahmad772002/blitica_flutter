import 'package:flutter/material.dart';
import '../model/user.dart';
import '../services/api_service.dart';

class UserProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<User> _users = [];
  int _currentPage = 1;
  bool _isLoading = false;

  List<User> get users => _users;
  bool get isLoading => _isLoading;

  Future<void> fetchUsers() async {
    if (_isLoading) return;

    _isLoading = true;
    notifyListeners();

    try {
      List<User> newUsers = await _apiService.fetchUsers(page: _currentPage, results: 10);
      _users.addAll(newUsers);
      _currentPage++;
    } catch (e) {
      print("Error fetching users: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
