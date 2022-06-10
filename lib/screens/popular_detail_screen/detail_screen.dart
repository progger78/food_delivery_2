import 'package:flutter/material.dart';

import 'components/popular_detail_body.dart';

class PopularDetailScreen extends StatelessWidget {
  const PopularDetailScreen({Key? key, required this.pageId}) : super(key: key);
  final int pageId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopularDetailBody(pageId: pageId),
    );
  }
}
