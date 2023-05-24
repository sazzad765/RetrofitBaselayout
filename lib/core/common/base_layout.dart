import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_retrofit/core/common/action_chips_row.dart';
import 'package:flutter_retrofit/core/common/custom_app_bar.dart';
import 'package:flutter_retrofit/core/common/custom_response_dialog.dart';
import 'package:flutter_retrofit/core/model/base_response.dart';
import 'package:flutter_retrofit/utils/theme/theme.dart';

class BaseLayout extends StatefulWidget {
  final String? title;
  final Widget? titleWidget;
  final Future<BaseResponse> Function()? onFetch;
  final Widget body;
  final Widget? bottomLayout;
  final List<Widget>? actions;
  final Color? background;
  final Color? titleColor;
  final void Function(String)? onSearch;
  final List<ActionChipsRowItem>? filterItem;
  final void Function(dynamic, String)? onSelectFilter;
  final dynamic selectedFilter;
  final Key? scaffoldKey;
  final Widget? floatingActionButton;

  const BaseLayout({
    Key? key,
    this.title,
    this.titleWidget,
    this.onFetch,
    required this.body,
    this.bottomLayout,
    this.actions,
    this.background,
    this.titleColor,
    this.onSearch,
    this.onSelectFilter,
    this.filterItem,
    this.selectedFilter,
    this.scaffoldKey,
    this.floatingActionButton,
  }) : super(key: key);

  @override
  State<BaseLayout> createState() => _BaseLayoutState();
}

class _BaseLayoutState extends State<BaseLayout> {
  Future<BaseResponse<dynamic>>? _future;

  bool _isLoading = true;
  bool _isSuccess = true;

  @override
  void initState() {
    if (widget.onFetch != null) {
      _fetch();
    }
    // Provider.of<ConnectivityProvider>(context, listen: false).startMonitoring();
    super.initState();
  }

  Future<void> _fetch() async {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _isLoading = true;
        _isSuccess = false;
      });
    });
    _future = widget.onFetch!();
    final result = await _future;
    if (result?.type == APIResultType.success) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        setState(() {
          _isLoading = false;
          _isSuccess = true;
        });
      });
    } else {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        setState(() {
          _isLoading = false;
          _isSuccess = false;
        });
        // showAlertDialog(context);
      });
    }
  }

  showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomResponseDialog(
          title: 'Error',
          descriptions: 'No data found',
          onRetry: () {
            _fetch();
            Navigator.pop(context);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: widget.scaffoldKey,
        appBar: (widget.title == null && widget.titleWidget == null)
            ? null
            : CustomAppBar(
                label: widget.title!,
                titleWidget: widget.titleWidget,
                titleColor: widget.titleColor,
                actions: widget.actions,
                onSearch: widget.onSearch,
              ),
        floatingActionButton: widget.floatingActionButton,
        body: Container(
          color: widget.background ?? CustomColors.background,
          child: widget.onFetch != null
              ? RefreshIndicator(
                  onRefresh: _fetch,
                  child: Column(
                    children: [
                      if (widget.filterItem != null)
                        ActionChipsRow(
                            items: widget.filterItem!,
                            onSelected: widget.onSelectFilter!,
                            selected: widget.selectedFilter),
                      Expanded(
                        child: _isLoading
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : _isSuccess
                                ? widget.body
                                : const Center(
                                    child: Text('No data available'),
                                  ),
                      ),
                      if (widget.bottomLayout != null) widget.bottomLayout!
                    ],
                  ))
              : Column(children: [
                  if (widget.filterItem != null)
                    ActionChipsRow<dynamic>(
                        items: widget.filterItem!,
                        onSelected: widget.onSelectFilter!,
                        selected: widget.selectedFilter),
                  Expanded(child: widget.body),
                  if (widget.bottomLayout != null) widget.bottomLayout!
                ]),
        ));
  }
}
