import '../models/movie_model.dart';
import '../models/live_model.dart';

/// Central place for all sample / mock data used in the Kumastream app.
class SampleData {
  SampleData._();

  // ═══════════════════════════════════════════════════════════════════════════
  //  ICONIC MOVIES
  // ═══════════════════════════════════════════════════════════════════════════
  static final List<Movie> iconicMovies = [
    Movie(
      id: 101,
      title: 'The Shawshank Redemption',
      year: 1994,
      imdbRating: 9.3,
      duration: '2h 22m',
      genres: ['Drama'],
      synopsis:
          'အင်ဒီ ဒူဖရိန်းသည် မိမိဇနီးကို လုံးပန်းတိုက်ခိုက်သတ်ဖြတ်ခဲ့သည်ဟု တရားမမှန်ခံချိန်ခံရပြီး ရှောင်ရှန့်အကျဉ်းထောင်တွင် နှစ်ပေါင်းများစွာ ကျခံခဲ့ရသည်။ ထောင်အတွင်းတွင် သူသည် ရဲချစ်သူ ရက်ဒ်နှင့် ရင်းနှီးမှုရရှိပြီး မျှော်လင့်ချက်နှင့် လွတ်မြောက်ရေးအတွက် မိမိနည်းလမ်းဖြင့် ရုန်းကန်ခဲ့သည်။',
      posterUrl: 'https://picsum.photos/seed/movie101/400/600',
      backdropUrl: 'https://picsum.photos/seed/backdrop101/800/450',
      cast: [
        CastMember(
          name: 'Tim Robbins',
          profileUrl: 'https://picsum.photos/seed/cast1011/200/200',
          character: 'Andy Dufresne',
        ),
        CastMember(
          name: 'Morgan Freeman',
          profileUrl: 'https://picsum.photos/seed/cast1012/200/200',
          character: 'Red',
        ),
        CastMember(
          name: 'Bob Gunton',
          profileUrl: 'https://picsum.photos/seed/cast1013/200/200',
          character: 'Warden Norton',
        ),
        CastMember(
          name: 'William Sadler',
          profileUrl: 'https://picsum.photos/seed/cast1014/200/200',
          character: 'Heywood',
        ),
      ],
    ),
    Movie(
      id: 102,
      title: 'The Godfather',
      year: 1972,
      imdbRating: 9.2,
      duration: '2h 55m',
      genres: ['Crime', 'Drama'],
      synopsis:
          'ကိုရီယွန်းမိသားစုသည် အမေရိကန်တွင် အာဏာကြီးမားဆုံး မာဖီးယားအုပ်စုတစ်ခုဖြစ်သည်။ ဖခင်ဖြစ်သူ ဗီတိုကိုရီယွန်း လုပ်ကြံခံရပြီးနောက် သားငယ် မိုက်ကယ်ကိုရီယွန်းသည် မိသားစုလုပ်ငန်းကို ဦးဆောင်ရန် တာဝန်ယူလာရပြီး အာဏာလောဘနှင့် မိသားစုချစ်ခြင်းကြား ရွေးချယ်ရန် ကြုံတွေ့ရသည်။',
      posterUrl: 'https://picsum.photos/seed/movie102/400/600',
      backdropUrl: 'https://picsum.photos/seed/backdrop102/800/450',
      cast: [
        CastMember(
          name: 'Marlon Brando',
          profileUrl: 'https://picsum.photos/seed/cast1021/200/200',
          character: 'Vito Corleone',
        ),
        CastMember(
          name: 'Al Pacino',
          profileUrl: 'https://picsum.photos/seed/cast1022/200/200',
          character: 'Michael Corleone',
        ),
        CastMember(
          name: 'James Caan',
          profileUrl: 'https://picsum.photos/seed/cast1023/200/200',
          character: 'Sonny Corleone',
        ),
      ],
    ),
    Movie(
      id: 103,
      title: 'Schindler\'s List',
      year: 1993,
      imdbRating: 9.0,
      duration: '3h 15m',
      genres: ['Biography', 'Drama', 'History'],
      synopsis:
          'ဒုတိယကမ္ဘာစစ်အတွင်း ဂျာမန်နာဇီများလက်အောက်တွင် ဂျူးလူမျိုးများကို စနစ်တကျ သုတ်သင်နေချိန်တွင် အိုစကာ ရှင်းဒလားသည် မိမိစက်ရုံတွင် အလုပ်လုပ်ကိုင်ခွင့်ပေးခြင်းဖြင့် ဂျူးလူမျိုး တစ်ထောင်ကျော်ကို ကယ်တင်ခဲ့သည်။ သူ၏名称သည် သမိုင်းတွင် မော်ကွန်းတင်ခံရသည်။',
      posterUrl: 'https://picsum.photos/seed/movie103/400/600',
      backdropUrl: 'https://picsum.photos/seed/backdrop103/800/450',
      cast: [
        CastMember(
          name: 'Liam Neeson',
          profileUrl: 'https://picsum.photos/seed/cast1031/200/200',
          character: 'Oskar Schindler',
        ),
        CastMember(
          name: 'Ben Kingsley',
          profileUrl: 'https://picsum.photos/seed/cast1032/200/200',
          character: 'Itzhak Stern',
        ),
        CastMember(
          name: 'Ralph Fiennes',
          profileUrl: 'https://picsum.photos/seed/cast1033/200/200',
          character: 'Amon Goeth',
        ),
      ],
    ),
    Movie(
      id: 104,
      title: 'Forrest Gump',
      year: 1994,
      imdbRating: 8.8,
      duration: '2h 22m',
      genres: ['Drama', 'Romance'],
      synopsis:
          'ဖောရက်စ်ဂမ်ပ်သည် အိုင်ကျူ ၇၅ ရှိသော်လည်း ဘဝကို ရိုးသားစွာ ရှေ့သို့သွားလျက် ပြေးတမ်းဝင်ခဲ့သည်။ ဗီယက်နမ်စစ်ပွဲ၊ ပင်လယ်ပုတ်လှန်ပွဲ၊ ပင်နယ်ပြိုင်ပွဲများစွာတွင် ပါဝင်ခဲ့ပြီး သူငယ်ချင်း ဂျန်နီကို အမြဲတမ်းချစ်မြတ်နိုးခဲ့သည်။',
      posterUrl: 'https://picsum.photos/seed/movie104/400/600',
      backdropUrl: 'https://picsum.photos/seed/backdrop104/800/450',
      cast: [
        CastMember(
          name: 'Tom Hanks',
          profileUrl: 'https://picsum.photos/seed/cast1041/200/200',
          character: 'Forrest Gump',
        ),
        CastMember(
          name: 'Robin Wright',
          profileUrl: 'https://picsum.photos/seed/cast1042/200/200',
          character: 'Jenny Curran',
        ),
        CastMember(
          name: 'Gary Sinise',
          profileUrl: 'https://picsum.photos/seed/cast1043/200/200',
          character: 'Lieutenant Dan',
        ),
        CastMember(
          name: 'Sally Field',
          profileUrl: 'https://picsum.photos/seed/cast1044/200/200',
          character: 'Mrs. Gump',
        ),
      ],
    ),
    Movie(
      id: 105,
      title: 'The Dark Knight',
      year: 2008,
      imdbRating: 9.0,
      duration: '2h 32m',
      genres: ['Action', 'Crime', 'Drama'],
      synopsis:
          'ဗတ်မင်းသည် ဂေါ့သမ်မြို့တွင် ရာဇဝတ်မှုများကို တိုက်ဖျက်နေချိန်တွင် အရပ်ဝါဒါးဟုခေါ်သော ရာဇဝတ်သားတစ်ဦး ပေါ်ပေါက်လာသည်။ ဂျောကာသည် မြို့တော်ကို ရောင်ရမ်းစေပြီး ဗတ်မင်းအား ကျင့်ဝတ်ဆိုင်ရာ ပြဿနာများနှင့် ရင်ဆိုင်စေသည်။',
      posterUrl: 'https://picsum.photos/seed/movie105/400/600',
      backdropUrl: 'https://picsum.photos/seed/backdrop105/800/450',
      cast: [
        CastMember(
          name: 'Christian Bale',
          profileUrl: 'https://picsum.photos/seed/cast1051/200/200',
          character: 'Bruce Wayne',
        ),
        CastMember(
          name: 'Heath Ledger',
          profileUrl: 'https://picsum.photos/seed/cast1052/200/200',
          character: 'Joker',
        ),
        CastMember(
          name: 'Aaron Eckhart',
          profileUrl: 'https://picsum.photos/seed/cast1053/200/200',
          character: 'Harvey Dent',
        ),
      ],
    ),
    Movie(
      id: 106,
      title: 'Pulp Fiction',
      year: 1994,
      imdbRating: 8.9,
      duration: '2h 34m',
      genres: ['Crime', 'Drama'],
      synopsis:
          'လော့စ်အိန်ဂျလိစ်မြို့တွင် ဖြစ်ပျက်သော ရာဇဝတ်မှုဇာတ်လမ်းများစွာ တစ်ခုနှင့်တစ်ခု ဆက်စပ်နေသည်။ လုပ်ကိုင်သူနှစ်ယောက်၊ ဘောက်ဆာတစ်ဦး၊ လက်နက်ကိုင်ခိုးသားဇနီးမောင်နှံနှင့် စားသောက်ဆိုင်လုပ်သူများ၏ ဘဝများ ရောထွေးနေသည်။',
      posterUrl: 'https://picsum.photos/seed/movie106/400/600',
      backdropUrl: 'https://picsum.photos/seed/backdrop106/800/450',
      cast: [
        CastMember(
          name: 'John Travolta',
          profileUrl: 'https://picsum.photos/seed/cast1061/200/200',
          character: 'Vincent Vega',
        ),
        CastMember(
          name: 'Samuel L. Jackson',
          profileUrl: 'https://picsum.photos/seed/cast1062/200/200',
          character: 'Jules Winnfield',
        ),
        CastMember(
          name: 'Uma Thurman',
          profileUrl: 'https://picsum.photos/seed/cast1063/200/200',
          character: 'Mia Wallace',
        ),
      ],
    ),
    Movie(
      id: 107,
      title: 'Fight Club',
      year: 1999,
      imdbRating: 8.8,
      duration: '2h 19m',
      genres: ['Drama', 'Thriller'],
      synopsis:
          'အလုပ်ရှင်းစားသမားတစ်ဦးသည် အိပ်မပျော်နိုင်သော ရောဂါခံစားနေရပြီး ဆပ်ဆိုင်းပြသခန်းများသို့ တက်ရောက်ရာမှ တေလာဒါဒန်ဆိုသူနှင့် ရင်းနှီးသွားသည်။ နှစ်ဦးတို့ ပြိုင်ပွဲဝင်စစ်ဆင်ရေးအသင်းကို တည်ထောင်ကြပြီး အရာရာကို ဖျက်ဆီးလိုသော ဆန္ဒသည် ထိန်းမရနိုင်အောင် ကြီးထွားလာသည်။',
      posterUrl: 'https://picsum.photos/seed/movie107/400/600',
      backdropUrl: 'https://picsum.photos/seed/backdrop107/800/450',
      cast: [
        CastMember(
          name: 'Brad Pitt',
          profileUrl: 'https://picsum.photos/seed/cast1071/200/200',
          character: 'Tyler Durden',
        ),
        CastMember(
          name: 'Edward Norton',
          profileUrl: 'https://picsum.photos/seed/cast1072/200/200',
          character: 'The Narrator',
        ),
        CastMember(
          name: 'Helena Bonham Carter',
          profileUrl: 'https://picsum.photos/seed/cast1073/200/200',
          character: 'Marla Singer',
        ),
      ],
    ),
    Movie(
      id: 108,
      title: 'Inception',
      year: 2010,
      imdbRating: 8.8,
      duration: '2h 28m',
      genres: ['Action', 'Sci-Fi', 'Thriller'],
      synopsis:
          'ဒိုမ်ကိုးဘ်သည် အိပ်မက်ထဲသို့ဝင်ရောက်ပြီး လူတစ်ယောက်၏ ဆန္ဒကို ခိုးယူနိုင်သော ကျွမ်းကျင်သူဖြစ်သည်။ ယခုအခါ သူ့အား ဆန္ဒတစ်ခုကို ထည့်သွင်းရန် တာဝန်ပေးအပ်သည်။ အိပ်မက်အတွင်း အိပ်မက်ထပ်ဆင့်နေသော လွှမ်းမိုးမှုများကြားတွင် သူသည် ဇနီးဟောင်း၏ အရိပ်နှင့် ရင်ဆိုင်ရသည်။',
      posterUrl: 'https://picsum.photos/seed/movie108/400/600',
      backdropUrl: 'https://picsum.photos/seed/backdrop108/800/450',
      cast: [
        CastMember(
          name: 'Leonardo DiCaprio',
          profileUrl: 'https://picsum.photos/seed/cast1081/200/200',
          character: 'Cobb',
        ),
        CastMember(
          name: 'Joseph Gordon-Levitt',
          profileUrl: 'https://picsum.photos/seed/cast1082/200/200',
          character: 'Arthur',
        ),
        CastMember(
          name: 'Elliot Page',
          profileUrl: 'https://picsum.photos/seed/cast1083/200/200',
          character: 'Ariadne',
        ),
        CastMember(
          name: 'Tom Hardy',
          profileUrl: 'https://picsum.photos/seed/cast1084/200/200',
          character: 'Eames',
        ),
      ],
    ),
  ];

