part of 'pages.dart';

class MovieDetailPage extends StatefulWidget {
  const MovieDetailPage({Key? key}) : super(key: key);

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  MovieDetailModel? _movieDetailModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.bgLight,
      body: ListView(
        children: [
          FutureBuilder(
            future: MovieService.getMovieDetails("tt3896198"),
            builder: (context, AsyncSnapshot<MovieDetailModel> snapshot) {
              if (snapshot.hasData) {
                _movieDetailModel = snapshot.data;

                List<String> allActor = _movieDetailModel!.actors.split(',');
                List<String> rating =
                    _movieDetailModel!.ratings[0].value.split('/');

                var rate = double.parse(rating[0]) / 2;
                return Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 300,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(_movieDetailModel!.poster),
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
                      margin: EdgeInsets.only(
                          top: 200, left: SpaceConfig.longSpace),
                      height: 200,
                      width: 130,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(SpaceConfig.normalSpace),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(_movieDetailModel!.poster),
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
                            _movieDetailModel!.title,
                            style: TypeTheme.titleTextFont,
                            maxLines: 2,
                            overflow: TextOverflow.clip,
                          ),
                          Row(
                            children: [
                              for (int i = 0; i < 5; i++)
                                Icon(
                                  Icons.star,
                                  color: i < rate
                                      ? ColorTheme.secondaryColor
                                      : Colors.grey,
                                ),
                              SizedBox(width: SpaceConfig.shortSpace),
                              Text(
                                _movieDetailModel!.ratings[0].value,
                                style: TypeTheme.normalTextFont,
                              )
                            ],
                          ),
                          Text(
                            _movieDetailModel!.genre,
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
                      margin:
                          EdgeInsets.only(top: 300 + SpaceConfig.longSpace * 5),
                      child: DefaultTabController(
                        length: 2,
                        initialIndex: 0,
                        child: Column(
                          children: [
                            TabBar(
                              labelColor: ColorTheme.secondaryColor,
                              unselectedLabelColor:
                                  ColorTheme.accentColorDarkGrey,
                              labelStyle: TypeTheme.bigTextFont.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                              unselectedLabelStyle:
                                  TypeTheme.bigTextFont.copyWith(
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
                              height: 310,
                              width: double.infinity,
                              child: TabBarView(
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                      horizontal: SpaceConfig.longSpace,
                                      vertical: SpaceConfig.normalSpace,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Sinopsis",
                                          style: TypeTheme.subTitleTextFont,
                                        ),
                                        SizedBox(
                                            height: SpaceConfig.shortSpace),
                                        Text(
                                          _movieDetailModel!.plot,
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
                                        SizedBox(
                                            height: SpaceConfig.shortSpace),
                                        Expanded(
                                          child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: allActor.length,
                                            itemBuilder: (context, index) {
                                              return Container(
                                                margin: EdgeInsets.only(
                                                  left: (index == 0) ? 0 : 2,
                                                  right:
                                                      (index == 8 - 1) ? 0 : 2,
                                                ),
                                                child: ActorCard(
                                                  name: allActor[index],
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Penghargaan",
                                          style: TypeTheme.subTitleTextFont,
                                        ),
                                        SizedBox(
                                            height: SpaceConfig.shortSpace),
                                        Text(
                                          _movieDetailModel!.awards,
                                          style: TypeTheme.normalTextFont,
                                          textAlign: TextAlign.justify,
                                          maxLines: 3,
                                          overflow: TextOverflow.clip,
                                        ),
                                        SizedBox(height: SpaceConfig.longSpace),
                                        Column(
                                          children: List.generate(
                                              _movieDetailModel!.ratings.length,
                                              (index) {
                                            return Container(
                                              margin: EdgeInsets.only(
                                                top: (index == 0) ? 0 : 2,
                                                bottom: (index == 2) ? 0 : 2,
                                              ),
                                              child: RateCard(
                                                name: _movieDetailModel!
                                                    .ratings[index].source,
                                                rate: _movieDetailModel!
                                                    .ratings[index].value,
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
                );
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
    );
  }
}
