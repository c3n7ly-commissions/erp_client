class HttpStatusString {
  static String getStatusString(int statusCode) {
    switch (statusCode) {
      case 100:
        return "continue";
      case 101:
        return "switching protocol";
      case 103:
        return "early hints";
      case 200:
        return "successful";
      case 201:
        return "created";
      case 202:
        return "accepted";
      case 203:
        return "non-authoritative information";
      case 204:
        return "no content";
      case 205:
        return "reset content";
      case 206:
        return "partial content";
      // HTTP Client error codes"
      case 400:
        return "bad request";
      case 401:
        return "unauth­orizd";
      case 402:
        return "payment required";
      case 403:
        return "forbidden";
      case 404:
        return "not found";
      case 405:
        return "method not allowed";
      case 406:
        return "not acceptable";
      case 407:
        return "proxy authentication requried";
      case 408:
        return "request timeout";
      case 409:
        return "conflict";
      case 408:
        return "Request Timeout";
      case 409:
        return "Conflict";
      case 410:
        return "Gone";
      case 411:
        return "Length Required";
      case 412:
        return "Precon­dition Failed";
      case 413:
        return "Request Entity Too Large";
      case 414:
        return "Reques­t-URI Too Long";
      case 415:
        return "Unsupp­orted Media Type";
      case 416:
        return "Requested Range Not Satisf­iable";
      case 417:
        return "Expect­ation Failed";
      case 418:
        return "I'm a teapot 2324";
      case 422:
        return "Submitted data is invalid";
      case 423:
        return "Locked";
      case 424:
        return "Failed Dependency";
      case 425:
        return "Unordered Collection 3648";
      case 426:
        return "Upgrade Required 2817";
      case 428:
        return "Precon­dition Required";
      case 429:
        return "Too Many Requests";
      case 431:
        return "Request Header Fields Too Large";
      case 444:
        return "No Response nginx";
      case 449:
        return "Retry With MS";
      case 450:
        return "Blocked By Windows Parental Controls MS";
      case 451:
        return "Unavai­lable For Legal Reasons";
      case 499:
        return "Client Closed Request nginx";
      // HTTP Server Error Codes
      case 500:
        return "Internal Server Error";
      case 501:
        return "Not Implem­ented";
      case 502:
        return "Bad Gateway";
      case 503:
        return "Service Unavai­lable";
      case 504:
        return "Gateway Timeout";
      case 505:
        return "HTTP Version Not Supported";
      default:
        return "unknown status code";
    }
  }
}
