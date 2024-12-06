class Location {
  final int cityId;
  final String cityName;
  final int countryId;
  final String countryName;

  Location({
    required this.cityId,
    required this.cityName,
    required this.countryId,
    required this.countryName,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      cityId: json['cityId'],
      cityName: json['city_name'],
      countryId: json['country_id'],
      countryName: json['country_name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cityId': cityId,
      'city_name': cityName,
      'country_id': countryId,
      'country_name': countryName,
    };
  }
}
