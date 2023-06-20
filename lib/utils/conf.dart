const List<int> ports = [50500, 50050];

// only for fetching update
const String currentVersion = '3.5.0';
const String multipleFilesDelimiter = '|sharik|';

const Sources source = Sources.gitHub;

enum Sources {
  gitHub,
  githubRelease,
  playStore,
  snap,
  windowsStore,
  appStore,
  none
}

// todo fix urls & add another distributions methods
String source2url(Sources source) {
  switch (source) {
    case Sources.gitHub:
      return 'https://github.com/marchellodev/sharik';
    case Sources.githubRelease:
      return 'https://github.com/marchellodev/sharik/releases';
    case Sources.playStore:
      return 'https://play.google.com/store/apps/details?id=dev.marchello.sharik';
    case Sources.snap:
      return 'https://snapcraft.io/sharik-app';
    case Sources.windowsStore:
      return 'https://www.microsoft.com/store/apps/9NGCLB7JSPR9';
    case Sources.appStore:
      return 'https://apps.apple.com/app/id1531473857';

    case Sources.none:
      return 'https://unknown.com';
  }
}
