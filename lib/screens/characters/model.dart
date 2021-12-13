class AutoGenerate {
  AutoGenerate({
    required this.charId,
    required this.name,
    required this.birthday,
    required this.occupation,
    required this.img,
    required this.status,
    required this.nickname,
    required this.appearance,
    required this.portrayed,
    required this.category,
    required this.betterCallSaulAppearance,
  });
  late final int charId;
  late final String name;
  late final String birthday;
  late final List<String> occupation;
  late final String img;
  late final String status;
  late final String nickname;
  late final List<int> appearance;
  late final String portrayed;
  late final String category;
  late final List<dynamic> betterCallSaulAppearance;

  AutoGenerate.fromJson(Map<String, dynamic> json) {
    charId = json['char_id'];
    name = json['name'];
    birthday = json['birthday'];
    occupation = List.castFrom<dynamic, String>(json['occupation']);
    img = json['img'];
    status = json['status'];
    nickname = json['nickname'];
    appearance = List.castFrom<dynamic, int>(json['appearance']);
    portrayed = json['portrayed'];
    category = json['category'];
    betterCallSaulAppearance =
        List.castFrom<dynamic, dynamic>(json['better_call_saul_appearance']);
  }
}
