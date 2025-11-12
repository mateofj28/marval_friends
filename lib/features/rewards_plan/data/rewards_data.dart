import '../domain/models/reward.dart';

class RewardsData {
  static const Map<String, List<Reward>> cityRewards = {
    'Bucaramanga': [
      Reward(name: 'NAVARRA GRAN RESERVA', price: '\$ 2.000.000'),
      Reward(name: 'GERMANIA', price: '\$ 1.000.000'),
      Reward(name: 'PRADERA DEL HATO', price: '\$ 2.000.000'),
      Reward(name: 'EL COUNTRY - MASAI', price: '\$ 700.000'),
      Reward(name: 'SKY TOWER', price: '\$ 1.000.000'),
      Reward(name: 'MIRAFLORES DEL VALLE', price: '\$ 500.000'),
      Reward(name: 'BULEVAR DEL PUENTE', price: '\$ 500.000'),
      Reward(name: 'CITYCENTER', price: '\$ 700.000'),
    ],
    'Bogotá': [
      Reward(name: 'PROVENZA IMPERIAL', price: '\$ 2.000.000'),
      Reward(name: 'PROVENZA PRESTIGE', price: '\$ 2.000.000'),
      Reward(name: 'BAVIERA', price: '\$ 3.500.000'),
      Reward(name: 'SAN SIMON - LA QUINTA', price: '\$ 200.000'),
      Reward(name: 'SAN MATEO - LA QUINTA', price: '\$ 250.000'),
      Reward(name: 'BURDEOS CIUDAD LA SALLE', price: '\$ 700.000'),
      Reward(name: 'PROVENZA REGENCY', price: '\$ 1.500.000'),
      Reward(name: 'LA SCALA', price: '\$ 500.000'),
    ],
    'Cartagena': [
      Reward(name: 'FIORENTTI', price: '\$ 2.000.000'),
      Reward(name: 'PORTO NOVO', price: '\$ 5.000.000'),
      Reward(name: 'JARDIN IMPERIAL', price: '\$ 400.000'),
      Reward(name: 'MILAN', price: '\$ 500.000'),
      Reward(name: 'BRISAS DEL JARDIN', price: '\$ 300.000'),
      Reward(name: 'PARMA', price: '\$ 200.000'),
      Reward(name: 'JARDIN AZUCENA', price: '\$ 200.000'),
      Reward(name: 'PUNTALTA ALTARENA', price: '\$ 500.000'),
    ],
    'Barranquilla': [
      Reward(name: 'COSTANERA', price: '\$ 1.500.000'),
      Reward(name: 'PARKSIDE', price: '\$ 600.000'),
      Reward(name: 'VALLARTA', price: '\$ 1.500.000'),
      Reward(name: 'PIAMONTE', price: '\$ 1.000.000'),
      Reward(name: 'BOLONIA', price: '\$ 400.000'),
      Reward(name: 'ALTOS DEL PARQUE', price: '\$ 500.000'),
      Reward(name: 'MIRADOR DEL PARQUE', price: '\$ 500.000'),
      Reward(name: 'SIENA', price: '\$ 500.000'),
    ],
    'Cali': [
      Reward(name: 'COSTANERA', price: '\$ 1.500.000'),
      Reward(name: 'PARKSIDE', price: '\$ 600.000'),
      Reward(name: 'VALLARTA', price: '\$ 1.500.000'),
      Reward(name: 'PIAMONTE', price: '\$ 1.000.000'),
      Reward(name: 'BOLONIA', price: '\$ 400.000'),
      Reward(name: 'ALTOS DEL PARQUE', price: '\$ 500.000'),
      Reward(name: 'MIRADOR DEL PARQUE', price: '\$ 500.000'),
      Reward(name: 'SIENA', price: '\$ 500.000'),
    ],
  };

  static List<Reward> getRewardsByCity(String city) {
    return cityRewards[city] ?? [];
  }
}