  // ═══════════════════════════════════════════════════════════════════════════
  //  WAR MOVIES
  // ═══════════════════════════════════════════════════════════════════════════
  static final List<Movie> warMovies = [
    Movie(
      id: 201,
      title: 'Saving Private Ryan',
      year: 1998,
      imdbRating: 8.6,
      duration: '2h 49m',
      genres: ['Drama', 'War'],
      synopsis:
          'ဒုတိယကမ္ဘာစစ်အတွင်း နော်မန်ဒီကုန်းတက်ချိန်တွင် ရိုင်းယန်းမိသားစု၏ သားလေးယောက်အနက် သုံးယောက် စစ်ပွဲတွင် ကျဆုံးခဲ့သည်။ စတုတ္ထမြောက်သား ဂျိမ်းရိုင်းယန်းကို ရှာဖွေပြန်လည်ရန် ကပ္ပတိန်မီလားသည် စစ်သားအုပ်စုတစ်စုကို ဦးဆောင်ကာ ရန်သူများဖက်သို့ ထိုးဖောက်ဝင်ရောက်သွားသည်။',
      posterUrl: 'https://picsum.photos/seed/movie201/400/600',
      backdropUrl: 'https://picsum.photos/seed/backdrop201/800/450',
      cast: [
        CastMember(
          name: 'Tom Hanks',
          profileUrl: 'https://picsum.photos/seed/cast2011/200/200',
          character: 'Captain Miller',
        ),
        CastMember(
          name: 'Matt Damon',
          profileUrl: 'https://picsum.photos/seed/cast2012/200/200',
          character: 'Private Ryan',
        ),
        CastMember(
          name: 'Tom Sizemore',
          profileUrl: 'https://picsum.photos/seed/cast2013/200/200',
          character: 'Sergeant Horvath',
        ),
      ],
    ),
    Movie(
      id: 202,
      title: '1917',
      year: 2019,
      imdbRating: 8.3,
      duration: '1h 59m',
      genres: ['Drama', 'War'],
      synopsis:
          'ပထမကမ္ဘာစစ်အတွင်း ဗြိတိသျှစစ်သားနှစ်ဦးဖြစ်သော ရှော်ဖီးလ်နှင့် ဘလိတ်တို့သည် ရန်သူ့စစ်လိုင်းကိုဖြတ်ကျော်ပြီး သူတို့၏တပ်ဖွဲ့အား အဖမ်းမိန်းတွင်းသို့ မဝင်ရောက်ရန် သတိပေးရန် မစ်ရှင်တစ်ခုကို ထမ်းဆောင်ကြသည်။ အချိန်နှင့် ရင်းနှီးမှုသည် ဘဝနှင့် သေဆုံးမှုကြား ဖြတ်သန်းရသည်။',
      posterUrl: 'https://picsum.photos/seed/movie202/400/600',
      backdropUrl: 'https://picsum.photos/seed/backdrop202/800/450',
      cast: [
        CastMember(
          name: 'George MacKay',
          profileUrl: 'https://picsum.photos/seed/cast2021/200/200',
          character: 'Lance Corporal Schofield',
        ),
        CastMember(
          name: 'Dean-Charles Chapman',
          profileUrl: 'https://picsum.photos/seed/cast2022/200/200',
          character: 'Lance Corporal Blake',
        ),
        CastMember(
          name: 'Colin Firth',
          profileUrl: 'https://picsum.photos/seed/cast2023/200/200',
          character: 'General Erinmore',
        ),
      ],
    ),
    Movie(
      id: 203,
      title: 'Dunkirk',
      year: 2017,
      imdbRating: 7.8,
      duration: '1h 46m',
      genres: ['Action', 'Drama', 'War'],
      synopsis:
          'ဒုတိယကမ္ဘာစစ်အတွင်း ပြင်သစ်နိုင်ငံ ဒန်ကက်မြို့တွင် ဗြိတိသျှစစ်သားများ ရန်သူများဖြင့် ဝန်းရံခံရပြီး ပင်လယ်ကြောင်းဖြင့် ထွက်ပြေးရန် ကြိုးစားကြသည်။ မြေပြင်၊ ပင်လယ်နှင့် လေထဲတွင် ဖြစ်ပျက်သော ဇာတ်လမ်းသုံးခု ပေါင်းစပ်နေသည်။',
      posterUrl: 'https://picsum.photos/seed/movie203/400/600',
      backdropUrl: 'https://picsum.photos/seed/backdrop203/800/450',
      cast: [
        CastMember(
          name: 'Fionn Whitehead',
          profileUrl: 'https://picsum.photos/seed/cast2031/200/200',
          character: 'Tommy',
        ),
        CastMember(
          name: 'Tom Hardy',
          profileUrl: 'https://picsum.photos/seed/cast2032/200/200',
          character: 'Farrier',
        ),
        CastMember(
          name: 'Mark Rylance',
          profileUrl: 'https://picsum.photos/seed/cast2033/200/200',
          character: 'Mr. Dawson',
        ),
      ],
    ),
    Movie(
      id: 204,
      title: 'Hacksaw Ridge',
      year: 2016,
      imdbRating: 8.1,
      duration: '2h 19m',
      genres: ['Biography', 'Drama', 'War'],
      synopsis:
          'ဒက်စမွန်းဒေါ့သည် လက်နက်မကိုင်ဘဲ စစ်မှုထမ်းရန် ဆုံးဖြတ်ချက်ချခဲ့သော ဆရာဝန်တစ်ဦးဖြစ်သည်။ အိုကီနာဝါတိုက်ပွဲတွင် လက်နက်မပါဘဲ သူ့ရဲဘော် ၇၅ ယောက်ကို ကယ်တင်ခဲ့သည်။ သူ၏ယုံကြည်မှုနှင့် သတ္တိသည် လူအများကို အံ့ဩစေခဲ့သည်။',
      posterUrl: 'https://picsum.photos/seed/movie204/400/600',
      backdropUrl: 'https://picsum.photos/seed/backdrop204/800/450',
      cast: [
        CastMember(
          name: 'Andrew Garfield',
          profileUrl: 'https://picsum.photos/seed/cast2041/200/200',
          character: 'Desmond Doss',
        ),
        CastMember(
          name: 'Sam Worthington',
          profileUrl: 'https://picsum.photos/seed/cast2042/200/200',
          character: 'Captain Glover',
        ),
        CastMember(
          name: 'Vince Vaughn',
          profileUrl: 'https://picsum.photos/seed/cast2043/200/200',
          character: 'Sergeant Howell',
        ),
      ],
    ),
    Movie(
      id: 205,
      title: 'Full Metal Jacket',
      year: 1987,
      imdbRating: 8.3,
      duration: '1h 56m',
      genres: ['Drama', 'War'],
      synopsis:
          'ဗီယက်နမ်စစ်ပွဲအတွက် အမေရိကန်ရေဘီးဆိုဒါများကို လေ့ကျင့်ရာတွင် စစ်သင်တန်းဆရာ ဟာတ်မန်းသည် စစ်သားသစ်များကို ရက်ရက်စက်စက် လေ့ကျင့်သည်။ ပိုင်းလ်ဆိုသူ စစ်သားတစ်ဦး စိတ်ပျက်ပြီး ပြဿနာဖြစ်လာပြီးနောက် ဗီယက်နမ်စစ်ပွဲ၏ ကြမ်းတမ်းမှုကို ကိုယ်တွေ့ခံစားရသည်။',
      posterUrl: 'https://picsum.photos/seed/movie205/400/600',
      backdropUrl: 'https://picsum.photos/seed/backdrop205/800/450',
      cast: [
        CastMember(
          name: 'Matthew Modine',
          profileUrl: 'https://picsum.photos/seed/cast2051/200/200',
          character: 'Private Joker',
        ),
        CastMember(
          name: 'R. Lee Ermey',
          profileUrl: 'https://picsum.photos/seed/cast2052/200/200',
          character: 'Gunnery Sergeant Hartman',
        ),
        CastMember(
          name: 'Vincent D\'Onofrio',
          profileUrl: 'https://picsum.photos/seed/cast2053/200/200',
          character: 'Private Pyle',
        ),
      ],
    ),
    Movie(
      id: 206,
      title: 'Letters from Iwo Jima',
      year: 2006,
      imdbRating: 7.9,
      duration: '2h 21m',
      genres: ['Drama', 'History', 'War'],
      synopsis:
          'ဂျပန်စစ်သားများ၏ မျက်စိဖြင့် အိုင်းဝိုဂျီးမားကျွန်းတိုက်ပွဲကို ပြသသည်။ ဂျပန်ဗိုလ်မှူးကြီး ကူရိဘာယာရှီသည် အမေရိကန်တပ်များကို ရှောင်တချည်း ခုခံရန် ကျွန်းတွင် မြေအောက်တပ်စခန်းများ တည်ဆောက်သည်။ စစ်သားများ၏ စာပို့မှတ်တမ်းများမှတဆင့် သူတို့၏ ခံစားချက်များကို ဖော်ပြသည်။',
      posterUrl: 'https://picsum.photos/seed/movie206/400/600',
      backdropUrl: 'https://picsum.photos/seed/backdrop206/800/450',
      cast: [
        CastMember(
          name: 'Ken Watanabe',
          profileUrl: 'https://picsum.photos/seed/cast2061/200/200',
          character: 'General Kuribayashi',
        ),
        CastMember(
          name: 'Kazunari Ninomiya',
          profileUrl: 'https://picsum.photos/seed/cast2062/200/200',
          character: 'Saigo',
        ),
        CastMember(
          name: 'Tsuyoshi Ihara',
          profileUrl: 'https://picsum.photos/seed/cast2063/200/200',
          character: 'Baron Nishi',
        ),
      ],
    ),
  ];

