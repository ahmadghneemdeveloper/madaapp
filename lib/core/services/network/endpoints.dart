class NetworkPath {
  static const String hostName = "https://test.lavetro-agency.com/api/";
}

class EndPoints {
  static const String authenticateApi = "${NetworkPath.hostName}login";

  static const String homeApi="${NetworkPath.hostName}home";

  static const String profileApi="${NetworkPath.hostName}user";
  static const String reservations="${NetworkPath.hostName}users/reservations";


}
