String _getFieldById(int id, List lst) {
  for (var item in lst) {
    if (item['id'] == id) {
      return item['name'];
    }
  }
  return '${id}';
}

String getCountyById(int id) {
  return _getFieldById(id, countries);
}

String getInterestCategoryById(int id) {
  return _getFieldById(id, interestsCategories);
}

List<Map<String, dynamic>> countries = [
  {"id": 19, "name": "Австралия"},
  {"id": 20, "name": "Австрия"},
  {"id": 5, "name": "Азербайджан"},
  {"id": 21, "name": "Албания"},
  {"id": 22, "name": "Алжир"},
  {"id": 23, "name": "Американское Самоа"},
  {"id": 24, "name": "Ангилья"},
  {"id": 25, "name": "Ангола"},
  {"id": 26, "name": "Андорра"},
  {"id": 27, "name": "Антигуа и Барбуда"},
  {"id": 28, "name": "Аргентина"},
  {"id": 6, "name": "Армения"},
  {"id": 29, "name": "Аруба"},
  {"id": 30, "name": "Афганистан"},
  {"id": 31, "name": "Багамы"},
  {"id": 32, "name": "Бангладеш"},
  {"id": 33, "name": "Барбадос"},
  {"id": 34, "name": "Бахрейн"},
  {"id": 3, "name": "Беларусь"},
  {"id": 35, "name": "Белиз"},
  {"id": 36, "name": "Бельгия"},
  {"id": 37, "name": "Бенин"},
  {"id": 38, "name": "Бермуды"},
  {"id": 39, "name": "Болгария"},
  {"id": 40, "name": "Боливия"},
  {"id": 235, "name": "Бонайре, Синт-Эстатиус и Саба"},
  {"id": 41, "name": "Босния и Герцеговина"},
  {"id": 42, "name": "Ботсвана"},
  {"id": 43, "name": "Бразилия"},
  {"id": 44, "name": "Бруней"},
  {"id": 45, "name": "Буркина-Фасо"},
  {"id": 46, "name": "Бурунди"},
  {"id": 47, "name": "Бутан"},
  {"id": 48, "name": "Вануату"},
  {"id": 233, "name": "Ватикан"},
  {"id": 49, "name": "Великобритания"},
  {"id": 50, "name": "Венгрия"},
  {"id": 51, "name": "Венесуэла"},
  {"id": 52, "name": "Виргинские острова, Великобритания"},
  {"id": 53, "name": "Виргинские острова, США"},
  {"id": 54, "name": "Восточный Тимор"},
  {"id": 55, "name": "Вьетнам"},
  {"id": 56, "name": "Габон"},
  {"id": 57, "name": "Гаити"},
  {"id": 58, "name": "Гайана"},
  {"id": 59, "name": "Гамбия"},
  {"id": 60, "name": "Гана"},
  {"id": 61, "name": "Гваделупа"},
  {"id": 62, "name": "Гватемала"},
  {"id": 63, "name": "Гвинея"},
  {"id": 64, "name": "Гвинея-Бисау"},
  {"id": 65, "name": "Германия"},
  {"id": 236, "name": "Гернси"},
  {"id": 66, "name": "Гибралтар"},
  {"id": 67, "name": "Гондурас"},
  {"id": 69, "name": "Гренада"},
  {"id": 70, "name": "Гренландия"},
  {"id": 71, "name": "Греция"},
  {"id": 7, "name": "Грузия"},
  {"id": 72, "name": "Гуам"},
  {"id": 73, "name": "Дания"},
  {"id": 237, "name": "Джерси"},
  {"id": 231, "name": "Джибути"},
  {"id": 74, "name": "Доминика"},
  {"id": 75, "name": "Доминиканская Республика"},
  {"id": 76, "name": "Египет"},
  {"id": 77, "name": "Замбия"},
  {"id": 78, "name": "Западная Сахара"},
  {"id": 79, "name": "Зимбабве"},
  {"id": 8, "name": "Израиль"},
  {"id": 80, "name": "Индия"},
  {"id": 81, "name": "Индонезия"},
  {"id": 82, "name": "Иордания"},
  {"id": 83, "name": "Ирак"},
  {"id": 84, "name": "Иран"},
  {"id": 85, "name": "Ирландия"},
  {"id": 86, "name": "Исландия"},
  {"id": 87, "name": "Испания"},
  {"id": 88, "name": "Италия"},
  {"id": 89, "name": "Йемен"},
  {"id": 90, "name": "Кабо-Верде"},
  {"id": 4, "name": "Казахстан"},
  {"id": 91, "name": "Камбоджа"},
  {"id": 92, "name": "Камерун"},
  {"id": 10, "name": "Канада"},
  {"id": 93, "name": "Катар"},
  {"id": 94, "name": "Кения"},
  {"id": 95, "name": "Кипр"},
  {"id": 96, "name": "Кирибати"},
  {"id": 97, "name": "Китай"},
  {"id": 98, "name": "Колумбия"},
  {"id": 99, "name": "Коморы"},
  {"id": 100, "name": "Конго"},
  {"id": 101, "name": "Конго, демократическая республика"},
  {"id": 102, "name": "Коста-Рика"},
  {"id": 103, "name": "Кот-д'Ивуар"},
  {"id": 104, "name": "Куба"},
  {"id": 105, "name": "Кувейт"},
  {"id": 11, "name": "Кыргызстан"},
  {"id": 138, "name": "Кюрасао"},
  {"id": 106, "name": "Лаос"},
  {"id": 12, "name": "Латвия"},
  {"id": 107, "name": "Лесото"},
  {"id": 108, "name": "Либерия"},
  {"id": 109, "name": "Ливан"},
  {"id": 110, "name": "Ливия"},
  {"id": 13, "name": "Литва"},
  {"id": 111, "name": "Лихтенштейн"},
  {"id": 112, "name": "Люксембург"},
  {"id": 113, "name": "Маврикий"},
  {"id": 114, "name": "Мавритания"},
  {"id": 115, "name": "Мадагаскар"},
  {"id": 118, "name": "Малави"},
  {"id": 119, "name": "Малайзия"},
  {"id": 120, "name": "Мали"},
  {"id": 121, "name": "Мальдивы"},
  {"id": 122, "name": "Мальта"},
  {"id": 123, "name": "Марокко"},
  {"id": 124, "name": "Мартиника"},
  {"id": 125, "name": "Маршалловы Острова"},
  {"id": 126, "name": "Мексика"},
  {"id": 127, "name": "Микронезия, федеративные штаты"},
  {"id": 128, "name": "Мозамбик"},
  {"id": 15, "name": "Молдова"},
  {"id": 129, "name": "Монако"},
  {"id": 130, "name": "Монголия"},
  {"id": 131, "name": "Монтсеррат"},
  {"id": 132, "name": "Мьянма"},
  {"id": 133, "name": "Намибия"},
  {"id": 134, "name": "Науру"},
  {"id": 135, "name": "Непал"},
  {"id": 136, "name": "Нигер"},
  {"id": 137, "name": "Нигерия"},
  {"id": 139, "name": "Нидерланды"},
  {"id": 140, "name": "Никарагуа"},
  {"id": 141, "name": "Ниуэ"},
  {"id": 142, "name": "Новая Зеландия"},
  {"id": 143, "name": "Новая Каледония"},
  {"id": 144, "name": "Норвегия"},
  {"id": 145, "name": "Объединенные Арабские Эмираты"},
  {"id": 146, "name": "Оман"},
  {"id": 147, "name": "Остров Мэн"},
  {"id": 148, "name": "Остров Норфолк"},
  {"id": 149, "name": "Острова Кайман"},
  {"id": 150, "name": "Острова Кука"},
  {"id": 151, "name": "Острова Теркс и Кайкос"},
  {"id": 152, "name": "Пакистан"},
  {"id": 153, "name": "Палау"},
  {"id": 154, "name": "Палестинская автономия"},
  {"id": 155, "name": "Панама"},
  {"id": 156, "name": "Папуа — Новая Гвинея"},
  {"id": 157, "name": "Парагвай"},
  {"id": 158, "name": "Перу"},
  {"id": 159, "name": "Питкерн"},
  {"id": 160, "name": "Польша"},
  {"id": 161, "name": "Португалия"},
  {"id": 162, "name": "Пуэрто-Рико"},
  {"id": 163, "name": "Реюньон"},
  {"id": 1, "name": "Россия"},
  {"id": 164, "name": "Руанда"},
  {"id": 165, "name": "Румыния"},
  {"id": 9, "name": "США"},
  {"id": 166, "name": "Сальвадор"},
  {"id": 167, "name": "Самоа"},
  {"id": 168, "name": "Сан-Марино"},
  {"id": 169, "name": "Сан-Томе и Принсипи"},
  {"id": 170, "name": "Саудовская Аравия"},
  {"id": 172, "name": "Святая Елена"},
  {"id": 173, "name": "Северная Корея"},
  {"id": 117, "name": "Северная Македония"},
  {"id": 174, "name": "Северные Марианские острова"},
  {"id": 175, "name": "Сейшелы"},
  {"id": 176, "name": "Сенегал"},
  {"id": 177, "name": "Сент-Винсент и Гренадины"},
  {"id": 178, "name": "Сент-Китс и Невис"},
  {"id": 179, "name": "Сент-Люсия"},
  {"id": 180, "name": "Сент-Пьер и Микелон"},
  {"id": 181, "name": "Сербия"},
  {"id": 182, "name": "Сингапур"},
  {"id": 234, "name": "Синт-Мартен"},
  {"id": 183, "name": "Сирия"},
  {"id": 184, "name": "Словакия"},
  {"id": 185, "name": "Словения"},
  {"id": 186, "name": "Соломоновы Острова"},
  {"id": 187, "name": "Сомали"},
  {"id": 188, "name": "Судан"},
  {"id": 189, "name": "Суринам"},
  {"id": 190, "name": "Сьерра-Леоне"},
  {"id": 16, "name": "Таджикистан"},
  {"id": 191, "name": "Таиланд"},
  {"id": 192, "name": "Тайвань"},
  {"id": 193, "name": "Танзания"},
  {"id": 194, "name": "Того"},
  {"id": 195, "name": "Токелау"},
  {"id": 196, "name": "Тонга"},
  {"id": 197, "name": "Тринидад и Тобаго"},
  {"id": 198, "name": "Тувалу"},
  {"id": 199, "name": "Тунис"},
  {"id": 17, "name": "Туркменистан"},
  {"id": 200, "name": "Турция"},
  {"id": 201, "name": "Уганда"},
  {"id": 18, "name": "Узбекистан"},
  {"id": 2, "name": "Украина"},
  {"id": 202, "name": "Уоллис и Футуна"},
  {"id": 203, "name": "Уругвай"},
  {"id": 204, "name": "Фарерские острова"},
  {"id": 205, "name": "Фиджи"},
  {"id": 206, "name": "Филиппины"},
  {"id": 207, "name": "Финляндия"},
  {"id": 208, "name": "Фолклендские острова"},
  {"id": 209, "name": "Франция"},
  {"id": 210, "name": "Французская Гвиана"},
  {"id": 211, "name": "Французская Полинезия"},
  {"id": 212, "name": "Хорватия"},
  {"id": 213, "name": "Центральноафриканская Республика"},
  {"id": 214, "name": "Чад"},
  {"id": 230, "name": "Черногория"},
  {"id": 215, "name": "Чехия"},
  {"id": 216, "name": "Чили"},
  {"id": 217, "name": "Швейцария"},
  {"id": 218, "name": "Швеция"},
  {"id": 219, "name": "Шпицберген и Ян Майен"},
  {"id": 220, "name": "Шри-Ланка"},
  {"id": 221, "name": "Эквадор"},
  {"id": 222, "name": "Экваториальная Гвинея"},
  {"id": 223, "name": "Эритрея"},
  {"id": 171, "name": "Эсватини"},
  {"id": 14, "name": "Эстония"},
  {"id": 224, "name": "Эфиопия"},
  {"id": 226, "name": "Южная Корея"},
  {"id": 227, "name": "Южно-Африканская Республика"},
  {"id": 232, "name": "Южный Судан"},
  {"id": 228, "name": "Ямайка"},
  {"id": 229, "name": "Япония"}
];

