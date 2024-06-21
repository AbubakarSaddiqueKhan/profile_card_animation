import 'package:custom_profile_card_animation/widgets/custom_profile_card.dart';
import 'package:custom_profile_card_animation/widgets/profile_card_animation_clipper.dart';
import 'package:flutter/material.dart';

class ProfileCardAnimationPage extends StatefulWidget {
  const ProfileCardAnimationPage({super.key});

  @override
  State<ProfileCardAnimationPage> createState() =>
      _ProfileCardAnimationPageState();
}

class _ProfileCardAnimationPageState extends State<ProfileCardAnimationPage>
    with TickerProviderStateMixin {
  late final cardSize;
  late final holeSizeTween;
  late final cardOffsetTween;
  late final cardRotationTween;
  late final cardElevationTween;
  late AnimationController holeAnimationController;
  late AnimationController cardOffsetAnimationController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    cardSize = MediaQuery.sizeOf(context).width * 0.6;
    holeSizeTween = Tween<double>(begin: 0, end: 1.5 * cardSize);
    cardOffsetTween = Tween<double>(begin: 0, end: cardSize * 2.15)
        .chain(CurveTween(curve: Curves.easeInBack));

    cardRotationTween = Tween<double>(begin: 0, end: 0.5)
        .chain(CurveTween(curve: Curves.easeInBack));

    cardElevationTween = Tween<double>(begin: 0, end: 50);

    holeAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300))
      ..addListener(
        () => setState(() {}),
      );
    cardOffsetAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000))
      ..addListener(
        () => setState(() {}),
      );
  }

  double get holeSize => holeSizeTween.evaluate(holeAnimationController);

  double get cardOffset =>
      cardOffsetTween.evaluate(cardOffsetAnimationController);

  double get cardRotation =>
      cardRotationTween.evaluate(cardOffsetAnimationController);

  double get cardElevation =>
      cardElevationTween.evaluate(cardOffsetAnimationController);

  @override
  void dispose() {
    holeAnimationController.dispose();
    cardOffsetAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: cardSize * 1.25,
          child: ClipPath(
            clipper: ProfileCardAnimationClipper(),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SizedBox(
                  width: holeSize,
                  child: Image.asset("assets/images/hole.png"),
                ),
                Transform.translate(
                    offset: Offset(0, cardOffset),
                    child: Transform.rotate(
                        angle: cardRotation,
                        child: CustomProfileCard(
                          elevationValue: cardElevation,
                        )))
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {
              holeAnimationController.reverse();
              cardOffsetAnimationController.reverse();
            },
            child: Icon(
              Icons.arrow_upward_outlined,
              color: Colors.brown.shade900,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          FloatingActionButton(
            onPressed: () async {
              holeAnimationController.forward();
              await cardOffsetAnimationController.forward();
              Future.delayed(
                const Duration(milliseconds: 100),
                () => holeAnimationController.reverse(),
              );
            },
            child: Icon(
              Icons.arrow_downward_outlined,
              color: Colors.brown.shade900,
            ),
          )
        ],
      ),
    );
  }
}
