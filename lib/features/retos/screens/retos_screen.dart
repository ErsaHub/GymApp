import 'package:flutter/material.dart';

class RetosScreen extends StatelessWidget {
  const RetosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Retos'),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {},
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Activos'),
              Tab(text: 'Amigos'),
              Tab(text: 'Ranking'),
            ],
            indicatorColor: Colors.purple,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white54,
          ),
        ),
        body: TabBarView(
          children: [
            _buildRetosActivos(context),
            _buildRetosAmigos(context),
            _buildRanking(context),
          ],
        ),
      ),
    );
  }

  Widget _buildRetosActivos(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildRetoCard(
          context,
          title: 'Press Banca 100kg',
          participantes: 234,
          diasRestantes: 5,
          icon: Icons.fitness_center,
        ),
        const SizedBox(height: 12),
        _buildRetoCard(
          context,
          title: 'Sentadilla 120kg',
          participantes: 189,
          diasRestantes: 12,
          icon: Icons.fitness_center,
        ),
        const SizedBox(height: 12),
        _buildRetoCard(
          context,
          title: '20 Dominadas seguidas',
          participantes: 456,
          diasRestantes: 3,
          icon: Icons.fitness_center,
        ),
        const SizedBox(height: 12),
        _buildRetoCard(
          context,
          title: '50 Flexiones en 1 min',
          participantes: 892,
          diasRestantes: 7,
          icon: Icons.timer,
        ),
      ],
    );
  }

  Widget _buildRetosAmigos(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.people_outline,
            size: 64,
            color: Colors.white.withOpacity(0.3),
          ),
          const SizedBox(height: 16),
          Text(
            'No tienes retos con amigos',
            style: TextStyle(
              color: Colors.white.withOpacity(0.5),
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add),
            label: const Text('Crear reto'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRanking(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildRankingItem(context, 1, 'Carlos M.', '150kg', true),
        _buildRankingItem(context, 2, 'Ana G.', '140kg', true),
        _buildRankingItem(context, 3, 'Pedro L.', '135kg', true),
        _buildRankingItem(context, 4, 'María S.', '130kg', false),
        _buildRankingItem(context, 5, 'Juan R.', '125kg', true),
        _buildRankingItem(context, 6, 'Laura P.', '120kg', false),
        _buildRankingItem(context, 7, 'Diego F.', '115kg', true),
      ],
    );
  }

  Widget _buildRetoCard(
    BuildContext context, {
    required String title,
    required int participantes,
    required int diasRestantes,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white12),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.purple.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: Colors.purple),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '$participantes participantes • $diasRestantes días',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.chevron_right,
            color: Colors.white54,
          ),
        ],
      ),
    );
  }

  Widget _buildRankingItem(
    BuildContext context,
    int position,
    String name,
    String record,
    bool verified,
  ) {
    Color positionColor;
    if (position == 1) {
      positionColor = Colors.amber;
    } else if (position == 2) {
      positionColor = Colors.grey.shade400;
    } else if (position == 3) {
      positionColor = Colors.orange.shade700;
    } else {
      positionColor = Colors.white54;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: position <= 3
            ? Border.all(color: positionColor.withOpacity(0.3))
            : null,
      ),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: positionColor.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Text(
              '$position',
              style: TextStyle(
                color: positionColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 12),
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.purple.withOpacity(0.3),
            child: Text(
              name[0],
              style: const TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          if (verified)
            const Icon(
              Icons.verified,
              color: Colors.blue,
              size: 18,
            ),
          const SizedBox(width: 8),
          Text(
            record,
            style: const TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
