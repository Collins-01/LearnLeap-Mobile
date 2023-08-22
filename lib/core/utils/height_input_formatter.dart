import 'package:flutter/services.dart';

class HeightInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final int newTextLength = newValue.text.length;
    final StringBuffer newText = StringBuffer();
    int selectionIndex = 0;
    var value = '';
    print("New Value : ${newValue.text}");
    print("Old Value : ${oldValue.text}");
    if (newTextLength == 1) {
      newText.write(newValue.text);
      newText.write("'");
      value = newText.toString();
      // selectionIndex + 2;
    }
    print(value.length);
    if (value.length == 2) {
      selectionIndex++;
      newText.write('1');
    }

    // throw UnimplementedError();
    return TextEditingValue(
      text: value.toString(),
      selection: TextSelection.collapsed(
        offset: selectionIndex,
      ),
    );
  }
}
