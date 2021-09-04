import 'dart:convert';

class Geocoding {
  final PlusCode plusCode;
  final List<Results> results;
  final String status;

  Geocoding({
    required this.plusCode,
    required this.results,
    required this.status,
  });

  factory Geocoding.fromRawJson(String str) =>
      Geocoding.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Geocoding.fromJson(Map<String, dynamic> json) => Geocoding(
        plusCode: PlusCode.fromJson(json['plus_code']),
        results:
            List<Results>.from(json['results'].map((r) => Results.fromJson(r))),
        status: json['status'],
      );

  Map<String, dynamic> toJson() => {
        'plus_code': plusCode.toJson(),
        'results': results.map((v) => v.toJson()).toList(),
        'status': status,
      };
}

class PlusCode {
  final String compoundCode;
  final String globalCode;

  PlusCode({required this.compoundCode, required this.globalCode});

  factory PlusCode.fromRawJson(String str) =>
      PlusCode.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PlusCode.fromJson(Map<String, dynamic> json) => PlusCode(
        compoundCode: json['compound_code'],
        globalCode: json['global_code'],
      );

  Map<String, dynamic> toJson() => {
        'compound_code': compoundCode,
        'global_code': globalCode,
      };
}

class Results {
  final List<AddressComponents> addressComponents;
  final String formattedAddress;
  final Geometry geometry;
  final String placeId;
  final PlusCode plusCode;
  final List<String> types;

  Results(
      {required this.addressComponents,
      required this.formattedAddress,
      required this.geometry,
      required this.placeId,
      required this.plusCode,
      required this.types});

  factory Results.fromRawJson(String str) => Results.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Results.fromJson(Map<String, dynamic> json) => Results(
        addressComponents: List<AddressComponents>.from(
            json['address_components']
                .map((x) => AddressComponents.fromJson(x))),
        formattedAddress: json['formatted_address'],
        geometry: Geometry.fromJson(json['geometry']),
        placeId: json['place_id'],
        plusCode: PlusCode.fromJson(json['plus_code']),
        types: json['types'].cast<String>(),
      );

  Map<String, dynamic> toJson() => {
        'address_components': addressComponents.map((v) => v.toJson()).toList(),
        'formatted_address': formattedAddress,
        'geometry': geometry.toJson(),
        'place_id': placeId,
        'plus_code': plusCode.toJson(),
        'types': types
      };
}

class AddressComponents {
  final String longName;
  final String shortName;
  final List<String> types;

  AddressComponents({
    required this.longName,
    required this.shortName,
    required this.types,
  });

  factory AddressComponents.fromRawJson(String str) =>
      AddressComponents.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AddressComponents.fromJson(Map<String, dynamic> json) =>
      AddressComponents(
        longName: json['long_name'],
        shortName: json['short_name'],
        types: json['types'].cast<String>(),
      );

  Map<String, dynamic> toJson() => {
        'long_name': longName,
        'short_name': shortName,
        'types': types,
      };
}

class Geometry {
  final Location location;
  final String locationType;
  final Viewport viewport;

  Geometry({
    required this.location,
    required this.locationType,
    required this.viewport,
  });

  factory Geometry.fromRawJson(String str) =>
      Geometry.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        location: Location.fromJson(json['location']),
        locationType: json['location_type'],
        viewport: Viewport.fromJson(json['viewport']),
      );

  Map<String, dynamic> toJson() => {
        'location': location.toJson(),
        'location_type': locationType,
        'viewport': viewport.toJson(),
      };
}

class Location {
  final double lat;
  final double lng;

  Location({required this.lat, required this.lng});

  factory Location.fromRawJson(String str) =>
      Location.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        lat: json['lat'],
        lng: json['lng'],
      );

  Map<String, dynamic> toJson() => {
        'lat': this.lat,
        'lng': this.lng,
      };
}

class Viewport {
  final Location northeast;
  final Location southwest;

  Viewport({required this.northeast, required this.southwest});

  factory Viewport.fromRawJson(String str) =>
      Viewport.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Viewport.fromJson(Map<String, dynamic> json) => Viewport(
        northeast: Location.fromJson(json['northeast']),
        southwest: Location.fromJson(json['southwest']),
      );

  Map<String, dynamic> toJson() => {
        'northeast': this.northeast.toJson(),
        'southwest': this.southwest.toJson(),
      };
}
