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
  // static String? validateName(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'Name is required';
  //   }
  //   if (value.startsWith(' ')) {
  //     return 'Name should not start with a space';
  //   }
  //   if (value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
  //     return 'Special characters are not allowed';
  //   }
  //   return null;
  // }

  // Name validation (only alphabets and spaces, not empty)
  static String? validateName(String? value ,String? label) {
    if (value == null || value.isEmpty) {
      return '$label is required';
    }
    if (value.startsWith(' ')) {
      return 'Name should not start with a space';
    }
    // Use ^ and $ to match the entire string and + to require at least one character
    if (!RegExp(r"^[a-zA-Z ]+$").hasMatch(value)) {
      return 'Name should only contain letters';
    }
    String processedValue = value.toLowerCase().replaceAll(' ', '');

    // Check if string has at least 3 characters and all are the same
    if (processedValue.length >= 3) {
      bool allSameCharacter = true;
      for (int i = 1; i < processedValue.length; i++) {
        if (processedValue[i] != processedValue[0]) {
          allSameCharacter = false;
          break;
        }
      }
      if (allSameCharacter) {
        return 'Name cannot be a single repeated character';
      }
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

  String? validatePincode(String? value) {
    if (value == null || value.isEmpty) {
      return 'Pincode is required';
    }

    if (value.startsWith(' ')) {
      return 'Pincode should not start with a space';
    }

    // Check for exactly 6 digits
    if (!RegExp(r'^\d{6}$').hasMatch(value)) {
      return 'Invalid Pincode';
    }

    return null;
  }


  static String? validateEmptyCheck(String? value,
      {String errorMessage = 'Invalid Input'}) {
    if (value!.isEmpty) return errorMessage;
    return null;
  }

  //Added By MS
  //Email Validation
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (value.startsWith(' ')) {
      return 'Email should not start with a space';
    }
    if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(value)) {
      return 'Invalid email format';
    }
    return null;
  }

  // Credit card number validation
  static String? validateCreditCard(String? value) {
    if (value == null || value.isEmpty) {
      return 'Credit card number is required';
    }
    if (value.startsWith(' ')) {
      return 'Credit card number should not start with a space';
    }
    if (!RegExp(r'^\d{16}$').hasMatch(value)) {
      return 'Invalid credit card number';
    }

    // Luhn algorithm for credit card validation
    int sum = 0;
    bool alternate = false;
    for (int i = value.length - 1; i >= 0; i--) {
      int n = int.parse(value[i]);
      if (alternate) {
        n *= 2;
        if (n > 9) n -= 9;
      }
      sum += n;
      alternate = !alternate;
    }
    if (sum % 10 != 0) {
      return 'Invalid credit card number';
    }

    return null;
  }

  // URL validation
  static String? validateURL(String? value) {
    if (value == null || value.isEmpty) {
      return 'URL is required';
    }
    if (value.startsWith(' ')) {
      return 'URL should not start with a space';
    }
    if (!RegExp(r'^(https?:\/\/)?([a-z0-9-]+(\.[a-z0-9-]+)+)(\/[^\s]*)?$').hasMatch(value)) {
      return 'Invalid URL format';
    }
    return null;
  }

  // Date of birth validation
  static String? validateDateOfBirth(DateTime? dob) {
    if (dob == null) {
      return 'Date of birth is required';
    }
    if (dob.isAfter(DateTime.now())) {
      return 'Date of birth cannot be in the future';
    }
    return null;
  }

  // Strong password validation
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter password';
    }
    if (value.startsWith(' ')) {
      return 'Password should not start with a space';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    if (!RegExp(r'(?=.*[0-9])(?=.*[!@#$%^&*])(?=.*[a-z])(?=.*[A-Z]).{8,}').hasMatch(value)) {
      return 'Password must contain at least one uppercase letter, one lowercase letter, one number, and one special character';
    }
    return null;
  }


  //todo -added in main validatio  - 19-11-2024

  static String? validateUserNameDetails(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter username';
    }

    // Case-insensitive validation: Alpha-numeric and special characters allowed
    if (!RegExp(r'^[A-Za-z0-9_@!#$%^&*()\-+={}[\]:;<>?,.~`|\\]+$').hasMatch(value)) {
      return 'Username can only contain letters, numbers, and special characters';
    }

    if (value.startsWith(' ')) {
      return 'User name should not start with a space';
    }
    return null; // Valid username
  }

  static String? validateBarcode(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter Barcode Number';
    }

    if (value.startsWith(' ')) {
      return 'Barcode Number should not start with a space';
    }
    if (value.length > 20) {
      return 'Barcode Number must be up to 20 characters';
    }
    if (!RegExp(r'^[A-Za-z0-9_@#\$%\^&\*\(\)\-\+=]*$').hasMatch(value)) {
      return 'Barcode Number contains invalid characters';
    }
    return null;
  }

  static String? validateSize(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Enter Size" ; //null; // Allow empty values (optional field)
    }

    // Ensure the input matches the positive number format
    final regex = RegExp(r'^\d+(\.\d{2,3})?$');
    if (!regex.hasMatch(value)) {
      return 'Enter a valid size (up to 3 decimals)';
    }

    // Ensure the value is greater than or equal to 0.001
    final parsedValue = double.tryParse(value);
    if (parsedValue == null || parsedValue < 0.001) {
      return 'Minimum size is 0.001';
    }
    if (parsedValue > 99.999) {
      return 'Maximum size is 99.999';
    }
    return null; // Valid input
  }

  static String? validategrossWeight(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter Gross Weight';
    }
    final regex = RegExp(r'^\d+(\.\d{1,3})?$');
    if (!regex.hasMatch(value)) {
      return 'Size must be a positive number with up to 3 decimals';
    }
    final double? size = double.tryParse(value);
    if (size == null || size < 0.001) {
      return 'Size must be at least 0.001';
    }
    if (size > 999.999) {
      return 'Size must not exceed 999.999';
    }

    return null;
  }

  static String? validatePieces(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter Pieces';
    }
    final regex = RegExp(r'^[1-9]\d*$');
    if (!regex.hasMatch(value)) {
      return 'Please enter a valid positive integer';
    }

    final int? pieces = int.tryParse(value);
    if (pieces == null || pieces < 1) {
      return 'Number of pieces must be at least 1';
    }

    return null;
  }


  static String? validateInput(String? value) {
    if (value!.isEmpty) {
      return 'Field cannot be empty';
    }
    final int? number = int.tryParse(value);
    if (number == null || number <= 0) {
      return 'Please enter a positive integer and at least 1';
    }
    return null;
  }

  static String? validateWastagePercent(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter Wastage Percentage';
    }

    final int? wastage = int.tryParse(value);
    if (wastage == null) {
      return 'Wastage must be a valid integer';
    }

    if (wastage < 1 || wastage > 100) {
      return 'Wastage must be between 1% and 100%';
    }

    return null;
  }

}

extension PanCardValidator on String {
  bool isValidPanCardNo() {
    return RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]{1}$').hasMatch(this);
  }
}


