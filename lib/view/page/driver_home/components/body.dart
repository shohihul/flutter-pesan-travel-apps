part of '../driver_home.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kDefaultPadding),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Daftar Tugas',
                  style: secondTitleTextStyle,
                ),
                Text(
                  '3 Tugas',
                  style: smallSecondBoldTextStyle,
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
            child: StreamBuilder(
              stream: getTaskList(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var listTask = snapshot.data;
                  return ListView.builder(
                    itemCount: listTask.length,
                    itemBuilder: (context, index) {
                      return TaskListCard(task: listTask[index]);
                    },
                  );
                } else {
                  return Center (
                    child: CircularProgressIndicator()
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}