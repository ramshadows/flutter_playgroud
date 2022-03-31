// Creating a route information parser

import 'package:flutter/cupertino.dart';
import 'package:fooderlich4/navigation/app_link.dart';

// AppRouteParser extends RouteInformationParser . Notice it takes a generic
// type. In this case, your type is AppLink , which holds all the route and 
// navigation information.
class AppRouteParser extends RouteInformationParser<AppLink> {
  // The first method you need to override is parseRouteInformation() . 
  // The route information contains the URL string.
  // Take the route information and build an instance of AppLink from it.
  @override
  Future<AppLink> parseRouteInformation(
      RouteInformation routeInformation) async {
    final link = AppLink.fromLocation(routeInformation.location);

    return link;
  }

  // The second method you need to override is restoreRouteInformation()
  // This function passes in an AppLink object. You ask AppLink to give you 
  // back the URL string.
  // You wrap it in RouteInformation to pass it along.
  @override
  RouteInformation restoreRouteInformation(AppLink configuration) {
    final location = configuration.toLocation();

    return RouteInformation(location: location);
  }
}
