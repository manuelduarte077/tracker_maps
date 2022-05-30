import 'dart:convert';

class PlacesResponse {
  PlacesResponse({
    required this.type,
    // required this.query,
    required this.features,
    required this.attribution,
  });

  final String type;
  // final List<String> query;
  final List<Feature> features;
  final String attribution;

  factory PlacesResponse.fromRawJson(String str) =>
      PlacesResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PlacesResponse.fromJson(Map<String, dynamic> json) => PlacesResponse(
        type: json['type'],
        // query: List<String>.from(json['query'].map((x) => x)),
        features: List<Feature>.from(
            json['features'].map((x) => Feature.fromJson(x))),
        attribution: json['attribution'],
      );

  Map<String, dynamic> toJson() => {
        'type': type,
        // 'query': List<dynamic>.from(query.map((x) => x)),
        'features': List<dynamic>.from(features.map((x) => x.toJson())),
        'attribution': attribution,
      };
}

class Feature {
  Feature({
    required this.id,
    required this.type,
    required this.placeType,
    // required this.relevance,
    required this.properties,
    required this.textEs,
    required this.placeNameEs,
    required this.text,
    required this.placeName,
    required this.center,
    required this.geometry,
    required this.context,
  });

  final String id;
  final String type;
  final List<String> placeType;
  // final int relevance;
  final Properties properties;
  final String textEs;
  final String placeNameEs;
  final String text;
  final String placeName;
  final List<double> center;
  final Geometry geometry;
  final List<Context> context;

  factory Feature.fromRawJson(String str) => Feature.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Feature.fromJson(Map<String, dynamic> json) => Feature(
        id: json['id'],
        type: json['type'],
        placeType: List<String>.from(json['place_type'].map((x) => x)),
        // relevance: json['relevance'],
        properties: Properties.fromJson(json['properties']),
        textEs: json['text_es'],
        placeNameEs: json['place_name_es'],
        text: json['text'],
        placeName: json['place_name'],
        center: List<double>.from(json['center'].map((x) => x.toDouble())),
        geometry: Geometry.fromJson(json['geometry']),
        context:
            List<Context>.from(json['context'].map((x) => Context.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type,
        'place_type': List<dynamic>.from(placeType.map((x) => x)),
        // 'relevance': relevance,
        'properties': properties.toJson(),
        'text_es': textEs,
        'place_name_es': placeNameEs,
        'text': text,
        'place_name': placeName,
        'center': List<dynamic>.from(center.map((x) => x)),
        'geometry': geometry.toJson(),
        'context': List<dynamic>.from(context.map((x) => x.toJson())),
      };
}

class Context {
  Context({
    required this.id,
    required this.textEs,
    required this.text,
    required this.wikidata,
    required this.languageEs,
    required this.language,
    required this.shortCode,
  });

  final String id;
  final String textEs;
  final String text;
  final String? wikidata;
  final Language? languageEs;
  final Language? language;
  final String? shortCode;

  factory Context.fromRawJson(String str) => Context.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Context.fromJson(Map<String, dynamic> json) => Context(
        id: json['id'],
        textEs: json['text_es'],
        text: json['text'],
        wikidata: json['wikidata'],
        languageEs: json['language_es'] == null
            ? null
            : languageValues.map[json['language_es']],
        language: json['language'] == null
            ? null
            : languageValues.map[json['language']],
        shortCode: json['short_code'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'text_es': textEs,
        'text': text,
        'wikidata': wikidata,
        'language_es':
            languageEs == null ? null : languageValues.reverse[languageEs],
        'language': language == null ? null : languageValues.reverse[language],
        'short_code': shortCode,
      };
}

enum Language { ES }

final languageValues = EnumValues({'es': Language.ES});

class Geometry {
  Geometry({
    required this.coordinates,
    required this.type,
  });

  final List<double> coordinates;
  final String type;

  factory Geometry.fromRawJson(String str) =>
      Geometry.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        coordinates:
            List<double>.from(json['coordinates'].map((x) => x.toDouble())),
        type: json['type'],
      );

  Map<String, dynamic> toJson() => {
        'coordinates': List<dynamic>.from(coordinates.map((x) => x)),
        'type': type,
      };
}

class Properties {
  Properties({
    required this.foursquare,
    required this.landmark,
    required this.address,
    required this.category,
    required this.maki,
  });

  final String? foursquare;
  final bool? landmark;
  final String? address;
  final String? category;
  final String? maki;

  factory Properties.fromRawJson(String str) =>
      Properties.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Properties.fromJson(Map<String, dynamic> json) => Properties(
        foursquare: json['foursquare'],
        landmark: json['landmark'],
        address: json['address'],
        category: json['category'],
        maki: json['maki'],
      );

  Map<String, dynamic> toJson() => {
        'foursquare': foursquare,
        'landmark': landmark,
        'address': address,
        'category': category,
        'maki': maki,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap!;
  }
}
