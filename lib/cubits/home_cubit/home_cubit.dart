import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:linger/Utils/progress_utility.dart';
import 'package:linger/cubits/profile_cubit/profile_cubit.dart';
import 'package:linger/data/data_repository/app_repository.dart';
import 'package:linger/data/model/al_quran/surah_chapter_details.dart';
import 'package:linger/data/model/al_quran/surah_model.dart';
import 'package:linger/data/model/theme_modal.dart';
import 'package:linger/data/model/user_home_reponse_model.dart';
import 'package:linger/models/homepage/TimingResponse.dart';
import 'package:linger/router/app_routes.gr.dart';
import 'package:linger/services/app_json_store.dart';
import 'package:linger/services/http_services.dart';
import 'package:rive/rive.dart';

import '../../data/model/user_quran_response_model.dart';
import '../../locator.dart';
import '../../services/base_api.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit()
      : super(const HomeState.init(
            loading: false, currentTriggerDuration: Duration(seconds: 1)));

  final dataRepo = getItInjector<AppRepository>();
  final appRoute = getItInjector<AppRouter>();
  final route = getItInjector<AppRouter>();
  StreamSubscription? myAnimationProviderStream;

  SMITrigger? trigger;
  StateMachineController? stateMachineController;
  DateTime dateTime = DateTime.now();
  DateTime dateTime1 = DateTime.now().add(const Duration(days: 1));

  void init() async {
    final authCubit =
        appRoute.navigatorKey.currentState!.context.read<ProfileCubit>();
    emit(state.copyWith(loading: true));
    final home = await dataRepo.getUserHome(
        token: authCubit.state.user!.token ?? '',
        lat: state.lat ?? '26.8467',
        long: state.long ?? '80.9462');
    emit(state.copyWith(loading: false));
    home.fold((l) {}, (r) {
      emit(state.copyWith(home: r));
    });
    getGeoLocationPosition();
    await getUserQuran();
    getTheme(true);
  }

  Future<Position> getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    getAddressFromLatLong(await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high));
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> getAddressFromLatLong(Position position) async {
    onlatChanged("${position.latitude}");
    onlongChanged("${position.longitude}");
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    print(place.locality);
    emit(state.copyWith(city: place.locality!));
    await loadTemp();
    getNamaazTiming(DateFormat("dd-MM-yyyy").format(dateTime), place.locality!);
    // checkCurrentDateTime();
  }

  Future<void> getNamaazTiming(String date, String address) async {
    final url = "${BaseApi.baseUrl1}${BaseApi.timing}$date?address=$address";
    emit(state.copyWith(
      loading: true,
    ));
    final response = await http.get(Uri.parse(url));
    final Map<String, dynamic> data = json.decode(response.body);
    TimingResponse timingResponse = TimingResponse.fromJson(data);
    print(timingResponse.timingResponseBody!.timings!.asr);
    emit(state.copyWith(
      loading: false,
      timing: timingResponse.timingResponseBody,
    ));
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      // await loadTemp();
      if (state.timing != null && state.timing!.timings != null) {
        await checkCurrentDateTime(state.timing!.timings!);
      }
    });
    // checkCurrentDateTime();
  }

  loadTemp() async {
    var lat = state.lat ?? "0.0";
    var lon = state.long ?? "0.0";

    final weatherResponse = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?APPID=0721392c0ba0af8c410aa9394defa29e&lat=${lat.toString()}&lon=${lon.toString()}'));

    if (weatherResponse.statusCode == 200) {
      var data = WeatherData.fromJson(jsonDecode(weatherResponse.body));

      emit(state.copyWith(weather: k2c(data.temp.toString())));
    }
  }

  Future<void> getAllChaptersOfSurah() async {
    final response = await http.get(Uri.parse(BaseApi.getAllChaptersOfSurah));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      emit(state.copyWith(surahChapters: SurahModel.fromJson(data)));
    }
  }

  Future<void> getUserQuran() async {
    ProgressUtil.showProgress(
        context: route.navigatorKey.currentState!.context);
    final authCubit =
        appRoute.navigatorKey.currentState!.context.read<ProfileCubit>();
    var data = await dataRepo.getUserQuran(
      token: authCubit.state.user!.token ?? '',
    );
    ProgressUtil.hideProgress();
    data.fold((l) {}, (r) {
      emit(state.copyWith(quran: r));
    });
  }

  Future<void> getUserQuranDetails(
      {required language, required number, required type}) async {
    ProgressUtil.showProgress(
        context: route.navigatorKey.currentState!.context);
    emit(state.copyWith(quranDetails: null));
    final authCubit =
        appRoute.navigatorKey.currentState!.context.read<ProfileCubit>();
    var data = await dataRepo.getUserQuranDetails(
        token: authCubit.state.user!.token ?? '',
        language: language,
        number: number,
        type: type);
    ProgressUtil.hideProgress();
    data.fold((l) {}, (r) {
      emit(state.copyWith(quranDetails: r));
    });
  }

  Future<void> getChaptersDetails(int id) async {
    final response = await http
        .get(Uri.parse("${BaseApi.getChaptersDetails}$id/info?language=en"));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      emit(state.copyWith(
          surahChaptersDetails: SurahChaptersDetails.fromJson(data)));
    }
  }

  Future<void> getTheme(bool isBright) async {
    Map<String, Color> themeData = <String, Color>{};
    if (isBright) {
      themeData = ({
        "textColor": const Color.fromARGB(255, 0, 0, 0),
        "appBar": const Color.fromARGB(255, 255, 255, 255),
        "screenColor": const Color.fromARGB(255, 255, 255, 255),
        "cardsColors": const Color.fromARGB(255, 255, 255, 255),
        "arrowIconColor": Colors.green,
        "iconColor": Colors.black
      });
    }
    if (!isBright) {
      themeData = ({
        "textColor": const Color.fromARGB(255, 255, 255, 255),
        "appBar": Colors.black,
        "screenColor": const Color.fromARGB(255, 29, 29, 29),
        "cardsColors": Colors.black,
        "arrowIconColor": Colors.white,
        "iconColor": Colors.white
      });
    }
    emit(state.copyWith(themeModal: ThemeModal.changeTheme(themeData)));
  }

  String k2c(String k) {
    return "${(double.parse(k) - 273.15).toStringAsFixed(0)}°C";
  }

  Future<void> checkCurrentDateTime(Timings timings) async {
    DateTime prayer1Time = DateTime.now();
    DateTime prayer2Time = DateTime.now();
    DateTime prayer3Time = DateTime.now();
    DateTime prayer4Time = DateTime.now();
    DateTime prayer5Time = DateTime.now();
    // if (DateTime.parse(
    //             "${DateFormat("yyyy-MM-dd").format(dateTime)} ${timings.fajr!}")
    //         .compareTo(DateTime.now()) >
    //     0) {
    prayer1Time = DateTime.parse(
        "${DateFormat("yyyy-MM-dd").format(dateTime)} ${timings.fajr!}");
    // } else {
    //   prayer1Time = DateTime.parse(
    //       "${DateFormat("yyyy-MM-dd").format(dateTime1)} ${timings.fajr!}");
    // }
    // if (DateTime.parse(
    //             "${DateFormat("yyyy-MM-dd").format(dateTime)} ${timings.dhuhr!}")
    //         .compareTo(DateTime.now()) >
    //     0) {
    prayer2Time = DateTime.parse(
        "${DateFormat("yyyy-MM-dd").format(dateTime)} ${timings.dhuhr!}");
    // } else {
    // prayer2Time = DateTime.parse(
    //     "${DateFormat("yyyy-MM-dd").format(dateTime1)} ${timings.dhuhr!}");
    // }
    // if (DateTime.parse(
    //             "${DateFormat("yyyy-MM-dd").format(dateTime)} ${timings.asr!}")
    //         .compareTo(DateTime.now()) >
    //     0) {
    prayer3Time = DateTime.parse(
        "${DateFormat("yyyy-MM-dd").format(dateTime)} ${timings.asr!}");
    // } else {
    // prayer3Time = DateTime.parse(
    //     "${DateFormat("yyyy-MM-dd").format(dateTime1)} ${timings.asr!}");
    // }
    // if (DateTime.parse(
    //             "${DateFormat("yyyy-MM-dd").format(dateTime)} ${timings.maghrib!}")
    //         .compareTo(DateTime.now()) >
    //     0) {
    prayer4Time = DateTime.parse(
        "${DateFormat("yyyy-MM-dd").format(dateTime)} ${timings.maghrib!}");
    // } else {
    // prayer4Time = DateTime.parse(
    //     "${DateFormat("yyyy-MM-dd").format(dateTime1)} ${timings.maghrib!}");
    // }
    // if (DateTime.parse(
    //             "${DateFormat("yyyy-MM-dd").format(dateTime)} ${timings.isha!}")
    //         .compareTo(DateTime.now()) >
    //     0) {
    prayer5Time = DateTime.parse(
        "${DateFormat("yyyy-MM-dd").format(dateTime)} ${timings.isha!}");
    // } else {
    // prayer5Time = DateTime.parse(
    //     "${DateFormat("yyyy-MM-dd").format(dateTime1)} ${timings.isha!}");
    // }
    await changeDecoration(timings, prayer1Time, prayer3Time, prayer2Time,
        prayer4Time, prayer5Time);
  }

  Future<void> changeDecoration(
      Timings timings,
      DateTime prayer1Time,
      DateTime prayer3Time,
      DateTime prayer2Time,
      DateTime prayer4Time,
      DateTime prayer5Time) async {
    DateTime now = DateTime.now();
    if (now.isAfter(prayer1Time) && now.isBefore(prayer2Time)) {
      emit(state.copyWith(
        colorStatus: Colors.black,
        decorationColor: const Color(0xFFDFB690),
        prayername: "Dhuhr ${timings.dhuhr!}",
        counter: prayer2Time.difference(DateTime.now()),
      ));
    } else if (now.isAfter(prayer2Time) && now.isBefore(prayer3Time)) {
      emit(state.copyWith(
        colorStatus: Colors.black,
        decorationColor: const Color(0xFF90C3DF),
        prayername: "Asr ${timings.asr!}",
        counter: prayer3Time.difference(DateTime.now()),
      ));
    } else if (now.isAfter(prayer3Time) && now.isBefore(prayer4Time)) {
      emit(state.copyWith(
        colorStatus: Colors.black,
        decorationColor: const Color(0xFF90B9DF),
        prayername: "Maghrib ${timings.maghrib!}",
        counter: prayer4Time.difference(DateTime.now()),
      ));
    } else if ((now.isAfter(prayer4Time)) && (now.isBefore(prayer5Time))) {
      emit(
        state.copyWith(
          colorStatus: Colors.white,
          decorationColor: const Color(0xFF322777),
          prayername: 'Isha ${timings.isha}',
          counter: prayer5Time.difference(DateTime.now()),
        ),
      );
    } else if (now.isAfter(prayer5Time) &&
        now.isBefore(prayer1Time.add(const Duration(days: 1)))) {
      emit(state.copyWith(
        colorStatus: Colors.white,
        decorationColor: const Color(0xFF081923),
        prayername: 'Fajr ${timings.fajr}',
        counter:
            prayer1Time.add(const Duration(days: 1)).difference(DateTime.now()),
      ));
    } else {
      emit(state.copyWith(
        colorStatus: Colors.white,
        decorationColor: const Color(0xFF081923),
        prayername: 'Fajr ${timings.fajr}',
        counter: prayer1Time.difference(DateTime.now()),
      ));
    }
  }

  void onlatChanged(String? value) {
    emit(state.copyWith(lat: value));
  }

  void onlongChanged(String? value) {
    emit(state.copyWith(long: value));
  }

  void startAnimation() {
    if (myAnimationProviderStream != null) {
      myAnimationProviderStream?.cancel();
    } else {
      myAnimationProviderStream =
          Stream.periodic(const Duration(seconds: 5)).listen((event) {
        final currentTime = DateTime.now();
        triggerFire('${currentTime.hour}');
      });
    }
  }

  void triggerFire(String smi) {
    rootBundle.load('assets/images/Final_Weather_Animation.riv').then(
      (data) {
        final file = RiveFile.import(data);
        final artboard = file.mainArtboard;
        stateMachineController =
            StateMachineController.fromArtboard(artboard, "State Machine 1")!;
        if (stateMachineController != null) {
          artboard.addController(stateMachineController!);
          trigger = stateMachineController?.findSMI(smi);
          emit(state.copyWith(
            currentArtBoard: artboard,
          ));
        }
        if (trigger != null) {
          trigger?.fire();
        }
      },
    );
  }

  void likePOST(BuildContext context, String postId, String isStatus) async {
    final authCubit =
        appRoute.navigatorKey.currentState!.context.read<ProfileCubit>();
    // context.loaderOverlay.show(widget: const CupertinoActivityIndicator());
    final loginRes = await dataRepo.likePOST(
        token: authCubit.state.user!.token ?? '',
        isStatus: isStatus,
        picId: postId);
    // context.loaderOverlay.hide();
    loginRes.fold(
      (l) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Failed to like post')));
      },
      (r) async {
        if (r != null) {
          if (r.success ?? false) {
            emit(state.copyWith(loading: true));
            final home = await dataRepo.getUserHome(
                token: authCubit.state.user!.token ?? '',
                lat: state.lat ?? '26.8467',
                long: state.long ?? '80.9462');
            emit(state.copyWith(loading: false));
            home.fold((l) {}, (r) {
              emit(state.copyWith(home: r));
            });
            // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${r.message}')));
            // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const OtpScreen()));
          } else {
            // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${r.message}')));
          }
          return;
        }
      },
    );
  }
}

