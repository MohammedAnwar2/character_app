class CharactersModel {
  int? id;
  String? name;
  String? status;
  String? species;
  String? type;
  String? gender;
  String? image;
  List<dynamic>? episode;
  String? url;
  String? originName;
  String? locationName;
  DateTime? created;

  CharactersModel({
    this.originName,
    this.locationName,
    this.id,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
    this.image,
    this.episode,
    this.url,
    this.created,
  });

  factory CharactersModel.fromJson(Map<String, dynamic> json) =>
      CharactersModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
        status: json['status'] as String?,
        species: json['species'] as String?,
        type: json['type'] as String?,
        gender: json['gender'] as String?,
        image: json['image'] as String?,
        episode: json['episode'] as List<dynamic>?,
        url: json['url'] as String?,
        originName: json['origin']['name'],
        locationName: json['location']['name'],
        created: json['created'] == null
            ? null
            : DateTime.parse(json['created'] as String),
      );
}
