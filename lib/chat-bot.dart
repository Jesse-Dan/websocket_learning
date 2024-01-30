class ResponseBot {
  final Map<String, String> _responses;

  ResponseBot(this._responses);

  String respondTo(String prompt) {
    prompt = prompt.toLowerCase();

    if (_responses.containsKey(prompt)) {
      return _responses[prompt]!;
    } else {
      return "I'm sorry, I don't understand that. Can you provide a prompt from our list of prompts";
    }
  }
}
