part of '../invoice_detail.dart';

class Body extends StatelessWidget {
  final Invoice invoice;

  const Body({
    Key key,
    this.invoice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Container(
            height: (invoice.status == 'new' || invoice.status == 'rejected') ? 120 : 110,
            width: double.infinity,
            decoration: BoxDecoration(
            color: primaryColor,
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
                Text(
                  'Total Tagihan'.toUpperCase(),
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 16,
                    color: Colors.white
                  ),
                ),
                Text(
                  rupiah(invoice.amount),
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 36,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),
                ),
                sizeBoxVertical,
                Text(
                  (invoice.status == 'new' || invoice.status == 'rejected') ? 'Bayar sebelum :'.toUpperCase() : '',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 12,
                    color: Colors.white
                  ),
                ),
                Text(
                  (invoice.status == 'new' || invoice.status == 'rejected') ? tanggal(invoice.dueDate) + ' | ' + DateFormat('HH:mm').format(invoice.dueDate) + ' WIB'
                  : '',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(
                  vertical: 30,
                  horizontal: 20,
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 20,
                ),
                decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: Offset(0, 20),
                    spreadRadius: -10,
                    blurRadius: 20,
                  )
                ]
              ),
                child: Column(
                  children: [
                    Text(
                      (invoice.status == 'rejected') ? 'Konfirmasi Pembayaran Anda Ditolak'.toUpperCase()
                      : '',
                      style: TextStyle(
                        color: warningColor,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                        fontSize: 12.0
                      ),
                    ),
                    Text(
                      (invoice.status == 'on_process') ? 'Sedang Proses Verifikasi'.toUpperCase()
                      : (invoice.status == 'paid_off') ? 'Terima kasih, Tagihan Lunas!'.toUpperCase()
                      : 'mohon lakukan pembayaran'.toUpperCase(),
                      style: primaryTitleTextStyle,
                    ),
                    sizeBoxVertical,
                    Image.asset(
                      (invoice.status == 'on_process') ? 'assets/images/illustration/process.png'
                      : (invoice.status == 'paid_off') ? 'assets/images/illustration/success.png'
                      : 'assets/images/illustration/payment.png',
                      height: 250,
                    ),
                    (invoice.status == 'new' || invoice.status == 'rejected') ? 
                    Column(
                      children: [
                        sizeBoxVertical,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/images/bank/' + invoice.bankLogo,
                              height: 30,
                              color: secondColor,
                            ),
                            sizeBoxHorizontal,
                            Text(
                              'BANK ' + invoice.bankAccount,
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 20,
                                color: secondColor,
                                fontWeight: FontWeight.bold
                              ),
                            )
                          ],
                        ),
                        sizeBoxVertical,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Nomor rekening',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 14,
                                    color: secondColor,
                                  ),
                                ),
                                Text(
                                  'Nomor faktur',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 14,
                                    color: secondColor,
                                  ),
                                )
                              ],
                            ),
                            sizeBoxHorizontal,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  ':    '+ invoice.accountNumber,
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 14,
                                    color: secondColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  ':    ' + invoice.id.toString(),
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 14,
                                    color: secondColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        divider,
                        //cara pembayaran
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    color: primaryColor.withOpacity(0.2)
                                  ),
                                  child: Center(
                                    child: Text(
                                      '1',
                                      style: TextStyle(
                                        color: secondColor,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Montserrat',
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                                sizeBoxHorizontal,
                                Container(
                                  width: 225,
                                  child: Text(
                                    'Silahkan lakukan transfer berdasarkan metode pembayaran yang telah anda pilih.',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            sizeBoxVertical,
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    color: primaryColor.withOpacity(0.2)
                                  ),
                                  child: Center(
                                    child: Text(
                                      '2',
                                      style: TextStyle(
                                        color: secondColor,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Montserrat',
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                                sizeBoxHorizontal,
                                Container(
                                  width: 225,
                                  child: Text(
                                    'Masukkan Nomor Referensi / Berita / Keterangan dengan Nomor Faktur anda.',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            sizeBoxVertical,
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    color: primaryColor.withOpacity(0.2)
                                  ),
                                  child: Center(
                                    child: Text(
                                      '3',
                                      style: TextStyle(
                                        color: secondColor,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Montserrat',
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                                sizeBoxHorizontal,
                                Container(
                                  width: 225,
                                  child: Text(
                                    'Lakukan konfirmasi pembayaran.',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () => InvoiceService.paymentConfirmation(invoice.id),
                          child: Container(
                            margin: EdgeInsets.only(
                              top: 30,
                              left: 40,
                              right: 40,
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal: 30
                            ),
                            decoration: BoxDecoration(
                              gradient: gradientWarningColor,
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Center(
                              child: Text(
                                'Konfirmasi Pembayaran',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ) :
                    Column(children: [],)
                  ],
                ),
              )
            ),
          )
        ]
      ),
    );
  }
}