part of 'widgets.dart';

class RateCard extends StatelessWidget {
  final String name;
  final String rate;
  const RateCard({Key? key, required this.name, required this.rate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Card(
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(SpaceConfig.normalSpace),
              color: Colors.white,
            ),
            child: const Icon(
              Icons.star,
              size: 40,
            ),
          ),
        ),
        SizedBox(width: SpaceConfig.shortSpace),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TypeTheme.subTitleTextFont,
            ),
            Text(
              rate,
              style: TypeTheme.normalTextFont,
            ),
          ],
        ),
      ],
    );
  }
}
