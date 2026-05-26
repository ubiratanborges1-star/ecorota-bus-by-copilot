class Relatorio {
  int? id;
  int mes;
  int ano;
  int idUsuario;
  double kmTotalMes;
  double mediaConsumoMes;
  double metaConsumoMes;
  String resultadoGeral;
  double horasTotalMes;

  Relatorio({
    this.id,
    required this.mes,
    required this.ano,
    required this.idUsuario,
    required this.kmTotalMes,
    required this.mediaConsumoMes,
    required this.metaConsumoMes,
    required this.resultadoGeral,
    required this.horasTotalMes,
  });

  // Converter para Map (para salvar no banco)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'mes': mes,
      'ano': ano,
      'id_usuario': idUsuario,
      'km_total_mes': kmTotalMes,
      'media_consumo_mes': mediaConsumoMes,
      'meta_consumo_mes': metaConsumoMes,
      'resultado_geral': resultadoGeral,
      'horas_total_mes': horasTotalMes,
    };
  }

  // Criar objeto a partir de Map (quando buscar do banco)
  factory Relatorio.fromMap(Map<String, dynamic> map) {
    return Relatorio(
      id: map['id'],
      mes: map['mes'],
      ano: map['ano'],
      idUsuario: map['id_usuario'],
      kmTotalMes: map['km_total_mes'],
      mediaConsumoMes: map['media_consumo_mes'],
      metaConsumoMes: map['meta_consumo_mes'],
      resultadoGeral: map['resultado_geral'],
      horasTotalMes: map['horas_total_mes'],
    );
  }
}
