import 'package:fluent_ui/fluent_ui.dart';

class HeroCarousel extends StatelessWidget {
  const HeroCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.black.withOpacity(0.3),
      ),
      child: const Center(
        child: Text(
          "posters from media in this section",
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
