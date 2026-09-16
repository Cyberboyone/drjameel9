import 'package:flutter/material.dart';
import '../models/lesson.dart';
import '../services/duration_service.dart';
import '../theme/ramadan_theme.dart';

class LessonCard extends StatefulWidget {
  final Lesson lesson;
  final VoidCallback onTap;

  const LessonCard({super.key, required this.lesson, required this.onTap});

  @override
  State<LessonCard> createState() => _LessonCardState();
}

class _LessonCardState extends State<LessonCard> {
  @override
  void initState() {
    super.initState();
    DurationService.instance.durationsReady.addListener(_rebuild);
  }

  @override
  void dispose() {
    DurationService.instance.durationsReady.removeListener(_rebuild);
    super.dispose();
  }

  void _rebuild() {
    if (mounted) setState(() {});
  }

  String _formatDuration(Duration d) {
    final h = d.inHours;
    final m = d.inMinutes.remainder(60);
    final s = d.inSeconds.remainder(60);
    if (h > 0) {
      return '$h:${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
    }
    return '$m:${s.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final lesson = widget.lesson;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          padding: const EdgeInsets.all(14),
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
              // Scholar photo or icon
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: RamadanColors.background,
                  borderRadius: BorderRadius.circular(26),
                  border: Border.all(
                    color: RamadanColors.border,
                    width: 1,
                  ),
                ),
                child: lesson.scholarPhotoPath != null
                    ? ClipOval(
                        child: Image.asset(
                          lesson.scholarPhotoPath!,
                          width: 52,
                          height: 52,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(
                              Icons.headphones_outlined,
                              color: RamadanColors.gold,
                              size: 26,
                            );
                          },
                        ),
                      )
                    : const Icon(
                        Icons.headphones_outlined,
                        color: RamadanColors.gold,
                        size: 26,
                      ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      lesson.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        color: RamadanColors.textPrimary,
                        fontSize: 15,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      lesson.course.isNotEmpty
                          ? lesson.course
                          : lesson.scholarName,
                      style: const TextStyle(
                        color: RamadanColors.textSecondary,
                        fontSize: 12,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _formatDuration(lesson.duration),
                      style: const TextStyle(
                        color: RamadanColors.gold,
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: widget.onTap,
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
                  child: const Icon(
                    Icons.play_arrow_rounded,
                    size: 22,
                    color: RamadanColors.gold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
