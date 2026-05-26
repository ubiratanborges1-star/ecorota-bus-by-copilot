class DateUtilsHelper {
  // Formatar data no padrão dd/MM/yyyy
  static String formatDate(String dateStr) {
    try {
      final date = DateTime.parse(dateStr);
      return "${date.day.toString().padLeft(2, '0')}/"
             "${date.month.toString().padLeft(2, '0')}/"
             "${date.year}";
    } catch (e) {
      return dateStr;
    }
  }

  // Retornar nome do mês por extenso
  static String getMonthName(int month) {
    const meses = [
      "Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho",
      "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"
    ];
    return meses[month - 1];
  }

  // Verificar se uma data está dentro do mês/ano especificado
  static bool isInMonthYear(String dateStr, int mes, int ano) {
    try {
      final date = DateTime.parse(dateStr);
      return date.month == mes && date.year == ano;
    } catch (e) {
      return false;
    }
  }
}
