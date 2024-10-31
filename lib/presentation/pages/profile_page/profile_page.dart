import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String email = 'soroushnorzyui@gmail.com';
  String username = 'Soroushnrz';
  int followers = 778;
  int following = 243;
  List<Map<String, String>> playlists = [
    {'title': 'Dont Smile At Me', 'artist': 'Billie Eilish'},
    {'title': 'As It Was', 'artist': 'Harry Styles'},
    {'title': 'Super Freaky Girl', 'artist': 'Nicki Minaj'},
    {'title': 'Bad Habit', 'artist': 'Steve Lacy'},
    {'title': 'Planet Her', 'artist': 'Doja Cat'},
    {'title': 'Sweetest Pie', 'artist': 'Megan Thee Stallion'},
  ];

  @override
  void initState() {
    super.initState();
    // You can perform initialization here, like fetching data from an API
    // For example:
    // _fetchUserData();
  }

  // Example method to fetch user data
  // void _fetchUserData() async {
  //   // Simulating an API call
  //   await Future.delayed(Duration(seconds: 2));
  //   setState(() {
  //     email = 'fetched_email@example.com';
  //     username = 'FetchedUsername';
  //     followers = 1000;
  //     following = 500;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              // Handle more options
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://example.com/profile-image.jpg'),
            ),
            SizedBox(height: 10),
            Text(
              email,
              style: TextStyle(color: Colors.grey),
            ),
            Text(
              username,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildFollowCount(followers.toString(), 'Followers'),
                SizedBox(width: 40),
                _buildFollowCount(following.toString(), 'Following'),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'PUBLIC PLAYLISTS',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ...playlists.map((playlist) => _buildPlaylistItem(playlist['title']!, playlist['artist']!)).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildFollowCount(String count, String label) {
    return Column(
      children: [
        Text(
          count,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          label,
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildPlaylistItem(String title, String artist) {
    return ListTile(
      leading: Container(
        width: 50,
        height: 50,
        color: Colors.grey[300],
        // You can replace this with actual album art
      ),
      title: Text(title),
      subtitle: Text(artist),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('5:33'),
          SizedBox(width: 10),
          Icon(Icons.more_vert),
        ],
      ),
    );
  }
}