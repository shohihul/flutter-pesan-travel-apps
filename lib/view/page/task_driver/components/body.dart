part of '../task_driver.dart';

class Body extends StatelessWidget {
  final TaskList task;

  const Body({
    Key key,
    this.task
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Penumpang',
                  style: secondTitleTextStyle,
                ),
              ],
            ),
          ),
          Divider(
            height: 20,
            thickness: 1,
            color: greyColor.withOpacity(0.5),
          ),
          Expanded(
            child: FutureBuilder(
              future: getPassengerList(task.serviceId),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var listPassenger = snapshot.data;
                  return ListView.builder(
                    itemCount: listPassenger.length,
                    itemBuilder: (context, index) {
                      return PassengerCard(passenger: listPassenger[index]);
                    }
                  );
                } else {
                  return Center (
                    child: CircularProgressIndicator()
                  );
                }
              }
            )
          )
        ],
      ),
    );
  }
}