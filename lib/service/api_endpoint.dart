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
  static String sendMessage = "chat-with-teacher";
  static String session = "filter-utilities";
  static String fessHistory = "payment-history";
  static String studentDetails = "student-details";
  static String curriculum = "notice-board";
  static String fessDetails = "fees-details";
}
