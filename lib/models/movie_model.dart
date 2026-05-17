class Movie {
  final String id;
  final String title;
  final String posterUrl;
  final String backdropUrl;
  final double imdbRating;
  final String year;
  final String duration;
  final String genre;
  final String description;
  final String quality;
  final String type;
  final bool isTrending;
  final List<String> tags;

  Duration? watchProgress;
  Duration? totalDuration;

  Movie({
    required this.id,
    required this.title,
    required this.posterUrl,
    required this.backdropUrl,
    required this.imdbRating,
    required this.year,
    required this.duration,
    required this.genre,
    required this.description,
    this.quality = 'WEB-DL',
    this.type = 'Movie',
    this.isTrending = false,
    this.tags = const [],
    this.watchProgress,
    this.totalDuration,
  });

  String get qualityBadge => quality;
  bool get isSeries => type == 'Series';

  String get progressText {
    if (watchProgress == null || totalDuration == null) return '';
    String formatDuration(Duration d) {
      String twoDigits(int n) => n.toString().padLeft(2, '0');
      return '${twoDigits(d.inHours)}:${twoDigits(d.inMinutes.remainder(60))}:${twoDigits(d.inSeconds.remainder(60))}';
    }
    return 'Watched: ${formatDuration(watchProgress!)} / ${formatDuration(totalDuration!)}';
  }

  double get progressPercent {
    if (watchProgress == null || totalDuration == null || totalDuration!.inSeconds == 0) return 0.0;
    return watchProgress!.inSeconds / totalDuration!.inSeconds;
  }

  bool hasTag(String tag) => tags.contains(tag);

  Movie copyWith({
    String? id,
    String? title,
    String? posterUrl,
    String? backdropUrl,
    double? imdbRating,
    String? year,
    String? duration,
    String? genre,
    String? description,
    String? quality,
    String? type,
    bool? isTrending,
    List<String>? tags,
    Duration? watchProgress,
    Duration? totalDuration,
  }) {
    return Movie(
      id: id ?? this.id,
      title: title ?? this.title,
      posterUrl: posterUrl ?? this.posterUrl,
      backdropUrl: backdropUrl ?? this.backdropUrl,
      imdbRating: imdbRating ?? this.imdbRating,
      year: year ?? this.year,
      duration: duration ?? this.duration,
      genre: genre ?? this.genre,
      description: description ?? this.description,
      quality: quality ?? this.quality,
      type: type ?? this.type,
      isTrending: isTrending ?? this.isTrending,
      tags: tags ?? this.tags,
      watchProgress: watchProgress ?? this.watchProgress,
      totalDuration: totalDuration ?? this.totalDuration,
    );
  }
}
