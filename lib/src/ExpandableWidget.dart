import 'package:flutter/material.dart';
import 'package:flutter_expandable_widget/flutter_expandable_widget.dart';

class ExpandableWidget extends StatefulWidget {
  const ExpandableWidget({
    Key? key,
    required this.title,
    this.controller,
    //widget
    this.decoration,
    this.padding = const EdgeInsets.all(16.0),
    this.margin,
    //title
    this.titleRowAxisAlignment = MainAxisAlignment.spaceBetween,
    this.expansionDirection = ExpansionDirection.expandDown,
    this.titleDecoration,
    this.titlePadding,
    this.titleMargin,
    //content
    this.children,
    this.childrenDecoration,
    this.childrenPadding,
    this.childrenMargin,
    //trailing Widget
    this.trailing = const Icon(
      Icons.keyboard_arrow_right,
      size: 30,
    ),
    this.trailingDuration = const Duration(milliseconds: 350),
    this.trailingStartTurns = 0.0,
    this.trailingEndTurns = 0.25,
    this.trailingPosition = TrailingPosition.right,
    //Expand
    this.expandDuration = const Duration(milliseconds: 350),
    this.expandCurve = Curves.fastOutSlowIn,
  })  : content = null,
        super(key: key);

  ///content builder
  const ExpandableWidget.content({
    Key? key,
    required this.title,
    required this.content,
    this.controller,
    //widget
    this.decoration,
    this.padding = const EdgeInsets.all(16.0),
    this.margin,
    //title
    this.titleRowAxisAlignment = MainAxisAlignment.spaceBetween,
    this.expansionDirection = ExpansionDirection.expandDown,
    this.titleDecoration,
    this.titlePadding,
    this.titleMargin,
    //trailing
    this.trailing = const Icon(
      Icons.keyboard_arrow_right,
      size: 30,
    ),
    this.trailingDuration = const Duration(milliseconds: 350),
    this.trailingStartTurns = 0.0,
    this.trailingEndTurns = 0.25,
    this.trailingPosition = TrailingPosition.right,
    //Expand
    this.expandDuration = const Duration(milliseconds: 350),
    this.expandCurve = Curves.fastOutSlowIn,
  })  : children = null,
        childrenDecoration = null,
        childrenPadding = null,
        childrenMargin = null,
        super(key: key);

  ///control Expandable Widget
  final ExpandableWidgetController? controller;

  ///expandableWidget's decoration
  final Decoration? decoration;

  ///expandableWidget's padding
  final EdgeInsetsGeometry? padding;

  ///expandableWidget's margin
  final EdgeInsetsGeometry? margin;

  ///title widget
  final Widget title;

  ///title and trailing MainAxisAlignment in Row
  final MainAxisAlignment titleRowAxisAlignment;

  ///setting expansion direction
  ///ex: ExpansionDirection.expandUp content is on top of Title
  final ExpansionDirection expansionDirection;

  ///title's decoration
  final Decoration? titleDecoration;

  ///title's padding
  final EdgeInsetsGeometry? titlePadding;

  ///title's margin
  final EdgeInsetsGeometry? titleMargin;

  ///content
  final Widget? content;

  ///children
  final List<Widget>? children;

  ///children's decoration
  final Decoration? childrenDecoration;

  ///children's padding
  final EdgeInsetsGeometry? childrenPadding;

  ///children's margin
  final EdgeInsetsGeometry? childrenMargin;

  /// Trailing Widget
  final Widget trailing;

  /// Trailing Widget's duration
  final Duration trailingDuration;

  ///Rotation start turns
  final double trailingStartTurns;

  ///Rotation end turns
  final double trailingEndTurns;

  ///trail's position
  ///ex: TrailingPosition.left: trailing is to the left of title
  final TrailingPosition trailingPosition;

  ///Expand animated duration
  final Duration expandDuration;

  ///Expand animated curve
  final Curve expandCurve;

  @override
  State<StatefulWidget> createState() => _ExpandableWidgetState();
}

class _ExpandableWidgetState extends State<ExpandableWidget> {
  //Control expands or closes
  late final ExpandableWidgetController controller;

  //Whether controller is created in the state
  bool isControllerCreateAtState = false;

  @override
  void initState() {
    super.initState();
    isControllerCreateAtState = widget.controller == null;
    controller = widget.controller ?? ExpandableWidgetController();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    if (isControllerCreateAtState) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetColumn = [];
    if (widget.expansionDirection == ExpansionDirection.expandDown) {
      widgetColumn.add(getTitle());
      widgetColumn.add(getContent());
    } else {
      widgetColumn.add(getContent());
      widgetColumn.add(getTitle());
    }

    return Container(
      decoration: widget.decoration,
      padding: widget.padding,
      margin: widget.margin,
      child: Column(children: widgetColumn),
    );
  }

  Widget getTitle() {
    List<Widget> titleRow = [];
    if (widget.trailingPosition == TrailingPosition.right) {
      titleRow.add(widget.title);
      titleRow.add(getTrailing());
    } else {
      titleRow.add(getTrailing());
      titleRow.add(widget.title);
    }

    return GestureDetector(
      onTap: () {
        controller.toggle();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        decoration: widget.titleDecoration,
        padding: widget.titlePadding,
        margin: widget.titleMargin,
        child: Row(
          mainAxisAlignment: widget.titleRowAxisAlignment,
          children: titleRow,
        ),
      ),
    );
  }

  //getTrailing Widget
  Widget getTrailing() {
    return AnimatedRotation(
      duration: widget.trailingDuration,
      turns: controller.isExpanded ? widget.trailingStartTurns : widget.trailingEndTurns,
      child: widget.trailing,
    );
  }

  //getContent Widget
  Widget getContent() {
    if (widget.content == null) {
      return AnimatedSize(
        duration: widget.expandDuration,
        curve: widget.expandCurve,
        child: !controller.isExpanded
            ? const SizedBox()
            : Container(
                decoration: widget.childrenDecoration,
                padding: widget.childrenPadding,
                margin: widget.childrenMargin,
                child: Column(
                  children: widget.children ?? [],
                ),
              ),
      );
    }

    return AnimatedSize(
      duration: widget.expandDuration,
      curve: widget.expandCurve,
      child: controller.isExpanded ? widget.content : const SizedBox(),
    );
  }
}

///expansion direction
enum ExpansionDirection {
  expandDown,
  expandUp,
}

///setting trail's position
enum TrailingPosition {
  left,
  right,
}
