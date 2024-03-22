enum EnumTypeDocument {
  cc('CC', 'Cédula de Ciudadanía'),
  ti('TI', 'Tarjeta de Identidad'),
  ce('CE', 'Cédula de Extranjería'),
  na('NA', 'Seleccione un tipo de documento');

  final String type;
  final String txtToShow;

  const EnumTypeDocument(
    this.type,
    this.txtToShow,
  );
}
