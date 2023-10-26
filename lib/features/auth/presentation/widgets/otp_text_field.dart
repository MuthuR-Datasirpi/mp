import 'package:flutter/material.dart';
import 'package:mobile/core/resources/colors.dart';

class OTPTextField extends StatefulWidget {
  final int length;
  final ValueChanged<String> onCompleted;
  final bool isDisabled;

  const OTPTextField({
    Key? key,
    required this.length,
    required this.onCompleted,
    this.isDisabled = false,
  }) : super(key: key);

  @override
  State<OTPTextField> createState() => _OTPTextFieldState();
}

class _OTPTextFieldState extends State<OTPTextField> {
  late List<FocusNode?> _focusNodes;
  late List<TextEditingController?> _textControllers;
  late List<String> _pin;

  @override
  void initState() {
    super.initState();
    // Generate the List with null values
    _focusNodes = List.generate(widget.length, (_) => null);
    _textControllers = List.generate(widget.length, (_) => null);
    _pin = List.generate(widget.length, (_) => '');
  }

  @override
  void dispose() {
    for (var controller in _textControllers) {
      controller?.dispose();
    }
    super.dispose();
  }

// Function for get current pin
  String _getCurrentPin() {
    return _pin.join();
  }

// Function for get handle paste
  void _handlePaste(String str) {
    if (str.length > widget.length) {
      str = str.substring(0, widget.length);
    }

    for (int i = 0; i < str.length; i++) {
      String digit = str.substring(i, i + 1);
      _textControllers[i]!.text = digit;
      _pin[i] = digit;
    }

    _focusNodes[widget.length - 1]?.requestFocus();

    String currentPin = _getCurrentPin();

    if (!_pin.contains(null) &&
        !_pin.contains('') &&
        currentPin.length == widget.length) {
      widget.onCompleted.call(currentPin);
    }
  }

// Widget start from here
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.length, (index) {
        return buildTextField(context, index);
      }),
    );
  }

  /// This function Build and returns individual TextField item.
  Widget buildTextField(BuildContext context, int index) {
    if (_focusNodes[index] == null) _focusNodes[index] = FocusNode();

    if (_textControllers[index] == null) {
      _textControllers[index] = TextEditingController();
    }

    return Container(
      width: 50.0,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      // TextField widget
      child: TextField(
        autofocus: index == 0,
        readOnly: widget.isDisabled,
        maxLength: 1,
        controller: _textControllers[index],
        focusNode: _focusNodes[index],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 20.0),
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.otpBoxFillColor,
          contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
          counterText: "",
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(width: 2, color: AppColors.primaryColor),
          ),
        ),
        // On change event
        onChanged: (String str) {
          if (str.length > 1) {
            _handlePaste(str);
            return;
          }

          // Check if the current value at this position is empty
          // If it is move focus to previous text field.
          if (str.isEmpty) {
            if (index != 0) {
              _focusNodes[index]!.unfocus();
              _focusNodes[index - 1]!.requestFocus();
            }
          }

          // Update the current pin
          setState(() {
            _pin[index] = str;
          });

          // Remove focus
          if (str.isNotEmpty && index != (widget.length - 1)) {
            _focusNodes[index]!.unfocus();
          }
          // Set focus to the next field if available
          if (index + 1 != widget.length && str.isNotEmpty) {
            FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
          }

          String currentPin = _getCurrentPin();
          widget.onCompleted.call(currentPin);
        },
      ),
    );
  }
}

// Class for Otp field controller
class OtpFieldController {
  late _OTPTextFieldState _otpTextFieldState;

// Function for setOtpTextFieldState
  void setOtpTextFieldState(_OTPTextFieldState state) {
    _otpTextFieldState = state;
  }

  // Controller clear method
  void clear() {
    _otpTextFieldState._pin = List.filled(_otpTextFieldState.widget.length, '');
    for (var textController in _otpTextFieldState._textControllers) {
      textController?.clear();
    }
    _otpTextFieldState._focusNodes[0]?.requestFocus();
  }

  // Controller set pin method
  void set(List<String> pin) {
    _otpTextFieldState._pin = pin;
    String newPin = '';

    for (int i = 0; i < _otpTextFieldState._textControllers.length; i++) {
      final textController = _otpTextFieldState._textControllers[i];
      final pinValue = pin[i];
      newPin += pinValue;

      textController?.text = pinValue;
    }

    _otpTextFieldState.widget.onCompleted.call(newPin);
  }

  // Controller set value method
  void setValue(String value, int position) {
    final textController = _otpTextFieldState._textControllers[position];

    if (textController != null) {
      textController.text = value;
      _otpTextFieldState._pin[position] = value;
    }

    String newPin = "";
    for (var item in _otpTextFieldState._pin) {
      newPin += item;
    }

    _otpTextFieldState.widget.onCompleted.call(newPin);
  }

  // Controller set focus node method
  void setFocus(int position) {
    _otpTextFieldState._focusNodes[position]?.requestFocus();
  }
}
