class GeoModel {
  String? lat;
  String? lng;

  GeoModel({
    this.lat,
    this.lng,
  });

  factory GeoModel.fromJson(Map<String, dynamic> json) {
    return GeoModel(
      lat: json['lat'] as String?,
      lng: json['lng'] as String?,
    );
  }
}
