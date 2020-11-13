part of 'widgets.dart';

class InvoiceListCard extends StatelessWidget {
  final Invoice invoice;

  const InvoiceListCard({
    Key key,
    this.invoice
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: primaryColor.withOpacity(0.4),
            blurRadius: 10,
            spreadRadius: -5,
            offset: Offset(0, 10),
          )
        ]
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  invoice.service,
                  style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                    fontSize: 18
                  ),
                ),
                Text(
                  invoice.route,
                  style: TextStyle(
                    color: secondColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                    fontSize: 12
                  ),
                ),
                Divider(
                  height: 20,
                  thickness: 1,
                  color: Color(0xFFEEEEEE),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          rupiah(invoice.amount),
                          style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat',
                            fontSize: 18
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          (invoice.status == 'new') ? 'Silahkan bayar sebelum :' : '',
                          style: TextStyle(
                            color: greyColor,
                            fontFamily: 'Montserrat',
                            fontSize: 10,
                          )
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 8,
                              width: 8,
                              decoration: BoxDecoration(
                                color: (invoice.status == 'paid_off') ? primaryColor : warningColor,
                                shape: BoxShape.circle
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              (invoice.status == 'paid_off') ? 'Sudah Lunas!' 
                              : (invoice.status == 'on_process') ? 'Proses Verifikasi'
                              : (invoice.status == 'cencel') ? 'Dibatalkan'
                              : (invoice.status == 'rejected') ? 'Konfirmasi Pembayaran Ditolak'
                              : tanggal(invoice.dueDate) + ' - ' + DateFormat('HH:mm').format(invoice.dueDate) + ' WIB',
                              style: TextStyle(
                                color: secondColor,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                                fontSize: 12,
                              )
                            ),
                          ],
                        ),
                      ],
                    ),
                    (invoice.status == 'cencel') ? Container() :
                    GestureDetector(
                      onTap: () {
                        Get.to(InvoiceDetailPage(invoice: invoice,));
                      },
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: primaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          shape: BoxShape.rectangle
                        ),
                        child: SvgPicture.asset(
                          'assets/icons/right-arrow.svg',
                          color: primaryColor,
                          height: 20,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 10,
            decoration: BoxDecoration(
              gradient: gradientPrimaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0),
                topRight: Radius.circular(0),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              )
            ),
          ),
        ],
      ),
    );
  }
}