import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import '../services/player_service.dart';
import '../theme/ramadan_theme.dart';
import '../screens/player_screen.dart';

class MiniPlayer extends StatefulWidget {
  const MiniPlayer({super.key});

  @override
  State<MiniPlayer> createState() => _MiniPlayerState();
}

class _MiniPlayerState extends State<MiniPlayer> {
  @override
  void initState() {
    super.initState();
    PlayerService.instance.tick.addListener(_rebuild);
    PlayerService.instance.player.playingStream.listen((_) {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    PlayerService.instance.tick.removeListener(_rebuild);
    super.dispose();
  }

  void _rebuild() {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final audio = PlayerService.instance;
    final lesson = audio.currentLesson;
    final player = audio.player;

    if (lesson == null) return const SizedBox.shrink();

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => PlayerScreen(lesson: lesson)),
        );
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: RamadanColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: RamadanColors.border,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            // Artwork thumbnail
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: RamadanColors.background,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: RamadanColors.border,
                  width: 1,
                ),
              ),
              child: Center(
                child: lesson.arabicLabel != null
                    ? Text(
                        lesson.arabicLabel!,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: RamadanColors.gold,
                        ),
                      )
                    : const Icon(Icons.menu_book_outlined,
                        size: 24, color: RamadanColors.gold),
              ),
            ),
            const SizedBox(width: 12),

            // Title + subtitle
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    lesson.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: RamadanColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    lesson.scholarName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12,
                      color: RamadanColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),

            // Play/pause
            StreamBuilder<PlayerState>(
              stream: player.playerStateStream,
              builder: (context, snapshot) {
                final playing = snapshot.data?.playing ?? false;
                return GestureDetector(
                  onTap: () => audio.togglePlay(),
                  child: Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: RamadanColors.gold.withValues(alpha: 0.15),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: RamadanColors.gold.withValues(alpha: 0.3),
                        width: 1,
                      ),
                    ),
                    child: Icon(
                      playing
                          ? Icons.pause_rounded
                          : Icons.play_arrow_rounded,
                      size: 22,
                      color: RamadanColors.gold,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
