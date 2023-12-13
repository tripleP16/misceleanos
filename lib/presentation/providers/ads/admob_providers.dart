import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:second_app/config/config.dart';

final adBannerProvider = FutureProvider<BannerAd>((ref) async {
  //TODO: validar si se muestran o no los ads
  final ad = await AdmobPlugin.loadBannerAd();

  return ad;
});

final adInterstitialProvider =
    FutureProvider.autoDispose<InterstitialAd>((ref) async {
  //TODO: validar si se muestran o no los ads
  final ad = await AdmobPlugin.loadInterstitialAd();

  return ad;
});


final adRewardedProvider =
    FutureProvider.autoDispose<RewardedAd>((ref) async {
  //TODO: validar si se muestran o no los ads
  final ad = await AdmobPlugin.loadRewardedAd();

  return ad;
});
