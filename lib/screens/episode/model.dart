class EpisodeModel {
  EpisodeModel({
    required this.episodeId,
    required this.title,
    required this.season,
    required this.airDate,
    required this.characters,
    required this.episode,
    required this.series,
  });
  late final int episodeId;
  late final String title;
  late final String season;
  late final String airDate;
  late final List<String> characters;
  late final String episode;
  late final String series;

  EpisodeModel.fromJson(Map<String, dynamic> json) {
    episodeId = json['episode_id'];
    title = json['title'];
    season = json['season'];
    airDate = json['air_date'];
    characters = List.castFrom<dynamic, String>(json['characters']);
    episode = json['episode'];
    series = json['series'];
  }

}
