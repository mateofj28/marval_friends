import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theme/theme_extensions.dart';
import '../../../../core/l10n/app_localizations.dart';

class TermsConditionsPage extends StatelessWidget {
  const TermsConditionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.background,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(20),
              color: context.surface,
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back,
                        color: context.primaryBlue),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      context.tr('terms.title'),
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: context.primaryBlue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: context.surface,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSection(context, context.tr('terms.section_referrer'),
                        _getReferrerContent(context),
                      ),
                      _buildSection(context, context.tr('terms.section_prizes'),
                        _getPrizesContent(context),
                      ),
                      _buildSection(context, context.tr('terms.section_referred'),
                        _getReferredContent(context),
                      ),
                      _buildSection(context, context.tr('terms.section_categories'),
                        _getCategoriesContent(context),
                      ),
                      _buildCategoryItem(context, context.tr('profile.tier_bronze'), _getCategoryBronze(context)),
                      _buildCategoryItem(context, context.tr('profile.tier_silver'), _getCategorySilver(context)),
                      _buildCategoryItem(context, context.tr('profile.tier_gold'), _getCategoryGold(context)),
                      const SizedBox(height: 16),
                      _buildBulletPoint(context, _getCategoryNote(context)),
                      const SizedBox(height: 24),
                      _buildSection(context, context.tr('terms.section_support'),
                        _getSupportContent(context),
                      ),
                      const SizedBox(height: 24),
                      Center(
                        child: Text(
                          context.tr('terms.last_update'),
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontStyle: FontStyle.italic,
                            color: context.textSecondary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(BuildContext context, String title, List<String> points) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(
            color: context.primaryBlue.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: context.primaryBlue,
            ),
          ),
        ),
        const SizedBox(height: 16),
        ...points.map((point) => _buildBulletPoint(context, point)),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildBulletPoint(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 8),
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: context.primaryBlue,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.poppins(
                fontSize: 14,
                height: 1.6,
                color: context.darkNavy,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(BuildContext context, String category, String description) {
    final isBronze = category.toLowerCase().contains('bronze') || category.toLowerCase().contains('bronce');
    final isSilver = category.toLowerCase().contains('silver') || category.toLowerCase().contains('plata');
    
    return Padding(
      padding: const EdgeInsets.only(left: 24, bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: isBronze
                  ? context.bronze
                  : isSilver
                      ? context.silver
                      : context.gold,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              category,
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              description,
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: context.darkNavy,
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<String> _getReferrerContent(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;
    if (locale == 'en') {
      return [
        'Customer participation is voluntary and free of charge.',
        'This program (Marval Friends) does not include raffles or sweepstakes.',
        'All Customers (who will be called REFERRERS) of the MARVAL group (Urbanizadora Marval S.A.S, Construcciones Marval S.A.S and Marval S.A.S who will be called THE COMPANIES) may participate. Understanding as a customer that NATURAL person who has paid the total separation of a property from our available offer or who has signed a purchase offer as of March 15, 2016; the person who is paying the initial fee or has registered a property with the companies will also be considered a referrer. Our customers have the possibility to refer other potential customers.',
        'The program does not apply to legal entities.',
        'Employees of the Marval group companies belonging to the sales, processing and portfolio area at the national level are excluded; other employees may participate as long as they are customers.',
        'The program does not apply to referrers who have been subject to withdrawal or withdrawal from a sales offer with THE COMPANIES.',
      ];
    }
    return [
      'La participacion del cliente es voluntaria y sin costo.',
      'Este programa (Amigos Marval) no contempla rifas ni sorteos.',
      'Podran participar todos los Clientes (a quienes se les llamara REFERENTES) del grupo MARVAL (Urbanizadora Marval S.A.S, Construcciones Marval S.A.S y Marval S.A.S a quienes se les llamara LAS EMPRESAS). Entendiendo como cliente aquella persona NATURAL que haya pagado el total de la separacion de un inmueble de nuestra oferta disponible o que haya suscrito oferta de compraventa a partir del 15 de marzo de 2016; tambien se considerara referente la persona que este pagando la cuota inicial o haya escriturado un inmueble con las empresas. Nuestros clientes tienen la posibilidad de referir otros potenciales clientes.',
      'El programa no aplica para personas juridicas.',
      'Quedan excluidos los funcionarios de las empresas del grupo Marval pertenecientes al area de ventas, tramite y cartera a nivel nacional; los demas funcionarios podran participar siempre y cuando sean clientes.',
      'El programa no aplica para referentes que hayan sido objeto de retiro o desistimiento de una oferta de venta con LAS EMPRESAS.',
    ];
  }

  List<String> _getPrizesContent(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;
    if (locale == 'en') {
      return [
        'The prize will be a value in pesos that the referrer can redeem at different commercial establishments through digital vouchers granted through the company Quantum, a provider contracted by THE COMPANIES to offer this service.',
        'The prizes are subject to the terms and conditions of the Quantum company and can be consulted before being redeemed in the Marval Friends mobile application.',
        'The value of the prizes may vary at any time, at the discretion of THE COMPANIES, that is, it is dynamic.',
        'The program applies to SELECTED PROJECTS by THE COMPANIES, listed in the "Rewards Plan" section of the Marval Friends mobile application and may vary at any time.',
        'THE COMPANIES are not responsible for the loss, expiration or any news presented with the prize. Quantum will be directly responsible for providing support in case of any news or customer inquiry.',
      ];
    }
    return [
      'El premio sera un valor en pesos que el referente podra redimir en diferentes establecimientos comerciales por medio de bonos digitales otorgados a traves de la empresa Quantum, proveedor contratado por LAS EMPRESAS para ofrecer este servicio.',
      'Los premios estan sujetos a los terminos y condiciones de la empresa Quantum y podran ser consultados antes de ser redimidos en la aplicacion movil Amigos Marval.',
      'El valor de los premios podra variar en cualquier momento, a criterio de LAS EMPRESAS, es decir es dinamico.',
      'El programa aplica para PROYECTOS SELECCIONADOS por LAS EMPRESAS, relacionados en el apartado "Plan de Premios" de la aplicacion movil Amigos Marval y podran variar en cualquier momento.',
      'LAS EMPRESAS no se hacen responsables por la perdida, vencimiento o cualquier novedad presentada con el premio. Quantum sera el encargado directo de prestar el soporte en caso de alguna novedad o inquietud del cliente.',
    ];
  }

  List<String> _getReferredContent(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;
    if (locale == 'en') {
      return [
        'The referred must be a new customer for THE COMPANIES, that is, they do not have any property acquired with THE COMPANIES.',
        'The referrer must register the referred BEFORE they make a quote for a property with THE COMPANIES. Otherwise, they will not be able to register them, since they will not be considered a NEW customer.',
        'Each time a referrer registers a referred, the referred will receive a notification by email, and must give their approval to participate in the program, and authorize the use of their personal data to THE COMPANIES and Quantum. Without this, the referred cannot be registered.',
        'Each time a referred is effective, the referrer will be notified through the notifications section of the Marval Friends mobile application.',
      ];
    }
    return [
      'El referido debe ser un cliente nuevo para LAS EMPRESAS es decir que no tenga ningun inmueble adquirido con LAS EMPRESAS.',
      'El referente debe registrar al referido ANTES de que este realice la cotizacion de un inmueble con LAS EMPRESAS. De lo contrario, no podra inscribirlo, ya que no sera considerado un cliente NUEVO.',
      'Cada vez que un referente registre a un referido, el referido recibira una notificacion por correo electronico, y debera dar su aprobacion para participar en el programa, y autorizar el uso de sus datos personales a LAS EMPRESAS y a Quantum. Sin esto, el referido no podra ser inscrito.',
      'Cada vez que un referido sea efectivo, le sera notificado al referente por medio de la seccion notificaciones de la aplicacion movil Amigos Marval.',
    ];
  }

  List<String> _getCategoriesContent(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;
    if (locale == 'en') {
      return [
        'The referrer will be classified by THE COMPANIES within the following 3 categories according to the number of effective referrals:',
      ];
    }
    return [
      'El referente sera clasificado por LAS EMPRESAS dentro de las siguientes 3 categorias de acuerdo con el numero de referidos efectivos:',
    ];
  }

  String _getCategoryBronze(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;
    return locale == 'en' ? 'From 3 to 5 effective referrals' : 'De 3 a 5 referidos efectivos';
  }

  String _getCategorySilver(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;
    return locale == 'en' ? 'Between 5 and 10 effective referrals' : 'Entre 5 y 10 referidos efectivos';
  }

  String _getCategoryGold(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;
    return locale == 'en' ? 'More than 10 effective referrals' : 'Mas de 10 referidos efectivos';
  }

  String _getCategoryNote(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;
    return locale == 'en' 
        ? 'The referred can move up in category according to the number of effective referrals and obtain additional benefits in travel.'
        : 'El referido podra ir subiendo de categoria de acuerdo con el numero de referidos efectivos y obtener beneficios adicionales en viajes.';
  }

  List<String> _getSupportContent(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;
    if (locale == 'en') {
      return [
        'Referrers will have permanent support on the Marval Friends program, through a chat bot available in the Marval Friends mobile application, or if required they can establish communication through the following email: amigosmarval@marval.com.co',
        'The Marval Friends Program reserves the right to reject the registration of any person who does not meet the requirements to participate in the program.',
        'Registration alone does not grant the right to the prize.',
        'In case of transfer of the referred apartment to another property of THE COMPANIES, the referrer will receive the value of the prize corresponding to the first negotiation.',
        'The program rewards the referrer for the number of people referred and NOT for the number of properties acquired.',
        'If two customers (referrers) refer to the same person (referred), the order of entry of the referred in the application will prevail and will be notified immediately.',
        'The prize will only be delivered to the customer registered in the Marval Friends mobile application and who has approved all the terms to be a winner.',
        'Customers may not transfer referrals to each other. If proven, they will not add up to obtain prizes.',
        'Customers who are prize winners and reside abroad can only redeem it at the following brands: XXXXX',
        'The promotion is non-transferable, non-negotiable, non-exchangeable, or for other goods or services and will be valid until December 31, 2026.',
        'The beneficiaries accept in advance the conditions under which the companies have chosen it without the right to claim for changes generated in the dynamics.',
        'The participants of the prize release THE COMPANIES from all responsibility understanding that they decide to participate for the prize individually and by their own will and risk, so they accept and declare that they understand all the previous clauses and waive to claim by any means, damage, loss or harm that may be caused by the use, enjoyment or abuse of the benefits of the promotion.',
      ];
    }
    return [
      'Los referentes tendran soporte permanente sobre el programa Amigos Marval, por medio de un chat bot dispuesto en la aplicacion movil Amigos Marval, o en caso de requerirlo pueden establecer comunicacion mediante el siguiente correo: amigosmarval@marval.com.co',
      'El Programa Amigos Marval se reserva la facultad de rechazar la inscripcion de toda persona que no cumpla los requisitos para participar del programa.',
      'La sola inscripcion no otorga el derecho al premio.',
      'En caso de traslado de apartamento del referido a otro inmueble de LAS EMPRESAS, el referente recibira el valor del premio correspondiente a la primera negociacion.',
      'El programa premia al referente por la cantidad de personas referidas y NO por el numero de inmuebles que adquiera.',
      'Si dos clientes (referentes) refieren a la misma persona (referido), primara el orden de ingreso del referido en la aplicacion y sera notificado inmediatamente.',
      'El premio solo se entregara al cliente registrado en la aplicacion movil Amigos Marval y que haya aprobado todos los terminos para ser ganador.',
      'Los clientes no podran transferir referidos entre si. En caso de comprobarse, no sumaran para obtener premios.',
      'Los clientes que sean ganadores de premio y residan en el exterior solo podran redimirlo en las siguientes marcas: XXXXX',
      'La promocion es intransferible, no negociable, no canjeable, ni por otros bienes o servicios y tendra validez hasta el 31 de diciembre del 2026.',
      'Los favorecidos aceptan de antemano las condiciones bajo las cuales las empresas lo han escogido sin derecho a reclamar por cambios generados en la dinamica.',
      'Los participantes del premio liberan a LAS EMPRESAS de toda responsabilidad entendiendo que deciden participar por el premio en forma individual y por su propia voluntad y riesgo, por lo que aceptan y declaran que comprenden todas las clausulas anteriores y renuncian a reclamar por cualquier medio, dano, perdida o perjuicio alguno que se pueda ocasionar por el uso, disfrute o abuso de los beneficios de la promocion.',
    ];
  }
}
