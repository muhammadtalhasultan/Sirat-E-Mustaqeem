class Contributor {
  final String name;
  Contributor(this.name);
}

class Contributors {
  static List<Contributor> contributors = [
    Contributor('Abdul Kudoos Tahir'),
    Contributor('Abdul Rafik'),
    Contributor('Abdurahman Omar'),
    Contributor('Abid Hanif'),
    Contributor('Ahmad Zul Qarnain'),
    Contributor('Aicha Ba'),
    Contributor('Akif Mamedov'),
    Contributor('Aldina Mehmedovic'),
    Contributor('Amarpreet Kaur Nijjar'),
    Contributor('Azizbek Zubaydullayev'),
    Contributor('Ceyda'),
    Contributor('D West'),
    Contributor('Demitra Adams'),
    Contributor('Dr. Faizan Awan'),
    Contributor('Eren Yildiz'),
    Contributor('Haider Hameed'),
    Contributor('Hanif Hasan'),
    Contributor('Hashem Akbar'),
    Contributor('Hirman Abdullah'),
    Contributor('I Arendse'),
    Contributor('J Lukman'),
    Contributor('Kysha Zulkapri'),
    Contributor('Lamin L Jammeh'),
    Contributor('Mona Eldadah'),
    Contributor('Monir Ahmed'),
    Contributor('Mr. White'),
    Contributor('Muhammad Butr'),
    Contributor('Muhammad Tabrez Gangee'),
    Contributor('Mustapha El Kotob'),
    Contributor('Nasir Akhtar'),
    Contributor('Noor Huda Jaafar'),
    Contributor('Noyeem'),
    Contributor('Nur Liyana Kamaludin'),
    Contributor('Omaid Ali Khan'),
    Contributor('R O Walker'),
    Contributor('Ray S'),
    Contributor('Richard Hassad'),
    Contributor('Rushaa Mungroo'),
    Contributor('Saif Anwar'),
    Contributor('Saiyma Sajid'),
    Contributor('Shenaz Gangee'),
    Contributor('Shoaib Ali'),
    Contributor('Sylfest Haug'),
    Contributor('Tarek Haoula'),
    Contributor('Tauhid Sarwary'),
    Contributor('Taunie Jordan'),
  ];

  static int get firstColumnCount {
    final int total = contributors.length;

    if (total % 2 == 0) {
      return (total / 2).round();
    } else {
      return (total / 2).round() + 1;
    }
  }

  static int get secondColumnCount => contributors.length - firstColumnCount;
}
