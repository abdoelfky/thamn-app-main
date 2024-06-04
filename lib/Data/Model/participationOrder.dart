part of data;

class ParticipationOrderX {
  ParticipationOrderX({
    required this.id,
    required this.userID,
    required this.orderID,
    required this.shareWith,
    this.completionDate='',
  });

  ParticipationOrderX.empty();

  late int id;
  late int userID;
  late int orderID;
  late String shareWith;
  late String completionDate;

  factory ParticipationOrderX.fromJson(Map<String, dynamic> json) {
    return ParticipationOrderX(
      id: json[NameX.id]??0,
      userID: json[NameX.userID]??0,
      orderID: json[NameX.orderID]??0,
      shareWith: json[NameX.shareWith]??'',
      completionDate: json[NameX.completionDate]??'',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      NameX.id: id,
      NameX.userID: userID,
      NameX.orderID: orderID,
      NameX.shareWith: shareWith,
      NameX.completionDate: completionDate,
    };
  }
}
