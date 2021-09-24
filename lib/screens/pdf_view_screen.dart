import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/file.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:pdf_render/pdf_render_widgets.dart';

class PdfViewScreen extends StatefulWidget {
  static const String routename = '/pdf_view_screen';

  @override
  _PdfViewScreenState createState() => _PdfViewScreenState();
}

class _PdfViewScreenState extends State<PdfViewScreen> {

  @override
  Widget build(BuildContext context) {
    final PdfViewScreenArguments args =
        // ignore: cast_nullable_to_non_nullable
        ModalRoute.of(context)!.settings.arguments as PdfViewScreenArguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.name, style: Theme.of(context).textTheme.bodyText1),
      ),
      body: FutureBuilder(
        future: DefaultCacheManager().getSingleFile(
          args.url,
        ),
        builder: (
          BuildContext context,
          AsyncSnapshot<File> snapshot,
        ) =>
            snapshot.connectionState == ConnectionState.waiting
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : snapshot.hasData
                    ? PdfViewer.openFile(
                        snapshot.data!.path,
                      )
                    : const Center(
                        child: Text('Error Occured'),
                      ),
      ),
    );
  }
}

class PdfViewScreenArguments {
  PdfViewScreenArguments({
    required this.name,
    required this.url,
  });
  String url;
  String name;
}
