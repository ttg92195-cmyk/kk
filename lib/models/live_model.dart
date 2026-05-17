class LiveChannel {
  final String id;
  final String name;
  final String logoUrl;
  final String streamUrl;
  final String category;
  final bool isLive;

  LiveChannel({
    required this.id,
    required this.name,
    required this.logoUrl,
    required this.streamUrl,
    required this.category,
    this.isLive = true,
  });
}
