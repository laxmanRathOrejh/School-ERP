class ApiEndpoint {
  static bool isLIVE = true;

  static final userTokeKey = "weberp";
  static String serverURL = isLIVE
      ? "https://nauticalerp.itworkshop.in/api/v1/"
      : "https://nauticalerp.itworkshop.in/api/v1/";

  static String login = "login";
  static String verifiy = "verify-pin";
  static String calender = "calendar";
  static String parentsDetails = "parent-details";
  static String teacherList = "get-all-teachers-chat";
  static String teacherChatHistory = "get-teacher-chats";
}
