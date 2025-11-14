import 'package:flutter/material.dart';
import '../../../../core/l10n/app_localizations.dart';
import '../../domain/models/faq_item.dart';

class FaqData {
  static List<FaqItem> getFaqs(BuildContext context) {
    return [
      FaqItem(
        question: context.tr('chatbot.faq_1_q'),
        answer: context.tr('chatbot.faq_1_a'),
      ),
      FaqItem(
        question: context.tr('chatbot.faq_2_q'),
        answer: context.tr('chatbot.faq_2_a'),
      ),
      FaqItem(
        question: context.tr('chatbot.faq_3_q'),
        answer: context.tr('chatbot.faq_3_a'),
      ),
    ];
  }
}
