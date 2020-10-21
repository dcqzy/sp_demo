import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:flutter_sp_demo/styleSheets/styles.dart';

import 'Business/pages/index_home_page.dart';

class StarterHandler {
  /// 富文本示例
  static buildRichHtml() {
    return ButtonBarTheme(
        data: ButtonBarThemeData(alignment: MainAxisAlignment.center),
        child: Scaffold(
          appBar: AppBar(
            title: Text("富文本使用demo"),
          ),
          body: ButtonBarTheme(
            data: ButtonBarThemeData(alignment: MainAxisAlignment.center),
            child: Container(
              alignment: Alignment.center,
              child: Html(
                data: """
            <div>
              <h1>Demo Page</h1>
              <p>This is a fantastic product that you should buy!</p>
              <h3>Features</h3>
              <ul>
                <li>It actually works</li>
                <li>It exists</li>
                <li>It doesn't cost much!</li>
              </ul>
              <!--You can pretty much put any html in here!-->
            </div>
          """,
                onLinkTap: (url) {
                  // open url in a webview
                },
                style: {
                  "div": Style(backgroundColor: Colors.blue),
                },
                onImageTap: (src) {
                  // Display the image in large form.
                },
              ),
            ),
          ),
        ));
  }

  /// 显示样式分离控件
  static showThemeWidget(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("样式分离demo"),
      ),
      body: Column(children: [
        Row(
          children: [
            Flexible(
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(
                    // 此处使用样式文件中的样式
                    left: CarrerIndexStyles.mainContainerPadding),
                color: Colors.red,
                child: Text(
                  '使用通用文本样式2dasfdd使用通用文本样式2dasfdd使用通用文本样式2dasfdd使用通用文本样式2dasfdd使用通用文本样式2dasfdd使用通用文本样式2dasfdd使用通用文本样式2dasfdd使用通用文本样式2dasfdd使用通用文本样式2dasfdd使用通用文本样式2dasfdd使用通用文本样式2dasfdd使用通用文本样式2dasfdd使用通用文本样式2dasfdd使用通用文本样式2dasfdd使用通用文本样式2dasfdd使用通用文本样式2dasfdd使用通用文本样式2dasfdd使用通用文本样式2dasfdd',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: CarrerIndexStyles.commonTextStyle,
                ),
              ),
            ),
          ],
        ),
      ]),
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(accentColor: Colors.yellow),
        child: FloatingActionButton(
          onPressed: null,
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  /// Qubic 示例
  static showQubicPage(context) {
    return IndexHomePage();
  }
}
