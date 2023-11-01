class Sayt{
  final String title;
  final String subtitle;
  final String url;

  Sayt({
    required this.title,
    required this.subtitle,
    required this.url
  });
}

class Saytlar {
  final List<Sayt> _list = [
    Sayt(title: "Modul 6 hometask", subtitle: " ", url: "https://modul6-hometask.netlify.app/"),
    Sayt(title: "Modul 5 hometask", subtitle: " ", url: "https://hometask-modul5.netlify.app/"),
    Sayt(title: "Modul 5", subtitle: " ", url: "https://modul5.netlify.app/"),
    Sayt(title: "Modul 5 (2)", subtitle: " ", url: "https://mywallet-m.netlify.app/"),

  ];
  List<Sayt> get list {
    return _list;
  }
}