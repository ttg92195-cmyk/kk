/// Application-wide constants for Kumastream.
class AppConstants {
  AppConstants._();

  // ── App Info ─────────────────────────────────────────────────────────────
  static const String appName = 'Kumastream';
  static const String version = '1.0.0';
  static const String greeting = 'မင်္ဂလာပါ ကိုယ်စိတ်နှစ်ဖြာ ကျန်းမာ ချမ်းသာ ကြပါစေ';

  // ── API & Endpoints ──────────────────────────────────────────────────────
  static const String baseApiUrl = 'https://api.kumastream.com';
  static const String imageBaseUrl = 'https://image.tmdb.org/t/p/';

  // ── Image Sizes ──────────────────────────────────────────────────────────
  static const String posterSize = 'w500';
  static const String backdropSize = 'original';
  static const String profileSize = 'w185';
  static const String stillSize = 'w300';

  // ── Placeholder / Sample Images ──────────────────────────────────────────
  static const String placeholderPoster =
      'https://picsum.photos/seed/placeholder/400/600';
  static const String placeholderBackdrop =
      'https://picsum.photos/seed/backdrop/800/450';
  static const String placeholderAvatar =
      'https://picsum.photos/seed/avatar/200/200';
  static const String placeholderThumbnail =
      'https://picsum.photos/seed/thumb/320/180';

  // ── Sample Image URLs ────────────────────────────────────────────────────
  static const List<String> sampleBannerImages = [
    'https://picsum.photos/seed/banner1/800/450',
    'https://picsum.photos/seed/banner2/800/450',
    'https://picsum.photos/seed/banner3/800/450',
    'https://picsum.photos/seed/banner4/800/450',
    'https://picsum.photos/seed/banner5/800/450',
  ];

  static const List<String> samplePosterImages = [
    'https://picsum.photos/seed/poster1/400/600',
    'https://picsum.photos/seed/poster2/400/600',
    'https://picsum.photos/seed/poster3/400/600',
    'https://picsum.photos/seed/poster4/400/600',
    'https://picsum.photos/seed/poster5/400/600',
  ];

  // ── Movie Categories ─────────────────────────────────────────────────────
  static const String categoryIconic = 'Iconic Movies';
  static const String categoryWar = 'War Movies';
  static const String categoryTrending = 'Trending Now';
  static const String categorySeries = 'Ongoing Series';
  static const String categoryAnime = 'Anime';
  static const String categoryAction = 'Action';
  static const String categoryHorror = 'Horror';

  static const List<String> allCategories = [
    categoryIconic,
    categoryWar,
    categoryTrending,
    categorySeries,
    categoryAnime,
    categoryAction,
    categoryHorror,
  ];

  // ── Player Options ───────────────────────────────────────────────────────
  static const String playerDefault = 'Default';
  static const String playerNetworkStream = 'Network Stream';

  static const List<String> playerOptions = [
    playerDefault,
    playerNetworkStream,
  ];

  // ── Animation & UI ──────────────────────────────────────────────────────
  static const Duration animationDuration = Duration(milliseconds: 300);
  static const Duration bannerAutoScrollDuration = Duration(seconds: 5);
  static const int maxSearchResults = 20;
  static const double cardBorderRadius = 12.0;
  static const double posterAspectRatio = 2 / 3;
  static const double backdropAspectRatio = 16 / 9;

  // ── Storage Keys ─────────────────────────────────────────────────────────
  static const String keyIsLoggedIn = 'is_logged_in';
  static const String keyIsPremium = 'is_premium';
  static const String keyAdultContent = 'adult_content_enabled';
  static const String keyNotifications = 'notification_enabled';
  static const String keySelectedPlayer = 'selected_player';
  static const String keyBookmarks = 'bookmarks';
  static const String keyUsername = 'username';
}
