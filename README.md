# flutter_scrap

## Website Scraping with Dart (Flutter)

```
void initChaptersTitleScrap() async {
    final rawUrl =
        'https://unacademy.com/course/gravitation-for-iit-jee/D5A8YSAJ';
    final webScraper = WebScraper('https://unacademy.com');
    final endpoint = rawUrl.replaceAll(r'https://unacademy.com', '');
    if (await webScraper.loadWebPage(endpoint)) {
      final titleElements = webScraper.getElement(
          'div.Week__Wrapper-sc-1qeje5a-2 > a.Link__StyledAnchor-sc-1n9f3wx-0 '
          '> div.ItemCard__ItemInfo-xrh60s-1 '
          '> h6.H6-sc-1gn2suh-0',
          []);
      print(titleElements);
      final titleList = <String>[];
      titleElements.forEach((element) {
        final title = element['title'];
        titleList.add('$title');
      });
      print(titleList);
      if (mounted)
        setState(() {
          this.titleList = titleList;
        });
    } else {
      print('Cannot load url');
    }
  }
```

## Read blog

[https://medium.com/@ayushpguptaapg/website-scraping-with-dart-flutter-56db60033d49?sk=8f63064bca080b548660d430c35386ef](https://medium.com/@ayushpguptaapg/website-scraping-with-dart-flutter-56db60033d49?sk=8f63064bca080b548660d430c35386ef)

## Disclaimer
Although this isn't legal for some websites but here the purpose is solely educational
