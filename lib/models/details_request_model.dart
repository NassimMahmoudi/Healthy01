class DetailsRequestModel {
  DetailsRequestModel({
    required this.id,
    required this.sexe,
    required this.height,
    required this.weight,
    required this.bodyTemp,
    required this.heartRate,
    required this.level,
  });
  late final String id;
  late final String sexe;
  late final String height;
  late final String weight;
  late final String bodyTemp;
  late final String heartRate;
  late final String level;

  DetailsRequestModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sexe = json['sexe'];
    height = json['height'];
    weight = json['weight'];
    heartRate = json['heart_Rate'];
    bodyTemp = json['body_Temp'];
    level = json['level'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['sexe'] = sexe;
    _data['height'] = height;
    _data['weight'] = weight;
    _data['bodyTemp'] = bodyTemp;
    _data['heartRate'] = heartRate;
    _data['level'] = level;
    return _data;
  }
}
