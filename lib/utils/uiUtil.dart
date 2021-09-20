
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mecar_test/common/theme/textStyle.dart';
import 'package:mecar_test/common/widget/my_text_view.dart';
import 'package:transparent_image/transparent_image.dart';

const  ARR_BG_AVATAR = [Color(0xffabecd6),Color(0xffc7e5b4),Color(0xFF9F9F9F),Color(0xffFFD500),Color(0xffffbc12),Color(0xffffc2a1),Color(0xff395AFF),Color(0xffffb1bb)];

ImageProvider makeImageDecoration(String url) {
  url = (url == null || url.isEmpty) ? "assets/image/default.jpg" : url;
  ImageProvider imgProvider;
  if (url.contains('http') || url.contains('https')) {
    imgProvider =
        FadeInImage.memoryNetwork(image: url, placeholder: kTransparentImage)
            .image;
  } else {
    imgProvider = AssetImage(url);
  }
  return imgProvider;
}



Widget makeImageWidget(String url,
    {double width,
    double height,
    BoxFit boxFit,
    Color color,
    BlendMode blendMode}) {
  ByteData placeHolderImage;
  rootBundle.load('assets/image/user_default.jpg').then((value) => placeHolderImage = value);
  url = (url == null || url.isEmpty) ? "assets/image/user_default.jpg" : url;
  Widget imgWidget;
  if (url.contains('http') || url.contains('https')) {
    imgWidget = FadeInImage.memoryNetwork(
      image: url,
      width: width,
      height: height,
      fit: boxFit,
      placeholder:  kTransparentImage ,
    );
  } else {
    imgWidget = Image.asset(
      url,
      width: width,
      height: height,
      colorBlendMode: blendMode,
      color: color,
      fit: boxFit,
    );
  }
  return imgWidget;
}



Widget makeCircleImageWidget(String url,
    {double size,
    Color color,
    bool shadowOn = false,
    String initialName,
    TextStyle textStyle}) {
  if ((url == null || url.isEmpty) &&
      initialName != null &&
      initialName.isNotEmpty) {
    textStyle = textStyle ?? textNormal;
    List<String> listWords = initialName.split(" ");
    String lastWord = listWords[listWords.length - 1];
    String firstCharacter = lastWord[0].toUpperCase();

    int sumCharsCode = 0;
    lastWord.codeUnits.forEach((e) => sumCharsCode += e);

    int pickRandomBgColor = sumCharsCode % ARR_BG_AVATAR.length;
    return new Container(
        width: size,
        height: size,
        alignment: Alignment.center,
        child: MyTextView(
          text: firstCharacter,
          textStyle: textStyle.copyWith(color: Colors.white),
        ),
        decoration: new BoxDecoration(
          boxShadow: shadowOn
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    spreadRadius: size * 0.08,
                    blurRadius: size * 0.04,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ]
              : null,
          shape: BoxShape.circle,
          color: ARR_BG_AVATAR[pickRandomBgColor],
        ));
  }
  return new Container(
      width: size,
      height: size,
      decoration: new BoxDecoration(
          boxShadow: shadowOn
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    spreadRadius: size * 0.08,
                    blurRadius: size * 0.04,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ]
              : null,
          shape: BoxShape.circle,
          color: color,
          image: new DecorationImage(
              fit: BoxFit.cover, image: makeImageDecoration(url))));
}
