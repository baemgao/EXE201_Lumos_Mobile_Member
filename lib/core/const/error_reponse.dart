class LoginErrorMessage {
  static const String wrongCredentials = "Sai tên đăng nhập hoặc mật khẩu.";
  static const String accountLocked =
      "Tài khoản đã bị khóa. Vui lòng liên hệ với quản trị viên.";
  static const String connectionError =
      "Không thể kết nối đến máy chủ. Vui lòng kiểm tra kết nối internet và thử lại sau.";
  static const String systemError =
      "Đã xảy ra lỗi hệ thống. Vui lòng thử lại sau.";
}

class LoginSuccessMessage {
  static String loginSuccess(String username) =>
      "Thành công, chào mừng $username trở lại!";
  static const String passwordChanged = "Mật khẩu đã được thay đổi thành công.";
  static const String logoutSuccess = "Đã đăng xuất thành công.";
}

class SearchErrorMessage {
  static const String noResultsFound =
      "Không tìm thấy kết quả nào phù hợp với yêu cầu của bạn.";
}

class SearchSuccessMessage {
  static String resultsFound(int count) =>
      "Đã tìm thấy $count kết quả phù hợp với yêu cầu của bạn.";
}

class OperationErrorMessage {
  static const String accessDenied =
      "Bạn không có quyền truy cập vào tài nguyên này.";
  static const String deleteError =
      "Không thể xóa mục này. Vui lòng thử lại sau hoặc liên hệ với quản trị viên.";
}

class OperationSuccessMessage {
  static String createSuccess(String itemName) =>
      "Đã thêm mới $itemName thành công.";
  static String updateSuccess(String itemName) =>
      "Đã cập nhật thông tin $itemName thành công.";
  static String deleteSuccess(String itemName) =>
      "Đã xóa $itemName thành công.";
}

class BookingErrorMessage {
  static const String invalidTimeSlot =
      "Thời gian bạn chọn không khả dụng. Vui lòng chọn thời gian khác.";
  static const String bookingConflict =
      "Đã có lịch đặt khác cho thời gian bạn chọn. Vui lòng chọn thời gian khác.";
}

class BookingSuccessMessage {
  static const String bookingSuccess =
      "Đặt dịch vụ thành công. Xin cảm ơn bạn đã sử dụng dịch vụ của chúng tôi!";
}

class OnDevelopmentMessage {
  static const String fearureOnDevelopmentTitle = "Tính năng đang phát triển";
  static const String featureOnDevelopment =
      "Tính năng này đang được phát triển. Vui lòng quay lại sau.";
}

class OnInvalidInputMessage {
  static const String emptyInput = "Vui lòng nhập dữ liệu trước khi thực hiện";
  static const String invalidInputTitle = "Dữ liệu không hợp lệ";
  static const String invalidInput =
      "Dữ liệu bạn nhập không hợp lệ. Vui lòng kiểm tra lại.";
}

class OnSignOutMessage {
  static const String signOutTitle = "Đăng xuất";
  static const String signOutMessage = "Bạn có chắc chắn muốn đăng xuất?";
  static const String signOutConfirm = "Đăng xuất";
  static const String signOutCancel = "Hủy";
}