/*
import 'dart:async';
import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:linger/Basepackage/baseclass.dart';
import 'package:linger/Utils/AssetImage.dart';
import 'package:linger/Utils/colors.dart';
import 'package:linger/cubits/home_cubit/home_cubit.dart';
import 'package:linger/data/model/user_home_reponse_model.dart';
import 'package:linger/locator.dart';
import 'package:linger/router/app_routes.gr.dart';
import 'package:linger/router/route_names.dart';
import 'package:linger/ui/DrawerMenuScreens.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/src/provider.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import '../constants/apiendpoints.dart';
import 'package:rive/rive.dart';
import '../constants/apiendpoints.dart';
import '../models/homepage/TimingResponse.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with baseclass {
  DateTime dateTime = DateTime.now();
  BoxDecoration decoration = const BoxDecoration();
  String prayerName = "";
  Timings timings = Timings();
  bool loading = true;
  Color colorStatus = Colors.white;
  Duration counter = const Duration(hours: 00, minutes: 00, seconds: 00);

  Artboard? _Artboard;
  SMITrigger? trigger;
  StateMachineController? stateMachineController;
  HomeCubit? homeCubit;

  void checkCurrentDateTime() {
    DateTime prayer1Time = DateTime.parse(
        DateFormat("yyyy-MM-dd").format(dateTime) + " " + timings.fajr!);
    DateTime prayer2Time = DateTime.parse(
        DateFormat("yyyy-MM-dd").format(dateTime) + " " + timings.dhuhr!);
    DateTime prayer3Time = DateTime.parse(
        DateFormat("yyyy-MM-dd").format(dateTime) + " " + timings.asr!);
    DateTime prayer4Time = DateTime.parse(
        DateFormat("yyyy-MM-dd").format(dateTime) + " " + timings.maghrib!);
    DateTime prayer5Time = DateTime.parse(
        DateFormat("yyyy-MM-dd").format(dateTime) + " " + timings.isha!);
    if (dateTime.isAfter(prayer1Time) && dateTime.isBefore(prayer2Time)) {
      if (mounted) {
        setState(() {
          decoration = const BoxDecoration(
            color: Color(0xFFDFB690),
            // gradient: LinearGradient(
            //     begin: Alignment.topCenter,
            //     end: Alignment.bottomCenter,
            //     colors: [Color(0xFFDFB690), Color(0xFFF5E7DF)])
          );
          colorStatus = Colors.black;
          prayerName = "Dhuhr " + timings.dhuhr!;
          counter = prayer2Time.difference(DateTime.now());
        });
      }
    } else if (dateTime.isAfter(prayer2Time) &&
        dateTime.isBefore(prayer3Time)) {
      if (mounted) {
        setState(() {
          decoration = const BoxDecoration(
            color: Color(0xFF90C3DF),
            // gradient: LinearGradient(
            //     begin: Alignment.topCenter,
            //     end: Alignment.bottomCenter,
            //     colors: [Color(0xFF90C3DF), Color(0xFFDFF5E6)])
          );
          prayerName = "Asr " + timings.asr!;
          colorStatus = Colors.black;
          counter = prayer3Time.difference(DateTime.now());
        });
      }
    } else if (dateTime.isAfter(prayer3Time) &&
        dateTime.isBefore(prayer4Time)) {
      if (mounted) {
        setState(() {
          decoration = const BoxDecoration(
            color: Color(0xFF90B9DF),
            // gradient: LinearGradient(
            //     begin: Alignment.topCenter,
            //     end: Alignment.bottomCenter,
            //     colors: [Color(0xFF90B9DF), Color(0xFFF5ECDF)])
          );
          prayerName = "Maghrib " + timings.maghrib!;
          colorStatus = Colors.black;
          counter = prayer4Time.difference(DateTime.now());
        });
      }
    } else if (dateTime.isAfter(prayer4Time) &&
        dateTime.isBefore(prayer5Time)) {
      if (mounted) {
        setState(() {
          decoration = const BoxDecoration(
            color: Color(0xFF322777),
            // gradient: LinearGradient(
            //     begin: Alignment.topCenter,
            //     end: Alignment.bottomCenter,
            //     colors: [Color(0xFF322777), Color(0xFF025682)])
          );
          prayerName = "Isha " + timings.isha!;
          colorStatus = Colors.white;
          counter = prayer5Time.difference(DateTime.now());
        });
      }
    } else if (dateTime.isAfter(prayer5Time) ||
        dateTime.isBefore(prayer1Time)) {
      if (mounted) {
        setState(() {
          decoration = const BoxDecoration(
            color: Color(0xFF081923),
            // gradient: LinearGradient(
            //     begin: Alignment.topCenter,
            //     end: Alignment.bottomCenter,
            //     colors: [Color(0xFF081923), Color(0xFF025682)])
          );
          prayerName = "Fajr " + timings.fajr!;
          colorStatus = Colors.white;
          counter = prayer1Time.difference(DateTime.now());
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _getGeoLocationPosition();
    homeCubit = context.read<HomeCubit>();


  }

  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    getAddressFromLatLong(await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high));
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> getAddressFromLatLong(Position position) async {
    homeCubit?.onlatChanged("${position.latitude}");
    homeCubit?.onlongChanged("${position.longitude}");
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    print(place.subAdministrativeArea);
    getNamaazTiming(DateFormat("dd-MM-yyyy").format(dateTime),
        place.subAdministrativeArea!);
    // checkCurrentDateTime();
  }

  Future<void> getNamaazTiming(String date, String address) async {
    final url = APIEndPoints.BASE_URL +
        APIEndPoints.timing +
        date +
        "?address=" +
        address;
    final response = await http.get(Uri.parse(url));

    print(url);
    print(response.body);
    final Map<String, dynamic> data = json.decode(response.body);

    TimingResponse timingResponse = TimingResponse.fromJson(data);

    print(timingResponse.timingResponseBody!.timings!.asr);
    timings = timingResponse.timingResponseBody!.timings!;
    loading = false;
    Timer.periodic(const Duration(seconds: 1), (timer) {
      checkCurrentDateTime();
    });
    // checkCurrentDateTime();
  }

  Stream<int> _stream() {
    Duration interval = const Duration(minutes: 5);
    Stream<int> stream = Stream<int>.periodic(interval, transform);
    stream = stream.take(59);
    return stream;
  }

  int transform(int value) {
    return value;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        Data? homeRes = state.home;
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(children: [
              Stack(
                children: [
                  // StreamBuilder(
                  //   stream: _stream(),
                  //   builder: (context, AsyncSnapshot<dynamic?> snapshot) {
                  //    print("");
                  //     rootBundle.load('assets/images/Final_Weather_Animation.riv').then(
                  //           (data) {
                  //         final file = RiveFile.import(data);
                  //         final artboard = file.mainArtboard;
                  //         stateMachineController =
                  //             StateMachineController.fromArtboard(artboard, "State Machine 1");
                  //         if (stateMachineController != null) {
                  //           artboard.addController(stateMachineController!);
                  //           trigger = stateMachineController!.findSMI('24');
                  //         }
                  //         _Artboard = artboard;
                  //
                  //         },
                  //     );
                  //     if (DateTime.now().toLocal().hour.toString() == "15") {
                  //       trigger?.fire();
                  //     }
                  //
                  //     return
                  //
                  //   },
                  // ),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                        width: size.width,
                        height: 260,
                        child:
                        state.currentArtBoard == null
                            ?  const SizedBox.shrink()
                            :
                        Rive(
                            artboard: state.currentArtBoard!,
                            fit: BoxFit.fill,
                          )),
                  ),
                  SizedBox(
                      width: size.width,
                      height: 260,
                      // decoration: decoration,
                      // color: colorStatus,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    padding: const EdgeInsets.all(10),
                                    alignment: Alignment.topLeft,
                                    child: Row(children: [
                                      Container(
                                        padding: const EdgeInsets.all(7.5),
                                        decoration: const BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle),
                                        child: const Icon(
                                          Icons.calendar_today_outlined,
                                          color: Colors.blue,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            DateFormat("EEEE, d MMMM")
                                                .format(dateTime),
                                            style: TextStyle(
                                                color: colorStatus,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500),
                                          )
                                        ],
                                      ),
                                    ])),
                                InkWell(
                                  onTap: () {
                                    getItInjector<AppRouter>()
                                        .pushNamed(RouteNames.drawerMenuScreen);
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Icon(
                                      Icons.menu,
                                      color: colorStatus,
                                      size: 30,
                                    ),
                                  ),
                                ),
                              ]),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  "Next Prayer",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  prayerName,
                                  style: TextStyle(
                                      color: colorStatus,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  counter.toString().split('.')[0],
                                  style: TextStyle(
                                      color: colorStatus,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600),
                                ),
                              ]),
                          !loading
                              ? Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 7.5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            timings.fajr!,
                                            style: TextStyle(
                                                color: colorStatus,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          const Text(
                                            "Fajr",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                          height: 20,
                                          child: VerticalDivider(
                                              color: Colors.grey)),
                                      Column(
                                        children: [
                                          Text(
                                            timings.dhuhr!,
                                            style: TextStyle(
                                                color: colorStatus,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          const Text(
                                            "Dhuhr",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                          height: 20,
                                          child: VerticalDivider(
                                              color: Colors.grey)),
                                      Column(
                                        children: [
                                          Text(
                                            timings.asr!,
                                            style: TextStyle(
                                                color: colorStatus,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          const Text(
                                            "Asr",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                          height: 20,
                                          child: VerticalDivider(
                                              color: Colors.grey)),
                                      Column(
                                        children: [
                                          Text(
                                            timings.maghrib!,
                                            style: TextStyle(
                                                color: colorStatus,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          const Text(
                                            "Maghrib",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                          height: 20,
                                          child: VerticalDivider(
                                              color: Colors.grey)),
                                      Column(
                                        children: [
                                          Text(
                                            timings.isha!,
                                            style: TextStyle(
                                                color: colorStatus,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          const Text(
                                            "Isha",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ))
                              : Wrap(),
                        ],
                      )),
                ],
              ),
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Quizzes",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                      Row(
                        children: [
                          Text(
                            "See All",
                            style: TextStyle(
                                color: getColorFromHex(ColorConstants.green),
                                fontSize: 16),
                          ),
                          Icon(
                            Icons.chevron_right,
                            color: getColorFromHex(ColorConstants.green),
                          ),
                        ],
                      )
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: size.width * 0.465,
                      height: size.width * 0.55,
                      padding: const EdgeInsets.only(
                          left: 12, right: 12, bottom: 12, top: 20),
                      decoration: BoxDecoration(
                        color: getColorFromHex(ColorConstants.activeQuizColors),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Image.asset("assets/images/yellow_bulb.png"),
                          ),
                          const SizedBox(
                            height: 45,
                          ),
                          const Text(
                            "Slot 1",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 17,
                                child: Image.asset('assets/images/clock.png'),
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              const Text(
                                '10 am - 01 pm',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            width: size.width * 0.45 - 25,
                            height: 40,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Text(
                              'Active',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w400),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: size.width * 0.465,
                      height: size.width * 0.55,
                      padding: const EdgeInsets.only(
                          left: 12, right: 12, bottom: 12, top: 20),
                      decoration: BoxDecoration(
                        color:
                            getColorFromHex(ColorConstants.inactiveQuizColors),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Image.asset("assets/images/yellow_bulb.png"),
                          ),
                          const SizedBox(
                            height: 45,
                          ),
                          const Text(
                            "Slot 2",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 17,
                                child: Image.asset('assets/images/clock.png'),
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              const Text(
                                '02 pm - 01 pm',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            width: size.width * 0.45 - 25,
                            height: 40,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(63, 235, 235, 245),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Text(
                              'Inactive',
                              style: TextStyle(
                                  color: Colors.white60,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w400),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.topLeft,
                child: const Text(
                  "Pic of the Day",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ),
              homeRes!=null? Container(
                width: MediaQuery.of(context).size.width,
                // height: MediaQuery.of(context).size.height*0.30,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: CachedNetworkImage(
                    placeholder: (context, url) => const SizedBox(
                        width: 3,
                        height: 3,
                        child: Center(child: CircularProgressIndicator())),
                    imageUrl: "${homeRes.perOfTheDay!.image}",
                    fit: BoxFit.fill,
                  ),
                ),
              ):Container(),
              Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.topLeft,
                child: const Text(
                  "Verse of the Day",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: homeRes!=null? ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: CachedNetworkImage(
                    placeholder: (context, url) => const SizedBox(
                        width: 3,
                        height: 3,
                        child: Center(child: CircularProgressIndicator())),
                    imageUrl: "${homeRes.verseOfTheDay!.image}",
                    fit: BoxFit.fill,
                  )
                ):Container(),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.topLeft,
                child: const Text(
                  "Title",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(12.5),
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: getColorFromHex(
                                      ColorConstants.titleBackgroundColors),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Image.asset(
                                    "assets/images/static_quran.png"),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                'Al Quran',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Icon(
                                Icons.chevron_right,
                                color: getColorFromHex(ColorConstants.green),
                              )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(12.5),
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: getColorFromHex(
                                      ColorConstants.titleBackgroundColors),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Image.asset(
                                    "assets/images/static_sukoon.png"),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                'Sukoon',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Icon(
                                Icons.chevron_right,
                                color: getColorFromHex(ColorConstants.green),
                              )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(12.5),
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: getColorFromHex(
                                      ColorConstants.titleBackgroundColors),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Image.asset(
                                    "assets/images/static_sunnat.png"),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                'Sunnat',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Icon(
                                Icons.chevron_right,
                                color: getColorFromHex(ColorConstants.green),
                              )),
                        ],
                      )
                    ],
                  )),
              Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.topLeft,
                child: const Text(
                  "Banners",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ),
              homeRes!=null?Container(
                padding: const EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*0.30,
                child:  ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Swiper(
                    itemBuilder: (BuildContext context,int index){
                      return  Image.network(
                        "${homeRes.slider![index].image}",
                        fit: BoxFit.fill,
                      );
                    },
                    itemCount: homeRes.slider!.length,
                    loop: false,
                    pagination:homeRes.slider!.length==1?null:SwiperPagination(),
                  ),
                ),

              ):Container(
                padding: const EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.asset(
                    'assets/images/static_banner_image.png',
                    width: size.width,
                    height: size.width / 2.25,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ]),
          ),
        );
      },
    );
  }
}

 */
