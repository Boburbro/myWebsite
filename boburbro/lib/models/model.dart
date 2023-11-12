class Sayt {
  final String title;
  final String subtitle;
  final String url;

  Sayt({required this.title, required this.subtitle, required this.url});
}

class Saytlar {
  final List<Sayt> _list = [
    Sayt(
        title: "Modul 7",
        subtitle: "Ovqatlar menusi +ButtonNavigationBar",
        url: "https://modul7.netlify.app"),
    Sayt(
        title: "Modul 7",
        subtitle: "Ovqatlar menusi +tab bar",
        url: "https://modul7.netlify.app/#/2"),
    Sayt(
        title: "Modul 6 hometask",
        subtitle: "Number quizz app",
        url: "https://modul6-hometask.netlify.app/"),
    Sayt(
        title: "Modul 5 hometask",
        subtitle: "TicTacToe app",
        url: "https://hometask-modul5.netlify.app/"),
    Sayt(
        title: "Modul 5",
        subtitle: "My Wallet",
        url: "https://modul5.netlify.app/"),
    Sayt(
        title: "Modul 4 hometask",
        subtitle: "My wallet for hometask",
        url: "https://mywallet-m.netlify.app/"),
    Sayt(
        title: "Modul 4",
        subtitle: "ToDo app",
        url: "https://modul4.netlify.app/"),
    Sayt(
        title: "Modul 2",
        subtitle: "Foydalanuvchi ro'yxati",
        url: "https://modul2-7.netlify.app/"),
    Sayt(
        title: "First hometask",
        subtitle: "Malumotlar va button set state bilan",
        url: "https://first-hometask.netlify.app/"),
    Sayt(
        title: "First app",
        subtitle: "Quizz app",
        url: "https://first-app-bobur.netlify.app/"),
  ];
  List<Sayt> get list {
    return _list;
  }
}