List<Map<String, dynamic>> interestsCategories = [
  {"id": 501, "name": "Покупают онлайн"},
  {"id": 510, "name": "Родители, дети до 1 года"},
  {"id": 511, "name": "Родители, дети от 1 до 3 лет"},
  {"id": 512, "name": "Родители, дети от 4 до 6 лет"},
  {"id": 513, "name": "Родители, дети от 7 до 12 лет"},
  {"id": 520, "name": "Покупка жилья"},
  {"id": 521, "name": "Коммерческая недвижимость"},
  {"id": 522, "name": "Покупка автомобиля"},
  {"id": 523, "name": "Интернет-банкинг"},
  {"id": 524, "name": "Потребительские кредиты"},
  {"id": 525, "name": "Микрозаймы и МФО"},
  {"id": 526, "name": "Кредиты для бизнеса"},
  {"id": 527, "name": "Кредитные карточки"},
  {"id": 528, "name": "Вклады и депозиты"},
  {"id": 529, "name": "Электронные кошельки"},
  {"id": 603, "name": "Друзья именинников — мужчин, 3 дня"},
  {"id": 604, "name": "Друзья именинников — мужчин, 7 дней"},
  {"id": 605, "name": "Друзья именинников — женщин, 3 дня"},
  {"id": 606, "name": "Друзья именинников — женщин, 7 дней"},
  {"id": 1, "name": "Авто/мото"},
  {"id": 2, "name": "Активный отдых"},
  {"id": 19, "name": "Безопасность"},
  {"id": 3, "name": "Бизнес"},
  {"id": 42, "name": "Дизайн и графика"},
  {"id": 29, "name": "Дом и семья"},
  {"id": 4, "name": "Домашние животные"},
  {"id": 5, "name": "Здоровье"},
  {"id": 6, "name": "Знакомство и общение"},
  {"id": 7, "name": "Игры"},
  {"id": 8, "name": "ИТ (компьютеры и софт)"},
  {"id": 9, "name": "Кино"},
  {"id": 10, "name": "Красота и мода"},
  {"id": 11, "name": "Кулинария"},
  {"id": 12, "name": "Культура и искусство"},
  {"id": 13, "name": "Литература"},
  {"id": 14, "name": "Мобильная связь и интернет"},
  {"id": 15, "name": "Музыка"},
  {"id": 16, "name": "Наука и техника"},
  {"id": 17, "name": "Недвижимость"},
  {"id": 18, "name": "Новости и СМИ"},
  {"id": 20, "name": "Образование"},
  {"id": 21, "name": "Обустройство и ремонт"},
  {"id": 41, "name": "Общество, гуманитарные науки"},
  {"id": 22, "name": "Политика"},
  {"id": 23, "name": "Продукты питания"},
  {"id": 24, "name": "Промышленность"},
  {"id": 25, "name": "Путешествия"},
  {"id": 26, "name": "Работа"},
  {"id": 27, "name": "Развлечения"},
  {"id": 28, "name": "Религия"},
  {"id": 30, "name": "Спорт"},
  {"id": 31, "name": "Страхование"},
  {"id": 32, "name": "Телевидение"},
  {"id": 33, "name": "Товары и услуги"},
  {"id": 34, "name": "Увлечения и хобби"},
  {"id": 35, "name": "Финансы"},
  {"id": 36, "name": "Фото"},
  {"id": 37, "name": "Эзотерика"},
  {"id": 38, "name": "Электроника и бытовая техника"},
  {"id": 39, "name": "Эротика"},
  {"id": 40, "name": "Юмор"},
  {"id": 10066, "name": "Авто и мото"},
  {"id": 10001, "name": "Автомобили"},
  {"id": 10002, "name": "Автодилеры"},
  {"id": 10003, "name": "Автовладельцы"},
  {"id": 10004, "name": "Мотоциклы"},
  {"id": 10005, "name": "Велосипеды, скутеры"},
  {"id": 522, "name": "Покупка автомобиля"},
  {"id": 10067, "name": "Бизнес"},
  {"id": 10016, "name": "IT услуги"},
  {"id": 10017, "name": "Финансовая и правовая поддержка"},
  {"id": 10018, "name": "Услуги для бизнеса"},
  {"id": 10019, "name": "Производство"},
  {"id": 521, "name": "Коммерческая недвижимость"},
  {"id": 526, "name": "Кредиты для бизнеса"},
  {"id": 10068, "name": "Дом и ремонт"},
  {"id": 10044, "name": "Мебель"},
  {"id": 10045, "name": "Дизайн интерьера"},
  {"id": 10046, "name": "Ремонт, стройматериалы и инструменты"},
  {"id": 10047, "name": "Дача"},
  {"id": 10061, "name": "Бытовые услуги"},
  {"id": 520, "name": "Покупка жилья"},
  {"id": 10014, "name": "Домашние животные"},
  {"id": 10069, "name": "Еда и кулинария"},
  {"id": 10058, "name": "Продукты питания"},
  {"id": 10059, "name": "Доставка еды"},
  {"id": 10070, "name": "Красота и здоровье"},
  {"id": 10025, "name": "Аптеки и лекарства"},
  {"id": 10026, "name": "Медицинские учреждения"},
  {"id": 10028, "name": "Диеты и здоровое питание"},
  {"id": 10063, "name": "Красота, уход за собой"},
  {"id": 10029, "name": "Парфюмерия и косметика"},
  {"id": 10062, "name": "Мобильная связь и интернет"},
  {"id": 10039, "name": "Недвижимость"},
  {"id": 10020, "name": "Образование"},
  {"id": 10071, "name": "Обувь, одежда и аксессуары"},
  {"id": 10031, "name": "Женская и мужская одежда и обувь"},
  {"id": 10032, "name": "Детская одежда и обувь"},
  {"id": 10033, "name": "Украшения и другие аксессуары"},
  {"id": 10072, "name": "Общество"},
  {"id": 10040, "name": "Новости и СМИ"},
  {"id": 10041, "name": "Общество и политика"},
  {"id": 10060, "name": "Благотворительность"},
  {"id": 10042, "name": "Наука и техника"},
  {"id": 10043, "name": "Религия"},
  {"id": 10015, "name": "Поиск работы"},
  {"id": 10073, "name": "Развлечения и досуг"},
  {"id": 10006, "name": "Культурный отдых, афиша, мероприятия"},
  {"id": 10007, "name": "Рестораны, бары, кафе"},
  {"id": 10008, "name": "Развлечения"},
  {"id": 10009, "name": "Кинофильмы"},
  {"id": 10010, "name": "Музыка"},
  {"id": 10011, "name": "Книги"},
  {"id": 10012, "name": "Компьютерные игры"},
  {"id": 10013, "name": "Знакомство и общение"},
  {"id": 603, "name": "Друзья именинников — мужчин, 3 дня"},
  {"id": 604, "name": "Друзья именинников — мужчин, 7 дней"},
  {"id": 605, "name": "Друзья именинников — женщин, 3 дня"},
  {"id": 606, "name": "Друзья именинников — женщин, 7 дней"},
  {"id": 10074, "name": "Семья и дети"},
  {"id": 10021, "name": "Свадьба"},
  {"id": 10022, "name": "Беременность и роды"},
  {"id": 10023, "name": "Родители"},
  {"id": 10024, "name": "Товары для детей"},
  {"id": 10027, "name": "Детское здоровье"},
  {"id": 510, "name": "Родители, дети до 1 года"},
  {"id": 511, "name": "Родители, дети от 1 до 3 лет"},
  {"id": 512, "name": "Родители, дети от 4 до 6 лет"},
  {"id": 513, "name": "Родители, дети от 7 до 12 лет"},
  {"id": 10075, "name": "Спорт и фитнес"},
  {"id": 10030, "name": "Фитнес и ЗОЖ"},
  {"id": 10064, "name": "Спорт"},
  {"id": 10076, "name": "Туризм и путешествия"},
  {"id": 10034, "name": "Туры и турагентства"},
  {"id": 10035, "name": "Билеты и проживание"},
  {"id": 10036, "name": "Путешествуют по России"},
  {"id": 10037, "name": "Путешествуют за границей"},
  {"id": 10038, "name": "Активный отдых"},
  {"id": 10077, "name": "Финансы и страхование"},
  {"id": 10048, "name": "Кредиты и займы"},
  {"id": 10049, "name": "Банки, рынки, налоги"},
  {"id": 10050, "name": "Страхование"},
  {"id": 10051, "name": "Автострахование"},
  {"id": 501, "name": "Покупают онлайн"},
  {"id": 523, "name": "Интернет-банкинг"},
  {"id": 524, "name": "Потребительские кредиты"},
  {"id": 525, "name": "Микрозаймы и МФО"},
  {"id": 527, "name": "Кредитные карточки"},
  {"id": 528, "name": "Вклады и депозиты"},
  {"id": 529, "name": "Электронные кошельки"},
  {"id": 10078, "name": "Электроника и бытовая техника"},
  {"id": 10052, "name": "Ноутбуки, компьютеры и комплектующие"},
  {"id": 10053, "name": "Смартфоны и планшеты"},
  {"id": 10054, "name": "Аудио- и видеотехника, фото"},
  {"id": 10055, "name": "ПО и игры"},
  {"id": 10056, "name": "Мелкая бытовая техника"},
  {"id": 10057, "name": "Крупная бытовая техника"}
];
