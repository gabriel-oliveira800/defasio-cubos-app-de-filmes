const categoriesTeste =  '''{
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

const moviesTeste = '''{
  "page": 1,
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


const moviesTestePaginate = '''{
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