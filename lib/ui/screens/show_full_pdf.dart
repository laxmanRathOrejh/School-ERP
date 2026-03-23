import 'package:flutter/material.dart';
import 'package:school_erp/ui/widgets/appbaw_with_back_buton_widgets.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ShowFullPdf extends StatelessWidget {
  final String pdfdata;
  const ShowFullPdf({super.key, required this.pdfdata});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWithBackWidget(titleText: "Detail pdf"),
      body: SafeArea(child: SfPdfViewer.network(pdfdata)),
    );
  }
}
