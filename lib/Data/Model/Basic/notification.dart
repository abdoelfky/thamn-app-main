part of data;

class NotificationX {
  NotificationX(
      {required this.id,
      required this.title,
      required this.body,
      required this.summary,
      required this.payload,
      required this.dateTime});

  final int id;
  final String title;
  final String body;
  final String summary;
  final Map<String, String?> payload;
  final DateTime dateTime;

  factory NotificationX.fromJson(Map<dynamic, dynamic> json) {
    return NotificationX(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      summary: json['summary'],
      payload: Map<String, String?>.from(json['payload']),
      dateTime: json['dateTime'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'summary': summary,
      'payload': payload,
      'dateTime': dateTime,
    };
  }
}
