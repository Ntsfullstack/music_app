import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/presentation/pages/home_page/widget/tab_bar.dart';
import '../../../core/config/assets/app_vectors.dart';
import '../profile_page/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            _buildBanner(),
            _buildTabBar(),
            Expanded(
              child: CustomTabBarView(tabController: tabController),
            ),
            _buildPlaylistHeader(),
            Expanded(
              child: _buildListView(),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(

      leading: IconButton(
        icon:  SvgPicture.asset(AppVectors.profile),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProfilePage()), // Replace ProfilePage with your target widget
          );
        },
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.list, color: Colors.black, size: 30),
          onPressed: () {
            // Add your list functionality here
          },
        ),
      ],
      title: SvgPicture.asset(
        AppVectors.logo,
        height: 40,
      ),
      centerTitle: true,
      automaticallyImplyLeading: false,
      elevation: 0,
    );
  }
  Widget _buildBanner() {
    return Container(
      height: 200,
      decoration: const BoxDecoration(
        
      ),
    );
  }
  Widget _buildTabBar() {
    return TabBar(
      tabAlignment: TabAlignment.center,
      controller: tabController,
      isScrollable: true,
      labelColor: Colors.black,
      unselectedLabelColor: Colors.grey,
      labelStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 14, // Font size for unselected tabs
        fontWeight: FontWeight.normal, // Regular weight for unselected tabs
      ),
      tabs: const [
        Tab(text: 'News'),
        Tab(text: 'Videos'),
        Tab(text: 'Artists'),
        Tab(text: 'Postcards'),
      ],
    );
  }


  Widget _buildPlaylistHeader() {
    return Row(
      children: [
        const Text('Playlist'),
        const Spacer(),
        TextButton(
          onPressed: () {
            // View all functionality
          },
          child: const Text('View All'),
        ),
      ],
    );
  }

  Widget _buildListView() {

    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return  Padding(
          padding: const EdgeInsets.all(8),
          child: Text('Item ${ index + 1}'),
        );
      },
    );
  }
}
