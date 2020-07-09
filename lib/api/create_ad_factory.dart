import 'package:ads_cloner/models/ad_targeting.dart';
import 'package:ads_cloner/models/create_ad.dart';
import 'package:ads_cloner/models/wall_post.dart';

enum OptionType { post, target }

class CloneOption {
  OptionType type;
  String param;
  String value;

  CloneOption(this.type, this.param, this.value);
}

class CloneFactory {
  WallPost _wallPost;
  AdTargeting _adTargeting;
  CloneOption _cloneOption;

  buildAdList(
      WallPost wallPost, AdTargeting adTargeting, CloneOption cloneOption) {
    switch (cloneOption.type) {
      case OptionType.post:
       //something
        break;
      case OptionType.target:
        //something
        break;
    }
  }
}
