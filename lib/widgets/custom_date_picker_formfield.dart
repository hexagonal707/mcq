import 'package:flutter/material.dart';

class CustomDatePickerFormField extends StatefulWidget {
  final String labelText;
  final Function(DateTime) onDateSelected;
  final EdgeInsetsGeometry padding;
  final DateTime initialDateTime;
  final String date;

  const CustomDatePickerFormField(
      {super.key, required this.labelText,
      required this.onDateSelected,
      required this.padding,
      required this.initialDateTime,
      required this.date});

  @override
  _CustomDatePickerFormFieldState createState() =>
      _CustomDatePickerFormFieldState();
}

class _CustomDatePickerFormFieldState extends State<CustomDatePickerFormField> {
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      helpText: 'Select Report Date',
      initialDate: widget.initialDateTime,
      firstDate: DateTime(2000),
      lastDate: DateTime(2199),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        widget.onDateSelected(_selectedDate!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: InkWell(
        borderRadius: const BorderRadius.all(
          Radius.circular(8.0),
        ),
        onTap: () => _selectDate(context),
        child: InputDecorator(
          decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
            errorStyle:
                const TextStyle(fontSize: 10.0, fontWeight: FontWeight.w500),
            labelText: widget.labelText,
            labelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14.0),
            suffixIcon: const Icon(Icons.arrow_drop_down),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
            hintStyle:
                const TextStyle(fontSize: 25.0, fontWeight: FontWeight.w600),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _selectedDate == null
                    ? widget.date
                    : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                style: const TextStyle(
                    fontSize: 14.0, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
