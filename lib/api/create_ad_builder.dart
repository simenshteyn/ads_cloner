import 'package:SmmHub/api/clone_factory.dart';
import 'package:SmmHub/models/ad.dart';
import 'package:SmmHub/models/ad_layout.dart';
import 'package:SmmHub/models/ad_targeting.dart';
import 'package:SmmHub/models/create_ad.dart';
import 'package:SmmHub/models/wall_post.dart';

class CreateAdRequest {
  Ad ad;
  AdLayout layout;
  AdTargeting targeting;
  CreateAdRequest(this.ad, this.layout, this.targeting);
}

abstract class CreateAdBuilderInterface {
  CreateAdRequest request;
  void reset();
  void setAdSettings(Ad ad);
  void setLayoutSettings(AdLayout layout);
  void setTargetingSettings(AdTargeting targeting);
  CreateAd getCreateAd();
}


