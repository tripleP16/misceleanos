import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:second_app/presentation/providers/providers.dart';

class AdRewardedScreen extends ConsumerWidget {
  const AdRewardedScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final adRewarded = ref.watch(adRewardedProvider);
    final points = ref.watch(pointsProvider);
    ref.listen(adRewardedProvider, (pre, next) {
      if (!next.hasValue) return;
      if (next.value == null) return;

      next.value!.show(onUserEarnedReward: (ad, reward) {
        ref.read(pointsProvider.notifier).update((state) => state + 10);
      });
    });

    if (adRewarded.isLoading) {
      return const Scaffold(
        body: Center(
          child: Text('Cargando anuncio'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ad Rewarded Screen'),
      ),
      body: Center(
        child: Text('Puntos actuales: $points'),
      ),
    );
  }
}
