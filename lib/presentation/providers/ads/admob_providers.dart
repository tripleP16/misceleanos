import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:second_app/config/config.dart';
import 'package:second_app/presentation/providers/ads/show_provider.dart';

final adBannerProvider = FutureProvider<BannerAd>((ref) async {
  final showAds = ref.watch(showAdsProvider);

  if (!showAds) throw 'Ads are not enabled';

  final ad = await AdmobPlugin.loadBannerAd();

  return ad;
});

final adInterstitialProvider =
    FutureProvider.autoDispose<InterstitialAd>((ref) async {
  final showAds = ref.watch(showAdsProvider);

  if (!showAds) throw 'Ads are not enabled';
  final ad = await AdmobPlugin.loadInterstitialAd();

  return ad;
});

final adRewardedProvider = FutureProvider.autoDispose<RewardedAd>((ref) async {
  final showAds = ref.watch(showAdsProvider);

  if (!showAds) throw 'Ads are not enabled';
  final ad = await AdmobPlugin.loadRewardedAd();

  return ad;
});
