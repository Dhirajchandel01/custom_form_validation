# Custom Validation Form

`custom_form_validation` is a customizable validation class for your Flutter project. It
provides a validation. This class simplifies the process of creating and customizing validations in your Flutter
applications.
</br></br>

## Platform Support

| **Android** |  
|:-----------:|
|   &#9989;   | 
</br></br>


| **iOs** | 
|:-------:| 
| &#9989; | 
</br></br>


| **iOs** | 
|:-------:| 
| &#9989; | 
</br></br>
## Installation

To use `custom_form_validation` in your Flutter project, follow these steps:

1. Add the package to your `pubspec.yaml` file and run `flutter pub get`:

    ```yaml
        dependencies:
          custom_form_validation : ^0.0.5  
    ```

2. Import the package in your Dart code:

   ```dart
   import 'package:custom_form_validation/custom_validation.dart';
   ```

</br></br>

## Usage

To create a customized text input field with validation using `custom_text_form_field_plus`, you can
use the `CustomTextFormField` widget and the provided `Validations` class for validation functions.
Here's an example:

   ```flutter
       import 'package:custom_form_validation/custom_validation.dart';
   ```

   ```
      TextFormField(
              validator: (value)=>Validator.validateMobile(value),
            ),

       TextFormField(
              validator: (value)=>Validator.validateName(value),
            ),

       TextFormField(
              validator: (value)=>Validator.validateAddress(value),
            ),
   ```

Check example folder for more.
</br></br>

## Customizations

`custom_form_validation` provides various customization options through its class. You
can customize attributes like add your validations in your local and many more to suit your
application's requirements.
</br>


## Author

- [Dhiraj Chandel](https://www.linkedin.com/in/dhirajsingh-chandel-7259b5172?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app)

If you have any questions or need assistance, please feel free to contact the author.
