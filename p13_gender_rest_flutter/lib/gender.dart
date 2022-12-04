class Gender {
  final String? gender;
  final String? name;
  final double? probability;

  Gender(
      this.gender,
      this.name,
      this.probability,
      );
  factory Gender.fromMap(Map<String, dynamic> json) {
    return Gender(json['gender'], json['name'], json['probability']);
  }
  factory Gender.fromJson(Map<String, dynamic> json) {
    return Gender(json['gender'], json['name'], json['probability']);
  }
}
