part of 'pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.bgLight,
      body: ListView(
        padding: EdgeInsets.all(SpaceConfig.longSpace),
        children: [
          const Welcome(),
          SizedBox(height: SpaceConfig.longSpace),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(SpaceConfig.normalSpace),
            ),
            color: Colors.white,
            child: SizedBox(
              height: 50,
              child: TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  prefixIcon:
                      Icon(Icons.search, color: ColorTheme.secondaryColor),
                  border: const OutlineInputBorder(borderSide: BorderSide.none),
                  hintText: "Cari film, genre, atau tahun...",
                  hintStyle: TextStyle(color: ColorTheme.secondaryColor),
                ),
              ),
            ),
          ),
          SizedBox(height: SpaceConfig.longSpace),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Sedang Tayang",
                style: TypeTheme.titleTextFont
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              Text(
                "Lihat Semua",
                style: TypeTheme.normalTextFont
                    .copyWith(color: ColorTheme.secondaryColor),
              ),
            ],
          ),
          SizedBox(height: SpaceConfig.normalSpace),
          CarouselSlider.builder(
            carouselController: CarouselController(),
            itemCount: 5,
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 0.6,
              aspectRatio: 0.87,
              initialPage: 2,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) {
              return Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 300,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(SpaceConfig.normalSpace),
                          image: const DecorationImage(
                            image: NetworkImage(
                              "https://s.studiobinder.com/wp-content/uploads/2017/12/Movie-Poster-Template-Dark-with-Image.jpg?x81279",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: (_currentIndex == itemIndex) ||
                                (_currentIndex == pageViewIndex)
                            ? Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.vertical(
                                      bottom: Radius.circular(
                                          SpaceConfig.normalSpace),
                                    ),
                                    color: ColorTheme.primaryColor
                                        .withOpacity(0.5)),
                                child: Center(
                                  child: Text("Beli Tiket",
                                      style: TypeTheme.subTitleTextFont
                                          .copyWith(color: Colors.white)),
                                ),
                              )
                            : Container(),
                      ),
                    ],
                  ),
                  SizedBox(height: SpaceConfig.normalSpace),
                  Text(
                    "Senja Mania",
                    style: TypeTheme.titleTextFont,
                  ),
                  SizedBox(height: SpaceConfig.shortSpace),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < 5; i++)
                        Icon(
                          Icons.star,
                          color:
                              i < 3 ? ColorTheme.secondaryColor : Colors.grey,
                        ),
                    ],
                  ),
                ],
              );
            },
          ),
          SizedBox(height: SpaceConfig.shortSpace),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Akan Tayang",
                style: TypeTheme.titleTextFont
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              Text(
                "Lihat Semua",
                style: TypeTheme.normalTextFont
                    .copyWith(color: ColorTheme.secondaryColor),
              ),
            ],
          ),
          SizedBox(height: SpaceConfig.normalSpace),
          Column(
            children: List.generate(5, (index) {
              return Card(
                margin: EdgeInsets.only(
                  top: (index == 0) ? 0 : SpaceConfig.normalSpace,
                  bottom: (index == 5 - 1) ? SpaceConfig.normalSpace : 0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(SpaceConfig.normalSpace),
                ),
                elevation: 2,
                color: Colors.white,
                child: Container(
                  padding: EdgeInsets.all(SpaceConfig.normalSpace),
                  child: Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(SpaceConfig.normalSpace),
                          image: const DecorationImage(
                            image: NetworkImage(
                              "https://s.studiobinder.com/wp-content/uploads/2017/12/Movie-Poster-Template-Dark-with-Image.jpg?x81279",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: SpaceConfig.normalSpace),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Senja Mania",
                            style: TypeTheme.titleTextFont,
                          ),
                          SizedBox(height: SpaceConfig.shortSpace / 2),
                          Text(
                            "Action, Comedy",
                            style: TypeTheme.normalTextFont,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
