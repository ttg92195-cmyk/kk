import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:readmore/readmore.dart';
import '../config/theme.dart';
import '../models/movie_model.dart';

/// Movie detail page showing full info about a movie.
/// Expects a [Movie] object passed via ModalRoute arguments.
class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Movie movie =
        ModalRoute.of(context)!.settings.arguments as Movie;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // ── Backdrop with gradient overlay ─────────────────────────────
          SliverToBoxAdapter(
            child: SizedBox(
              height: 280,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // Backdrop image
                  CachedNetworkImage(
                    imageUrl: movie.backdropUrl,
                    fit: BoxFit.cover,
                    errorWidget: (_, __, ___) => Container(
                      color: AppColors.surface,
                      child: const Icon(Icons.movie,
                          color: AppColors.textSecondary, size: 48),
                    ),
                  ),
                  // Gradient overlay
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          AppColors.scaffoldBackground.withValues(alpha: 0.6),
                          AppColors.scaffoldBackground,
                        ],
                        stops: const [0.3, 0.7, 1.0],
                      ),
                    ),
                  ),
                  // Back button
                  Positioned(
                    top: 8,
                    left: 8,
                    child: SafeArea(
                      child: CircleAvatar(
                        backgroundColor:
                            AppColors.scaffoldBackground.withValues(alpha: 0.6),
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back,
                              color: AppColors.textPrimary, size: 20),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ── Poster + Info ───────────────────────────────────────────────
          SliverToBoxAdapter(
            child: Transform.translate(
              offset: const Offset(0, -60),
              child: Column(
                children: [
                  // Poster
                  Container(
                    width: 160,
                    height: 220,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.5),
                          blurRadius: 16,
                          offset: const Offset(0, 8),
                        ),
                      ],
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(movie.posterUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Title
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      movie.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        height: 1.3,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Meta info row
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 12,
                      runSpacing: 8,
                      children: [
                        // IMDb rating
                        _MetaChip(
                          icon: Icons.star,
                          iconColor: AppColors.primary,
                          label: movie.formattedRating,
                        ),
                        // Year
                        _MetaChip(
                          icon: Icons.calendar_today,
                          iconColor: AppColors.textSecondary,
                          label: movie.yearDisplay,
                        ),
                        // Duration
                        _MetaChip(
                          icon: Icons.schedule,
                          iconColor: AppColors.textSecondary,
                          label: movie.duration,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Genre chips
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 6,
                      runSpacing: 6,
                      children: movie.genres.map((genre) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppColors.surface,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: AppColors.divider, width: 0.5),
                          ),
                          child: Text(
                            genre,
                            style: const TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Action buttons row
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      children: [
                        // Watch Now
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              // TODO: Start streaming
                            },
                            icon: const Icon(Icons.play_arrow_rounded, size: 20),
                            label: const Text('Watch Now'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              foregroundColor: AppColors.scaffoldBackground,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        // Download
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () {
                              // TODO: Download
                            },
                            icon: const Icon(Icons.download_rounded, size: 20),
                            label: const Text('Download'),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: AppColors.primary,
                              side: const BorderSide(
                                  color: AppColors.primary, width: 1.5),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Synopsis
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Synopsis',
                          style: TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 8),
                        ReadMoreText(
                          movie.synopsis,
                          trimMode: TrimMode.Length,
                          trimLength: 150,
                          trimCollapsedText: ' read more',
                          trimExpandedText: ' read less',
                          colorClickableText: AppColors.primary,
                          style: const TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 13,
                            height: 1.6,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Cast section
                  if (movie.cast.isNotEmpty) ...[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: const Text(
                        'Cast',
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 110,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        itemCount: movie.cast.length,
                        separatorBuilder: (_, __) => const SizedBox(width: 16),
                        itemBuilder: (context, index) {
                          return _CastMemberCard(
                              member: movie.cast[index]);
                        },
                      ),
                    ),
                  ],

                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════════
//  HELPER WIDGETS
// ═══════════════════════════════════════════════════════════════════════════════

class _MetaChip extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String label;

  const _MetaChip({
    required this.icon,
    required this.iconColor,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: iconColor, size: 16),
        const SizedBox(width: 4),
        Text(
          label,
          style: TextStyle(
            color: iconColor,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _CastMemberCard extends StatelessWidget {
  final CastMember member;
  const _CastMemberCard({required this.member});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: AppColors.surface,
            backgroundImage:
                CachedNetworkImageProvider(member.profileUrl),
            onBackgroundImageError: (_, __) {},
            child: const Icon(Icons.person,
                color: AppColors.textSecondary, size: 24),
          ),
          const SizedBox(height: 6),
          Text(
            member.name,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 11,
              fontWeight: FontWeight.w500,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}
