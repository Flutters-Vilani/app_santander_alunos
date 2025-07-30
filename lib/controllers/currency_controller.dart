import 'package:intl/intl.dart';

class CurrencyController {
  static final NumberFormat _currencyFormatter = NumberFormat.currency(
    locale: 'pt_BR',
    symbol: 'R\$ ',
    decimalDigits: 2,
  );

  static final NumberFormat _inputFormatter = NumberFormat.currency(
    locale: 'pt_BR',
    symbol: '',
    decimalDigits: 2,
  );

  // Formata o valor para exibição (ex: R$ 10.599,99)
  static String formatCurrency(double value) {
    return _currencyFormatter.format(value);
  }

  // Formata o valor para exibição sem símbolo (ex: 10.599,99)
  static String formatCurrencyWithoutSymbol(double value) {
    return _inputFormatter.format(value);
  }

  // Converte string formatada para double (ex: "10.599,99" -> 10599.99)
  static double parseCurrency(String value) {
    if (value.isEmpty) return 0.0;

    // Remove o prefixo R$ se existir
    String cleanValue = value.replaceAll('R\$', '').trim();

    // Remove pontos de milhares e substitui vírgula por ponto
    cleanValue = cleanValue.replaceAll('.', '').replaceAll(',', '.');

    try {
      return double.parse(cleanValue);
    } catch (e) {
      return 0.0;
    }
  }

  // Formata o input enquanto o usuário digita
  static String formatInput(String value) {
    if (value.isEmpty) return '';

    // Remove tudo que não é número
    String numbersOnly = value.replaceAll(RegExp(r'[^\d]'), '');

    if (numbersOnly.isEmpty) return '';

    // Converte para centavos
    int cents = int.parse(numbersOnly);
    double realValue = cents / 100;

    // Formata para exibição
    return formatCurrencyWithoutSymbol(realValue);
  }

  // Verifica se o valor é válido para habilitar o botão
  static bool isValidCurrency(String value) {
    if (value.isEmpty) return false;
    double parsed = parseCurrency(value);
    return parsed > 0;
  }
}
