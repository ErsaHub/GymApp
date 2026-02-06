import 'package:flutter/material.dart';

class SocialScreen extends StatelessWidget {
  const SocialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Social'),
        actions: [
          IconButton(
            icon: const Icon(Icons.chat_bubble_outline),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Stories/Historias de amigos
          SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildStoryItem(context, 'Tu historia', isAdd: true),
                _buildStoryItem(context, 'Carlos'),
                _buildStoryItem(context, 'Ana'),
                _buildStoryItem(context, 'Pedro'),
                _buildStoryItem(context, 'María'),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Divider(color: Colors.white12),
          const SizedBox(height: 16),

          // Feed
          _buildFeedItem(
            context,
            userName: 'Carlos M.',
            action: 'completó un entrenamiento',
            detail: 'Push Day - Pecho y Tríceps',
            time: 'Hace 2h',
            likes: 12,
            comments: 3,
            type: FeedType.entrenamiento,
          ),
          const SizedBox(height: 16),
          _buildFeedItem(
            context,
            userName: 'Ana G.',
            action: 'superó un reto',
            detail: 'Press Banca 80kg 🏆',
            time: 'Hace 4h',
            likes: 45,
            comments: 8,
            type: FeedType.reto,
            hasVideo: true,
          ),
          const SizedBox(height: 16),
          _buildFeedItem(
            context,
            userName: 'Pedro L.',
            action: 'alcanzó una racha de',
            detail: '🔥 30 días seguidos',
            time: 'Hace 6h',
            likes: 67,
            comments: 12,
            type: FeedType.logro,
          ),
          const SizedBox(height: 16),
          _buildFeedItem(
            context,
            userName: 'María S.',
            action: 'completó un entrenamiento',
            detail: 'Leg Day - Piernas completo',
            time: 'Hace 8h',
            likes: 23,
            comments: 5,
            type: FeedType.entrenamiento,
          ),
        ],
      ),
    );
  }

  Widget _buildStoryItem(BuildContext context, String name, {bool isAdd = false}) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: isAdd
                  ? null
                  : const LinearGradient(
                      colors: [Colors.purple, Colors.blue],
                    ),
              border: isAdd
                  ? Border.all(color: Colors.white24, width: 2)
                  : null,
            ),
            padding: const EdgeInsets.all(3),
            child: CircleAvatar(
              backgroundColor: const Color(0xFF1A1A2E),
              child: isAdd
                  ? const Icon(Icons.add, color: Colors.white)
                  : Text(
                      name[0],
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            name,
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 12,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildFeedItem(
    BuildContext context, {
    required String userName,
    required String action,
    required String detail,
    required String time,
    required int likes,
    required int comments,
    required FeedType type,
    bool hasVideo = false,
  }) {
    IconData typeIcon;
    Color typeColor;

    switch (type) {
      case FeedType.entrenamiento:
        typeIcon = Icons.fitness_center;
        typeColor = Colors.blue;
        break;
      case FeedType.reto:
        typeIcon = Icons.emoji_events;
        typeColor = Colors.amber;
        break;
      case FeedType.logro:
        typeIcon = Icons.local_fire_department;
        typeColor = Colors.orange;
        break;
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.purple.withOpacity(0.3),
                child: Text(
                  userName[0],
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          userName,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          action,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.6),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      time,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(typeIcon, color: typeColor, size: 20),
            ],
          ),
          const SizedBox(height: 12),

          // Content
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: typeColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    detail,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
                if (hasVideo)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.play_arrow, size: 14, color: Colors.white),
                        SizedBox(width: 2),
                        Text(
                          'Video',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 12),

          // Actions
          Row(
            children: [
              _buildActionButton(Icons.favorite_border, '$likes'),
              const SizedBox(width: 16),
              _buildActionButton(Icons.chat_bubble_outline, '$comments'),
              const Spacer(),
              Icon(
                Icons.share_outlined,
                color: Colors.white.withOpacity(0.5),
                size: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String count) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.white.withOpacity(0.5),
          size: 20,
        ),
        const SizedBox(width: 4),
        Text(
          count,
          style: TextStyle(
            color: Colors.white.withOpacity(0.5),
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}

enum FeedType { entrenamiento, reto, logro }
