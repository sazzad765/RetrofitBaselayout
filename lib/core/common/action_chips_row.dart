import 'package:flutter/material.dart';
import 'package:flutter_retrofit/utils/theme/theme.dart';

class ActionChipsRowItem<T> {
  final T value;
  final String label;

  ActionChipsRowItem(this.value, this.label);
}

class ActionChipsRow<T> extends StatefulWidget {
  const ActionChipsRow({
    super.key,
    required this.items,
    required this.onSelected,
    required this.selected,
  });

  final List<ActionChipsRowItem<T?>> items;
  final void Function(T? selectedData, String label) onSelected;
  final T? selected;

  @override
  _ActionChipsRowState createState() => _ActionChipsRowState<T>();
}

class _ActionChipsRowState<T> extends State<ActionChipsRow<T>> {
  List<Widget> _buildActionChips() {
    var chips = widget.items.map((item) {
      return Padding(
        padding: const EdgeInsets.all(5),
        child: ActionChip(
          label: Text(
            item.label,
            style: TextStyle(
                color: item.value == widget.selected ? Colors.white : null,
                // fontWeight: item.value == widget.selected ? FontWeight.bold : FontWeight.normal,
                fontWeight: FontWeight.normal),
          ),
          padding: const EdgeInsets.all(CustomSpacing.small),
          backgroundColor: item.value == widget.selected
              ? Theme.of(context).primaryColor
              : CustomColors.background,
          onPressed: () => widget.onSelected(item.value, item.label),
        ),
      );
    }).toList();

    return [const SizedBox(width: CustomSpacing.xSmall), ...chips];
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
        alignment: Alignment.centerLeft,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: _buildActionChips()),
        ));
  }
}
