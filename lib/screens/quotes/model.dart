class QuotesModel {
  QuotesModel({
    required this.quoteId,
    required this.quote,
    required this.author,
    required this.series,
  });
  late final int quoteId;
  late final String quote;
  late final String author;
  late final String series;

  QuotesModel.fromJson(Map<String, dynamic> json) {
    quoteId = json['quote_id'];
    quote = json['quote'];
    author = json['author'];
    series = json['series'];
  }
}
