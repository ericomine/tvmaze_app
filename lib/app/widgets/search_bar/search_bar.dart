import 'dart:async';

import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  final void Function(String) onChanged;

  const SearchBar({
    Key key,
    this.onChanged,
  }) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController _controller;
  Timer _debounce;
  bool _hasFocus;

  void _onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      widget.onChanged(_controller.text);
    });
  }

  void _onFocusChanged(bool value) {
    setState(() {
      _hasFocus = value;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.addListener(_onSearchChanged);
    _hasFocus = false;
  }

  @override
  void dispose() {
    _controller.removeListener(_onSearchChanged);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(blurRadius: 4.0, color: Colors.grey)]),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(Icons.search),
            ),
            Expanded(
              child: FocusScope(
                onFocusChange: _onFocusChanged,
                child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration()
                        .applyDefaults(Theme.of(context).inputDecorationTheme)
                        .copyWith(hintText: "Type to search shows")),
              ),
            ),
            if (_hasFocus ?? false)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: IconButton(
                  icon: const Icon(Icons.keyboard_hide),
                  onPressed: FocusScope.of(context).unfocus,
                ),
              ),
          ],
        ));
  }
}
