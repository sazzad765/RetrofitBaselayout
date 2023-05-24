import 'package:flutter/material.dart';

class CustomDropdown<T> extends StatefulWidget {
  const CustomDropdown(
      {Key? key,
      required this.hint,
      this.value,
      this.items,
      this.onChanged,
      this.validator,
      this.contentPadding,
      this.disableDropdown = false,
      double? borderRadius})
      : borderRadius = borderRadius ?? 6,
        super(key: key);
  final List<DropdownMenuItem<T>>? items;
  final T? value;
  final String hint;
  final void Function(T?)? onChanged;
  final String? Function(T?)? validator;
  final EdgeInsetsGeometry? contentPadding;
  final double borderRadius;
  final bool disableDropdown;

  @override
  State<CustomDropdown<T>> createState() => _CustomDropdownState<T>();
}

class _CustomDropdownState<T> extends State<CustomDropdown<T>> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
        validator: widget.validator,
        decoration: InputDecoration(
          contentPadding: widget.contentPadding ??
              const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          fillColor: Colors.transparent,
          focusColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          filled: true,
        ),
        value: widget.value,
        hint: Text(widget.hint),
        icon: const Icon(Icons.keyboard_arrow_down),
        isDense: true,
        isExpanded: true,
        items: widget.items,
        onChanged: widget.disableDropdown ? null : widget.onChanged);
  }
}
