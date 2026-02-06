import 'package:flutter/material.dart';

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Perfil'),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings_outlined),
              onPressed: () {},
            ),
          ],
        ),
        body: Column(
          children: [
            // Profile Header
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.purple.withOpacity(0.3),
                    child: const Text(
                      'JD',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Juan Díaz',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '@juandiaz • Nivel 12',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.6),
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit_outlined, color: Colors.white54),
                    onPressed: () {},
                  ),
                ],
              ),
            ),

            // Stats Row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  _buildStatItem('156', 'Entrenos'),
                  _buildStatItem('23', 'Retos'),
                  _buildStatItem('12', 'Amigos'),
                  _buildStatItem('🔥 15', 'Racha'),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Tabs
            const TabBar(
              tabs: [
                Tab(text: 'Actividad'),
                Tab(text: 'Gráficas'),
                Tab(text: 'Logros'),
              ],
              indicatorColor: Colors.purple,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white54,
            ),

            // Tab Content
            Expanded(
              child: TabBarView(
                children: [
                  _buildActividadTab(context),
                  _buildGraficasTab(context),
                  _buildLogrosTab(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActividadTab(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildActividadItem(
          'Entrenamiento completado',
          'Push Day - Pecho',
          'Hoy, 10:30',
          Icons.fitness_center,
          Colors.blue,
        ),
        _buildActividadItem(
          'Reto superado',
          'Press Banca 100kg',
          'Ayer, 18:45',
          Icons.emoji_events,
          Colors.amber,
        ),
        _buildActividadItem(
          'Nueva racha',
          '15 días seguidos 🔥',
          'Ayer',
          Icons.local_fire_department,
          Colors.orange,
        ),
        _buildActividadItem(
          'Entrenamiento completado',
          'Pull Day - Espalda',
          'Hace 2 días',
          Icons.fitness_center,
          Colors.blue,
        ),
        _buildActividadItem(
          'Nuevo amigo',
          'Conectaste con Carlos M.',
          'Hace 3 días',
          Icons.person_add,
          Colors.green,
        ),
      ],
    );
  }

  Widget _buildActividadItem(
    String title,
    String subtitle,
    String time,
    IconData icon,
    Color color,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withOpacity(0.15),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          Text(
            time,
            style: TextStyle(
              color: Colors.white.withOpacity(0.4),
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGraficasTab(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Semana actual
          const Text(
            'Esta semana',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          _buildWeeklyChart(),
          const SizedBox(height: 24),

          // PRs
          const Text(
            'Récords Personales',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          _buildPRItem('Press Banca', '100 kg', '+5 kg'),
          _buildPRItem('Sentadilla', '120 kg', '+10 kg'),
          _buildPRItem('Peso Muerto', '140 kg', '+5 kg'),
          _buildPRItem('Dominadas', '15 reps', '+3 reps'),
        ],
      ),
    );
  }

  Widget _buildWeeklyChart() {
    final days = ['L', 'M', 'X', 'J', 'V', 'S', 'D'];
    final completed = [true, true, false, true, true, false, false];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(7, (index) {
          return Column(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: completed[index]
                      ? Colors.green.withOpacity(0.2)
                      : Colors.white.withOpacity(0.05),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: completed[index] ? Colors.green : Colors.white24,
                    width: 2,
                  ),
                ),
                child: completed[index]
                    ? const Icon(Icons.check, color: Colors.green, size: 18)
                    : null,
              ),
              const SizedBox(height: 8),
              Text(
                days[index],
                style: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 12,
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildPRItem(String exercise, String record, String improvement) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              exercise,
              style: const TextStyle(color: Colors.white),
            ),
          ),
          Text(
            record,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.2),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              improvement,
              style: const TextStyle(
                color: Colors.green,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLogrosTab(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(16),
      crossAxisCount: 3,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      children: [
        _buildLogroItem('🏋️', 'Primer\nEntreno', true),
        _buildLogroItem('🔥', 'Racha 7\ndías', true),
        _buildLogroItem('🔥', 'Racha 30\ndías', false),
        _buildLogroItem('🏆', 'Primer\nReto', true),
        _buildLogroItem('💪', '100kg\nPress', true),
        _buildLogroItem('👥', '10\nAmigos', false),
        _buildLogroItem('⭐', 'Top 10\nRanking', false),
        _buildLogroItem('📅', '100\nEntrenos', false),
        _buildLogroItem('🎯', '10 Retos\nSuperados', false),
      ],
    );
  }

  Widget _buildLogroItem(String emoji, String label, bool unlocked) {
    return Container(
      decoration: BoxDecoration(
        color: unlocked
            ? Colors.purple.withOpacity(0.15)
            : Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: unlocked ? Colors.purple.withOpacity(0.5) : Colors.white12,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            emoji,
            style: TextStyle(
              fontSize: 28,
              color: unlocked ? null : Colors.white24,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: unlocked ? Colors.white70 : Colors.white30,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
