import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_retrofit/utils/theme/theme.dart';

class CustomAppBar extends AppBar {
  CustomAppBar(
      {Key? key,
      required this.label,
      this.titleWidget,
      this.titleColor,
      this.actions,
      this.onSearch})
      : super(key: key);
  final String label;
  final Widget? titleWidget;
  final Color? titleColor;
  final List<Widget>? actions;
  final void Function(String)? onSearch;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  late Widget appBarSearch;
  Icon actionIcon = const Icon(
    Icons.search,
  );

  final TextEditingController _searchQuery = TextEditingController();
  bool _isSearching = false;

  void _handleSearchStart() {
    setState(() {
      actionIcon = const Icon(Icons.close);
      appBarSearch = TextField(
        controller: _searchQuery,
        onChanged: widget.onSearch,
        autofocus: true,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: "",
        ),
      );
      _isSearching = true;
    });
  }

  void _handleSearchEnd() {
    setState(() {
      actionIcon = const Icon(Icons.search);
      // appBarTitle = widget.titleWidget ??
      //     Text(widget.label,
      //         style:
      //             TextStyle(color: widget.titleColor ?? CustomColors.darkText));
      if (widget.onSearch != null) widget.onSearch!.call('');
      _isSearching = false;
      _searchQuery.clear();
    });
  }

  void search() {
    setState(() {
      if (!_isSearching) {
        _handleSearchStart();
      } else {
        _handleSearchEnd();
      }
    });
  }

  @override
  void initState() {
    super.initState();
  }

  Widget appBarTitle() =>
      widget.titleWidget ??
      Text(widget.label,
          style: TextStyle(color: widget.titleColor ?? CustomColors.darkText));

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: _isSearching ? appBarSearch : appBarTitle(),
        // title: Text(widget.label,
        //     style:
        //         TextStyle(color: widget.titleColor ?? CustomColors.darkText)),
        backgroundColor: Colors.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
        elevation: 3,
        centerTitle: true,
        actions: [
          if (widget.onSearch != null)
            IconButton(icon: actionIcon, onPressed: search),
          ...?widget.actions,
        ]);
  }
}
