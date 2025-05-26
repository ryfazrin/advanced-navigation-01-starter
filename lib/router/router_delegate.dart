import 'package:declarative_navigation/model/quote.dart';
import 'package:declarative_navigation/screen/quote_detail_screen.dart';
import 'package:declarative_navigation/screen/quotes_list_screen.dart';
import 'package:flutter/material.dart';

class MyRouterDelegate extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final GlobalKey<NavigatorState> _navigatorKey;

  MyRouterDelegate() : _navigatorKey = GlobalKey<NavigatorState>();

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  String? selectedQuote;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
          key: const ValueKey("QuotesListPage"),
          child: QuotesListScreen(
            quotes: quotes,
            onTapped: (String quoteId) {
              selectedQuote = quoteId;
              notifyListeners();
            },
          ),
        ),
        if (selectedQuote != null)
          MaterialPage(
            key: ValueKey("QuoteDetailsScreen-$selectedQuote"),
            child: QuoteDetailsScreen(
              quoteId: selectedQuote!,
            ),
          ),
      ],
      onDidRemovePage: (page) {
        if (page.key == ValueKey("QuoteDetailsScreen-$selectedQuote")) {
          selectedQuote = null;
          notifyListeners();
        }
      },
    );
  }

  @override
  Future<void> setNewRoutePath(configuration) async {
    /* Do Nothing */
  }
}