enum AppRoutes {
  home('/home'),
  details('/apod-details'),
  initial('/');

  final String path;

  const AppRoutes(this.path);
}
