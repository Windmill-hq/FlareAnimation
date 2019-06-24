import 'package:flutter/foundation.dart';

import 'cache.dart';
import 'cache_asset.dart';
import 'flare.dart';

/// A reference counted asset in a cache.
class FlareCacheJson extends CacheAsset {
  FlutterActor _actor;
  FlutterActor get actor => _actor;

  @override
  void loadJson(Cache cache, String json) {
    super.loadJson(cache, json);
    compute(FlutterActor.loadFromJson, json).then((FlutterActor actor) {
      actor.loadImages().then((_) {
        if (actor != null) {
          _actor = actor;
          completeLoad();
        } else {
          print("Failed to load flare file from $json.");
        }
      });
    });
  }


  @override
  bool get isAvailable => _actor != null;

}

