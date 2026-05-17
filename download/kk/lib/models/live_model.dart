/// Represents a streaming channel.
class Channel {
  final int id;
  final String name;
  final String logoUrl;
  final String streamUrl;

  const Channel({
    required this.id,
    required this.name,
    required this.logoUrl,
    required this.streamUrl,
  });

  factory Channel.fromJson(Map<String, dynamic> json) {
    return Channel(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      logoUrl: json['logoUrl'] as String? ?? '',
      streamUrl: json['streamUrl'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'logoUrl': logoUrl,
      'streamUrl': streamUrl,
    };
  }

  Channel copyWith({
    int? id,
    String? name,
    String? logoUrl,
    String? streamUrl,
  }) {
    return Channel(
      id: id ?? this.id,
      name: name ?? this.name,
      logoUrl: logoUrl ?? this.logoUrl,
      streamUrl: streamUrl ?? this.streamUrl,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Channel && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => 'Channel(id: $id, name: $name)';
}

/// Represents a live sports event.
class LiveEvent {
  final int id;
  final String title;
  final String league;
  final String time;
  final bool isLive;
  final String thumbnailUrl;
  final Channel channel;

  const LiveEvent({
    required this.id,
    required this.title,
    required this.league,
    required this.time,
    required this.isLive,
    required this.thumbnailUrl,
    required this.channel,
  });

  factory LiveEvent.fromJson(Map<String, dynamic> json) {
    return LiveEvent(
      id: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? '',
      league: json['league'] as String? ?? '',
      time: json['time'] as String? ?? '',
      isLive: json['isLive'] as bool? ?? false,
      thumbnailUrl: json['thumbnailUrl'] as String? ?? '',
      channel: json['channel'] != null
          ? Channel.fromJson(json['channel'] as Map<String, dynamic>)
          : const Channel(id: 0, name: '', logoUrl: '', streamUrl: ''),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'league': league,
      'time': time,
      'isLive': isLive,
      'thumbnailUrl': thumbnailUrl,
      'channel': channel.toJson(),
    };
  }

  /// Live badge display text
  String get liveLabel => isLive ? 'LIVE' : 'UPCOMING';

  LiveEvent copyWith({
    int? id,
    String? title,
    String? league,
    String? time,
    bool? isLive,
    String? thumbnailUrl,
    Channel? channel,
  }) {
    return LiveEvent(
      id: id ?? this.id,
      title: title ?? this.title,
      league: league ?? this.league,
      time: time ?? this.time,
      isLive: isLive ?? this.isLive,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      channel: channel ?? this.channel,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LiveEvent && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() =>
      'LiveEvent(id: $id, title: $title, isLive: $isLive)';
}