  // ═══════════════════════════════════════════════════════════════════════════
  //  TRENDING NOW
  // ═══════════════════════════════════════════════════════════════════════════
  static final List<Movie> trendingMovies = [
    Movie(
      id: 301,
      title: 'Oppenheimer',
      year: 2023,
      imdbRating: 8.4,
      duration: '3h 0m',
      genres: ['Biography', 'Drama', 'History'],
      synopsis:
          'ဂျူးလီယက်စ် အော်ပန်ဟိုင်းမားသည် အဏုမျူဗုံးကို တီထွင်သော သိပ္ပံပညာရှင်ဖြစ်သည်။ ဒုတိယကမ္ဘာစစ်အတွင်း မန်ဟက်တန်စီမံချက်ကို ဦးဆောင်ခဲ့ပြီး သူ၏တီထွင်မှုသည် လူသားမျိုးနွယ်ကို အကြီးမားဆုံး အန္တရာယ်ဖြစ်စေသည်။ သူသည် မိမိ၏ ဖန်တီးမှုနှင့် ကိုယ်ကျင့်တရားကြား ယှဉ်ပြိုင်ရသည်။',
      posterUrl: 'https://picsum.photos/seed/movie301/400/600',
      backdropUrl: 'https://picsum.photos/seed/backdrop301/800/450',
      cast: [
        CastMember(
          name: 'Cillian Murphy',
          profileUrl: 'https://picsum.photos/seed/cast3011/200/200',
          character: 'J. Robert Oppenheimer',
        ),
        CastMember(
          name: 'Emily Blunt',
          profileUrl: 'https://picsum.photos/seed/cast3012/200/200',
          character: 'Kitty Oppenheimer',
        ),
        CastMember(
          name: 'Robert Downey Jr.',
          profileUrl: 'https://picsum.photos/seed/cast3013/200/200',
          character: 'Lewis Strauss',
        ),
        CastMember(
          name: 'Matt Damon',
          profileUrl: 'https://picsum.photos/seed/cast3014/200/200',
          character: 'Leslie Groves',
        ),
      ],
    ),
    Movie(
      id: 302,
      title: 'Barbie',
      year: 2023,
      imdbRating: 6.9,
      duration: '1h 54m',
      genres: ['Adventure', 'Comedy', 'Fantasy'],
      synopsis:
          'ဘာဘီလွမ်းမိုးမြို့တွင် နေထိုင်သော စတီရီယိုတိုက်ပုံစံ ဘာဘီတစ်ယောက် ဇာတ်ကျေးချိုးကွက်များ ခံစားလာရပြီး တကယ့်လောကကို သွားရောက်ရန်  결定ချသည်။ ကင်းန်အတူတူ လိုက်ပါပြီး လူသားများ၏ ကမ္ဘာတွင် လူမှုရေးစံနှုန်းများနှင့် ရင်ဆိုင်ရသည်။',
      posterUrl: 'https://picsum.photos/seed/movie302/400/600',
      backdropUrl: 'https://picsum.photos/seed/backdrop302/800/450',
      cast: [
        CastMember(
          name: 'Margot Robbie',
          profileUrl: 'https://picsum.photos/seed/cast3021/200/200',
          character: 'Barbie',
        ),
        CastMember(
          name: 'Ryan Gosling',
          profileUrl: 'https://picsum.photos/seed/cast3022/200/200',
          character: 'Ken',
        ),
        CastMember(
          name: 'America Ferrera',
          profileUrl: 'https://picsum.photos/seed/cast3023/200/200',
          character: 'Gloria',
        ),
      ],
    ),
    Movie(
      id: 303,
      title: 'Killers of the Flower Moon',
      year: 2023,
      imdbRating: 7.7,
      duration: '3h 26m',
      genres: ['Crime', 'Drama', 'History'],
      synopsis:
          '၁၉၂၀ ပြည့်လွန်နှစ်များတွင် အိုဆေ့ခ်ျလူမျိုးတို့၏ မြေပေါ်တွင် ရေနံတွေ့ရှိပြီးနောက် ၎င်းတို့သည် ချမ်းသာလာခဲ့သည်။ သို့သော် အိုဆေ့ခ်ျလူမျိုးများ တစ်ဦးပြီးတစ်ဦး သေဆုံးလာပြီး နောက်ကွယ်တွင် ကြီးမားသော ဇာတ်လမ်းရှိနေသည်။ အက်ဖ်ဘီအိုင်းသည် စုံစမ်းစစ်ဆေးမှုများ ပြုလုပ်သည်။',
      posterUrl: 'https://picsum.photos/seed/movie303/400/600',
      backdropUrl: 'https://picsum.photos/seed/backdrop303/800/450',
      cast: [
        CastMember(
          name: 'Leonardo DiCaprio',
          profileUrl: 'https://picsum.photos/seed/cast3031/200/200',
          character: 'Ernest Burkhart',
        ),
        CastMember(
          name: 'Robert De Niro',
          profileUrl: 'https://picsum.photos/seed/cast3032/200/200',
          character: 'William Hale',
        ),
        CastMember(
          name: 'Lily Gladstone',
          profileUrl: 'https://picsum.photos/seed/cast3033/200/200',
          character: 'Mollie Burkhart',
        ),
      ],
    ),
    Movie(
      id: 304,
      title: 'Poor Things',
      year: 2023,
      imdbRating: 7.9,
      duration: '2h 21m',
      genres: ['Comedy', 'Drama', 'Romance'],
      synopsis:
          'ဗဲလာဘက်စတာသည် ဒေါက်တာဂေါ့ဝင် ဘလစ်စဘာရီဆိုသူ သိပ္ပံပညာရှင်တစ်ဦးမှ ပြန်လည်ရှင်သန်စေခဲ့သော အမျိုးသမီးတစ်ဦးဖြစ်သည်။ သူမသည် ကမ္ဘာကြီးကို ရှာဖွေလိုစိတ်ဖြင့် ပြည့်နေပြီး ဒန်ကန်ဝက်ဒါဘာန်ဆိုသူ ရှေ့နေနှင့်အတူ ခရီးထွက်သည်။',
      posterUrl: 'https://picsum.photos/seed/movie304/400/600',
      backdropUrl: 'https://picsum.photos/seed/backdrop304/800/450',
      cast: [
        CastMember(
          name: 'Emma Stone',
          profileUrl: 'https://picsum.photos/seed/cast3041/200/200',
          character: 'Bella Baxter',
        ),
        CastMember(
          name: 'Mark Ruffalo',
          profileUrl: 'https://picsum.photos/seed/cast3042/200/200',
          character: 'Duncan Wedderburn',
        ),
        CastMember(
          name: 'Willem Dafoe',
          profileUrl: 'https://picsum.photos/seed/cast3043/200/200',
          character: 'Dr. Godwin Baxter',
        ),
      ],
    ),
    Movie(
      id: 305,
      title: 'The Holdovers',
      year: 2023,
      imdbRating: 7.9,
      duration: '2h 13m',
      genres: ['Comedy', 'Drama'],
      synopsis:
          '၁၉၇၀ ပြည့်လွန်နှစ်များတွင် နယူးအင်္ဂလန်ဒေသရှိ ပုဂ္ဂလိကကျောင်းတစ်ကျောင်းတွင် ခရစ်စမတ်ရုံးချိန်းကာလအတွင်း ကျောင်းတွင်ကျန်ရစ်သော ကျောင်းသားတစ်ဦး၊ စိတ်မချမ်းသာသော ဆရာတစ်ဦးနှင့် ကျောင်းချက်ပြုတ်သမားတစ်ဦးတို့ အတူတကွ ဘဝအတွေ့အကြုံများ မျှဝေကြသည်။',
      posterUrl: 'https://picsum.photos/seed/movie305/400/600',
      backdropUrl: 'https://picsum.photos/seed/backdrop305/800/450',
      cast: [
        CastMember(
          name: 'Paul Giamatti',
          profileUrl: 'https://picsum.photos/seed/cast3051/200/200',
          character: 'Paul Hunham',
        ),
        CastMember(
          name: 'Da\'Vine Joy Randolph',
          profileUrl: 'https://picsum.photos/seed/cast3052/200/200',
          character: 'Mary Lamb',
        ),
        CastMember(
          name: 'Dominic Sessa',
          profileUrl: 'https://picsum.photos/seed/cast3053/200/200',
          character: 'Angus Tully',
        ),
      ],
    ),
    Movie(
      id: 306,
      title: 'Saltburn',
      year: 2023,
      imdbRating: 6.9,
      duration: '2h 11m',
      genres: ['Drama', 'Thriller'],
      synopsis:
          'အောက်စဖို့ဒ်တက္ကသိုလ်တွင် ပညာသင်ကြားနေသော အောက်လစ်ဗာသည် ချမ်းသာသော သူငယ်ချင်းဖဲလစ်၏ မိသားစု အိမ်ကြီးဆော့လ်ဘာန်သို့ နွေရာသီကုန်းချိန်ကို ကုန်ဆုံးရန် သွားရောက်ခဲ့သည်။ ထိုနေရာတွင် သူသည် ဆန်းကြယ်သော လူနေမှုဘဝနှင့် အက်ရောတ္ခံစားချက်များကို တွေ့ကြုံရသည်။',
      posterUrl: 'https://picsum.photos/seed/movie306/400/600',
      backdropUrl: 'https://picsum.photos/seed/backdrop306/800/450',
      cast: [
        CastMember(
          name: 'Barry Keoghan',
          profileUrl: 'https://picsum.photos/seed/cast3061/200/200',
          character: 'Oliver Quick',
        ),
        CastMember(
          name: 'Jacob Elordi',
          profileUrl: 'https://picsum.photos/seed/cast3062/200/200',
          character: 'Felix Catton',
        ),
        CastMember(
          name: 'Rosamund Pike',
          profileUrl: 'https://picsum.photos/seed/cast3063/200/200',
          character: 'Lady Elspeth Catton',
        ),
      ],
    ),
  ];

