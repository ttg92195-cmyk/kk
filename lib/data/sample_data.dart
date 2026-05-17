import '../models/movie_model.dart';

class SampleData {
  static List<Movie> get movies => [
    Movie(
      id: '1', title: 'Dune: Part Two',
      posterUrl: 'https://image.tmdb.org/t/p/w500/8b8R8l88Qje9dn9OE8PY05Nez7.jpg',
      backdropUrl: 'https://image.tmdb.org/t/p/w500/xOMo8BRK7PfcJv9JCnx7s5hj0PX.jpg',
      imdbRating: 8.5, year: '2024', duration: '2h 46m',
      genre: 'Sci-Fi, Adventure', description: 'Paul Atreides unites with the Fremen while on a warpath of revenge against the conspirators who destroyed his family.',
      quality: 'WEB-DL', type: 'Movie', isTrending: true, tags: ['4K Movies'],
    ),
    Movie(
      id: '2', title: 'Oppenheimer',
      posterUrl: 'https://image.tmdb.org/t/p/w500/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg',
      backdropUrl: 'https://image.tmdb.org/t/p/w500/nb3xI8XI3w4pMVZ38VijbsyBqP4.jpg',
      imdbRating: 8.3, year: '2023', duration: '3h 0m',
      genre: 'Drama, History', description: 'The story of American scientist J. Robert Oppenheimer and his role in the development of the atomic bomb.',
      quality: 'BluRay', type: 'Movie', isTrending: true, tags: ['4K Movies'],
    ),
    Movie(
      id: '3', title: 'The Batman',
      posterUrl: 'https://image.tmdb.org/t/p/w500/74xTEgt7R36Fpooo50r9T25onhq.jpg',
      backdropUrl: 'https://image.tmdb.org/t/p/w500/b0PlSFdDwbyFAJlMe1mDBIOQ2Ae.jpg',
      imdbRating: 7.8, year: '2022', duration: '2h 56m',
      genre: 'Action, Crime', description: 'When a sadistic serial killer begins murdering key political figures in Gotham, Batman is forced to investigate.',
      quality: 'HD', type: 'Movie', isTrending: true,
    ),
    Movie(
      id: '4', title: 'Spider-Man: No Way Home',
      posterUrl: 'https://image.tmdb.org/t/p/w500/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg',
      backdropUrl: 'https://image.tmdb.org/t/p/w500/iQFcwSGbZXMkeyEkxbCj7u86scV.jpg',
      imdbRating: 8.2, year: '2021', duration: '2h 28m',
      genre: 'Action, Adventure', description: 'With Spider-Man\'s identity now revealed, Peter asks Doctor Strange for help.',
      quality: 'WEB-DL', type: 'Movie', isTrending: true, tags: ['4K Movies'],
    ),
    Movie(
      id: '5', title: 'Interstellar',
      posterUrl: 'https://image.tmdb.org/t/p/w500/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg',
      backdropUrl: 'https://image.tmdb.org/t/p/w500/xJHokMbljvjADYdit5fK1DVfjko.jpg',
      imdbRating: 8.7, year: '2014', duration: '2h 49m',
      genre: 'Sci-Fi, Drama', description: 'A team of explorers travel through a wormhole in space in an attempt to ensure humanity\'s survival.',
      quality: 'BluRay', type: 'Movie', isTrending: true, tags: ['4K Movies'],
    ),
    Movie(
      id: '6', title: 'John Wick: Chapter 4',
      posterUrl: 'https://image.tmdb.org/t/p/w500/vzpaeoJOZ3N3iqYaADa6gR0ORJe.jpg',
      backdropUrl: 'https://image.tmdb.org/t/p/w500/h8gHn0OzBoKcXnpWrmVUyRSMIiB.jpg',
      imdbRating: 7.7, year: '2023', duration: '2h 49m',
      genre: 'Action, Thriller', description: 'John Wick uncovers a path to defeating The High Table.',
      quality: 'WEB-DL', type: 'Movie',
    ),
    Movie(
      id: '7', title: 'The Dark Knight',
      posterUrl: 'https://image.tmdb.org/t/p/w500/qJ2tW6WMUDux911BTUgMe1nW5hi.jpg',
      backdropUrl: 'https://image.tmdb.org/t/p/w500/nMKdUUepR0i5zn0y1T4CsSB5ez.jpg',
      imdbRating: 9.0, year: '2008', duration: '2h 32m',
      genre: 'Action, Crime', description: 'When the menace known as the Joker wreaks havoc on Gotham, Batman must accept one of the greatest psychological and physical tests.',
      quality: 'BluRay', type: 'Movie', tags: ['4K Movies'],
    ),
    Movie(
      id: '8', title: 'Guardians of the Galaxy Vol. 3',
      posterUrl: 'https://image.tmdb.org/t/p/w500/r2J02Z2OpNTctfOSN1Ydgii51I3.jpg',
      backdropUrl: 'https://image.tmdb.org/t/p/w500/nGxUxi3PfXDRm7Vg95VBNgNM8yc.jpg',
      imdbRating: 8.0, year: '2023', duration: '2h 30m',
      genre: 'Action, Comedy', description: 'The Guardians must fight to protect Rocket from his past.',
      quality: 'HD', type: 'Movie',
    ),
    Movie(
      id: '9', title: 'Killers of the Flower Moon',
      posterUrl: 'https://image.tmdb.org/t/p/w500/dB6Krk806zeqd0YNp2ngQ9zXteR.jpg',
      backdropUrl: 'https://image.tmdb.org/t/p/w500/1X7vow16X7CnCoexXh4H4F2yDJv.jpg',
      imdbRating: 7.6, year: '2023', duration: '3h 26m',
      genre: 'Crime, Drama', description: 'Members of the Osage tribe in Oklahoma are murdered under mysterious circumstances in the 1920s.',
      quality: 'WEB-DL', type: 'Movie',
    ),
    Movie(
      id: '10', title: 'Inception',
      posterUrl: 'https://image.tmdb.org/t/p/w500/edv5CZvWj09upOsy2Y6IwDhK8bt.jpg',
      backdropUrl: 'https://image.tmdb.org/t/p/w500/s2bT29y6rg2q7gMhOcEViGn0y3h.jpg',
      imdbRating: 8.8, year: '2010', duration: '2h 28m',
      genre: 'Sci-Fi, Action', description: 'A thief who steals corporate secrets through the use of dream-sharing technology.',
      quality: 'BluRay', type: 'Movie', tags: ['4K Movies'],
    ),
    Movie(
      id: '11', title: 'Barbie',
      posterUrl: 'https://image.tmdb.org/t/p/w500/iuFNMS8U5cb6xfzi51Dbkovj7vM.jpg',
      backdropUrl: 'https://image.tmdb.org/t/p/w500/nHf61UzkfFno5dHMQ7u0NyrBPEw.jpg',
      imdbRating: 6.8, year: '2023', duration: '1h 54m',
      genre: 'Comedy, Adventure', description: 'Barbie and Ken are having the time of their lives in the colorful world of Barbieland.',
      quality: 'HD', type: 'Movie',
    ),
    Movie(
      id: '12', title: 'Avatar: The Way of Water',
      posterUrl: 'https://image.tmdb.org/t/p/w500/t6HIqrRAclMCA60NsSmeqe9RmNV.jpg',
      backdropUrl: 'https://image.tmdb.org/t/p/w500/s16H6tpK2utvwDtzZ8Qy4qm5Emw.jpg',
      imdbRating: 7.6, year: '2022', duration: '3h 12m',
      genre: 'Sci-Fi, Adventure', description: 'Jake Sully lives with his newfound family formed on the extrasolar moon Pandora.',
      quality: 'WEB-DL', type: 'Movie', tags: ['4K Movies'],
    ),
    // K Drama
    Movie(
      id: 'm13', title: 'Parasite',
      posterUrl: 'https://image.tmdb.org/t/p/w500/7IiTTgloJzvGI1TAYymCfbfl3vT.jpg',
      backdropUrl: 'https://image.tmdb.org/t/p/w500/TU9NIjwzjoKPwQHoHshkFcQUCG8.jpg',
      imdbRating: 8.5, year: '2019', duration: '2h 12m',
      genre: 'Thriller, Drama', description: 'Greed and class discrimination threaten the newly formed symbiotic relationship between the wealthy Park family and the destitute Kim clan.',
      quality: 'BluRay', type: 'Movie', tags: ['K Drama'],
    ),
    Movie(
      id: 'm14', title: 'Decision to Leave',
      posterUrl: 'https://image.tmdb.org/t/p/w500/pv6UmH3wsMfF5qHmXi07Uj9elQz.jpg',
      backdropUrl: 'https://image.tmdb.org/t/p/w500/pt5HoyckVdWnQsX2VaBdKkDKP5q.jpg',
      imdbRating: 7.8, year: '2022', duration: '2h 18m',
      genre: 'Mystery, Romance', description: 'A detective investigating a man\'s death in the mountains begins to suspect the dead man\'s mysterious wife.',
      quality: 'HD', type: 'Movie', tags: ['K Drama'],
    ),
    // Animation
    Movie(
      id: 'm15', title: 'Spider-Man: Across the Spider-Verse',
      posterUrl: 'https://image.tmdb.org/t/p/w500/8Vt6mWEReuy4Of61Lnj5Xj704m8.jpg',
      backdropUrl: 'https://image.tmdb.org/t/p/w500/4HodYYKEIsGOdinkGi2Ucz6X9i0.jpg',
      imdbRating: 8.7, year: '2023', duration: '2h 20m',
      genre: 'Animation, Action', description: 'Miles Morales catapults across the Multiverse, where he encounters a team of Spider-People.',
      quality: 'WEB-DL', type: 'Movie', isTrending: true, tags: ['Animation', '4K Movies'],
    ),
    Movie(
      id: 'm16', title: 'The Super Mario Bros. Movie',
      posterUrl: 'https://image.tmdb.org/t/p/w500/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg',
      backdropUrl: 'https://image.tmdb.org/t/p/w500/9n2tJBplPbgR2ca05hS5CKXwP2c.jpg',
      imdbRating: 7.1, year: '2023', duration: '1h 32m',
      genre: 'Animation, Adventure', description: 'A plumber named Mario travels through an underground labyrinth with his brother, Luigi.',
      quality: 'HD', type: 'Movie', tags: ['Animation'],
    ),
    // Anime
    Movie(
      id: 'm17', title: 'Demon Slayer: Mugen Train',
      posterUrl: 'https://image.tmdb.org/t/p/w500/h8Rb9gBr4ODStNIo6UOVlXVDi2K.jpg',
      backdropUrl: 'https://image.tmdb.org/t/p/w500/xUfRZu2mi8jH6SzQEJGP6tjBuYj.jpg',
      imdbRating: 8.2, year: '2020', duration: '1h 57m',
      genre: 'Animation, Action', description: 'After a series of mysterious disappearances on a train, Tanjiro and his friends investigate.',
      quality: 'BluRay', type: 'Movie', tags: ['Anime'],
    ),
    Movie(
      id: 'm18', title: 'Jujutsu Kaisen 0',
      posterUrl: 'https://image.tmdb.org/t/p/w500/nedsHjET01EQERVKxeEAgN3eCR.jpg',
      backdropUrl: 'https://image.tmdb.org/t/p/w500/kzXBwAVwKMg0ODo2lPNTmL2btlP.jpg',
      imdbRating: 7.8, year: '2021', duration: '1h 45m',
      genre: 'Animation, Fantasy', description: 'A boy swallows a cursed talisman and becomes host to a powerful curse.',
      quality: 'HD', type: 'Movie', tags: ['Anime'],
    ),
    // Bollywood
    Movie(
      id: 'm19', title: 'RRR',
      posterUrl: 'https://image.tmdb.org/t/p/w500/nEufeZYpR9ivUa8cOiLEpMfWaEH.jpg',
      backdropUrl: 'https://image.tmdb.org/t/p/w500/sGJQQttG8xK08mZEnKvlPBYKg4f.jpg',
      imdbRating: 7.8, year: '2022', duration: '3h 7m',
      genre: 'Action, Drama', description: 'A fictitious story about two legendary revolutionaries and their journey far away from home.',
      quality: 'WEB-DL', type: 'Movie', tags: ['Bollywood'],
    ),
    Movie(
      id: 'm20', title: 'Pathaan',
      posterUrl: 'https://image.tmdb.org/t/p/w500/dFXCpSsJOaKgwpfOYzsS2A0pMIh.jpg',
      backdropUrl: 'https://image.tmdb.org/t/p/w500/r7vIfxDCeW2gt4cDILdjSrotSjA.jpg',
      imdbRating: 6.5, year: '2023', duration: '2h 26m',
      genre: 'Action, Thriller', description: 'An Indian spy takes on the leader of a group of mercenaries who have nefarious plans to target his homeland.',
      quality: 'HD', type: 'Movie', tags: ['Bollywood'],
    ),
  ];

