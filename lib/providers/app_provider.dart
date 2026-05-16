import 'package:flutter/foundation.dart';

import '../models/movie_model.dart';
import '../models/live_model.dart';
import '../data/sample_data.dart';

/// Represents the currently logged-in user.
class CurrentUser {
  final String username;
  final String phoneModel;
  final List<String> devices;

  const CurrentUser({
    required this.username,
    required this.phoneModel,
    required this.devices,
  });

  CurrentUser copyWith({
    String? username,
    String? phoneModel,
    List<String>? devices,
  }) {
    return CurrentUser(
      username: username ?? this.username,
      phoneModel: phoneModel ?? this.phoneModel,
      devices: devices ?? this.devices,
    );
  }

  static const empty = CurrentUser(
    username: '',
    phoneModel: '',
    devices: [],
  );
}

/// Central state-management provider for the Kumastream app.
class AppProvider with ChangeNotifier {
  // ── Auth & Account ────────────────────────────────────────────────────────
  bool _isLoggedIn = false;
  bool _isPremium = false;
  CurrentUser _currentUser = CurrentUser.empty;

  bool get isLoggedIn => _isLoggedIn;
  bool get isPremium => _isPremium;
  CurrentUser get currentUser => _currentUser;

  // ── Preferences ───────────────────────────────────────────────────────────
  bool _adultContentEnabled = false;
  bool _notificationEnabled = true;
  String _selectedPlayer = 'Default';

  bool get adultContentEnabled => _adultContentEnabled;
  bool get notificationEnabled => _notificationEnabled;
  String get selectedPlayer => _selectedPlayer;

  // ── Content ───────────────────────────────────────────────────────────────
  final List<Movie> _bookmarks = [];
  String _searchQuery = '';

  List<Movie> get bookmarks => List.unmodifiable(_bookmarks);
  String get searchQuery => _searchQuery;

  /// All movies from sample data, used for global search.
  List<Movie> get allMovies => SampleData.allMovies;

  /// Movies filtered by the current search query.
  List<Movie> get searchResults => _searchQuery.trim().isEmpty
      ? []
      : SampleData.searchMovies(_searchQuery);

  /// Category-keyed movie lists from sample data.
  Map<String, List<Movie>> get categoryMovies => SampleData.categoryMovies;

  /// Live events from sample data.
  List<LiveEvent> get liveEvents => SampleData.liveEvents;

  /// Channels from sample data.
  List<Channel> get channels => SampleData.channels;

  // ═══════════════════════════════════════════════════════════════════════════
  //  AUTH METHODS
  // ═══════════════════════════════════════════════════════════════════════════

  /// Log in with the given username and device information.
  void login({
    required String username,
    required String phoneModel,
    List<String>? devices,
  }) {
    _isLoggedIn = true;
    _currentUser = CurrentUser(
      username: username,
      phoneModel: phoneModel,
      devices: devices ?? [phoneModel],
    );
    notifyListeners();
  }

  /// Log out and reset user-specific state.
  void logout() {
    _isLoggedIn = false;
    _isPremium = false;
    _currentUser = CurrentUser.empty;
    _bookmarks.clear();
    _searchQuery = '';
    notifyListeners();
  }

  // ═══════════════════════════════════════════════════════════════════════════
  //  PREFERENCE METHODS
  // ═══════════════════════════════════════════════════════════════════════════

  /// Toggle the premium subscription status.
  void togglePremium() {
    _isPremium = !_isPremium;
    notifyListeners();
  }

  /// Toggle the adult content filter.
  void toggleAdult() {
    _adultContentEnabled = !_adultContentEnabled;
    notifyListeners();
  }

  /// Toggle notification preference.
  void toggleNotification() {
    _notificationEnabled = !_notificationEnabled;
    notifyListeners();
  }

  /// Set the preferred video player.
  void setPlayer(String player) {
    _selectedPlayer = player;
    notifyListeners();
  }

  // ═══════════════════════════════════════════════════════════════════════════
  //  BOOKMARK METHODS
  // ═══════════════════════════════════════════════════════════════════════════

  /// Add a movie to bookmarks. No-op if already bookmarked.
  void addBookmark(Movie movie) {
    final isAlreadyBookmarked = _bookmarks.any((m) => m.id == movie.id);
    if (!isAlreadyBookmarked) {
      _bookmarks.add(movie);
      notifyListeners();
    }
  }

  /// Remove a movie from bookmarks by its id.
  void removeBookmark(int movieId) {
    final initialLength = _bookmarks.length;
    _bookmarks.removeWhere((m) => m.id == movieId);
    if (_bookmarks.length != initialLength) {
      notifyListeners();
    }
  }

  /// Check whether a movie is bookmarked.
  bool isBookmarked(int movieId) {
    return _bookmarks.any((m) => m.id == movieId);
  }

  /// Toggle bookmark status for a movie.
  void toggleBookmark(Movie movie) {
    if (isBookmarked(movie.id)) {
      removeBookmark(movie.id);
    } else {
      addBookmark(movie);
    }
  }

  // ═══════════════════════════════════════════════════════════════════════════
  //  SEARCH METHODS
  // ═══════════════════════════════════════════════════════════════════════════

  /// Update the search query; triggers filtered results via [searchResults].
  void searchMovies(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  /// Clear the current search query.
  void clearSearch() {
    _searchQuery = '';
    notifyListeners();
  }

  // ═══════════════════════════════════════════════════════════════════════════
  //  DEVICE MANAGEMENT
  // ═══════════════════════════════════════════════════════════════════════════

  /// Add a device to the current user's device list.
  void addDevice(String deviceName) {
    if (!_currentUser.devices.contains(deviceName)) {
      _currentUser = _currentUser.copyWith(
        devices: [..._currentUser.devices, deviceName],
      );
      notifyListeners();
    }
  }

  /// Remove a device from the current user's device list.
  void removeDevice(String deviceName) {
    final updatedDevices =
        _currentUser.devices.where((d) => d != deviceName).toList();
    _currentUser = _currentUser.copyWith(devices: updatedDevices);
    notifyListeners();
  }
}
