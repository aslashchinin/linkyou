class LocationShort {
  final String cityName;
  final String countryName;

  LocationShort({
    required this.cityName,
    required this.countryName,
  });

  factory LocationShort.fromJson(Map<String, dynamic> json) {
    return LocationShort(
      cityName: json['city_name'],
      countryName: json['country_name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'city_name': cityName,
      'country_name': countryName,
    };
  }
}