  // ═══════════════════════════════════════════════════════════════════════════
  //  ONGOING SERIES
  // ═══════════════════════════════════════════════════════════════════════════
  static final List<Movie> ongoingSeries = [
    Movie(
      id: 401,
      title: 'Breaking Bad',
      year: 2008,
      imdbRating: 9.5,
      duration: '49m',
      genres: ['Crime', 'Drama', 'Thriller'],
      synopsis:
          'ဝေါ်လ်တာဝှိုက်သည် အသက်၅၀ရှိပြီဖြစ်သော ဓာုတ်ဗေဒဆရာတစ်ဦးဖြစ်သည်။ သူ့မှာ အဆုတ်ကင်ဆာရောဂါ စစ်ဆေးတွေ့ရှိရပြီး မိသားစုအတွက် ငွေကြေးရှာဖွေရန် မက်သ်အမားဖြူဆိုးမှုကို စတင်လုပ်ကိုင်သည်။ ယခင်ကျောင်းသား ဂျက်ဆီပင့်ခ်မန်နှင့် ပူးပေါင်းပြီး ရာဇဝတ်လောကတွင် နက်ရှိုင်းစွာ ဝင်ရောက်လာသည်။',
      posterUrl: 'https://picsum.photos/seed/movie401/400/600',
      backdropUrl: 'https://picsum.photos/seed/backdrop401/800/450',
      cast: [
        CastMember(
          name: 'Bryan Cranston',
          profileUrl: 'https://picsum.photos/seed/cast4011/200/200',
          character: 'Walter White',
        ),
        CastMember(
          name: 'Aaron Paul',
          profileUrl: 'https://picsum.photos/seed/cast4012/200/200',
          character: 'Jesse Pinkman',
        ),
        CastMember(
          name: 'Anna Gunn',
          profileUrl: 'https://picsum.photos/seed/cast4013/200/200',
          character: 'Skyler White',
        ),
      ],
    ),
    Movie(
      id: 402,
      title: 'Stranger Things',
      year: 2016,
      imdbRating: 8.7,
      duration: '51m',
      genres: ['Drama', 'Fantasy', 'Horror'],
      synopsis:
          '၁၉၈၀ ပြည့်နှစ်များတွင် အင်ဒီယားနားပြည်နယ် ဟောကင်းစ်မြို့၌ ကလေးသူငယ်တစ်ဦး ပျောက်ဆုံးသွားသည်။ သူ့သူငယ်ချင်းများသည် သူ့ကိုရှာဖွေရာမှ အထက်လွန်စွမ်းအားရှိသော ကလေးမလေး ၁၁ နှင့် တွေ့ဆုံကြပြီး အောက်ဘက်တွန်းလှန်းခေါ်သော နေရာနှင့် ဆက်စပ်နေကြောင်း သိရှိလာသည်။',
      posterUrl: 'https://picsum.photos/seed/movie402/400/600',
      backdropUrl: 'https://picsum.photos/seed/backdrop402/800/450',
      cast: [
        CastMember(
          name: 'Millie Bobby Brown',
          profileUrl: 'https://picsum.photos/seed/cast4021/200/200',
          character: 'Eleven',
        ),
        CastMember(
          name: 'Finn Wolfhard',
          profileUrl: 'https://picsum.photos/seed/cast4022/200/200',
          character: 'Mike Wheeler',
        ),
        CastMember(
          name: 'David Harbour',
          profileUrl: 'https://picsum.photos/seed/cast4023/200/200',
          character: 'Jim Hopper',
        ),
      ],
    ),
    Movie(
      id: 403,
      title: 'The Last of Us',
      year: 2023,
      imdbRating: 8.8,
      duration: '56m',
      genres: ['Action', 'Adventure', 'Drama'],
      synopsis:
          'ဖျားနာမှုကူးစက်ရောဂါဖြစ်သော ကော်ဒီဆပ်ပိုးမွှားကြောင့် လူ့အဖွဲ့အစည်း ပြိုလဲသွားပြီးနောက် ဂျိုလ်သည် ၁၄နှစ်အရွယ် အဲလီကို စောင့်ရှောက်ပြီး ကုသဆေးရှာဖွေရေးအတွက် ခရီးထွက်ကြသည်။ အဲလီသည် ရောဂါကို ခံနိုင်ရည်ရှိနေပြီး လူ့အဖွဲ့အစည်း၏ မျှော်လင့်ချက် ဖြစ်နေသည်။',
      posterUrl: 'https://picsum.photos/seed/movie403/400/600',
      backdropUrl: 'https://picsum.photos/seed/backdrop403/800/450',
      cast: [
        CastMember(
          name: 'Pedro Pascal',
          profileUrl: 'https://picsum.photos/seed/cast4031/200/200',
          character: 'Joel',
        ),
        CastMember(
          name: 'Bella Ramsey',
          profileUrl: 'https://picsum.photos/seed/cast4032/200/200',
          character: 'Ellie',
        ),
        CastMember(
          name: 'Anna Torv',
          profileUrl: 'https://picsum.photos/seed/cast4033/200/200',
          character: 'Tess',
        ),
      ],
    ),
    Movie(
      id: 404,
      title: 'Wednesday',
      year: 2022,
      imdbRating: 8.1,
      duration: '46m',
      genres: ['Comedy', 'Crime', 'Fantasy'],
      synopsis:
          'အက်ဒမ်မိသားစု၏ သမီးလတ် ဝက်စ်နေဒေးသည် နီဗာမိုးအကယ်ဒမီသို့ ပို့ဆောင်ခံရသည်။ ထိုကျောင်းတွင် သူမသည် စိတ်ဆိုးဝှက်မှုများကို ဖြေရှင်းရန် စွမ်းရည်ရှိကြောင်း သိလာပြီး မြို့တွင်းဖြစ်ပျက်နေသော လူစိတ်ပြုံးသတ်ဖြတ်မှုများကို စုံစမ်းစစ်ဆေးသည်။',
      posterUrl: 'https://picsum.photos/seed/movie404/400/600',
      backdropUrl: 'https://picsum.photos/seed/backdrop404/800/450',
      cast: [
        CastMember(
          name: 'Jenna Ortega',
          profileUrl: 'https://picsum.photos/seed/cast4041/200/200',
          character: 'Wednesday Addams',
        ),
        CastMember(
          name: 'Gwendoline Christie',
          profileUrl: 'https://picsum.photos/seed/cast4042/200/200',
          character: 'Principal Weems',
        ),
        CastMember(
          name: 'Riki Lindhome',
          profileUrl: 'https://picsum.photos/seed/cast4043/200/200',
          character: 'Dr. Kinbott',
        ),
      ],
    ),
    Movie(
      id: 405,
      title: 'Squid Game',
      year: 2021,
      imdbRating: 8.0,
      duration: '57m',
      genres: ['Action', 'Drama', 'Mystery'],
      synopsis:
          'ငွေကြေးဒုက္ခရောက်နေသော လူရာချယ်သားပေါင်း ၄၅၆ ဦးကို ကလေးကစားနည်းများကို ကစားရန် ဖိတ်ကြားသည်။ အနိုင်ရလျှင် ဘီလီယံသိန်းဂုဏ်ဆုကို ရမည်ဖြစ်ပြီး ရှုံးလျှင် အသက်ဆုံးရှုံးရမည်ဖြစ်သည်။ သန်းဆွေသည် မိမိမိသားစုအတွက် ဆုကိုရရန် ကစားကွက်များကို ကျော်ဖြတ်ရသည်။',
      posterUrl: 'https://picsum.photos/seed/movie405/400/600',
      backdropUrl: 'https://picsum.photos/seed/backdrop405/800/450',
      cast: [
        CastMember(
          name: 'Lee Jung-jae',
          profileUrl: 'https://picsum.photos/seed/cast4051/200/200',
          character: 'Seong Gi-hun',
        ),
        CastMember(
          name: 'Park Hae-soo',
          profileUrl: 'https://picsum.photos/seed/cast4052/200/200',
          character: 'Cho Sang-woo',
        ),
        CastMember(
          name: 'Wi Ha-joon',
          profileUrl: 'https://picsum.photos/seed/cast4053/200/200',
          character: 'Hwang Jun-ho',
        ),
      ],
    ),
    Movie(
      id: 406,
      title: 'House of the Dragon',
      year: 2022,
      imdbRating: 8.4,
      duration: '1h 5m',
      genres: ['Action', 'Adventure', 'Drama'],
      synopsis:
          'ဂိမ်းအော့ဖ်ထရုံး၏ ရှေ့ပိုင်းဇာတ်လမ်းဖြစ်ပြီး တာဂဲရီယန်မိသားစု၏ အရှုပ်တော်ပုံများကို ပြသသည်။ ဘုရင်ဗီဇဲရစ်၏ သမီး ရေနီးရားနှင့် ညီအကို အေမွန်းတို့ ထီးနန်းဆက်ခံခွင့်အတွက် ယှဉ်ပြိုင်ကြပြီး နဂါးများ၏ ကျူးကျော်မှုဖြင့် ကမ္ဘာကို မီးရှို့ဖို့ ပြင်ဆင်နေကြသည်။',
      posterUrl: 'https://picsum.photos/seed/movie406/400/600',
      backdropUrl: 'https://picsum.photos/seed/backdrop406/800/450',
      cast: [
        CastMember(
          name: 'Emma D\'Arcy',
          profileUrl: 'https://picsum.photos/seed/cast4061/200/200',
          character: 'Rhaenyra Targaryen',
        ),
        CastMember(
          name: 'Matt Smith',
          profileUrl: 'https://picsum.photos/seed/cast4062/200/200',
          character: 'Daemon Targaryen',
        ),
        CastMember(
          name: 'Olivia Cooke',
          profileUrl: 'https://picsum.photos/seed/cast4063/200/200',
          character: 'Alicent Hightower',
        ),
      ],
    ),
  ];

