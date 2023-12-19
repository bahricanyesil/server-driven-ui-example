import 'package:dart_frog/dart_frog.dart';

Response onRequest(RequestContext context) {
  return Response(
    body: template,
    headers: {'Content-Type': 'application/javascript'},
  );
}

const template = '''
var state = {
  value: "0",
  text: "",
};

function setText(e) {
  const jsonRes = JSON.stringify(e);
  const jsonParsed = JSON.parse(jsonRes);
  const newText = jsonParsed.newText; 
  state.text = newText;
  console.log(state.text);
}

function increment() {
  const current = parseInt(state.value);
  setValue(current + 1);
}

function decrement() {
  const current = parseInt(state.value);
  setValue(current - 1);
}

function setValue(value) {
  state.value = value.toString();
}
''';
