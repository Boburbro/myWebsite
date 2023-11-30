class Urls {
  Uri addUrls = Uri(
    scheme: "https",
    host: "boburbro.pythonanywhere.com",
    path: "/api/v1/bobur/add-apk",
  );

  Uri getUrl = Uri(
    scheme: "https",
    host: "boburbro.pythonanywhere.com",
    path: "/api/v1/bobur/get",
  );
  Uri deleteUrl = Uri(
    scheme: "https",
    host: "boburbro.pythonanywhere.com",
    path: "/api/v1/bobur/delete-apk-with-row-id",
  );
}
