# flutter_expandable_widget

An expandable widget with the easy control expands and closes

![expandable_widget](https://media.giphy.com/media/AicFNJcFGGmrRfX5r0/giphy.gif)

## Getting Started

In the `pubspec.yaml` of your flutter project, add the following dependency:

```yaml
dependencies:
  ...
  expandable_widget: ^1.0.2
```


Import it:

```dart
import 'package:expandable_widget/expandable_widget.dart';
```
## Usage Examples

### ExpandableWidget
```dart
ExpandableWidget(
    title: const Padding(
      padding: EdgeInsets.only(left: 10),
      child: Text('Center'),
    ),
    decoration: const BoxDecoration(color: Color(0xFF81C784)),
    childrenPadding: const EdgeInsets.only(top: 50),
    children: const [
      Text('S'),
      Text('M'),
      Text('L'),
      Text('XL'),
    ],
)
```

### Setting your trailing widget and rotation's duration、turns
```dart
ExpandableWidget(
  //...
  trailing: const Icon(Icons.arrow_forward),
  trailingStartTurns: 1,
  trailingEndTurns: 0.75,
  trailingDuration: const Duration(milliseconds: 350),
)
```

### Setting title and trailing position
```dart
//trailing is to the left of title
trailingPosition: TrailingPosition.left,
//trailing is to the right of title
trailingPosition: TrailingPosition.right,
```

### Setting expansion direction
```dart
//Title is on top of content
expansionDirection: ExpansionDirection.expandDown,
//content is on top of Title
expansionDirection: ExpansionDirection.expandUp,
```


### ExpandableWidget.content
```dart
ExpandableWidget.content(
    //...content replaces children
    content: Column(
      children: const [
        Text('S'),
        Text('M'),
        Text('L'),
        Text('XL'),
      ],
    ),
)
```