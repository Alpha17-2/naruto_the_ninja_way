import 'package:flutter/cupertino.dart';

class character {
  final String name;
  final String village;
  final String sex;
  final String rank;
  final String age;
  final String firstAppearance;
  final String quote;
  final String signatureMove;
  final String caseStudy;
  final List<String> images;

  character({
    this.name,
    this.sex,
    this.caseStudy,
    this.village,
    this.rank,
    this.age,
    this.firstAppearance,
    this.quote,
    this.signatureMove,
    this.images,
  });
}
