import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:spicy_destop_invoic_app/examples/report.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:spicy_destop_invoic_app/models/cartModel.dart';

class MyViewPrint extends StatefulWidget {

  List<CartModel> allCart;
  double totalPrice;

  MyViewPrint(
    this.allCart,
    this.totalPrice,
  );

  @override
  _MyViewPrintState createState() => _MyViewPrintState();
}

class _MyViewPrintState extends State<MyViewPrint> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: PdfPreview(
         
                                                  maxPageWidth: 100,
          build: (format) =>_generatePdf(format,widget.allCart,widget.totalPrice ) ,//generateCalendar(format, _data),
          // actions: actions,
        onPrinted:Navigator.of(context).pop,
        // onError: Navigator.of(context).pop,
        // _showPrintedToast,
        // onShared: _showSharedToast,

        ),
    );
  }

  
  

  Future<void> _saveAsFile(
    BuildContext context,
    LayoutCallback build,
    PdfPageFormat pageFormat,
  ) async {
    final bytes = await build(pageFormat);

    final appDocDir = await getApplicationDocumentsDirectory();
    final appDocPath = appDocDir.path;
    final file = File(appDocPath + '/' + 'document.pdf');
    print('Save as file ${file.path} ...');
    await file.writeAsBytes(bytes);
    await OpenFile.open(file.path);
  }
  //  Future<Uint8List> _generatePdf(PdfPageFormat format, String title) async {
  //   final pdf = Document();
  //   final font = await PdfGoogleFonts.nunitoExtraLight();
  //   print("print called");

  //   pdf.addPage(
  //   Page(
  //       pageFormat: format,
  //       build: (context) {
  //         return Column(
  //           children: [
  //             SizedBox(
  //               width: double.infinity,
  //               child: FittedBox(
  //                 child: Text(title, style: TextStyle(font: font)),
  //               ),
  //             ),
  //             SizedBox(height: 20),
  //             Flexible(child: FlutterLogo())
  //           ],
  //         );
  //       },
  //     ),
  //   );

  //   return pdf.save();
  // }

  Future<Uint8List> _generatePdf(PdfPageFormat format,List<CartModel> allCart,double totalPrice) async {
    final pdf = pw.Document();//version: PdfVersion.pdf_1_5, compress: true
    // final font = await PdfGoogleFonts.nunitoExtraLight();

    pdf.addPage(
      pw.Page(
        pageFormat: format,
        build: (context) {
          return pw.Column(
            children: [
              pw.SizedBox(
                width: double.infinity,
                child: pw.FittedBox(
                  child: pw.Text("Rehman plaza near ghazi Khan pump gate 3 main road KDA Kohat", style: pw.TextStyle(fontSize: 20 )),
                ),
              ),
              pw.SizedBox(height: 20),
              // pw.Flexible(child: pw.FlutterLogo())
             pw.Container(
                                          // color:Colors.white,
                                          child: pw.ListView.separated(
                                            separatorBuilder:
                                                (context, index) => pw.Divider(),
                                            itemCount: allCart.length,
                                            itemBuilder: (context, index) {
                                            
                                              return 
                                            

                                              
                                              
                                              // Text(allCart[index].tableNo.toString()+allCart[index].price.toString()+allCart[index].quantity.toString()+allCart[index].item+allCart[index].img)
                                              pw.Container(
                                                margin:pw.EdgeInsets.only(left: 10),
                                                height: 40,
                                                child: pw.Row(
                                                  children: [
                                                   pw. Flexible(
                                                      flex: 4,
                                                      fit: pw.FlexFit.tight,
                                                      child: pw.Container(
                                                        // color: Colors.amber,
                                                        child:
                                                            pw.Text(allCart[index].item),
                                                      ),
                                                    ),
                                                   pw. Flexible(
                                                      flex: 2,
                                                      fit: pw.FlexFit.tight,
                                                      child: pw.Container(
                                                        margin:
                                                            pw.EdgeInsets.only(
                                                                top: 5,
                                                                bottom: 5,
                                                                left: 5,
                                                                right: 5),
                                                        decoration:pw. BoxDecoration(
                                                            border:pw. Border.all(
                                                                width: 1,
                                                                )),
                                                        child:pw. Text(allCart[index].quantity.toString()),
                                                      ),
                                                    ),
                                                    pw.Flexible(
                                                      flex: 2,
                                                      fit: pw.FlexFit.tight,
                                                      child:pw. Container(
                                                        child:pw. Text(allCart[index].price.toString()),
                                                      ),
                                                    ),
                                                   
                                                  ],
                                                ));
                                              
                                            },
                                          ),
                                        ),
            pw.Row(
              children: [
               pw. Text('Total'),
               pw. Text(totalPrice.toString())
              ]
            ),
            ],
          );
        },
      ),
    );

    return pdf.save();
  }

  
  void _showPrintedToast(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Document printed successfully'),
      ),
    );
  }

  void _showSharedToast(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Document shared successfully'),
      ),
    );
  }


}