  static List<Movie> get series => [
    Movie(
      id: 's1', title: 'Breaking Bad',
      posterUrl: 'https://image.tmdb.org/t/p/w500/ztkUQFLlC19CCMYHW73WxxWgMD5.jpg',
      backdropUrl: 'https://image.tmdb.org/t/p/w500/9faGSFi5jam6pDWGNd0p8JcJgXQ.jpg',
      imdbRating: 9.5, year: '2008', duration: '5 Seasons',
      genre: 'Crime, Drama', description: 'A chemistry teacher diagnosed with terminal cancer turns to manufacturing methamphetamine.',
      quality: 'BluRay', type: 'Series', isTrending: true, tags: ['4K Series'],
    ),
    Movie(
      id: 's2', title: 'Stranger Things',
      posterUrl: 'https://image.tmdb.org/t/p/w500/49WJfeN0moxb9IPfGn8AIqMGskD.jpg',
      backdropUrl: 'https://image.tmdb.org/t/p/w500/56v2KjBlE1ulLiJPkjtJLFOBJiA.jpg',
      imdbRating: 8.7, year: '2016', duration: '4 Seasons',
      genre: 'Drama, Horror', description: 'When a young boy disappears, his mother, a police chief and his friends must confront terrifying supernatural forces.',
      quality: 'WEB-DL', type: 'Series', isTrending: true,
    ),
    Movie(
      id: 's3', title: 'The Last of Us',
      posterUrl: 'https://image.tmdb.org/t/p/w500/uKvVjHNqB5VmOrdxqAt2F7J78ED.jpg',
      backdropUrl: 'https://image.tmdb.org/t/p/w500/uDgy6hyPd82kOHh6I95FLtLnj6p.jpg',
      imdbRating: 8.8, year: '2023', duration: '1 Season',
      genre: 'Drama, Sci-Fi', description: 'Joel and Ellie must survive a pandemic that has ravaged the United States.',
      quality: 'WEB-DL', type: 'Series', isTrending: true, tags: ['4K Series'],
    ),
    Movie(
      id: 's4', title: 'Game of Thrones',
      posterUrl: 'https://image.tmdb.org/t/p/w500/7WUHnWGx5OO145IRxPDUkQSh4C7.jpg',
      backdropUrl: 'https://image.tmdb.org/t/p/w500/suopoADbf0bb1JKWxQxV9SyV4b7.jpg',
      imdbRating: 9.2, year: '2011', duration: '8 Seasons',
      genre: 'Drama, Fantasy', description: 'Nine noble families fight for control over the lands of Westeros.',
      quality: 'BluRay', type: 'Series', tags: ['4K Series'],
    ),
    Movie(
      id: 's5', title: 'Wednesday',
      posterUrl: 'https://image.tmdb.org/t/p/w500/9PFonBhy4cQy7Jz20NpMygczOkv.jpg',
      backdropUrl: 'https://image.tmdb.org/t/p/w500/iHSwvUVs0YFkH7WjVqzPzO8Vfbg.jpg',
      imdbRating: 8.1, year: '2022', duration: '1 Season',
      genre: 'Comedy, Crime', description: 'Follows Wednesday Addams years as a student attempting to master her psychic ability.',
      quality: 'HD', type: 'Series',
    ),
    Movie(
      id: 's6', title: 'The Mandalorian',
      posterUrl: 'https://image.tmdb.org/t/p/w500/sWgBv7LV2GRoWgShREInK3RrMvG.jpg',
      backdropUrl: 'https://image.tmdb.org/t/p/w500/9Vdg5Z9sJIboreK07X7PyhWK3eD.jpg',
      imdbRating: 8.3, year: '2019', duration: '3 Seasons',
      genre: 'Sci-Fi, Action', description: 'A lone gunfighter makes his way through the galaxy in the era after the fall of the Empire.',
      quality: 'WEB-DL', type: 'Series',
    ),
    Movie(
      id: 's7', title: 'Peaky Blinders',
      posterUrl: 'https://image.tmdb.org/t/p/w500/bG3x3dF2N8Z3lCz9hWjK2e9H4tO.jpg',
      backdropUrl: 'https://image.tmdb.org/t/p/w500/vT5JmgQqR4yeJh5V2sX0L0a9Y6I.jpg',
      imdbRating: 8.8, year: '2013', duration: '6 Seasons',
      genre: 'Crime, Drama', description: 'A gangster family epic set in 1900s England.',
      quality: 'BluRay', type: 'Series', tags: ['4K Series'],
    ),
    Movie(
      id: 's8', title: 'Squid Game',
      posterUrl: 'https://image.tmdb.org/t/p/w500/dDlEmu3EZ0Pgg93K2SVNLCjCSvE.jpg',
      backdropUrl: 'https://image.tmdb.org/t/p/w500/orO2ZnVxV2PvJHz5dCq9Us9hFBg.jpg',
      imdbRating: 8.0, year: '2021', duration: '2 Seasons',
      genre: 'Drama, Thriller', description: 'Hundreds of cash-strapped players accept a strange invitation to compete in children\'s games.',
      quality: 'WEB-DL', type: 'Series', isTrending: true, tags: ['K Drama'],
    ),
    Movie(
      id: 's9', title: 'House of the Dragon',
      posterUrl: 'https://image.tmdb.org/t/p/w500/z2Pi0aAYk0iOs2FiqfJ9VVn3Zk3.jpg',
      backdropUrl: 'https://image.tmdb.org/t/p/w500/DJcPFJYl4HoHwjv4mFy3b5V7Rz.jpg',
      imdbRating: 8.4, year: '2022', duration: '2 Seasons',
      genre: 'Drama, Fantasy', description: 'The story of the Targaryen civil war that took place about 200 years before the events of Game of Thrones.',
      quality: 'WEB-DL', type: 'Series', isTrending: true,
    ),
    Movie(
      id: 's10', title: 'Dark',
      posterUrl: 'https://image.tmdb.org/t/p/w500/apbrbWs8M9lyOpJYU5WXrpFbk1Z.jpg',
      backdropUrl: 'https://image.tmdb.org/t/p/w500/5qMoj8fv4QzZo7wLgqY0jJZZz9A.jpg',
      imdbRating: 8.8, year: '2017', duration: '3 Seasons',
      genre: 'Sci-Fi, Mystery', description: 'A family saga with a supernatural twist, set in a German town.',
      quality: 'BluRay', type: 'Series',
    ),
    // K Drama Series
    Movie(
      id: 's11', title: 'Crash Landing on You',
      posterUrl: 'https://image.tmdb.org/t/p/w500/k1gdFgJjzpD7R4MFCb5muN1BCpg.jpg',
      backdropUrl: 'https://image.tmdb.org/t/p/w500/fU6UhdBJmbNBtAMHhU6NHfN58CA.jpg',
      imdbRating: 8.2, year: '2019', duration: '1 Season',
      genre: 'Romance, Drama', description: 'A South Korean heiress accidentally lands in North Korea during a paragliding accident.',
      quality: 'HD', type: 'Series', tags: ['K Drama'],
    ),
    Movie(
      id: 's12', title: 'Vincenzo',
      posterUrl: 'https://image.tmdb.org/t/p/w500/d6PDFsKQN7U3LE7Y5x4K2m7KxPP.jpg',
      backdropUrl: 'https://image.tmdb.org/t/p/w500/mW1MzA0iBpKIZn5FhB2fqfx6Fz.jpg',
      imdbRating: 8.4, year: '2021', duration: '1 Season',
      genre: 'Crime, Comedy', description: 'An Italian-Korean mafia lawyer gives a conglomerate a taste of its own medicine.',
      quality: 'WEB-DL', type: 'Series', tags: ['K Drama'],
    ),
    // Animation Series
    Movie(
      id: 's13', title: 'Arcane',
      posterUrl: 'https://image.tmdb.org/t/p/w500/fqldf2t8ztc9aiwn3k6mlX3tvRT.jpg',
      backdropUrl: 'https://image.tmdb.org/t/p/w500/rkB4LyZHo1NHXFEDHl9vSD9r1lI.jpg',
      imdbRating: 9.0, year: '2021', duration: '1 Season',
      genre: 'Animation, Action', description: 'Set in the utopian region of Piltover and the oppressed underground of Zaun, the story follows the origins of two iconic champions.',
      quality: 'WEB-DL', type: 'Series', isTrending: true, tags: ['Animation', '4K Series'],
    ),
    // Anime Series
    Movie(
      id: 's14', title: 'Attack on Titan',
      posterUrl: 'https://image.tmdb.org/t/p/w500/hTP1DtLGFamjfu8WqjnuQdP1n4i.jpg',
      backdropUrl: 'https://image.tmdb.org/t/p/w500/7WsyChQLEftFiDhRkZUHahFXChJ.jpg',
      imdbRating: 9.1, year: '2013', duration: '4 Seasons',
      genre: 'Animation, Action', description: 'After his hometown is destroyed, young Eren Jaeger vows to cleanse the earth of the giant humanoid Titans.',
      quality: 'BluRay', type: 'Series', tags: ['Anime'],
    ),
    Movie(
      id: 's15', title: 'One Piece',
      posterUrl: 'https://image.tmdb.org/t/p/w500/cMD9Ygz11zjJzAovURpO75Qg7rT.jpg',
      backdropUrl: 'https://image.tmdb.org/t/p/w500/3X5pIDiEarWK3LRguJqaGRNljBm.jpg',
      imdbRating: 8.7, year: '2023', duration: '1 Season',
      genre: 'Action, Adventure', description: 'Monkey D. Luffy sets off on an adventure with his pirate crew in hopes of finding the greatest treasure ever.',
      quality: 'WEB-DL', type: 'Series', isTrending: true, tags: ['Anime'],
    ),
    // Bollywood Series
    Movie(
      id: 's16', title: 'Sacred Games',
      posterUrl: 'https://image.tmdb.org/t/p/w500/pVWTMwBOVRME2GjTfgHPyACOqYm.jpg',
      backdropUrl: 'https://image.tmdb.org/t/p/w500/iyMhvL3g9hfPm0chAPIRG0s9RFR.jpg',
      imdbRating: 8.0, year: '2018', duration: '2 Seasons',
      genre: 'Crime, Drama', description: 'A link in their pasts leads an honest cop to a fugitive gang boss, whose cryptic warning spurs the officer on a quest.',
      quality: 'WEB-DL', type: 'Series', tags: ['Bollywood'],
    ),
  ];

