import 'package:flutter/material.dart';
import 'package:learn_flutter/app/apps.dart';
import 'package:learn_flutter/models/models.dart';

class StoryOverview extends StatelessWidget {
  final Story story;
  const StoryOverview({
    super.key,
    required this.story,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.network(
              story.image,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Flexible(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  story.name,
                  style: AppStyles.h5,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  story.authors[0].name,
                  style: AppStyles.h7,
                ),
                Text(
                  story.createdAt.toIso8601String(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
