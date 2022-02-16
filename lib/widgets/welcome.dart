part of 'widgets.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  String _greetings() {
    final now = DateTime.now();
    final hour = now.hour;
    if (hour < 12) {
      return 'Pagi';
    } else if (hour < 15) {
      return "Siang";
    } else if (hour < 18) {
      return "Sore";
    } else {
      return "Malam";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Selamat ${_greetings()},",
              style: TypeTheme.normalTextFont,
            ),
            SizedBox(height: SpaceConfig.shortSpace),
            Text(
              "Nailul Firdaus",
              style: TypeTheme.titleTextFont,
            ),
          ],
        ),
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: ColorTheme.secondaryColor,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.person,
            color: Colors.white.withOpacity(0.8),
          ),
        ),
      ],
    );
  }
}
