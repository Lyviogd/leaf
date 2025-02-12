import 'package:flutter/material.dart';
import 'package:leaf/modelS/post_model.dart';

class InheritedPostModel extends InheritedWidget {
  final PostModel? postData;
  final Widget child;

  const InheritedPostModel({
    Key? key,
    this.postData,
    required this.child,
  }) : super(key: key, child: child);

  static InheritedPostModel of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<InheritedPostModel>()
        as InheritedPostModel);
  }

  @override
  bool updateShouldNotify(InheritedPostModel oldWidget) {
    return true;
  }
}
