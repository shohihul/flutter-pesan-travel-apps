part of '../driver_home.dart';

class TaskListCard extends StatelessWidget {
  final TaskList task;

  const TaskListCard({
    Key key,
    this.task
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
        boxShadow: [
          defaultBoxShadow
        ]
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Antar Kota',
                    style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                      fontSize: 10
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    task.origin + ' - ' + task.destination,
                    style: smallSecondBoldTextStyle,
                  ),
                  Text(
                    tanggal(task.start) + ' - ' + DateFormat('HH:mm').format(task.start),
                    style: smallSecondTextStyle,
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Get.to(TaskDriver(task: task,));
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: (task.routeReady == 0) ? Colors.transparent: primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    shape: BoxShape.rectangle
                  ),
                  child: SvgPicture.asset(
                    (task.routeReady == 0) ? 'assets/icons/timer.svg' : 'assets/icons/right-arrow.svg',
                    color: (task.routeReady == 0) ? secondColor.withOpacity(0.3) : primaryColor,
                    height: (task.routeReady == 0) ? 15 : 10,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/minivan-car.svg',
                  height: 15,
                  color: Color(0xFF8DA6FF),
                ),
                SizedBox(width: 10),
                Text(
                  task.carName,
                  style: smallSecondTextStyle,
                ),
                Spacer(),
                SvgPicture.asset(
                  'assets/icons/passenger.svg',
                  height: 15,
                  color: Color(0xFFFFB68D),
                ),
                SizedBox(width: 10),
                Text(
                  task.passengerCount.toString(),
                  style: smallSecondTextStyle,
                ),
                Spacer(),
                SvgPicture.asset(
                  'assets/icons/map.svg',
                  height: 15,
                  color: Color(0xFFFE6986),
                ),
                SizedBox(width: 10),
                Text(
                  (task.routeReady == 0) ? 'Not Ready' : 'Ready',
                  style: smallSecondTextStyle,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}