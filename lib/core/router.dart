import 'package:alen/features/articles/domain/entity/article.dart';
import 'package:alen/features/articles/view/add_article.dart';
import 'package:alen/features/articles/view/article_selected.dart';
import 'package:alen/features/auth/view/sign_in_screen.dart';
import 'package:alen/features/auth/view/sing_up_screen.dart';
import 'package:alen/features/forum/domain/entity/question.dart';
import 'package:alen/features/forum/view/add_answer.dart';
import 'package:alen/features/forum/view/ask_question_screen.dart';
import 'package:alen/features/forum/view/forum_screen.dart';
import 'package:alen/features/forum/view/selected_question.dart';
import 'package:alen/features/menu/menu_screen.dart';
import 'package:alen/features/articles/view/articles_screen.dart';
import 'package:alen/features/profil/view/change_info_screen.dart';
import 'package:alen/features/profil/view/profil_screen.dart';
import 'package:alen/features/qr/qr_view_screen.dart';
import 'package:alen/features/qr/view/qr_screen.dart';
import 'package:alen/features/splash_creen.dart';
import 'package:alen/features/story/story_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

GoRouter getRouter(BuildContext context) {
  final GoRouter router = GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/splash',
        pageBuilder: (context, state) =>
            buildAnimatedRouting(state, const SplashScreen()),
      ),
      GoRoute(
        path: '/sign_in',
        pageBuilder: (context, state) => buildAnimatedRouting(
          state,
          SignInScreen(),
        ),
        routes: [
          GoRoute(
            path: 'sign_up',
            pageBuilder: (context, state) => buildAnimatedRouting(
              state,
              SingUpScreen(),
            ),
          ),
        ],
      ),
      StatefulShellRoute.indexedStack(
        pageBuilder: (context, state, navigationShell) {
          return buildAnimatedRouting(
            state,
            MenuScreen(
              navigationShell: navigationShell,
            ),
          );
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profil',
                name: 'profil',
                pageBuilder: (context, state) =>
                    buildAnimatedRouting(state, const ProfilScreen()),
                routes: [
                  GoRoute(
                    path: 'change_info',
                    name: 'change_info',
                    pageBuilder: (context, state) => buildAnimatedRouting(
                      state,
                      ChangeInfoScreen(),
                    ),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/task',
                name: 'task',
                pageBuilder: (context, state) =>
                    buildAnimatedRouting(state, const ArticleScreen()),
                routes: [
                  GoRoute(
                      path: 'selected_article',
                      name: 'selected_article',
                      pageBuilder: (context, state) {
                        return buildAnimatedRouting(
                          state,
                          SelectedArticle(
                            article: state.extra as Article,
                          ),
                        );
                      }),
                  GoRoute(
                      path: 'add_article',
                      name: 'add_article',
                      pageBuilder: (context, state) {
                        return buildAnimatedRouting(
                          state,
                          AddArticle(),
                        );
                      })
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/forum',
                name: 'forum',
                pageBuilder: (context, state) =>
                    buildAnimatedRouting(state, const ForumScreen()),
                routes: [
                  GoRoute(
                    path: 'select_question',
                    name: 'select_question',
                    routes: [
                      GoRoute(
                        path: 'answer_question',
                        name: 'answer_question',
                        pageBuilder: (context, state) => buildAnimatedRouting(
                          state,
                          AddAnswerScreen(
                            question: state.extra as Question,
                          ),
                        ),
                      ),
                    ],
                    pageBuilder: (context, state) => buildAnimatedRouting(
                        state,
                        SelectedQuestion(
                          question: state.extra as Question,
                        )),
                  ),
                  GoRoute(
                    path: 'ask_question',
                    name: 'ask_question',
                    pageBuilder: (context, state) =>
                        buildAnimatedRouting(state, AskQuestionScreen()),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/story',
                pageBuilder: (context, state) => buildAnimatedRouting(
                  state,
                  StoryScreen(),
                ),
              )
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/qr',
                name: 'qr',
                routes: [
                  GoRoute(
                    path: 'qr_scan',
                    name: 'qr_scan',
                    pageBuilder: (context, state) =>
                        buildAnimatedRouting(state, QrViewScreeen()),
                  )
                ],
                pageBuilder: (context, state) =>
                    buildAnimatedRouting(state, QrScreen()),
              ),
            ],
          ),
        ],
      ),
    ],
  );

  return router;
}

//Анимация переходов
buildAnimatedRouting(GoRouterState state, Widget screen) {
  return CustomTransitionPage(
    key: state.pageKey,
    transitionDuration: const Duration(milliseconds: 225),
    reverseTransitionDuration: const Duration(milliseconds: 225),
    child: screen,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
        child: child,
      );
    },
  );
}