  static List<Movie> get all => [...movies, ...series];

  static List<Movie> get trendingMovies => movies.where((m) => m.isTrending).toList();
  static List<Movie> get trendingSeries => series.where((m) => m.isTrending).toList();
  static List<Movie> get kDramaMovies => movies.where((m) => m.hasTag('K Drama')).toList();
  static List<Movie> get kDramaSeries => series.where((m) => m.hasTag('K Drama')).toList();
  static List<Movie> get kDramaAll => [...kDramaMovies, ...kDramaSeries];
  static List<Movie> get fourKMovies => movies.where((m) => m.hasTag('4K Movies')).toList();
  static List<Movie> get fourKSeries => series.where((m) => m.hasTag('4K Series')).toList();
  static List<Movie> get animationMovies => movies.where((m) => m.hasTag('Animation')).toList();
  static List<Movie> get animationSeries => series.where((m) => m.hasTag('Animation')).toList();
  static List<Movie> get animationAll => [...animationMovies, ...animationSeries];
  static List<Movie> get animeMovies => movies.where((m) => m.hasTag('Anime')).toList();
  static List<Movie> get animeSeries => series.where((m) => m.hasTag('Anime')).toList();
  static List<Movie> get animeAll => [...animeMovies, ...animeSeries];
  static List<Movie> get bollywoodMovies => movies.where((m) => m.hasTag('Bollywood')).toList();
  static List<Movie> get bollywoodSeries => series.where((m) => m.hasTag('Bollywood')).toList();
  static List<Movie> get bollywoodAll => [...bollywoodMovies, ...bollywoodSeries];

