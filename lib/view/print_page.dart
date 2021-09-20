// ignore_for_file: public_member_api_docs

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

Future<void> main() async {
  runApp(const PrintDoc('Printing Demo'));
}

class PrintDoc extends StatelessWidget {
  const PrintDoc(this.title, {Key? key}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Preview")),
        body: PdfPreview(
          allowSharing: true,
          allowPrinting: true,
          pdfFileName: "Test",
          build: (format) => _generatePdf(format, title),
        ),
      ),
    );
  }

  Future<Uint8List> _generatePdf(PdfPageFormat format, String title) async {
    final pdf = pw.Document(version: PdfVersion.pdf_1_4, compress: true);
    final font = await PdfGoogleFonts.archivoMedium();

    pdf.addPage(
      pw.Page(
        pageFormat: format,
        clip: false,
        build: (context) {
          return pw.Column(
            children: [
              pw.Container(
                width: double.infinity,
                child: pw.Container(
                  child: pw.Text(title,
                      style: pw.TextStyle(
                        font: font,
                        fontSize: 24,
                        height: 1.5,
                        letterSpacing: 0.3,
                      )),
                ),
              ),
              // pw.SizedBox(height: 20),
              // pw.Flexible(child: pw.FlutterLogo())
            ],
          );
        },
      ),
    );

    return pdf.save();
  }
}
