class Viagem {
  int? id;
  String origem;
  String destino;
  double kmInicial;
  double kmFinal;
  double kmTotal;
  double metaConsumo;
  double mediaConsumo;
  int idUsuario;
  String dataOperacao;

  Viagem({
    this.id,
    required this.origem,
    required this.destino,
    required this.kmInicial,
    required this.kmFinal,
    required this.kmTotal,
    required this.metaConsumo,
    required this.mediaConsumo,
    required this.idUsuario,
    required this.dataOperacao,
  });

  // Converter para Map (para salvar no banco)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'origem': origem,
      'destino': destino,
      'km_inicial': kmInicial,
      'km_final': kmFinal,
      'km_total': kmTotal,
      'meta_consumo': metaConsumo,
      'media_consumo': mediaConsumo,
      'id_usuario': idUsuario,
      'data_operacao': dataOperacao,
    };
  }

  // Criar objeto a partir de Map (quando buscar do banco)
  factory Viagem.fromMap(Map<String, dynamic> map) {
    return Viagem(
      id: map['id'],
      origem: map['origem'],
      destino: map['destino'],
      kmInicial: map['km_inicial'],
      kmFinal: map['km_final'],
      kmTotal: map['km_total'],
      metaConsumo: map['meta_consumo'],
      mediaConsumo: map['media_consumo'],
      idUsuario: map['id_usuario'],
      dataOperacao: map['data_operacao'],
    );
  }
}
