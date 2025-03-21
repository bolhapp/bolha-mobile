import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lfg_mobile/modules/core/routes/routes.dart';
import 'package:lfg_mobile/modules/core/theme/theme.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  // todo: configure environment, release and whatever else might be useful
  // todo: setup flavors
  await SentryFlutter.init(
    (options) {
      // disabled until flavors are implemented as we don't want this to be active during dev
      // options.dns = 'https://73498c6341cd47a98ef1b7b4b376096d@o4507935073107968.ingest.de.sentry.io/4509015290085456';
      options.dsn = "";
      // Adds request headers and IP for users,
      // visit: https://docs.sentry.io/platforms/dart/data-management/data-collected/ for more info
      options.sendDefaultPii = true;
    },
    appRunner: () => runApp(
      SentryWidget(
        child: Bolha(),
      ),
    ),
  );
}

class Bolha extends StatelessWidget {
  const Bolha({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'LFG Mobile',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
      ],
      theme: appTheme,
    );
  }
}
