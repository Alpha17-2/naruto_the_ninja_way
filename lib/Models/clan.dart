import 'dart:ui';

class Clan {
  final String clanName;
  final String description;
  final String standingMember;
  final Map<String, String> members;
  final String village;
  final Color clanColor;
  final String coverImage;
  final String signatureAbility;
  Clan({this.clanName,this.coverImage,this.clanColor, this.village,this.standingMember,this.signatureAbility, this.members, this.description});
}
