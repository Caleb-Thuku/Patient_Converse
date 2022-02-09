class Response {
  final int sender;
  final String message;
  //final String body;

  Response(
      this.sender,
      this.message,
      );
  factory Response.fromMap(Map<String, dynamic> json){
    return Response(json['sender'],json['message'],);
  }
  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
      json['sender'],
      json['message'],
    );
  }
}