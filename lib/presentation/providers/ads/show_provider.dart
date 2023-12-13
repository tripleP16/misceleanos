import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:second_app/config/plugins/shared_preferences_plugin.dart';

const storeKey = 'showAds';

class ShowAdsNotifier extends StateNotifier<bool> {
  ShowAdsNotifier() : super(false) {
    checkState();
  }

  void checkState() async {
    state = await SharedPreferencesPlugin.getBool(storeKey);
  }

  void showAds() async {
    await SharedPreferencesPlugin.setBool(storeKey, true);
    state = true;
  }

  void hideAds() async {
    await SharedPreferencesPlugin.setBool(storeKey, false);
    state = false;
  }

  void toggleAds() async {
    state ? hideAds() : showAds();
  }
}

final showAdsProvider = StateNotifierProvider<ShowAdsNotifier, bool>(
  (ref) => ShowAdsNotifier(),
);
