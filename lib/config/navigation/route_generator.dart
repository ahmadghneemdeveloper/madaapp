import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:madaapp/presentation/auth/login/view/page/login_page.dart';
import 'package:madaapp/presentation/auth/register/view/pages/auth_otp.dart';
import 'package:madaapp/presentation/auth/register/view/pages/register.dart';
import 'package:madaapp/presentation/bookings/view/pages/booking_page.dart';
import 'package:madaapp/presentation/bookings/view/pages/date_page.dart';
import 'package:madaapp/presentation/bookings/view/pages/tickets_available_page.dart';
import 'package:madaapp/presentation/bookings/view/pages/witting_page.dart';
import 'package:madaapp/presentation/eservation_details/view/pages/reservation_details.dart';
import 'package:madaapp/presentation/home/view/pages/home_page.dart';
import 'package:madaapp/presentation/mybooking/view/pages/flight_reservations.dart';
import 'package:madaapp/presentation/mybooking/view/pages/mybooking_page.dart';
import 'package:madaapp/presentation/pricing_details_page/view/pages/pricing_details_page.dart';
import 'package:madaapp/presentation/profile/component/settings.dart';
import 'package:madaapp/presentation/profile/profile.dart';
import 'package:madaapp/presentation/traveler_data/view/pages/traveler_data_page.dart';
import 'package:madaapp/presentation/traveler_data/view/pages/traveler_input_page.dart';

import '../../presentation/component/screens/undefined_route_screen.dart';
import '../../presentation/splash/splash.dart';
import 'navigation.dart';

class RouteGenerator {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return platformPageRoute(const SplashScreen());
      case Routes.loginScreen:
        return platformPageRoute( LoginPage());
      case Routes.homeScreen:
        return platformPageRoute( HomePages());
 case Routes.profileScreen:
        return platformPageRoute( ProfilePages());
      case Routes.settings:
        return platformPageRoute( SettingScreen());
        case Routes.booking:
        return platformPageRoute( BookingPages());
        case Routes.mybooking:
        return platformPageRoute( MyBooking());
case Routes.flightreservations:
        return platformPageRoute( FlightReservations());
case Routes.reservationsdetails:
        return platformPageRoute( ReservationsDetails());
        case Routes.datepage:
        return platformPageRoute( DatePage());
        case Routes.wittingpage:
        return platformPageRoute( WittingPage());
        case Routes.ticketsavailable:
        return platformPageRoute( TicketsAvailable());
        case Routes.travelerdata:
        return platformPageRoute( TravelerData());
        case Routes.travelerinput:
        return platformPageRoute( TravelerInput());
      case Routes.pricingdetails:
        return platformPageRoute( PricingDetails());
        case Routes.registerpage:
        return platformPageRoute( RegisterPage());
        case Routes.myotp:
        return platformPageRoute( OTPScreen());




/*      case Routes.checkoutScreen:
        final args = settings.arguments as Map<String, dynamic>;
        return platformPageRoute(CheckoutScreen(
          cartData: args["cartData"],
        ));*/

      default:
        return platformPageRoute(const UndefinedRouteScreen());
    }
  }
}