  // ═══════════════════════════════════════════════════════════════════════════
  //  ANIME
  // ═══════════════════════════════════════════════════════════════════════════
  static final List<Movie> animeList = [
    Movie(
      id: 501,
      title: 'Attack on Titan',
      year: 2013,
      imdbRating: 9.1,
      duration: '24m',
      genres: ['Animation', 'Action', 'Drama'],
      synopsis:
          'လူသားများသည် ဧရာမတိုင်တန်များ၏ ရန်မှ ကာကွယ်ရန် မြို့ရိုးကြီးများဖြင့် နေထိုင်ကြသည်။ အဲရင်ယဲဂါသည် မိခင်ကို တိုင်တန်တစ်ကောင်မှ စားသတ်ဖြတ်ခံရပြီးနောက် တိုင်တန်အားလုံးကို ဖျက်ဆီးရန် ကျိန်ဆိုသည်။ သို့သော် သူ့မှာ ထူးခြားသော စွမ်းအားတစ်ခု ရှိနေသည်။',
      posterUrl: 'https://picsum.photos/seed/movie501/400/600',
      backdropUrl: 'https://picsum.photos/seed/backdrop501/800/450',
      cast: [
        CastMember(
          name: 'Yuki Kaji',
          profileUrl: 'https://picsum.photos/seed/cast5011/200/200',
          character: 'Eren Yeager (Voice)',
        ),
        CastMember(
          name: 'Yui Ishikawa',
          profileUrl: 'https://picsum.photos/seed/cast5012/200/200',
          character: 'Mikasa Ackerman (Voice)',
        ),
        CastMember(
          name: 'Marina Inoue',
          profileUrl: 'https://picsum.photos/seed/cast5013/200/200',
          character: 'Armin Arlert (Voice)',
        ),
      ],
    ),
    Movie(
      id: 502,
      title: 'Demon Slayer',
      year: 2019,
      imdbRating: 8.6,
      duration: '24m',
      genres: ['Animation', 'Action', 'Fantasy'],
      synopsis:
          'တန်ဇီရောကာမာဒိုသည် မိသားစုကို မိစ္ဆာဆိုးများက သတ်ဖြတ်ပြီးနောက် ညီမ နီဇူကိုးကို ကယ်တင်ရန် ကြိုးစားသည်။ နီဇူကိုးသည် မိစ္ဆာဖြစ်သွားသော်လည်း လူ့သဘောကို ထိန်းသိမ်းနိုင်သည်။ တန်ဇီရောသည် မိစ္ဆာသုတ်သင်သူအဖြစ် လေ့ကျင့်ပြီး ညီမကို ပြန်လည်ပြုပြင်ရန် ခရီးထွက်သည်။',
      posterUrl: 'https://picsum.photos/seed/movie502/400/600',
      backdropUrl: 'https://picsum.photos/seed/backdrop502/800/450',
      cast: [
        CastMember(
          name: 'Natsuki Hanae',
          profileUrl: 'https://picsum.photos/seed/cast5021/200/200',
          character: 'Tanjiro Kamado (Voice)',
        ),
        CastMember(
          name: 'Akari Kito',
          profileUrl: 'https://picsum.photos/seed/cast5022/200/200',
          character: 'Nezuko Kamado (Voice)',
        ),
        CastMember(
          name: 'Hiro Shimono',
          profileUrl: 'https://picsum.photos/seed/cast5023/200/200',
          character: 'Zenitsu Agatsuma (Voice)',
        ),
      ],
    ),
    Movie(
      id: 503,
      title: 'Jujutsu Kaisen',
      year: 2020,
      imdbRating: 8.6,
      duration: '24m',
      genres: ['Animation', 'Action', 'Fantasy'],
      synopsis:
          'ယူဂျီအီတာဒိုရီသည် သူ့သူငယ်ချင်းများကို ကယ်တင်ရန် သရဲခေါင်းကို မျိုချလိုက်ပြီး သရဲကျွမ်းကျင်သူအဖြစ် ပြောင်းလဲသွားသည်။ တိုကျိုစည်ပင်သာယာရေးကျောင်းတွင် သရဲနှင့် ကျွမ်းကျင်မှုကို လေ့ကျင့်ရပြီး အန္တရာယ်များစွာကို ရင်ဆိုင်ရသည်။',
      posterUrl: 'https://picsum.photos/seed/movie503/400/600',
      backdropUrl: 'https://picsum.photos/seed/backdrop503/800/450',
      cast: [
        CastMember(
          name: 'Junya Enoki',
          profileUrl: 'https://picsum.photos/seed/cast5031/200/200',
          character: 'Yuji Itadori (Voice)',
        ),
        CastMember(
          name: 'Yuma Uchida',
          profileUrl: 'https://picsum.photos/seed/cast5032/200/200',
          character: 'Megumi Fushiguro (Voice)',
        ),
        CastMember(
          name: 'Asami Seto',
          profileUrl: 'https://picsum.photos/seed/cast5033/200/200',
          character: 'Nobara Kugisaki (Voice)',
        ),
      ],
    ),
    Movie(
      id: 504,
      title: 'One Piece',
      year: 1999,
      imdbRating: 8.9,
      duration: '24m',
      genres: ['Animation', 'Action', 'Adventure'],
      synopsis:
          'မွန်ကီဒီလွဖီသည် ပင်လယ်ခေါင်းလျှောက်ဘုရင်ဖြစ်ရန် ရည်ရွယ်ပြီး ခရီးထွက်သည်။ သူသည် ဂျမ်းဖိုမျှော်စားသူများအဖွဲ့ကို ထူထောင်ပြီး ဂရန်လိုင်းတွင် ရောဘင်ကြီးကို ရှာဖွေရင်း အန္တရာယ်များစွာကို ကျော်လွှားရသည်။',
      posterUrl: 'https://picsum.photos/seed/movie504/400/600',
      backdropUrl: 'https://picsum.photos/seed/backdrop504/800/450',
      cast: [
        CastMember(
          name: 'Mayumi Tanaka',
          profileUrl: 'https://picsum.photos/seed/cast5041/200/200',
          character: 'Monkey D. Luffy (Voice)',
        ),
        CastMember(
          name: 'Kazuya Nakai',
          profileUrl: 'https://picsum.photos/seed/cast5042/200/200',
          character: 'Roronoa Zoro (Voice)',
        ),
        CastMember(
          name: 'Akemi Okamura',
          profileUrl: 'https://picsum.photos/seed/cast5043/200/200',
          character: 'Nami (Voice)',
        ),
      ],
    ),
    Movie(
      id: 505,
      title: 'Naruto',
      year: 2002,
      imdbRating: 8.4,
      duration: '24m',
      genres: ['Animation', 'Action', 'Adventure'],
      synopsis:
          'နာရုတိုအုဇုမခီသည် ကွန်းဟာမြို့၏ နီinjaတစ်ဦးဖြစ်ချင်သော ကလေးငယ်တစ်ဦးဖြစ်သည်။ သူ့ခန္ဓာကိုယ်တွင် ကိုးပင်စွန်းမြီးနဂါးဖောက်ထားပြီး မြို့သားများက သူ့ကို မုန်းတီးကြသည်။ သို့သော် သူသည် မိမိအိပ်မက်ကို မည်သည့်အခါမှ မစွန့်လွှတ်ဘဲ အိပ်က်ဟိုကဲဂဲ ဖြစ်လာရန် ကြိုးစားသည်။',
      posterUrl: 'https://picsum.photos/seed/movie505/400/600',
      backdropUrl: 'https://picsum.photos/seed/backdrop505/800/450',
      cast: [
        CastMember(
          name: 'Junko Takeuchi',
          profileUrl: 'https://picsum.photos/seed/cast5051/200/200',
          character: 'Naruto Uzumaki (Voice)',
        ),
        CastMember(
          name: 'Noriaki Sugiyama',
          profileUrl: 'https://picsum.photos/seed/cast5052/200/200',
          character: 'Sasuke Uchiha (Voice)',
        ),
        CastMember(
          name: 'Chie Nakamura',
          profileUrl: 'https://picsum.photos/seed/cast5053/200/200',
          character: 'Sakura Haruno (Voice)',
        ),
      ],
    ),
    Movie(
      id: 506,
      title: 'Dragon Ball Super',
      year: 2015,
      imdbRating: 7.6,
      duration: '24m',
      genres: ['Animation', 'Action', 'Adventure'],
      synopsis:
          'ဂိုကုနှင့် သူ့ရဲဘော်များသည် အားအသစ်များကို ရရှိပြီး စကြာဝဋာ၏ အခြားနေရာများမှ ရန်သူများနှင့် ရင်ဆိုင်ကြရသည်။ ဘီရပ်စ်နတ်ဘုရား၊ ဂိုးဒ်ဘီရပ်စ်နှင့် အခြားစကြာဝဋာတိုက်ပွဲများတွင် ဂိုကုသည် ဆူပါဆိုင်ယာဂေါ့ဒ်အဆင့်သို့ တက်လှမ်းသည်။',
      posterUrl: 'https://picsum.photos/seed/movie506/400/600',
      backdropUrl: 'https://picsum.photos/seed/backdrop506/800/450',
      cast: [
        CastMember(
          name: 'Masako Nozawa',
          profileUrl: 'https://picsum.photos/seed/cast5061/200/200',
          character: 'Goku (Voice)',
        ),
        CastMember(
          name: 'Ryo Horikawa',
          profileUrl: 'https://picsum.photos/seed/cast5062/200/200',
          character: 'Vegeta (Voice)',
        ),
        CastMember(
          name: 'Toshio Furukawa',
          profileUrl: 'https://picsum.photos/seed/cast5063/200/200',
          character: 'Piccolo (Voice)',
        ),
      ],
    ),
  ];

