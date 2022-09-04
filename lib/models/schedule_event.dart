const String tableEvents = "schedevents";

class ScheduledEvent {
  final int? id;
  final String orderId;
  final String ticketId;
  final String eventName;
  final String buyerName;
  final String chosenDate;
  final String chosenTime;
  final String link;
  final String price;
  final int? idImg;
  final bool isOnline;
  final DateTime time;

  const ScheduledEvent({
    this.id,
    required this.orderId,
    required this.ticketId,
    required this.eventName,
    required this.buyerName,
    required this.chosenDate,
    required this.chosenTime,
    required this.link,
    required this.price,
    required this.idImg,
    required this.isOnline,
    required this.time,
  });

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'orderId': orderId,
      'ticketId': ticketId,
      'eventName': eventName,
      'buyerName': buyerName,
      'chosenDate': chosenDate,
      'chosenTime': chosenTime,
      'link': link,
      'idImg': idImg,
      'isOnline': isOnline ? 1 : 0,
      'time': time.toIso8601String(),
    };
  }

  @override
  String toString() {
    return 'ScheduledEvent{id: $id, ticketId: $ticketId, eventName: $eventName, buyer: $buyerName, chosenDate: $chosenDate, chosenTime: $chosenTime, isOnline: $isOnline, time: $time}\n';
  }
}
