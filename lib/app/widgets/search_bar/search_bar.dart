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

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();

    // TODO: Improve widget by adding debounce to TextField behavior.
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
              child: TextField(
                  onChanged: widget.onChanged,
                  controller: _controller,
                  decoration: const InputDecoration()
                      .applyDefaults(Theme.of(context).inputDecorationTheme)
                      .copyWith(hintText: "Type to search shows")),
            ),
          ],
        ));
  }
}
