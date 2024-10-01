import 'package:flutter/material.dart';

class RememberMeWidget extends StatefulWidget {
  const RememberMeWidget({
    super.key,
    required this.text,
    required this.value,
    required this.onChanged,
  });

  final String text;
  final bool value;
  final ValueChanged<bool?> onChanged;

  @override
  _RememberMeWidgetState createState() => _RememberMeWidgetState();
}

class _RememberMeWidgetState extends State<RememberMeWidget> {
  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
          side: BorderSide(
            color: theme.colorScheme.onBackground,
          ),
          activeColor: theme.colorScheme.primary,
          // overlayColor: MaterialStatePropertyAll(Colors.red),
          // fillColor: MaterialStatePropertyAll(Colors.red),
          // checkColor: Colors.red,
          value: _value,
          onChanged: (value) {
            setState(() {
              _value = value!;
            });
            widget.onChanged(value);
          },
        ),
        Text(
          widget.text,
          style: theme.textTheme.bodySmall!.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
      ],
    );
  }
}
