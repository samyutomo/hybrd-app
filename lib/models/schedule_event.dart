const String tableEvents = "schedevents";

class ScheduledEvent {
  final int id;
  final String ticketId;
  final String eventName;
  final String buyerName;
  final String chosenDate;
  final String chosenTime;
  final String link;
  final bool isOnline;
  final DateTime time;

  const ScheduledEvent({
    this.id,
    required this.ticketId,
    required this.eventName,
    required this.buyerName,
    required this.chosenDate,
    required this.chosenTime,
    required this.link,
    required this.isOnline,
    required this.time,
  });

  Map<String, Object?> toMap() {
    return {
      '_id': id,
      'ticketId': ticketId,
      'eventName': eventName,
      'buyerName': buyerName,
      'chosenDate': chosenDate,
      'chosenTime': chosenTime,
      'link': link,
      'isOnline': isOnline? 1:0,
      'time': time.toIso8601String(),
    };
  }
}
