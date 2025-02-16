import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:leaf/helper/demo_values.dart';
import 'package:leaf/models/post_model.dart';
import 'package:leaf/view/presentation/theme.dart';
import 'package:leaf/view/pages/post_page.dart';
import 'package:leaf/view/widgets/inherited_widgets/inherited_post_model.dart';

bool _isLandscape(BuildContext context) =>
    MediaQuery.of(context).orientation == Orientation.landscape;

class PostCard extends StatelessWidget {
  final PostModel postData;

  const PostCard({Key? key, required this.postData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double aspectRatio = _isLandscape(context) ? 6 / 2 : 6 / 3;

    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return PostPage();
        }));
      },
      child: AspectRatio(
        aspectRatio: aspectRatio,
        child: Card(
          elevation: 2,
          child: Container(
            margin: const EdgeInsets.all(4.0),
            padding: const EdgeInsets.all(4.0),
            child: InheritedPostModel(
              postData: postData,
              child: Column(
                children: <Widget>[
                  _Post(),
                  Divider(color: Color.fromARGB(255, 235, 188, 60)),
                  _PostDetails(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Post extends StatelessWidget {
  const _Post({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Row(children: <Widget>[_PostImage(), _PostTitleAndSummary()]),
    );
  }
}

class _PostTitleAndSummary extends StatelessWidget {
  const _PostTitleAndSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle? titleTheme = Theme.of(context).textTheme.titleLarge;
    final TextStyle? summaryTheme = Theme.of(context).textTheme.bodyMedium;
    final PostModel postData =
        InheritedPostModel.of(context).postData as PostModel;
    if (postData == null) {
      return Text("Y a pas de données là :73");
    }
    final String? title = postData.title;
    final String? summary = postData.summary;
    final flex = _isLandscape(context) ? 5 : 3;

    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.only(left: 4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(title!, style: titleTheme),
            SizedBox(height: 2.0),
            Text(summary!, style: summaryTheme),
          ],
        ),
      ),
    );
  }
}

class _PostImage extends StatelessWidget {
  const _PostImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PostModel postData =
        InheritedPostModel.of(context).postData as PostModel;
    if (postData == null) {
      return Text("Y a pas de données là :73");
    }
    return Expanded(flex: 2, child: Image.asset(postData.imageURL!));
  }
}

class _PostDetails extends StatelessWidget {
  const _PostDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        _UserImage(),
        _UserNameAndEmail(),
        _PostTimeStamp(),
      ],
    );
  }
}

class _UserNameAndEmail extends StatelessWidget {
  const _UserNameAndEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle? nameTheme = Theme.of(context).textTheme.subtitle1;
    final TextStyle? emailTheme = Theme.of(context).textTheme.bodyMedium;
    final PostModel postData =
        InheritedPostModel.of(context).postData as PostModel;
    if (postData == null) {
      return Text("Y a pas de données là :73");
    }
    return Expanded(
      flex: 5,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(postData.author!.name!, style: nameTheme),
            SizedBox(height: 2.0),
            Text(postData.author!.email!, style: emailTheme),
          ],
        ),
      ),
    );
  }
}

class _UserImage extends StatelessWidget {
  const _UserImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PostModel postData =
        InheritedPostModel.of(context).postData as PostModel;
    if (postData == null) {
      return Text("Y a pas de données là :73");
    }
    return Expanded(
      flex: 1,
      child: CircleAvatar(
        backgroundImage: AssetImage(postData.author!.image!),
      ),
    );
  }
}

class _PostTimeStamp extends StatelessWidget {
  const _PostTimeStamp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle timeTheme = TextThemes.dateStyle;
    final PostModel postData =
        InheritedPostModel.of(context).postData as PostModel;
    if (postData == null) {
      return Text("Y a pas de données là :73");
    }
    return Expanded(
      flex: 2,
      child: Text(postData.postTimeFormatted as String, style: timeTheme),
    );
  }
}
