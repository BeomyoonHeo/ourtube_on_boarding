enum ChannelCategory {
  /*
  Api문서 참고하여 request keyword 확인하기 jsonKey
   */

  all(name: '전체', keyword: ''),
  game(name: '게임', keyword: 'game'),
  technology(name: '과학기술', keyword: 'Technology'),
  knowHowAndStyle(name: '노하우/스타일', keyword: 'knowHowAndStyle'),
  film(name: '영화/애니메이션', keyword: 'Film'),
  military(name: '군대', keyword: 'military'),
  politics(name: '뉴스/정치', keyword: 'Politics'),
  society(name: '비영리/사회운동', keyword: 'Society'),
  sports(name: '스포츠', keyword: 'sports'),
  pet(name: '애완동물/동물', keyword: 'Pet'),
  entertainment(name: '엔터테인먼트', keyword: 'Entertainment'),
  tourism(name: '여행', keyword: 'Tourism'),
  hobby(name: '인물/블로그', keyword: 'Hobby'),
  religion(name: '종교', keyword: 'religion'),
  humour(name: '코미디', keyword: 'Humour');

  final String name;
  final String keyword;

  const ChannelCategory({required this.name, required this.keyword});

  factory ChannelCategory.fromString(String keyword) {
    switch (keyword) {
      case '':
        return ChannelCategory.all;

      case 'game':
        return ChannelCategory.game;

      case 'Technology':
        return ChannelCategory.technology;

      case 'knowHowAndStyle':
        return ChannelCategory.knowHowAndStyle;

      case 'Film':
        return ChannelCategory.film;

      case 'military':
        return ChannelCategory.military;

      case 'Politics':
        return ChannelCategory.politics;

      case 'Society':
        return ChannelCategory.society;

      case 'sports':
        return ChannelCategory.sports;

      case 'Pet':
        return ChannelCategory.pet;

      case 'Entertainment':
        return ChannelCategory.entertainment;

      case 'Tourism':
        return ChannelCategory.tourism;

      case 'Hobby':
        return ChannelCategory.hobby;

      case 'religion':
        return ChannelCategory.religion;

      case 'Humour':
        return ChannelCategory.humour;

      default:
        throw Exception('enum not found');
    }
  }
}
