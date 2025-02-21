// GoRouter configuration
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:lfg_mobile/modules/activity_search/screens/search_page.dart';
import 'package:lfg_mobile/modules/activity_search/screens/search_page_filters.dart';
import 'package:lfg_mobile/modules/create_activity/screens/activity_scaffold.dart';
import 'package:lfg_mobile/modules/create_activity/screens/create_activity.dart';
import 'package:lfg_mobile/modules/create_activity/screens/create_activity_step_four.dart';
import 'package:lfg_mobile/modules/create_activity/screens/create_activity_step_three.dart';
import 'package:lfg_mobile/modules/create_activity/screens/create_activity_step_two.dart';
import 'package:lfg_mobile/modules/location_selector/screens/location_selector.dart';
import 'package:lfg_mobile/modules/my_activities/screens/activities_page.dart';
import 'package:lfg_mobile/modules/notifications/screens/page.dart';
import 'package:lfg_mobile/modules/recover_account/screens/recover_account_page.dart';
import 'package:lfg_mobile/modules/shared/components/bottom_navigation_manu.dart';
import 'package:lfg_mobile/modules/signin/screens/page.dart';
import 'package:lfg_mobile/modules/signup/screens/sign_up_page.dart';
import 'package:lfg_mobile/modules/signup/screens/sign_up_step_page.dart';
import 'package:lfg_mobile/modules/signup/screens/sign_up_step_two_page.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SignInPage(),
    ),
    GoRoute(
      path: '/recover_acount',
      builder: (context, state) => const RecoverAccountPage(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const SignUpPage(),
    ),
    GoRoute(
      path: '/register/step_one',
      builder: (context, state) => const SignUpStepPage(),
    ),
    GoRoute(
      path: '/register/step_tow',
      builder: (context, state) => const SignUpStepTwoPage(),
    ),
    GoRoute(
      path: '/location_selector',
      builder: (context, state) => const LocationSelector(),
    ),
    ShellRoute(
        builder: (BuildContext context, GoRouterState state, Widget child) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                AppLocalizations.of(context)!.activities,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                    fontSize:
                        Theme.of(context).textTheme.headlineLarge!.fontSize),
              ),
              actions: const [
                CircleAvatar(
                    minRadius: 50,
                    backgroundImage: AssetImage(
                        "assets/iaavatar.jpg") // replace with your image
                    ),
              ],
            ),
            body: child,
            bottomNavigationBar: BottomNavigationMenu(currentPath: state.fullPath!),
          );
        },
        routes: [
          GoRoute(
            path: '/search',
            builder: (context, state) => const SearchPage(),
          ),
          GoRoute(
            path: '/search/filters',
            builder: (context, state) => const SearchPageFilters(),
          ),
          GoRoute(
            path: '/notifications',
            builder: (context, state) => const NotificationsPage(),
          ),
          GoRoute(
            path: '/activities',
            builder: (context, state) => const ActivitiesPage(),
          ),
        ]),
    ShellRoute(
        builder: (BuildContext context, GoRouterState state, Widget child) {
          return ActivityScaffold(currentPath: state.fullPath!,child: child,);
        },
        routes: [
          GoRoute(
            path: '/create_activity',
            builder: (context, state) => const CreateActivityPage(),
          ),
          GoRoute(
            path: '/create_activity/step_two',
            builder: (context, state) => const CreateActivityStepTwoPage(),
          ),
          GoRoute(
            path: '/create_activity/step_three',
            builder: (context, state) => const CreateActivityStepThreePage(),
          ),
          GoRoute(
            path: '/create_activity/step_four',
            builder: (context, state) => const CreateActivityStepFourPage(),
          ),
        ]),
  ],
);
