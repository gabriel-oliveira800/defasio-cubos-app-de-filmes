const rawCategories = '''{
  "genres": [
    {
      "id": 28,
      "name": "Ação"
    },
    {
      "id": 12,
      "name": "Aventura"
    },
    {
      "id": 16,
      "name": "Animação"
    },
    {
      "id": 35,
      "name": "Comédia"
    },
    {
      "id": 80,
      "name": "Crime"
    },
    {
      "id": 99,
      "name": "Documentário"
    },
    {
      "id": 18,
      "name": "Drama"
    },
    {
      "id": 10751,
      "name": "Família"
    },
    {
      "id": 14,
      "name": "Fantasia"
    },
    {
      "id": 36,
      "name": "História"
    },
    {
      "id": 27,
      "name": "Terror"
    },
    {
      "id": 10402,
      "name": "Música"
    },
    {
      "id": 9648,
      "name": "Mistério"
    },
    {
      "id": 10749,
      "name": "Romance"
    },
    {
      "id": 878,
      "name": "Ficção científica"
    },
    {
      "id": 10770,
      "name": "Cinema TV"
    },
    {
      "id": 53,
      "name": "Thriller"
    },
    {
      "id": 10752,
      "name": "Guerra"
    },
    {
      "id": 37,
      "name": "Faroeste"
    }
  ]
}''';

const rawMoviesByCategory = '''{
  "page": 1,
  "results": [
    {
      "adult": false,
      "backdrop_path": "/ckfwfLkl0CkafTasoRw5FILhZAS.jpg",
      "genre_ids": [28, 35, 14],
      "id": 602211,
      "original_language": "en",
      "original_title": "Fatman",
      "overview": "",
      "popularity": 1630.265,
      "poster_path": "/4n8QNNdk4BOX9Dslfbz5Dy6j1HK.jpg",
      "release_date": "2020-11-13",
      "title": "Fatman",
      "video": false,
      "vote_average": 6.1,
      "vote_count": 90
    },
    {
      "adult": false,
      "backdrop_path": "/fTDzKoQIh1HeyjfpG5AHMi2jxAJ.jpg",
      "genre_ids": [28, 35],
      "id": 682377,
      "original_language": "en",
      "original_title": "Chick Fight",
      "overview": "",
      "popularity": 1443.813,
      "poster_path": "/4ZocdxnOO6q2UbdKye2wgofLFhB.jpg",
      "release_date": "2020-11-13",
      "title": "Chick Fight",
      "video": false,
      "vote_average": 5.9,
      "vote_count": 41
    }
  ],
  "total_pages": 500,
  "total_results": 10000
}''';

const rawMoviesByCategoryPaginate = '''{
  "page": 2,
  "results": [
    {
      "adult": false,
      "backdrop_path": "/fTDzKoQIh1HeyjfpG5AHMi2jxAJ.jpg",
      "genre_ids": [
        28,
        35
      ],
      "id": 682377,
      "original_language": "en",
      "original_title": "Chick Fight",
      "overview": "Quando Anna Wyncomb é apresentada a um submundo de luta feminina para lidar com toda a bagunça que está a sua vida, ela percebe que está mais conectada à história do clube do que imaginava, redescobrindo a si mesma, sua força interior e seu verdadeiro propósito.",
      "popularity": 1443.813,
      "poster_path": "/4ZocdxnOO6q2UbdKye2wgofLFhB.jpg",
      "release_date": "2020-11-13",
      "title": "Chick Fight",
      "video": false,
      "vote_average": 5.9,
      "vote_count": 41
    },
    {
      "adult": false,
      "backdrop_path": "/86L8wqGMDbwURPni2t7FQ0nDjsH.jpg",
      "genre_ids": [
        28,
        53
      ],
      "id": 724989,
      "original_language": "en",
      "original_title": "Hard Kill",
      "overview": "O trabalho do bilionário CEO de tecnologia Donovan Chalmers (Willis) é tão valioso que ele contrata mercenários para protegê-lo e um grupo terrorista sequestra sua filha apenas para obtê-lo.",
      "popularity": 1134.48,
      "poster_path": "/ugZW8ocsrfgI95pnQ7wrmKDxIe.jpg",
      "release_date": "2020-10-23",
      "title": "Hard Kill",
      "video": false,
      "vote_average": 5,
      "vote_count": 215
    }
  ],
  "total_pages": 500,
  "total_results": 10000
}
''';

