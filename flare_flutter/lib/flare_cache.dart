import 'dart:async';
import 'package:flutter/services.dart';

import 'asset_bundle_cache.dart';
import 'flare_cache_json.dart';

class FlareCache extends AssetBundleCache<FlareCacheJson> {
  FlareCache(AssetBundle bundle) : super(bundle);

  static bool doesPrune = true;
  static Duration pruneDelay = Duration(seconds: 2);

  @override
  bool get isPruningEnabled => doesPrune;

  @override
  Duration get pruneAfter => pruneDelay;

  @override
  FlareCacheJson makeAsset() {
    return FlareCacheJson();
  }
}

final Map<AssetBundle, FlareCache> _cache = {};

Future<FlareCacheJson> cachedJson(AssetBundle bundle, String json) async {
  FlareCache cache = _cache[bundle];
  if (cache == null) {
    _cache[bundle] = cache = FlareCache(bundle);
  }
  return cache.getJson(json);
}
