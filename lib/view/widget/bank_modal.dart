part of 'widgets.dart';

class BankModal extends StatelessWidget {
  final List<Bank> banks;

  const BankModal({
    Key key,
    this.banks
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    SelectedBankBloc selectBankBloc = BlocProvider.of<SelectedBankBloc>(context);

    return Container(
      padding: EdgeInsets.only(
        top: 40,
        bottom: 20,
        left: 20,
        right: 20
      ),
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: new BorderRadius.only(
          topLeft: const Radius.circular(30),
          topRight: const Radius.circular(30)
        )
      ),
      child: Column(
        children: [
          Text(
            'Pilih Metode Pembayaran',
            style: secondTitleTextStyle,
          ),
          sizeBoxVertical,
          Expanded(
            child: ListView.builder(
              itemCount: banks.length,
              itemBuilder: (BuildContext context, int index) {
                return BlocBuilder<SelectedBankBloc, SelectedBankState>(
                  builder: (context, selectedBank) => GestureDetector(
                    onTap: () {
                      selectBankBloc.add(SelectBank(banks[index].id, index));
                    },
                    child: Container(
                      padding: EdgeInsets.all(kDefaultPadding),
                      margin: EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: (selectedBank.id == banks[index].id) ? primaryColor : Colors.white,
                          width: (selectedBank.id == banks[index].id) ? 2 : 1,
                        ),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            'assets/images/bank/' + banks[index].logo,
                            height: 20,
                          ),
                          sizeBoxHorizontal,
                          Text(
                            'Bank ' + banks[index].bankAccount,
                            style: secondTitleTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 25.0),
            width: double.infinity,
            child: FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              padding: EdgeInsets.all(15.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              color: primaryColor,
              child: Text(
                'Selesai',
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 1.5,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}