const rawMovieDetails = '''{
  "adult": false,
  "backdrop_path": "/rr7E0NoGKxvbkb89eR1GwfoYjpA.jpg",
  "belongs_to_collection": null,
  "budget": 63000000,
  "genres": [
    {
      "id": 18,
      "name": "Drama"
    }
  ],
  "homepage": "http://www.foxmovies.com/movies/fight-club",
  "id": 550,
  "imdb_id": "tt0137523",
  "original_language": "en",
  "original_title": "Fight Club",
  "overview": "Um homem deprimido que sofre de insônia conhece um estranho vendedor chamado Tyler Durden e se vê morando em uma casa suja depois que seu perfeito apartamento é destruído. A dupla forma um clube com regras rígidas onde homens lutam. A parceria perfeita é comprometida quando uma mulher, Marla, atrai a atenção de Tyler.",
  "popularity": 42.902,
  "poster_path": "/ohXr0v9U0TfFu9IXbSDm5zoGV3R.jpg",
  "production_companies": [
    {
      "id": 508,
      "logo_path": "/7PzJdsLGlR7oW4J0J5Xcd0pHGRg.png",
      "name": "Regency Enterprises",
      "origin_country": "US"
    },
    {
      "id": 711,
      "logo_path": "/tEiIH5QesdheJmDAqQwvtN60727.png",
      "name": "Fox 2000 Pictures",
      "origin_country": "US"
    },
    {
      "id": 20555,
      "logo_path": "/hD8yEGUBlHOcfHYbujp71vD8gZp.png",
      "name": "Taurus Film",
      "origin_country": "DE"
    },
    {
      "id": 54051,
      "logo_path": null,
      "name": "Atman Entertainment",
      "origin_country": ""
    },
    {
      "id": 54052,
      "logo_path": null,
      "name": "Knickerbocker Films",
      "origin_country": "US"
    },
    {
      "id": 25,
      "logo_path": "/qZCc1lty5FzX30aOCVRBLzaVmcp.png",
      "name": "20th Century Fox",
      "origin_country": "US"
    },
    {
      "id": 4700,
      "logo_path": "/A32wmjrs9Psf4zw0uaixF0GXfxq.png",
      "name": "The Linson Company",
      "origin_country": ""
    }
  ],
  "production_countries": [
    {
      "iso_3166_1": "DE",
      "name": "Germany"
    },
    {
      "iso_3166_1": "US",
      "name": "United States of America"
    }
  ],
  "release_date": "1999-10-15",
  "revenue": 100853753,
  "runtime": 139,
  "spoken_languages": [
    {
      "english_name": "English",
      "iso_639_1": "en",
      "name": "English"
    }
  ],
  "status": "Released",
  "tagline": "Má conduta. Caos. Sabão.",
  "title": "Clube da Luta",
  "video": false,
  "vote_average": 8.4,
  "vote_count": 20534
}''';

const rawMoviesSearch = '''{
  "page": 1,
  "results": [
    {
      "poster_path": "/cezWGskPY5x7GaglTTRN4Fugfb8.jpg",
      "adult": false,
      "overview": "When an unexpected enemy emerges and threatens global safety and security, Nick Fury, director of the international peacekeeping agency known as S.H.I.E.L.D., finds himself in need of a team to pull the world back from the brink of disaster. Spanning the globe, a daring recruitment effort begins!",
      "release_date": "2012-04-25",
      "genre_ids": [
        878,
        28,
        12
      ],
      "id": 24428,
      "original_title": "The Avengers",
      "original_language": "en",
      "title": "The Avengers",
      "backdrop_path": "/hbn46fQaRmlpBuUrEiFqv0GDL6Y.jpg",
      "popularity": 7.353212,
      "vote_count": 8503,
      "video": false,
      "vote_average": 7.33
    },
    {
      "poster_path": "/7cJGRajXMU2aYdTbElIl6FtzOl2.jpg",
      "adult": false,
      "overview": "British Ministry agent John Steed, under direction from Mother, investigates a diabolical plot by arch-villain Sir August de Wynter to rule the world with his weather control machine. Steed investigates the beautiful Doctor Mrs. Emma Peel, the only suspect, but simultaneously falls for her and joins forces with her to combat Sir August.",
      "release_date": "1998-08-13",
      "genre_ids": [
        53
      ],
      "id": 9320,
      "original_title": "The Avengers",
      "original_language": "en",
      "title": "The Avengers",
      "backdrop_path": "/8YW4rwWQgC2JRlBcpStMNUko13k.jpg",
      "popularity": 2.270454,
      "vote_count": 111,
      "video": false,
      "vote_average": 4.7
    }
  ],
  "total_results": 14,
  "total_pages": 1
}
''';

const rawMoviesCredits = '''{
  "id": 550,
  "cast": [
    {
      "adult": false,
      "gender": 2,
      "id": 287,
      "known_for_department": "Acting",
      "name": "Brad Pitt",
      "original_name": "Brad Pitt",
      "popularity": 23.811,
      "profile_path": "/cckcYc2v0yh1tc9QjRelptcOBko.jpg",
      "cast_id": 5,
      "character": "Tyler Durden",
      "credit_id": "52fe4250c3a36847f80149f7",
      "order": 1
    }
  ],
  "crew": [
    {
      "adult": false,
      "gender": 2,
      "id": 605,
      "known_for_department": "Costume & Make-Up",
      "name": "Michael Kaplan",
      "original_name": "Michael Kaplan",
      "popularity": 0.695,
      "profile_path": null,
      "credit_id": "5894c4eac3a3685ec6000218",
      "department": "Costume & Make-Up",
      "job": "Costume Design"
    }
  ]
}''';
