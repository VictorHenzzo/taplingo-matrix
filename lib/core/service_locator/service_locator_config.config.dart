// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../ports/input/fetch_lyrics_input_port.dart' as _i12;
import '../ports/input/fetch_onboarding_input_port.dart' as _i13;
import '../ports/input/fetch_song_list_input_port.dart' as _i14;
import '../ports/output/fetch_lyrics_output_port.dart' as _i6;
import '../ports/output/fetch_onboarding_output_port.dart' as _i8;
import '../ports/output/fetch_song_list_output_port.dart' as _i10;
import '../repository/lyrics_repository.dart' as _i3;
import '../repository/onboarding_repository.dart' as _i4;
import '../repository/song_list_repository.dart' as _i5;
import '../usecase/fetch_lyrics_use_case.dart' as _i7;
import '../usecase/fetch_onboarding_use_case.dart' as _i9;
import '../usecase/fetch_song_list_use_case.dart' as _i11;
import 'modules/lyrics_core_module.dart' as _i15;
import 'modules/onboarding_core_module.dart' as _i16;
import 'modules/song_list_core_module.dart'
    as _i17; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final lyricsCoreModule = _$LyricsCoreModule();
  final onboardingCoreModule = _$OnboardingCoreModule();
  final songListCoreModule = _$SongListCoreModule();
  gh.singleton<_i3.LyricsRepository>(_i3.LyricsRepository());
  gh.singleton<_i4.OnboardingRepository>(_i4.OnboardingRepository());
  gh.singleton<_i5.SongListRepository>(_i5.SongListRepository());
  gh.singleton<_i6.FetchLyricsOutputPort>(
      lyricsCoreModule.fetchLyricOutputPort(get<_i3.LyricsRepository>()));
  gh.singleton<_i7.FetchLyricsUseCase>(
      _i7.FetchLyricsUseCase(get<_i6.FetchLyricsOutputPort>()));
  gh.singleton<_i8.FetchOnboardingOutputPort>(onboardingCoreModule
      .fetchOnboardingOutputPort(get<_i4.OnboardingRepository>()));
  gh.singleton<_i9.FetchOnboardingUseCase>(
      _i9.FetchOnboardingUseCase(get<_i8.FetchOnboardingOutputPort>()));
  gh.singleton<_i10.FetchSongListOutputPort>(songListCoreModule
      .fetchSongListOutputPort(get<_i5.SongListRepository>()));
  gh.singleton<_i11.FetchSongListUseCase>(
      _i11.FetchSongListUseCase(get<_i10.FetchSongListOutputPort>()));
  gh.singleton<_i12.FetchLyricsInputPort>(
      lyricsCoreModule.fetchLyricInputPort(get<_i7.FetchLyricsUseCase>()));
  gh.singleton<_i13.FetchOnboardingInputPort>(onboardingCoreModule
      .fetchOnboardingInputPort(get<_i9.FetchOnboardingUseCase>()));
  gh.singleton<_i14.FetchSongListInputPort>(songListCoreModule
      .fetchSongListInputPort(get<_i11.FetchSongListUseCase>()));
  return get;
}

class _$LyricsCoreModule extends _i15.LyricsCoreModule {}

class _$OnboardingCoreModule extends _i16.OnboardingCoreModule {}

class _$SongListCoreModule extends _i17.SongListCoreModule {}
