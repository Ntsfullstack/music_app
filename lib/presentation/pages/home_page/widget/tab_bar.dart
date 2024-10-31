import 'package:flutter/material.dart';

class CustomTabBarView extends StatelessWidget {
  final TabController tabController;

  const CustomTabBarView({Key? key, required this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        controller: tabController,
        children: [
          NewsTab(),
          const Center(child: Text('Search Page Content')),
          const Center(child: Text('Library Page Content')),
          const Center(child: Text('Profile Page Content')),
        ],
      ),
    );
  }
}


Widget NewsTab() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            _buildMusicItem('Bad Guy', 'Billie Eilish', 'https://example.com/billie_eilish.jpg', true),
            _buildMusicItem('Scorpion', 'Drake', 'https://example.com/drake.jpg', false),
            _buildMusicItem('WHEN WE ALL FALL ASLEEP, WHERE DO WE GO?', 'Billie Eilish', 'https://example.com/billie_album.jpg', false),
          ],
        ),
      ),
    ],
  );
}

Widget _buildMusicItem(String title, String artist, String imageUrl, bool isPlaying) {
  return SingleChildScrollView(
    child: Container(
      width: 200,
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // Quan trọng để giảm chiều cao
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  imageUrl,
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: isPlaying ? Colors.green : Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    isPlaying ? Icons.pause : Icons.play_arrow,
                    color: isPlaying ? Colors.white : Colors.black,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Flexible(
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Flexible(
            child: Text(
              artist,
              style: const TextStyle(color: Colors.grey),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    ),
  );
}icItem(String title, String artist, String imageUrl, bool isPlaying) {
  return Container(
    width: 200,
    height: 200,
    margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                imageUrl,
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: isPlaying ? Colors.green : Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(
                isPlaying ? Icons.pause : Icons.play_arrow,
                color: isPlaying ? Colors.white : Colors.black,
                size: 20,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          artist,
          style: TextStyle(color: Colors.grey),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    ),
  );
}