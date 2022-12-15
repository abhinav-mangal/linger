part of 'home_cubit.dart';

class HomeState extends Equatable {
  final Data? home;
  final bool loading;
  final String? lat;
  final String? long;
  final StateMachineController? stateMachineController;
  final SMITrigger? trigger;
  final Artboard? currentArtBoard;
  final Duration? currentTriggerDuration;
  final TimingResponseBody? timing;
  final BoxDecoration? decoration;
  final String? prayername;
  final Color? colorStatus;
  final Duration? counter;
  final DateTime? prayer1Time;
  final DateTime? prayer2Time;
  final DateTime? prayer3Time;
  final DateTime? prayer4Time;
  final DateTime? prayer5Time;
  final Color? decorationColor;
  final PerOfTheDay? peroftheday;
  final String? weather;
  final String? city;
  final SurahModel? surahChapters;
  final Quran? quran;
  final QuranDetails? quranDetails;
  final SurahChaptersDetails? surahChaptersDetails;
  final ThemeModal? themeModal;

  const HomeState(
      {this.currentTriggerDuration,
      this.home,
      required this.loading,
      this.lat,
      this.long,
      this.stateMachineController,
      this.trigger,
      this.currentArtBoard,
      this.timing,
      this.decoration,
      this.colorStatus,
      this.prayername,
      this.counter,
      this.decorationColor,
      this.prayer1Time,
      this.prayer2Time,
      this.prayer3Time,
      this.prayer4Time,
      this.prayer5Time,
      this.peroftheday,
      this.weather,
      this.city,
      this.surahChapters,
      this.surahChaptersDetails,
      this.quran,
      this.quranDetails,
      this.themeModal});

  const HomeState.init(
      {this.currentTriggerDuration,
      this.home,
      required this.loading,
      this.lat,
      this.long,
      this.stateMachineController,
      this.trigger,
      this.currentArtBoard,
      this.timing,
      this.decoration,
      this.colorStatus,
      this.prayername,
      this.counter,
      this.decorationColor,
      this.prayer1Time,
      this.prayer2Time,
      this.prayer3Time,
      this.prayer4Time,
      this.prayer5Time,
      this.peroftheday,
      this.weather,
      this.city,
      this.surahChapters,
      this.surahChaptersDetails,
      this.quran,
      this.quranDetails,
      this.themeModal});

  HomeState copyWith(
      {Data? home,
      bool? loading,
      String? lat,
      String? long,
      Artboard? currentArtBoard,
      StateMachineController? stateMachineController,
      SMITrigger? trigger,
      Duration? currentTriggerDuration,
      TimingResponseBody? timing,
      BoxDecoration? decoration,
      String? prayername,
      Color? colorStatus,
      Duration? counter,
      Color? decorationColor,
      DateTime? prayer1Time,
      DateTime? prayer2Time,
      DateTime? prayer3Time,
      DateTime? prayer4Time,
      DateTime? prayer5Time,
      PerOfTheDay? peroftheday,
      String? weather,
      String? city,
      SurahModel? surahChapters,
      SurahChaptersDetails? surahChaptersDetails,
      Quran? quran,
      QuranDetails? quranDetails,
      ThemeModal? themeModal}) {
    return HomeState(
      loading: loading ?? this.loading,
      home: home ?? this.home,
      lat: lat ?? this.lat,
      long: long ?? this.long,
      currentArtBoard: currentArtBoard ?? this.currentArtBoard,
      currentTriggerDuration:
          currentTriggerDuration ?? this.currentTriggerDuration,
      timing: timing ?? this.timing,
      decoration: decoration ?? this.decoration,
      colorStatus: colorStatus ?? this.colorStatus,
      prayername: prayername ?? this.prayername,
      counter: counter ?? this.counter,
      decorationColor: decorationColor ?? this.decorationColor,
      prayer1Time: prayer1Time ?? this.prayer1Time,
      prayer2Time: prayer2Time ?? this.prayer2Time,
      prayer3Time: prayer3Time ?? this.prayer3Time,
      prayer4Time: prayer4Time ?? this.prayer4Time,
      prayer5Time: prayer5Time ?? this.prayer5Time,
      peroftheday: peroftheday ?? this.peroftheday,
      weather: weather ?? this.weather,
      city: city ?? this.city,
      surahChapters: surahChapters ?? this.surahChapters,
      surahChaptersDetails: surahChaptersDetails ?? this.surahChaptersDetails,
      quran: quran ?? this.quran,
      quranDetails: quranDetails ?? this.quranDetails,
      themeModal: themeModal ?? this.themeModal,
    );
  }

  @override
// TODO: implement props
  List<Object?> get props => [
        loading,
        home,
        lat,
        long,
        currentArtBoard,
        stateMachineController,
        trigger,
        currentTriggerDuration,
        timing,
        counter,
        decoration,
        colorStatus,
        prayername,
        prayer1Time,
        prayer2Time,
        prayer3Time,
        prayer4Time,
        prayer5Time,
        peroftheday,
        weather,
        city,
        surahChapters,
        surahChaptersDetails,
        quran,
        quranDetails,
        themeModal
      ];
}
