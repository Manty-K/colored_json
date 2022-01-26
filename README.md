# Pretty JSON
Converts JSON data into a pretty *customizable* widget.

## Getting Started
 `PrettyJson` is a stateless widget that produces a structured view of JSON string provided. It can be used like any other flutter widget.
It's fully customizable where you can set different colors to different datatypes including colon, comma and brackets. Set indent length. Use text style of your choice. You can also change the background color.

||||
|--|--|--|
| <img src="https://i.ibb.co/Kbj27Nn/default.jpg" alt="Default View"/> | <img src="https://i.ibb.co/R3ChRyz/customized.jpg" alt="Customized View 1" >|<img src="https://i.ibb.co/Zhv9bxH/flexible.jpg" alt="Customized View 2" />|



## Usage
 - Add library to your *pubspec.yaml* file

```yaml
dependencies:
  pretty_json: 1.0.0
```

 - Import  the package in a dart file

```dart
import 'package:pretty_json/pretty_json.dart';
```

 - Pass a JSON string to the `data` parameter on `PrettyJson` Widget

### Simple Usage
```dart
const String responseBody = '''
{
  'id':1,
  'name':'Pretty Json',
  'isFlutterAwesome':true,
}
''';

PreetyJson(
	data: responseBody,
)

```
### Full Usage
``` dart
final dartMap = {
  "id": 24,
  "name": "Manthan Khandale",
  "score": 7.6,
  "socials": null,
  "hobbies": [
    "Music",
    "Filmmaking",
  ],
  "isFlutterCool": true,
};

PrettyJson(
	data: jsonEncode(dartMap),
	indentLength: 5,
	keyColor: Colors.green,
	backgroundColor: Colors.black,
	boolColor: Colors.white,
	nullColor: Colors.redAccent,
	stringColor: Colors.cyan,
	curlyBracketColor: Colors.yellow,
	doubleColor: Colors.deepOrange,
	squareBracketColor: Colors.amber,
	commaColor: Colors.yellow,
	colonColor: Colors.purple,
	intColor: Colors.lime,
	textStyle: const TextStyle(
	fontSize: 20,
	letterSpacing: 2,
	),
   ```

  
| Parameter | Info |
|--|--|
| **data** (required) | A **JSON** string to be formatted|
| keyColor | Color of Json **Key** |
| intColor | Color of **integer** type value |
| doubleColor | Color of **decimal** type value |
| stringColor | Color of **string** type value |
| boolColor | Color of **boolean** type value |
| nullColor | Color of **null** type value |
| curlyBracketColor | Color of **curly** brackets {} |
| squareBracketColor | Color of **square** brackets [] |
| commaColor | Color of **comma** ( , ) |
| colonColor | Color of **colon** ( : ) |
| backgroundColor | **Background** color of widget |
| textStyle | **Textstyle** of texts in the widget |
| indentLength | **Indent** length |




## Upcoming features

 - Shrink code within the specific scope on click.
 - Inner Spacing parameter 
