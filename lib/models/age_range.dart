import 'package:flutter/material.dart';

class AgeRange {
  int startAge, endAge;
  AgeRange(this.startAge, this.endAge);
}

class AgeRangeRequest {
  RangeValues range;
  double size;
  AgeRangeRequest(this.range, this.size);
}
