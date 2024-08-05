

class Validator {

  // Mobile number validation (10-digit number)
  static String? validateMobile(String? value) {
    if (value == null || value.isEmpty) {
      return 'Mobile number is required';
    }
    if (value.startsWith(' ')) {
      return 'Mobile number should not start with a space';
    }
    if (value.length != 10 || !RegExp(r'^[6789][0-9]{9}$').hasMatch(value)) {
      return 'Invalid mobile number';
    }
    return null;
  }


  // Name validation (only alphabets and spaces, not empty)
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }
    if (value.startsWith(' ')) {
      return 'Name should not start with a space';
    }
    if (value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Special characters are not allowed';
    }
    return null;
  }

  // Address validation (not empty)

  static String? validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return 'Address is required';
    }
    if (value.startsWith(' ')) {
      return 'Address should not start with a space';
    }
    return null;
  }

  // Aadhar card number validation (12-digit number)

  static String? validateAadhar(String? value) {
    if (value == null || value.isEmpty) {
      return 'Aadhar card number is required';
    }
    if (value.length != 12 || !RegExp(r'^[0-9]{12}$').hasMatch(value)) {
      return 'Invalid Aadhar card number';
    }
    if (value.startsWith(' ')) {
      return 'Aadhar should not start with a space';
    }
    if (value.startsWith('0')) {
      return 'Aadhar should not start with 0';
    }
    if (value.startsWith('1')) {
      return 'Aadhar should not start with 1';
    }
    return null;
  }

  // PAN number validation (10 characters, alphanumeric, specific format)

  static String? validatePan(String? value) {
    if (value == null || value.isEmpty) {
      return 'PAN number is required';
    }

    // Check for lowercase letters
    if (RegExp(r'[a-z]').hasMatch(value)) {
      return 'Enter Capital Letter';
    }

    // Check for lowercase letters
    if (RegExp(r'^[a-z]{5}[0-9]{4}[a-z]{1}$').hasMatch(value)) {
      return 'Enter Capital Letter';
    }

    if (!RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]{1}$').hasMatch(value)) {
      return 'Invalid PAN number';
    }
    if (value.startsWith(' ')) {
      return 'PAN number should not start with a space';
    }
    return null;
  }

  // Vehicle number validation (specific format, e.g., KA01AB1234)

  static String? validateVehicle(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vehicle number is required';
    }
    if (!RegExp(r'^[A-Z]{2}[0-9]{2}[A-Z]{2}[0-9]{4}$').hasMatch(value)) {
      return 'Invalid vehicle number';
    }
    if (value.startsWith(' ')) {
      return 'Vehicle number should not start with a space';
    }
    return null;
  }

  // User name validation (8-10 characters, alphanumeric)

  static String? validateUserName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter user name';
    }
    if (!RegExp(r'^[A-Za-z][A-Za-z0-9_]{7,10}$').hasMatch(value)) {
      return 'User name must start with a letter and be between 8 and 10 characters';
    }
    if (value.startsWith(' ')) {
      return 'User name should not start with a space';
    }
    return null;
  }

  // account no validation

  static String? validateAccountNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Account number is required';
    }
    RegExp r = RegExp(r"[0-9]{6,18}[1-9]+");
    if (!r.hasMatch(value)) {
      return 'Invalid account number';
    }
    if (value.startsWith(' ')) {
      return 'Account number should not start with a space';
    }
    return null;
  }

  // IFSC validation

  static String? validateIFSC(String? value) {
    if (value == null || value.isEmpty) {
      return 'IFSC code is required';
    }
    RegExp regex = RegExp(r"^[A-Z]{4}0[A-Z0-9]{6}");
    bool isMatch = regex.hasMatch(value);
    if (value.startsWith(' ')) {
      return 'IFSC should not start with a space';
    }
    if (isMatch) {
      return null; // Valid IFSC code
    } else {
      return 'Invalid IFSC code'; // Error message for invalid code
    }
  }

  // if user select 'Select' option in dropdown.

  static String? validateDropDown(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select an option';
    }
    if (value.startsWith('Select') || value.startsWith('select')) {
      return 'Please select an option';
    }
    return null;
    // Return null if the value is valid
  }

  // from date to to date validation

  static String? validateDateRange(DateTime? fromDate, DateTime? toDate) {
    if (fromDate == null || toDate == null) {
      return 'Please select both from and to dates';
    }
    if (toDate.isBefore(fromDate)) {
      return 'To date must be after from date';
    }
    return null; // Return null if the date range is valid
  }


  static String? validateAmount(value) {
    if (value!.isEmpty) {
      return "Please enter amount";
    }
    if ((double.tryParse(value) ?? 0) <= 10000000) {
      return null;
    } else {
      return "Please enter number between 1 to 10000000";
    }
  }



}

extension PanCardValidator on String {
  bool isValidPanCardNo() {
    return RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]{1}$').hasMatch(this);
  }
}
