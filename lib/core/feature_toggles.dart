import 'package:flagsmith/flagsmith.dart';

class FeatureToggles {
  final bool forceUpdate;
  final bool menuItemCongregations;
  final bool menuItemHome;
  final bool menuItemSettings;
  final bool menuItemVisits;

  FeatureToggles({
    required this.forceUpdate,
    required this.menuItemCongregations,
    required this.menuItemHome,
    required this.menuItemSettings,
    required this.menuItemVisits,
  });

  factory FeatureToggles.fromFlagSmith(List<Flag> features) {
    final forceUpdate = features.firstWhere((element) => element.feature.name == 'force_update');
    final menuItemCongregations = features.firstWhere((element) => element.feature.name == 'menu_item_congregations');
    final menuItemHome = features.firstWhere((element) => element.feature.name == 'menu_item_home');
    final menuItemSettings = features.firstWhere((element) => element.feature.name == 'menu_item_settings');
    final menuItemVisits = features.firstWhere((element) => element.feature.name == 'menu_item_visits');

    return FeatureToggles(
      forceUpdate: forceUpdate.enabled ?? false,
      menuItemCongregations: menuItemCongregations.enabled ?? false,
      menuItemHome: menuItemHome.enabled ?? false,
      menuItemSettings: menuItemSettings.enabled ?? false,
      menuItemVisits: menuItemVisits.enabled ?? false,
    );
  }

  factory FeatureToggles.empty() => FeatureToggles(
        forceUpdate: false,
        menuItemCongregations: false,
        menuItemHome: false,
        menuItemSettings: false,
        menuItemVisits: false,
      );
}
