part of 'models.dart';

class TaskList {
  int serviceId;
  String origin;
  String destination;
  DateTime start;
  int routeReady;
  String taskStatus;
  int passengerCount;
  String carName;
  int carCapacity;

  TaskList(
    this.serviceId,
    this.origin,
    this.destination,
    this.start,
    this.routeReady,
    this.taskStatus,
    this.passengerCount,
    this.carName,
    this.carCapacity,
  );

  factory TaskList.fromJson(Map<String, dynamic> object) {
    return TaskList(
      object['service_id'],
      object['origin'],
      object['destination'],
      DateTime.parse(object['start']),
      object['route_ready'],
      object['task_status'],
      object['passenger_count'],
      object['car_name'],
      object['car_capacity'],
    );
  }
}

List<TaskList> parseTaskList(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<TaskList>((json) => TaskList.fromJson(json)).toList();
}

Stream<List<TaskList>> getTaskList() async* {
  while (true) {
    await Future.delayed(Duration(seconds: 10));
    final response = await CallApi().getData('task_driver');
    String body = response.body;
    if(response.statusCode == 200)
      yield await compute(parseTaskList, body);
    else
      print(body);
  }
}