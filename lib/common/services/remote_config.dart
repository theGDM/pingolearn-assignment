import 'package:ecommerce/common/services/logger.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class FirebaseRemoteConfigClass {
  final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;

  Future<String> initializeConfig(String key) async {
    logger.i('Fetching config for key: $key');

    try {
      await remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(seconds: 10),
          minimumFetchInterval: const Duration(hours: 1),
        ),
      );

      await remoteConfig.fetchAndActivate();
      String value = remoteConfig.getString('displayDiscountPrice');

      logger.i('Fetched config value: $value');
      return value;
    } catch (e) {
      logger.e('Error fetching remote config: $e');
      return '{}';
    }
  }
}