  static List<String> get genres => [
    'Action', 'Adventure', 'Animation', 'Comedy', 'Crime',
    'Documentary', 'Drama', 'Fantasy', 'Horror', 'Mystery',
    'Romance', 'Sci-Fi', 'Thriller', 'War', 'Western',
  ];

  static List<String> get movieGenres => [
    'Action', 'Adventure', 'Animation', 'Comedy', 'Crime',
    'Documentary', 'Drama', 'Fantasy', 'Horror', 'Mystery',
    'Romance', 'Sci-Fi', 'Thriller', 'War', 'Western',
  ];

  static List<String> get seriesGenres => [
    'Action & Adventure', 'Animation', 'Comedy', 'Crime',
    'Documentary', 'Drama', 'Fantasy', 'Horror', 'Mystery',
    'Romance', 'Sci-Fi & Fantasy', 'Thriller', 'War', 'Western',
  ];

  static List<String> get tags => [
    '4K Movies', '4K Series', 'Animation', 'Anime', 'Bollywood',
    'K Drama', 'Marvel', 'DC', 'Netflix', 'HBO', 'Disney+',
    'Blockbuster', 'Indie', 'Classic', 'Award Winner',
  ];

  static List<String> get movieTags => [
    '4K Movies', 'Animation', 'Anime', 'Bollywood', 'K Drama',
    'Marvel', 'DC', 'Netflix', 'Award Winner', 'Classic',
  ];