  // ═══════════════════════════════════════════════════════════════════════════
  //  ACTION
  // ═══════════════════════════════════════════════════════════════════════════
  static final List<Movie> actionMovies = [
    Movie(
      id: 601,
      title: 'John Wick: Chapter 4',
      year: 2023,
      imdbRating: 7.7,
      duration: '2h 49m',
      genres: ['Action', 'Crime', 'Thriller'],
      synopsis:
          'ဂျွန်ဝစ်သည် ဟိုက်တိုက်ပွဲမှ လွတ်မြောက်ရန် ကြိုးစားနေဆဲဖြစ်သည်။ မာကွစ် ဒီ ဂရမွန့်ဆိုသူ ကောင်စီဝင်တစ်ဦးက သူ့ကို အမြဲတမ်း လိုက်လံဖမ်းဆီးသည်။ ဂျွန်ဝစ်သည် လွတ်မြောက်ရန် တစ်ဦးတည်း တိုက်ပွဲဝင်ရမည်ဖြစ်ပြီး ပါရီမြို့တွင် ဇာတ်ချိုးကြီး ဖြစ်ပေါ်လာသည်။',
      posterUrl: 'https://picsum.photos/seed/movie601/400/600',
      backdropUrl: 'https://picsum.photos/seed/backdrop601/800/450',
      cast: [
        CastMember(
          name: 'Keanu Reeves',
          profileUrl: 'https://picsum.photos/seed/cast6011/200/200',
          character: 'John Wick',
        ),
        CastMember(
          name: 'Donnie Yen',
          profileUrl: 'https://picsum.photos/seed/cast6012/200/200',
          character: 'Caine',
        ),
        CastMember(
          name: 'Bill Skarsgård',
          profileUrl: 'https://picsum.photos/seed/cast6013/200/200',
          character: 'Marquis de Gramont',
        ),
        CastMember(
          name: 'Hiroyuki Sanada',
          profileUrl: 'https://picsum.photos/seed/cast6014/200/200',
          character: 'Shimazu',
        ),
      ],
    ),
    Movie(
      id: 602,
      title: 'Mission: Impossible - Dead Reckoning',
      year: 2023,
      imdbRating: 7.8,
      duration: '2h 43m',
      genres: ['Action', 'Adventure', 'Thriller'],
      synopsis:
          'အီသန်ဟန့်သည် လူသားမျိုးနွယ်ကို ခြိမ်းချောက်နေသော အီအိုင်းစိတ်ကူးယဉ်အားဏာကို ရှာဖွေဖျက်ဆီးရန် မစ်ရှင်တစ်ခုကို ထမ်းဆောင်သည်။ သူ့ရှေ့မှာ ယခင်ချစ်သူ ဂရေးစ်လည်း ပါဝင်နေပြီး ရုရှားအာဏာပိုင်များကပါ လိုက်လံနေသည်။',
      posterUrl: 'https://picsum.photos/seed/movie602/400/600',
      backdropUrl: 'https://picsum.photos/seed/backdrop602/800/450',
      cast: [
        CastMember(
          name: 'Tom Cruise',
          profileUrl: 'https://picsum.photos/seed/cast6021/200/200',
          character: 'Ethan Hunt',
        ),
        CastMember(
          name: 'Hayley Atwell',
          profileUrl: 'https://picsum.photos/seed/cast6022/200/200',
          character: 'Grace',
        ),
        CastMember(
          name: 'Ving Rhames',
          profileUrl: 'https://picsum.photos/seed/cast6023/200/200',
          character: 'Luther Stickell',
        ),
      ],
    ),
    Movie(
      id: 603,
      title: 'Extraction 2',
      year: 2023,
      imdbRating: 7.0,
      duration: '2h 2m',
      genres: ['Action', 'Thriller'],
      synopsis:
          'တိုင်လာရိတ်ကသည် ပထမအကြိမ်မစ်ရှင်မှ အသက်ရှင်ကျန်ရစ်ပြီးနောက် အနားယူနေချိန်တွင် ယခင်အဖွဲ့ဝင် တောင်းပန်မှုကြောင့် ဂျော်ဂျီယာကိုစွန့်ခွာထားသော မိသားစုတစ်စုကို ကယ်တင်ရန် ပြန်လာရသည်။ ထောင်တွင်းမှ ကယ်ထုတ်ရန် အန္တရာယ်များစွာ ရင်ဆိုင်ရသည်။',
      posterUrl: 'https://picsum.photos/seed/movie603/400/600',
      backdropUrl: 'https://picsum.photos/seed/backdrop603/800/450',
      cast: [
        CastMember(
          name: 'Chris Hemsworth',
          profileUrl: 'https://picsum.photos/seed/cast6031/200/200',
          character: 'Tyler Rake',
        ),
        CastMember(
          name: 'Golshifteh Farahani',
          profileUrl: 'https://picsum.photos/seed/cast6032/200/200',
          character: 'Nik Khan',
        ),
        CastMember(
          name: 'Adam Bessa',
          profileUrl: 'https://picsum.photos/seed/cast6033/200/200',
          character: 'Yaz',
        ),
      ],
    ),
    Movie(
      id: 604,
      title: 'Fast X',
      year: 2023,
      imdbRating: 5.9,
      duration: '2h 21m',
      genres: ['Action', 'Adventure', 'Crime'],
      synopsis:
          'ဒန်တန်းရေးသည် ဒိုမ်နီကတိုရက်တို့၏ ရန်သူဟောင်း ဒန်တန်းရေး၏သား ဒန်တန်းရေးဇွန်းနှင့် ရင်ဆိုင်ရသည်။ ဒန်တန်းရေးဇွန်းသည် မိမိမိသားစုကို ဖျက်ဆီးရန် အစီအစဉ်ချထားပြီး ဒိုမ်နီသည် မိမိမိသားစုကို ကာကွယ်ရန် ရဲဘော်များနှင့် ပူးပေါင်းရသည်။',
      posterUrl: 'https://picsum.photos/seed/movie604/400/600',
      backdropUrl: 'https://picsum.photos/seed/backdrop604/800/450',
      cast: [
        CastMember(
          name: 'Vin Diesel',
          profileUrl: 'https://picsum.photos/seed/cast6041/200/200',
          character: 'Dominic Toretto',
        ),
        CastMember(
          name: 'Jason Momoa',
          profileUrl: 'https://picsum.photos/seed/cast6042/200/200',
          character: 'Dante Reyes',
        ),
        CastMember(
          name: 'Brie Larson',
          profileUrl: 'https://picsum.photos/seed/cast6043/200/200',
          character: 'Tess',
        ),
      ],
    ),
    Movie(
      id: 605,
      title: 'The Batman',
      year: 2022,
      imdbRating: 7.8,
      duration: '2h 56m',
      genres: ['Action', 'Crime', 'Drama'],
      synopsis:
          'ဗတ်မင်းသည် ဂေါ့သမ်မြို့တွင် နှစ်နှစ်ကျော် ရာဇဝတ်မှုများကို တိုက်ဖျက်နေချိန်တွင် ရစ်လားဆိုသူ ရာဇဝတ်သားတစ်ဦး ပေါ်ပေါက်လာသည်။ ရစ်လားသည် မြို့တော်၏ ခေါင်းဆောင်များကို တစ်ဦးပြီးတစ်ဦး ပစ်မှတ်ထားပြီး ဗတ်မင်းသည် လျှို့ဝှက်ချက်များကို ဖော်ထုတ်ရသည်။',
      posterUrl: 'https://picsum.photos/seed/movie605/400/600',
      backdropUrl: 'https://picsum.photos/seed/backdrop605/800/450',
      cast: [
        CastMember(
          name: 'Robert Pattinson',
          profileUrl: 'https://picsum.photos/seed/cast6051/200/200',
          character: 'Bruce Wayne',
        ),
        CastMember(
          name: 'Zoë Kravitz',
          profileUrl: 'https://picsum.photos/seed/cast6052/200/200',
          character: 'Catwoman',
        ),
        CastMember(
          name: 'Paul Dano',
          profileUrl: 'https://picsum.photos/seed/cast6053/200/200',
          character: 'The Riddler',
        ),
      ],
    ),
    Movie(
      id: 606,
      title: 'Top Gun: Maverick',
      year: 2022,
      imdbRating: 8.3,
      duration: '2h 11m',
      genres: ['Action', 'Drama'],
      synopsis:
          'ပီတမာဗရစ်သည် နှစ်ပေါင်း၃၀ကျော် စစ်တပ်တွင် ထူးချွန်စွာ ဆက်လက်တာဝန်ထမ်းဆောင်နေသည်။ သူ့အား တော်ဂွန်စစ်သင်တန်းကျောင်းသို့ ပြန်လည်ခေါ်ယူပြီး အထူးမစ်ရှန်အတွက် လေယာဉ်မှူးလူငယ်များကို လေ့ကျင့်ပေးရန် တာဝန်ပေးအပ်သည်။ သူ၏ယခင်ရဲဘော်၏သား ရူးစတားလည်း ပါဝင်နေသည်။',
      posterUrl: 'https://picsum.photos/seed/movie606/400/600',
      backdropUrl: 'https://picsum.photos/seed/backdrop606/800/450',
      cast: [
        CastMember(
          name: 'Tom Cruise',
          profileUrl: 'https://picsum.photos/seed/cast6061/200/200',
          character: 'Pete "Maverick" Mitchell',
        ),
        CastMember(
          name: 'Miles Teller',
          profileUrl: 'https://picsum.photos/seed/cast6062/200/200',
          character: 'Bradley "Rooster" Bradshaw',
        ),
        CastMember(
          name: 'Jennifer Connelly',
          profileUrl: 'https://picsum.photos/seed/cast6063/200/200',
          character: 'Penny Benjamin',
        ),
      ],
    ),
  ];

