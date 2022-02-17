part of 'widgets.dart';

class ActorCard extends StatelessWidget {
  final String name;
  const ActorCard({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
              Icons.person,
              size: 40,
            ),
          ),
        ),
        SizedBox(height: SpaceConfig.shortSpace),
        SizedBox(
          height: 50,
          width: 50,
          child: Text(
            name,
            style: TypeTheme.normalTextFont,
            maxLines: 2,
            textAlign: TextAlign.center,
            overflow: TextOverflow.clip,
          ),
        ),
      ],
    );
  }
}