  static List<String> get seriesTags => [
    '4K Series', 'Animation', 'Anime', 'Bollywood', 'K Drama',
    'Netflix', 'HBO', 'Disney+', 'Award Winner', 'Classic',
  ];

  static List<Map<String, dynamic>> get collections => [
    {'name': 'Marvel Universe', 'posterUrl': 'https://image.tmdb.org/t/p/w500/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg', 'count': 32},
    {'name': 'DC Extended Universe', 'posterUrl': 'https://image.tmdb.org/t/p/w500/74xTEgt7R36Fpooo50r9T25onhq.jpg', 'count': 18},
    {'name': 'Star Wars Saga', 'posterUrl': 'https://image.tmdb.org/t/p/w500/sWgBv7LV2GRoWgShREInK3RrMvG.jpg', 'count': 14},
    {'name': 'Oscar Winners 2024', 'posterUrl': 'https://image.tmdb.org/t/p/w500/8b8R8l88Qje9dn9OE8PY05Nez7.jpg', 'count': 10},
    {'name': 'Best of Nolan', 'posterUrl': 'https://image.tmdb.org/t/p/w500/edv5CZvWj09upOsy2Y6IwDhK8bt.jpg', 'count': 8},
    {'name': 'Horror Classics', 'posterUrl': 'https://image.tmdb.org/t/p/w500/apbrbWs8M9lyOpJYU5WXrpFbk1Z.jpg', 'count': 24},
  ];
}