  // ═══════════════════════════════════════════════════════════════════════════
  //  HORROR
  // ═══════════════════════════════════════════════════════════════════════════
  static final List<Movie> horrorMovies = [
    Movie(
      id: 701,
      title: 'The Conjuring',
      year: 2013,
      imdbRating: 7.5,
      duration: '1h 52m',
      genres: ['Horror', 'Mystery', 'Thriller'],
      synopsis:
          'ပယ်ရွန်မိသားစုသည် ရုဒ်အိုင်းလန်းတွင် နေအိမ်အသစ်သို့ ပြောင်းရွှေ့ကြသည်။ နေအိမ်တွင် မနာခံသော ဝိညာဉ်များ ရှိနေပြီး မိသားစုဝင်များကို နှောင့်ယှက်သည်။ အက်ဒ်နှင့် လော်ရိန်ဝါရင်းတို့သည် ဝိညာဉ်ပိုင်းစုံစမ်းသူများအဖြစ် ကူညီပေးရန် ရောက်လာကြသည်။',
      posterUrl: 'https://picsum.photos/seed/movie701/400/600',
      backdropUrl: 'https://picsum.photos/seed/backdrop701/800/450',
      cast: [
        CastMember(
          name: 'Vera Farmiga',
          profileUrl: 'https://picsum.photos/seed/cast7011/200/200',
          character: 'Lorraine Warren',
        ),
        CastMember(
          name: 'Patrick Wilson',
          profileUrl: 'https://picsum.photos/seed/cast7012/200/200',
          character: 'Ed Warren',
        ),
        CastMember(
          name: 'Lili Taylor',
          profileUrl: 'https://picsum.photos/seed/cast7013/200/200',
          character: 'Carolyn Perron',
        ),
      ],
    ),
    Movie(
      id: 702,
      title: 'Hereditary',
      year: 2018,
      imdbRating: 7.3,
      duration: '2h 7m',
      genres: ['Drama', 'Horror', 'Mystery'],
      synopsis:
          'ဂရေဟမ်မိသားစု၏ ဘေးလျာမှောင်မိုက်ဆန်သော ဇာတ်လမ်းဖြစ်သည်။ မိခင်ကွယ်လွန်ပြီးနောက် အန်နီနှင့် သူမမိသားစုဝင်များသည် ထူးခြားသော ဖြစ်ရပ်များကို ခံစားရသည်။ သူမတို့၏ ဘိုးဘေးများမှ ဆက်ခံလာသော ကျိန်စာသည် မိသားစုကို ဖျက်ဆီးနေသည်။',
      posterUrl: 'https://picsum.photos/seed/movie702/400/600',
      backdropUrl: 'https://picsum.photos/seed/backdrop702/800/450',
      cast: [
        CastMember(
          name: 'Toni Collette',
          profileUrl: 'https://picsum.photos/seed/cast7021/200/200',
          character: 'Annie Graham',
        ),
        CastMember(
          name: 'Milly Shapiro',
          profileUrl: 'https://picsum.photos/seed/cast7022/200/200',
          character: 'Charlie Graham',
        ),
        CastMember(
          name: 'Alex Wolff',
          profileUrl: 'https://picsum.photos/seed/cast7023/200/200',
          character: 'Peter Graham',
        ),
      ],
    ),
    Movie(
      id: 703,
      title: 'Get Out',
      year: 2017,
      imdbRating: 7.7,
      duration: '1h 44m',
      genres: ['Horror', 'Mystery', 'Thriller'],
      synopsis:
          'ခရစ်စ်ဝါရှင်းတန်သည် သူ့ချစ်သူရုစ်အာမီတေ့၏ မိဘများနှင့် တွေ့ဆုံရန် သွားရောက်သည်။ ဧည့်ခံမှုသည် အစပိုင်းတွင် ကောင်းမွန်သော်လည်း အမည်းရောင်သမားများ၏ အပြုံးနောက်တွင် ကြောက်မက်ဖွယ်ရာ လျှို့ဝှက်ချက်တစ်ခု ပုန်းအောင်းနေသည်။',
      posterUrl: 'https://picsum.photos/seed/movie703/400/600',
      backdropUrl: 'https://picsum.photos/seed/backdrop703/800/450',
      cast: [
        CastMember(
          name: 'Daniel Kaluuya',
          profileUrl: 'https://picsum.photos/seed/cast7031/200/200',
          character: 'Chris Washington',
        ),
        CastMember(
          name: 'Allison Williams',
          profileUrl: 'https://picsum.photos/seed/cast7032/200/200',
          character: 'Rose Armitage',
        ),
        CastMember(
          name: 'Bradley Whitford',
          profileUrl: 'https://picsum.photos/seed/cast7033/200/200',
          character: 'Dean Armitage',
        ),
      ],
    ),
    Movie(
      id: 704,
      title: 'A Quiet Place',
      year: 2018,
      imdbRating: 7.5,
      duration: '1h 30m',
      genres: ['Drama', 'Horror', 'Sci-Fi'],
      synopsis:
          'အသံကို ကျွမ်းကျင်စွာ ကြားနိုင်သော နဂိုမြင်သတ္တဝါများက ကမ္ဘာကို သိမ်းပိုက်ပြီးနောက် အက်ဗော့မိသားစုသည် အသံမမြည်ဘဲ နေထိုင်ကြသည်။ မိသားစု၏ အသက်ရှင်ရပ်တည်မှုသည် ကိုယ်ဝန်ဆောင်မိခင်၏ မွေးဖွားမှုကြောင့် ပိုမိုခက်ခဲလာသည်။',
      posterUrl: 'https://picsum.photos/seed/movie704/400/600',
      backdropUrl: 'https://picsum.photos/seed/backdrop704/800/450',
      cast: [
        CastMember(
          name: 'Emily Blunt',
          profileUrl: 'https://picsum.photos/seed/cast7041/200/200',
          character: 'Evelyn Abbott',
        ),
        CastMember(
          name: 'John Krasinski',
          profileUrl: 'https://picsum.photos/seed/cast7042/200/200',
          character: 'Lee Abbott',
        ),
        CastMember(
          name: 'Millicent Simmonds',
          profileUrl: 'https://picsum.photos/seed/cast7043/200/200',
          character: 'Regan Abbott',
        ),
      ],
    ),
    Movie(
      id: 705,
      title: 'IT',
      year: 2017,
      imdbRating: 7.3,
      duration: '2h 15m',
      genres: ['Horror', 'Thriller'],
      synopsis:
          'ဒဲရီမြို့တွင် ကလေးများ ပျောက်ဆုံးနေချိန်တွင် ဘီလ်နှင့် သူ့ရဲဘော်များဖြစ်သော လူဇာကလပ်အဖွဲ့သည် ပဲနီဝိုင်းဆိုသော ယုံကြည်စရာမကောင်းသော သရဲမုဆိုးတစ်ဦးကို ရင်ဆိုင်ကြရသည်။ ပဲနီဝိုင်းသည် ကလေးများ၏ ကြောက်ရွံ့မှုကို အားထုတ်စားသော သတ္တဝါဖြစ်သည်။',
      posterUrl: 'https://picsum.photos/seed/movie705/400/600',
      backdropUrl: 'https://picsum.photos/seed/backdrop705/800/450',
      cast: [
        CastMember(
          name: 'Bill Skarsgård',
          profileUrl: 'https://picsum.photos/seed/cast7051/200/200',
          character: 'Pennywise',
        ),
        CastMember(
          name: 'Jaeden Martell',
          profileUrl: 'https://picsum.photos/seed/cast7052/200/200',
          character: 'Bill Denbrough',
        ),
        CastMember(
          name: 'Finn Wolfhard',
          profileUrl: 'https://picsum.photos/seed/cast7053/200/200',
          character: 'Richie Tozier',
        ),
      ],
    ),
    Movie(
      id: 706,
      title: 'The Exorcist',
      year: 1973,
      imdbRating: 8.1,
      duration: '2h 2m',
      genres: ['Horror'],
      synopsis:
          '၁၂နှစ်အရွယ် ရီဂန်မက်နီးလ်သည် မိမိခန္ဓာကိုယ်ကို ရှုံးနှုန်းစေသော ရောဂါဖြင့် နာမကျန်းဖြစ်လာသည်။ ဆရာဝန်များ ရောဂါအကြောင်းရင်းကို မသိနိုင်ဘဲ ဖခင်မက်ရီသည် ဘုန်းတော်ကြီး မဲရင်းကို အကူအညီတောင်းသည်။ မက်ရင်းသည် ရီဂန်၏ခန္ဓာကိုယ်ထဲသို့ ဝင်ရောက်နေသော ဆိုးရွားသောဝိညာဉ်ကို နှင်ထုတ်ရန် ကြိုးစားသည်။',
      posterUrl: 'https://picsum.photos/seed/movie706/400/600',
      backdropUrl: 'https://picsum.photos/seed/backdrop706/800/450',
      cast: [
        CastMember(
          name: 'Ellen Burstyn',
          profileUrl: 'https://picsum.photos/seed/cast7061/200/200',
          character: 'Chris MacNeil',
        ),
        CastMember(
          name: 'Max von Sydow',
          profileUrl: 'https://picsum.photos/seed/cast7062/200/200',
          character: 'Father Merrin',
        ),
        CastMember(
          name: 'Linda Blair',
          profileUrl: 'https://picsum.photos/seed/cast7063/200/200',
          character: 'Regan MacNeil',
        ),
      ],
    ),
  ];

