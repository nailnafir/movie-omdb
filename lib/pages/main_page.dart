part of 'pages.dart';

class MainPage extends StatefulWidget {
  final int initialPage;
  const MainPage({Key? key, required this.initialPage}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedPage = 0;
  PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    _selectedPage = widget.initialPage;
    _pageController = PageController(initialPage: widget.initialPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _selectedPage = index;
            });
          },
          children: const [
            HomePage(),
            FavoritePage(),
            ProfilePage(),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        items: [
          Icon(
            Icons.home,
            size: 30,
            color: Colors.white.withOpacity(0.8),
          ),
          Icon(
            Icons.favorite,
            size: 30,
            color: Colors.white.withOpacity(0.8),
          ),
          Icon(
            Icons.person,
            size: 30,
            color: Colors.white.withOpacity(0.8),
          ),
        ],
        height: 50,
        backgroundColor: ColorTheme.bgLight,
        color: ColorTheme.secondaryColor,
        index: _selectedPage,
        onTap: (index) {
          setState(() {
            _selectedPage = index;
            _pageController.jumpToPage(index);
          });
        },
      ),
    );
  }
}
