import 'package:bloc/bloc.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:yuki/core/dio_helper/dio_helper.dart';
import 'package:yuki/core/models/cities_response.dart';

import '../../../../../core/models/countries_response.dart';
import 'entry_address_state.dart';

class EntryAddressCubit extends Cubit<EntryAddressState> {
  EntryAddressCubit() : super(EntryAddressStateInit()) {
    fetchCountries();
    fetchCities();
  }

  bool isSelected = true;

  selectContainer() {
    isSelected = !isSelected;
    emit(SelectContainer());
  }

  int activeIndex = 0;

  updateActiveIndex(int index) {
    activeIndex = index;
    emit(ClickOnCategoryContainer());
  }

  CountriesResponse? countriesResponse;

  List<String> countryNames = [];

  fetchCountries() async {
    emit(CountriesLoaingState());
    final response = await DioHelper.get("countries");
    final data = response!.data as Map<String, dynamic>;
    print("dddddx $data");
    if (data['status'] == true) {
      countriesResponse = CountriesResponse.fromJson(data);
      print("cccccc ${countries?[0].name}");
      emit(CountrySuccessState());
    } else {
      emit(CountryErrorState());
    }
  }

  String? selectedCountryItem;
  String? selectedCityItem;

  updateCountry(String value) {
    selectedCountryItem = value;
    emit(UpdateCountry());
  }

  updateCity(String value) {
    selectedCityItem = value;
    emit(UpdateCity());
  }

  updateEachCountryCities(int? id) {
    countryId = id;
    fetchCountries();
    emit(UpdateEachCountryCities());
  }

  CitiesResponse? citiesResponse;

  int? countryId;

  fetchCities() async {
    emit(CitiesLoaingState());
    final response = await DioHelper.get("cities?country_id=$countryId");
    final data = response!.data as Map<String, dynamic>;
    print("dddddx $data");

    if (data['status'] == true) {
      citiesResponse = CitiesResponse.fromJson(data);

      print("ccccccccI $countryId");
      emit(CitiesSuccessState());
    } else {
      emit(CitiesErrorState());
    }
  }
}
