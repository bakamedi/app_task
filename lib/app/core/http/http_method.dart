enum HttpMethod {
  get('GET'),
  post('POST'),
  patch('PATCH'),
  put('PUT'),
  delete('DELETE');

  const HttpMethod(
    this.name,
  );

  final String name;
}