  // ═══════════════════════════════════════════════════════════════════════════
  //  CATEGORY MAP
  // ═══════════════════════════════════════════════════════════════════════════
  static final Map<String, List<Movie>> categoryMovies = {
    'Iconic Movies': iconicMovies,
    'War Movies': warMovies,
    'Trending Now': trendingMovies,
    'Ongoing Series': ongoingSeries,
    'Anime': animeList,
    'Action': actionMovies,
    'Horror': horrorMovies,
  };

  // ═══════════════════════════════════════════════════│═══════════════════════
  //  LIVE EVENTS
  // ═══════════════════════════════════════════════════════════════════════════
  static final List<LiveEvent> liveEvents = [
    LiveEvent(
      id: 901,
      title: 'Al Hilal vs Ulsan HD',
      league: 'AFC Champions League',
      time: '20:00',
      isLive: true,
      thumbnailUrl: 'https://picsum.photos/seed/live901/320/180',
      channel: Channel(
        id: 1001,
        name: 'AFC TV',
        logoUrl: 'https://picsum.photos/seed/ch1001/100/100',
        streamUrl: 'https://stream.kumastream.com/afc/live1',
      ),
    ),
    LiveEvent(
      id: 902,
      title: 'Al Nassr vs Al Ain',
      league: 'AFC Champions League',
      time: '22:30',
      isLive: false,
      thumbnailUrl: 'https://picsum.photos/seed/live902/320/180',
      channel: Channel(
        id: 1001,
        name: 'AFC TV',
        logoUrl: 'https://picsum.photos/seed/ch1001/100/100',
        streamUrl: 'https://stream.kumastream.com/afc/live2',
      ),
    ),
    LiveEvent(
      id: 903,
      title: 'AC Milan vs Inter Milan',
      league: 'Serie A',
      time: '21:45',
      isLive: true,
      thumbnailUrl: 'https://picsum.photos/seed/live903/320/180',
      channel: Channel(
        id: 1002,
        name: 'Serie A Official',
        logoUrl: 'https://picsum.photos/seed/ch1002/100/100',
        streamUrl: 'https://stream.kumastream.com/seriea/live1',
      ),
    ),
    LiveEvent(
      id: 904,
      title: 'Juventus vs Napoli',
      league: 'Serie A',
      time: '19:30',
      isLive: false,
      thumbnailUrl: 'https://picsum.photos/seed/live904/320/180',
      channel: Channel(
        id: 1002,
        name: 'Serie A Official',
        logoUrl: 'https://picsum.photos/seed/ch1002/100/100',
        streamUrl: 'https://stream.kumastream.com/seriea/live2',
      ),
    ),
    LiveEvent(
      id: 905,
      title: 'Manchester City vs Arsenal',
      league: 'Premier League',
      time: '17:30',
      isLive: true,
      thumbnailUrl: 'https://picsum.photos/seed/live905/320/180',
      channel: Channel(
        id: 1003,
        name: 'Premier League TV',
        logoUrl: 'https://picsum.photos/seed/ch1003/100/100',
        streamUrl: 'https://stream.kumastream.com/epl/live1',
      ),
    ),
    LiveEvent(
      id: 906,
      title: 'Liverpool vs Chelsea',
      league: 'Premier League',
      time: '20:00',
      isLive: false,
      thumbnailUrl: 'https://picsum.photos/seed/live906/320/180',
      channel: Channel(
        id: 1003,
        name: 'Premier League TV',
        logoUrl: 'https://picsum.photos/seed/ch1003/100/100',
        streamUrl: 'https://stream.kumastream.com/epl/live2',
      ),
    ),
  ];

  // ═══════════════════════════════════════════════════════════════════════════
  //  CHANNELS
  // ═══════════════════════════════════════════════════════════════════════════
  static final List<Channel> channels = [
    Channel(
      id: 1001,
      name: 'AFC TV',
      logoUrl: 'https://picsum.photos/seed/ch1001/100/100',
      streamUrl: 'https://stream.kumastream.com/afc/main',
    ),
    Channel(
      id: 1002,
      name: 'Serie A Official',
      logoUrl: 'https://picsum.photos/seed/ch1002/100/100',
      streamUrl: 'https://stream.kumastream.com/seriea/main',
    ),
    Channel(
      id: 1003,
      name: 'Premier League TV',
      logoUrl: 'https://picsum.photos/seed/ch1003/100/100',
      streamUrl: 'https://stream.kumastream.com/epl/main',
    ),
    Channel(
      id: 1004,
      name: 'La Liga TV',
      logoUrl: 'https://picsum.photos/seed/ch1004/100/100',
      streamUrl: 'https://stream.kumastream.com/laliga/main',
    ),
    Channel(
      id: 1005,
      name: 'Bundesliga TV',
      logoUrl: 'https://picsum.photos/seed/ch1005/100/100',
      streamUrl: 'https://stream.kumastream.com/bundesliga/main',
    ),
    Channel(
      id: 1006,
      name: 'Ligue 1 TV',
      logoUrl: 'https://picsum.photos/seed/ch1006/100/100',
      streamUrl: 'https://stream.kumastream.com/ligue1/main',
    ),
    Channel(
      id: 1007,
      name: 'ESPN Sports',
      logoUrl: 'https://picsum.photos/seed/ch1007/100/100',
      streamUrl: 'https://stream.kumastream.com/espn/main',
    ),
    Channel(
      id: 1008,
      name: 'Sky Sports',
      logoUrl: 'https://picsum.photos/seed/ch1008/100/100',
      streamUrl: 'https://stream.kumastream.com/skysports/main',
    ),
  ];

  // ═══════════════════════════════════════════════════════════════════════════
  //  HELPERS
  // ═══════════════════════════════════════════════════════════════════════════

  /// Returns all movies across every category, de-duplicated by id.
  static List<Movie> get allMovies {
    final seen = <int>{};
    final result = <Movie>[];
    for (final list in categoryMovies.values) {
      for (final movie in list) {
        if (seen.add(movie.id)) {
          result.add(movie);
        }
      }
    }
    return result;
  }

  /// Search movies by title (case-insensitive substring match).
  static List<Movie> searchMovies(String query) {
    if (query.trim().isEmpty) return [];
    final q = query.toLowerCase();
    return allMovies.where((m) => m.title.toLowerCase().contains(q)).toList();
  }

  /// Returns the category name for a given movie, or null if not found.
  static String? categoryForMovie(Movie movie) {
    for (final entry in categoryMovies.entries) {
      if (entry.value.any((m) => m.id == movie.id)) {
        return entry.key;
      }
    }
    return null;
  }
}
