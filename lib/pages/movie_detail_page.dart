part of 'pages.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.bgLight,
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://images4.alphacoders.com/103/thumb-1920-1030254.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 300,
                color: Colors.black.withOpacity(0.35),
              ),
              IconButton(
                color: Colors.white,
                onPressed: () {},
                icon: Container(
                  width: 100,
                  height: 100,
                  padding: EdgeInsets.all(SpaceConfig.shortSpace / 2),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.arrow_back),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 280),
                width: double.infinity,
                height: 180,
                decoration: BoxDecoration(
                  color: ColorTheme.bgLight,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(SpaceConfig.longSpace),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 200, left: SpaceConfig.longSpace),
                height: 200,
                width: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(SpaceConfig.normalSpace),
                  image: const DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        'https://vista.flixcinema.com/CDN/Image/Entity/FilmPosterGraphic/h-HO00000569'),
                  ),
                ),
              ),
              Container(
                height: 108,
                margin: EdgeInsets.only(
                  left: SpaceConfig.longSpace * 7,
                  top: 280 + SpaceConfig.normalSpace,
                  right: SpaceConfig.longSpace,
                  bottom: SpaceConfig.normalSpace,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Dora The Explorer: Adventure",
                      style: TypeTheme.titleTextFont,
                      maxLines: 2,
                      overflow: TextOverflow.clip,
                    ),
                    Row(
                      children: [
                        for (int i = 0; i < 5; i++)
                          Icon(
                            Icons.star,
                            color:
                                i < 3 ? ColorTheme.secondaryColor : Colors.grey,
                          ),
                        SizedBox(width: SpaceConfig.shortSpace),
                        Text(
                          "7.8/10",
                          style: TypeTheme.normalTextFont,
                        )
                      ],
                    ),
                    Text(
                      "Action, Comedy, Adventure",
                      style: TypeTheme.normalTextFont.copyWith(
                        color: ColorTheme.accentColorDarkGrey,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.clip,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 300 + SpaceConfig.longSpace * 5),
                child: DefaultTabController(
                  length: 2,
                  initialIndex: 0,
                  child: Column(
                    children: [
                      TabBar(
                        labelColor: ColorTheme.secondaryColor,
                        unselectedLabelColor: ColorTheme.accentColorDarkGrey,
                        labelStyle: TypeTheme.bigTextFont.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                        unselectedLabelStyle: TypeTheme.bigTextFont.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                        tabs: const [
                          Tab(
                            child: Text("Tentang Film"),
                          ),
                          Tab(
                            child: Text("Penilaian"),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 300,
                        width: double.infinity,
                        child: TabBarView(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: SpaceConfig.longSpace,
                                vertical: SpaceConfig.normalSpace,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Sinopsis",
                                    style: TypeTheme.subTitleTextFont,
                                  ),
                                  SizedBox(height: SpaceConfig.shortSpace),
                                  Text(
                                    "The Guardians struggle to keep together as a team while dealing with their personal family issues, notably Star-Lord's encounter with his father the ambitious celestial being Ego.",
                                    style: TypeTheme.normalTextFont,
                                    textAlign: TextAlign.justify,
                                    maxLines: 5,
                                    overflow: TextOverflow.clip,
                                  ),
                                  SizedBox(height: SpaceConfig.longSpace),
                                  Text(
                                    "Aktor",
                                    style: TypeTheme.subTitleTextFont,
                                  ),
                                  SizedBox(height: SpaceConfig.shortSpace),
                                  Expanded(
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: 8,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          margin: EdgeInsets.only(
                                            left: (index == 0) ? 0 : 2,
                                            right: (index == 8 - 1) ? 0 : 2,
                                          ),
                                          child: const ActorCard(
                                            name: "Tony Stark",
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: SpaceConfig.longSpace,
                                vertical: SpaceConfig.normalSpace,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Penghargaan",
                                    style: TypeTheme.subTitleTextFont,
                                  ),
                                  SizedBox(height: SpaceConfig.shortSpace),
                                  Text(
                                    "Mendapatkan Juara 1 dari lomba film komedi kabupaten Banten",
                                    style: TypeTheme.normalTextFont,
                                    textAlign: TextAlign.justify,
                                    maxLines: 3,
                                    overflow: TextOverflow.clip,
                                  ),
                                  SizedBox(height: SpaceConfig.longSpace),
                                  Column(
                                    children: List.generate(3, (index) {
                                      return Container(
                                        margin: EdgeInsets.only(
                                          top: (index == 0) ? 0 : 2,
                                          bottom: (index == 2) ? 0 : 2,
                                        ),
                                        child: const RateCard(
                                          name: "Internet Movie Database",
                                          rate: "8.3/10",
                                        ),
                                      );
                                    }),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
