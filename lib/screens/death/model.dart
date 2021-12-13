class DeathModel {
  DeathModel({
    required this.deathId,
    required this.death,
    required this.cause,
    required this.responsible,
    required this.lastWords,
    required this.season,
    required this.episode,
    required this.numberOfDeaths,
  });
  late final int deathId;
  late final String death;
  late final String cause;
  late final String responsible;
  late final String lastWords;
  late final int season;
  late final int episode;
  late final int numberOfDeaths;

  DeathModel.fromJson(Map<String, dynamic> json) {
    deathId = json['death_id'];
    death = json['death'];
    cause = json['cause'];
    responsible = json['responsible'];
    lastWords = json['last_words'];
    season = json['season'];
    episode = json['episode'];
    numberOfDeaths = json['number_of_deaths'];
  }

}
