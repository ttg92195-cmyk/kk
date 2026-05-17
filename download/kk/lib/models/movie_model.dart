/// Represents a cast member associated with a movie.
class CastMember {
  final String name;
  final String profileUrl;
  final String character;

  const CastMember({
    required this.name,
    required this.profileUrl,
    required this.character,
  });

  factory CastMember.fromJson(Map<String, dynamic> json) {
    return CastMember(
      name: json['name'] as String? ?? '',
      profileUrl: json['profileUrl'] as String? ?? '',
      character: json['character'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'profileUrl': profileUrl,
      'character': character,
    };
  }

  CastMember copyWith({
    String? name,
    String? profileUrl,
    String? character,
  }) {
    return CastMember(
      name: name ?? this.name,
      profileUrl: profileUrl ?? this.profileUrl,
      character: character ?? this.character,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CastMember &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          profileUrl == other.profileUrl &&
          character == other.character;

  @override
  int get hashCode => Object.hash(name, profileUrl, character);

  @override
  String toString() => 'CastMember(name: $name, character: $character)';
}

/// Represents a movie / series in the Kumastream catalog.
class Movie {
  final int id;
  final String title;
  final int year;
  final double imdbRating;
  final String duration;
  final List<String> genres;
  final String synopsis;
  final String posterUrl;
  final String backdropUrl;
  final List<CastMember> cast;

  const Movie({
    required this.id,
    required this.title,
    required this.year,
    required this.imdbRating,
    required this.duration,
    required this.genres,
    required this.synopsis,
    required this.posterUrl,
    required this.backdropUrl,
    required this.cast,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? '',
      year: json['year'] as int? ?? 0,
      imdbRating: (json['imdbRating'] as num?)?.toDouble() ?? 0.0,
      duration: json['duration'] as String? ?? '',
      genres: (json['genres'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      synopsis: json['synopsis'] as String? ?? '',
      posterUrl: json['posterUrl'] as String? ?? '',
      backdropUrl: json['backdropUrl'] as String? ?? '',
      cast: (json['cast'] as List<dynamic>?)
              ?.map((e) => CastMember.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'year': year,
      'imdbRating': imdbRating,
      'duration': duration,
      'genres': genres,
      'synopsis': synopsis,
      'posterUrl': posterUrl,
      'backdropUrl': backdropUrl,
      'cast': cast.map((e) => e.toJson()).toList(),
    };
  }

  /// Formatted rating string, e.g. "8.5"
  String get formattedRating => imdbRating.toStringAsFixed(1);

  /// Short genre string, e.g. "Drama, Crime"
  String get genresDisplay => genres.join(', ');

  /// Year as string
  String get yearDisplay => year.toString();

  Movie copyWith({
    int? id,
    String? title,
    int? year,
    double? imdbRating,
    String? duration,
    List<String>? genres,
    String? synopsis,
    String? posterUrl,
    String? backdropUrl,
    List<CastMember>? cast,
  }) {
    return Movie(
      id: id ?? this.id,
      title: title ?? this.title,
      year: year ?? this.year,
      imdbRating: imdbRating ?? this.imdbRating,
      duration: duration ?? this.duration,
      genres: genres ?? this.genres,
      synopsis: synopsis ?? this.synopsis,
      posterUrl: posterUrl ?? this.posterUrl,
      backdropUrl: backdropUrl ?? this.backdropUrl,
      cast: cast ?? this.cast,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Movie && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => 'Movie(id: $id, title: $title, year: $year)';
}
