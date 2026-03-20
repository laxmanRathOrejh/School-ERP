import 'dart:io';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ShowFullPdf extends StatelessWidget {
  final String pdfdata;
  const ShowFullPdf({super.key, required this.pdfdata});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: SfPdfViewer.network(pdfdata)));
  }
}
