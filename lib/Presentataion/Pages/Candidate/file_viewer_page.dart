import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/material.dart';

import 'package:smart_recruiter/Constants/app_constants.dart';

class FileViewer extends StatefulWidget {
  const FileViewer({super.key, required this.pdfFile});
  final String pdfFile;

  @override
  State<FileViewer> createState() => _FileViewerState();
}

class _FileViewerState extends State<FileViewer> {
  PDFDocument? document;

  void initializePDF() async {
    try {
      document = await PDFDocument.fromURL(widget.pdfFile);
      setState(() {});
    } catch (e) {
      print("Error loading PDF: $e");
    }
  }

  void initState() {
    super.initState();
    initializePDF();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: const Text("Job Requirements"),
        centerTitle: true,
        backgroundColor: AppColors.backgroundColor,
      ),
      body: document != null
          ? Container(
              height: 670,
              child: PDFViewer(
                backgroundColor: AppColors.backgroundColor,
                pickerButtonColor: AppColors.teal,
                indicatorBackground: AppColors.teal,
                document: document!,
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
