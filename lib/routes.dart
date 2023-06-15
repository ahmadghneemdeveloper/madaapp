
import 'package:get/get.dart';
import 'package:madaapp/presentation/auth/login/view/page/login_page.dart';
import 'package:madaapp/presentation/auth/register/view/pages/auth_otp.dart';
import 'package:madaapp/presentation/auth/register/view/pages/register.dart';
import 'package:madaapp/presentation/bookings/view/pages/booking_page.dart';
import 'package:madaapp/presentation/bookings/view/pages/tickets_available_page.dart';
import 'package:madaapp/presentation/bookings/view/pages/witting_page.dart';
import 'package:madaapp/presentation/eservation_details/view/pages/reservation_details.dart';
import 'package:madaapp/presentation/home/view/pages/home_page.dart';
import 'package:madaapp/presentation/mybooking/view/pages/flight_reservations.dart';
import 'package:madaapp/presentation/mybooking/view/pages/mybooking_page.dart';
import 'package:madaapp/presentation/pricing_details_page/view/pages/pricing_details_page.dart';
import 'package:madaapp/presentation/profile/component/settings.dart';
import 'package:madaapp/presentation/profile/view/pages/profile_page.dart';
import 'package:madaapp/presentation/splash/view/screens/splash_screen.dart';
import 'package:madaapp/presentation/splash/view_model/SplashBinding.dart';
import 'package:madaapp/presentation/traveler_data/view/pages/traveler_data_page.dart';
import 'package:madaapp/presentation/traveler_data/view/pages/traveler_input_page.dart';

import 'presentation/auth/login/binding/login_binding.dart';


List<GetPage<dynamic>>? routes = [
  GetPage(
    name: "/splashScreen",
    page: () => const SplashScreen(),
    binding: SplashBinding(),
  ),
  GetPage(
    name: "/loginScreen",
    page: () => const LoginPage(),
binding:LoginBinding()
  ),
  GetPage(
    name: "/homeScreen",
    page: () => const HomePages(),
  ),
  GetPage(
    name: "/profileScreen",
    page: () => ProfilePages(),
  ),

  GetPage(
    name: "/settings",
    page: () => const SettingScreen(),
  ),
  GetPage(
    name: "/booking",
    page: () => const BookingPages(),
  ),
  GetPage(
    name: "/mybooking",
    page: () => const MyBooking(),
  ),
  GetPage(
    name: "/flightreservations",
    page: () => const FlightReservations(),
  ),
  GetPage(
    name: "/reservationsdetails",
    page: () => const ReservationsDetails(),
  ),
  GetPage(
    name: "/datepage",
    page: () => const WittingPage(),
  ),

  GetPage(
    name: "/ticketsavailable",
    page: () => const TicketsAvailable(),
  ),
  GetPage(
    name: "/travelerdata",
    page: () => const TravelerData(),
  ),GetPage(
    name: "/ticketsavailable",
    page: () => const TicketsAvailable(),
  ),GetPage(
    name: "/travelerinput",
    page: () => const TravelerInput(),
  ),GetPage(
    name: "/pricingdetails",
    page: () => const PricingDetails(),
  ),GetPage(
    name: "/registerpage",
    page: () => const RegisterPage(),
  ),GetPage(
    name: "/myotp",
    page: () =>  OTPScreen(),
  ),
];
