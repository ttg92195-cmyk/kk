import 'dart:async';
import 'package:flutter/material.dart';
import '../models/movie_model.dart';
import '../data/sample_data.dart';

class AppProvider extends ChangeNotifier {
  // Auth
  bool _isLoggedIn = false;
  bool _isAdmin = false;
  String _currentUser = '';
  String _phoneModel = '';

  bool get isLoggedIn => _isLoggedIn;
  bool get isAdmin => _isAdmin;
  String get currentUser => _currentUser;
  String get phoneModel => _phoneModel;

  // Admin credentials
  static const String _adminUsername = 'Chitminzaw';
  static const String _adminPassword = 'Chitmin7';

  // Bookmarks
  final List<Movie> _bookmarks = [];
  List<Movie> get bookmarks => _bookmarks;

  // Recent history
  final List<Movie> _recentHistory = [];
  List<Movie> get recentHistory => _recentHistory;

  // Downloads
  final List<DownloadItem> _downloads = [];
  List<DownloadItem> get downloads => _downloads;

  // Search
  String _searchQuery = '';
  String get searchQuery => _searchQuery;

  // Registered users
  final Map<String, String> _registeredUsers = {};

  void login(String username, String password) {
    if (username == _adminUsername && password == _adminPassword) {
      _isLoggedIn = true;
      _isAdmin = true;
      _currentUser = username;
      _phoneModel = 'Admin Device';
      notifyListeners();
      return;
    }
    if (_registeredUsers.containsKey(username) && _registeredUsers[username] == password) {
      _isLoggedIn = true;
      _isAdmin = false;
      _currentUser = username;
      _phoneModel = 'Android Device';
      notifyListeners();
      return;
    }
  }

  void register(String username, String password) {
    _registeredUsers[username] = password;
    _isLoggedIn = true;
    _isAdmin = false;
    _currentUser = username;
    _phoneModel = 'Android Device';
    notifyListeners();
  }

  void logout() {
    _isLoggedIn = false;
    _isAdmin = false;
    _currentUser = '';
    _phoneModel = '';
    notifyListeners();
  }

  // Bookmark methods
  void toggleBookmark(Movie movie) {
    final index = _bookmarks.indexWhere((m) => m.id == movie.id);
    if (index >= 0) {
      _bookmarks.removeAt(index);
    } else {
      _bookmarks.add(movie);
    }
    notifyListeners();
  }

  bool isBookmarked(String movieId) {
    return _bookmarks.any((m) => m.id == movieId);
  }

  void removeBookmark(String movieId) {
    _bookmarks.removeWhere((m) => m.id == movieId);
    notifyListeners();
  }

  void clearBookmarks() {
    _bookmarks.clear();
    notifyListeners();
  }

  // Recent methods
  void addToRecent(Movie movie) {
    _recentHistory.removeWhere((m) => m.id == movie.id);
    final recentMovie = movie.copyWith(
      watchProgress: movie.watchProgress ?? Duration.zero,
      totalDuration: movie.totalDuration ?? const Duration(hours: 2),
    );
    _recentHistory.insert(0, recentMovie);
    notifyListeners();
  }

  void removeFromRecent(String movieId) {
    _recentHistory.removeWhere((m) => m.id == movieId);
    notifyListeners();
  }

  void clearRecent() {
    _recentHistory.clear();
    notifyListeners();
  }

  // Download methods
  void addDownload(Movie movie) {
    if (!_downloads.any((d) => d.movie.id == movie.id)) {
      _downloads.add(DownloadItem(
        movie: movie,
        progress: 0.0,
        status: DownloadStatus.downloading,
      ));
      notifyListeners();
      _simulateDownload(movie.id);
    }
  }

  void _simulateDownload(String movieId) {
    double progress = 0.0;
    Timer.periodic(const Duration(milliseconds: 500), (timer) {
      final index = _downloads.indexWhere((d) => d.movie.id == movieId);
      if (index < 0) {
        timer.cancel();
        return;
      }
      progress += 0.05;
      if (progress >= 1.0) {
        _downloads[index] = _downloads[index].copyWith(
          progress: 1.0,
          status: DownloadStatus.completed,
        );
        notifyListeners();
        timer.cancel();
      } else {
        _downloads[index] = _downloads[index].copyWith(progress: progress);
        notifyListeners();
      }
    });
  }

  void pauseDownload(String movieId) {
    final index = _downloads.indexWhere((d) => d.movie.id == movieId);
    if (index >= 0) {
      _downloads[index] = _downloads[index].copyWith(status: DownloadStatus.paused);
      notifyListeners();
    }
  }

  void resumeDownload(String movieId) {
    final index = _downloads.indexWhere((d) => d.movie.id == movieId);
    if (index >= 0) {
      _downloads[index] = _downloads[index].copyWith(status: DownloadStatus.downloading);
      notifyListeners();
    }
  }

  void removeDownload(String movieId) {
    _downloads.removeWhere((d) => d.movie.id == movieId);
    notifyListeners();
  }

  void pauseAllDownloads() {
    for (int i = 0; i < _downloads.length; i++) {
      if (_downloads[i].status == DownloadStatus.downloading) {
        _downloads[i] = _downloads[i].copyWith(status: DownloadStatus.paused);
      }
    }
    notifyListeners();
  }

  void resumeAllDownloads() {
    for (int i = 0; i < _downloads.length; i++) {
      if (_downloads[i].status == DownloadStatus.paused) {
        _downloads[i] = _downloads[i].copyWith(status: DownloadStatus.downloading);
      }
    }
    notifyListeners();
  }

  // Search
  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  List<Movie> searchMovies(String query) {
    if (query.isEmpty) return SampleData.movies;
    return SampleData.all.where((movie) {
      return movie.title.toLowerCase().contains(query.toLowerCase()) ||
          movie.genre.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }

  List<Movie> get moviesByCategory {
    if (_searchQuery.isEmpty) return SampleData.movies;
    return SampleData.movies.where((m) =>
      m.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
      m.genre.toLowerCase().contains(_searchQuery.toLowerCase())
    ).toList();
  }

  List<Movie> get seriesByCategory {
    if (_searchQuery.isEmpty) return SampleData.series;
    return SampleData.series.where((m) =>
      m.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
      m.genre.toLowerCase().contains(_searchQuery.toLowerCase())
    ).toList();
  }
}

enum DownloadStatus { downloading, paused, completed }

class DownloadItem {
  final Movie movie;
  final double progress;
  final DownloadStatus status;

  DownloadItem({
    required this.movie,
    required this.progress,
    required this.status,
  });

  DownloadItem copyWith({
    Movie? movie,
    double? progress,
    DownloadStatus? status,
  }) {
    return DownloadItem(
      movie: movie ?? this.movie,
      progress: progress ?? this.progress,
      status: status ?? this.status,
    );
  }
}
