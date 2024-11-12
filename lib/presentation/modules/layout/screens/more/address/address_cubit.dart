import 'package:delivego/core/helpers/extensions.dart';
import 'package:delivego/presentation/modules/layout/screens/home/home_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../../../core/helpers/toast_states/enums.dart';
import '../../../../../../data/datasource/local/storage_keys.dart';
import '../../../../../../data/model/base/response_model.dart';
import '../../../../../../data/model/response/address_model.dart';
import '../../../../../../data/model/response/last_address_model.dart';
import '../../../../../../data/model/response/main_address_model.dart';
import '../../../../../../domain/provider/local_auth_provider_cubit.dart';
import '../../../../../../domain/request_body/address_body.dart';
import '../../../../../../domain/usecase/address/add_address_usecase.dart';
import '../../../../../../domain/usecase/address/address_usecase.dart';
import '../../../../../../domain/usecase/address/delete_address_usecase.dart';
import '../../../../../../domain/usecase/address/update_address_usecase.dart';
import '../../../../../component/google_map/address_location_model.dart';
import '../../cart/cart_cubit.dart';
part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  final AddressUseCase _addressUseCase;
  final AddAddressUseCase _addAddressUseCase;
  final DeleteAddressUseCase _deleteAddressUseCase;
  final UpdateAddressUseCase _updateAddressUseCase;
  AddressCubit({required UpdateAddressUseCase updateAddressUseCase,required DeleteAddressUseCase deleteAddressUseCase,required AddAddressUseCase addAddressUseCase,required AddressUseCase addressUseCase}):
        _updateAddressUseCase=updateAddressUseCase,
        _deleteAddressUseCase=deleteAddressUseCase,
        _addAddressUseCase=addAddressUseCase,
       _addressUseCase =addressUseCase, super(AddressInitial());


  MainAddressModelData? mainAddressModel;
  AddressModel? addressModel;
  AddressModelData? selectedAddress;
  String? selectedAddressValue;
  changeSelectedAddress(AddressModelData addressModel,context){
    selectedAddress=addressModel;
    selectedAddressValue = addressModel.id?.toString();
    emit(ChangeSelectedAddressState());
    LocalAuthCubit.saveDefaultAddress(addressModel);
    getAddressPosition(LatLng(double.parse(addressModel.lat??'0.0'), double.parse(addressModel.lat??'0.0')));
    HomeCubit cubit =HomeCubit.get(context);
    if(selectedAddressValue=='0'){
      cubit.getStoreTypes(latLng);

    }else{
      cubit.getStoreTypes(LatLng(double.parse(addressModel.lat??'0.0'), double.parse(addressModel.lng??'0.0')));

    }
    BlocProvider.of<CartCubit>(context, listen: false).removeAll();
  }

  int typeAddress=0;
  AddressModelData? orderAddress;
  TextEditingController addressController =TextEditingController();
  TextEditingController phoneController =TextEditingController();
  TextEditingController locationController =TextEditingController();
  TextEditingController noteController =TextEditingController();

  static AddressCubit get(BuildContext context) => BlocProvider.of(context);

  Future<ResponseModel> getAllAddress({int? defaultAddressId}) async {
    addressModel=null;
    emit(GetAllAddressLoadingState()) ;
    ResponseModel responseModel = await _addressUseCase.call();
    if (responseModel.isSuccess) {
      addressModel =responseModel.data;

      orderAddress= addressModel!=null && addressModel!.data!.isNotEmpty?
      addressModel!.data![0]:null;
      selectedAddress= LocalAuthCubit.getDefaultAddress();

      if(defaultAddressId!=null){
        selectedAddress= addressModel!.data!.firstWhere((element) => element.id==defaultAddressId);
        LocalAuthCubit.saveDefaultAddress(selectedAddress??addressModel!.data![0]);
      }
      selectedAddressValue=selectedAddress?.id?.toString();

      emit(GetAllAddressSuccessState()) ;
    }
    else{
      emit(GetAllAddressErrorState()) ;
    }
    return responseModel;
  }

  Future<dynamic> addAddress({required AddressBody addressBody,required BuildContext context,bool? pop}) async {
  try{
    emit(AddressLoadingState()) ;
    ResponseModel responseModel = await _addAddressUseCase.call(addressBody: addressBody);
    if (responseModel.isSuccess) {
      getAllAddress(defaultAddressId: responseModel.data);
      Future.delayed(const Duration(microseconds: 0)).then((value) {
        showToast(text: responseModel.message.toString(), state: ToastStates.success, context: context);
        initRemoveData();
        pop==true?
        context.pop():null;
      });
      emit(AddAddressSuccessState()) ;
    }else{
      emit(AddAddressErrorState()) ;
    }
  }catch(e){
    emit(AddAddressErrorState()) ;
  }
  }
  Future<ResponseModel> updateAddress({required AddressBody addressBody,required BuildContext context,required addressId}) async {
    emit(UpdateAddressLoadingState()) ;
    ResponseModel responseModel = await _updateAddressUseCase.call(addressBody: addressBody, addressId: addressId);
    if (responseModel.isSuccess) {
      getAllAddress();
      Future.delayed(const Duration(microseconds: 0)).then((value) {
        showToast(text: responseModel.message.toString(), state: ToastStates.success, context: context);
      });
      emit(UpdateAddressSuccessState()) ;
    }else{
      emit(UpdateAddressErrorState()) ;
    }
    return responseModel;
  }
  Future<ResponseModel> deleteAddress({required int addressId}) async {
    emit(DeleteAddressLoadingState()) ;
    ResponseModel responseModel = await _deleteAddressUseCase.call(addressId: addressId);
    if (responseModel.isSuccess) {
      getAllAddress();
      emit(DeleteAddressSuccessState()) ;
    }else{
      emit(DeleteAddressErrorState()) ;
    }
    return responseModel;
  }

  void initData(AddressModelData addressModelData){
    addressController=TextEditingController(text:addressModelData.address??'');
    phoneController=TextEditingController(text:addressModelData.phone??'');
    locationController=TextEditingController(text:'${addressModelData.lat}/${addressModelData.lng}'??'');
    emit(ChangeTypeState()) ;
  }
  void initRemoveData(){
    phoneController.text='';
    addressController.text='';
    locationController.text='';
    noteController.text='';
    emit(ChangeTypeState()) ;
  }
  void changeTypeOfAddress(int x){
    typeAddress =x;
    emit(ChangeTypeState()) ;
  }

  dynamic lat;
  dynamic long;
  LatLng? latLng;
  Position? p ;
  AddressLocationModel? addressLocationModel;
  Future<LatLng> getLocation(context)async{
   try{
     final position=await Geolocator.getCurrentPosition().then((Position value)async {
       lat=value.latitude;
       long=value.longitude;
       latLng=LatLng(value.latitude, value.longitude);
       selectedAddress= LocalAuthCubit.getDefaultAddress();
       selectedAddressValue=selectedAddress?.id?.toString()??'-1';
       emit(GetPositionState());
       return value;
     });
     p=position;
     if(selectedAddressValue !='-1' ){
       if(selectedAddressValue!='0'){
         getAddressPosition(LatLng(double.parse(selectedAddress?.lat??'0.0'), double.parse(selectedAddress?.lng??'0.0')));
         return  await LatLng(double.parse(selectedAddress?.lat??'0.0'), double.parse(selectedAddress?.lng??'0.0'));
       }
       else{
         getAddressPosition(LatLng(position.latitude, position.longitude));
         return  await LatLng(position.latitude, position.longitude);
       }
     }else{
       getAddressPosition(LatLng(position.latitude, position.longitude));
       return  await LatLng(position.latitude, position.longitude);
     }
   }catch(e){
     return LatLng(0, 0);
   }
  }
  AddressLocationModel? addressTitleModel;
  String? addressTitle;

  getAddressPosition(LatLng position)async{
    List<Placemark> p = await placemarkFromCoordinates(position.latitude, position.longitude);

    addressTitleModel = AddressLocationModel(
      lat: position.latitude.toString(),
      long: position.longitude.toString(),
      country: p[0].country.toString(),
      bigCity: p[0].administrativeArea.toString(),
      city: p[0].subAdministrativeArea.toString(),
      street: p[0].street.toString(),
      locality: p[0].locality.toString(),
    );
    addressTitle= '${addressTitleModel?.country??''} ${addressTitleModel?.city??''}  ${addressTitleModel?.locality??''} ${addressTitleModel?.street??''}';
    print('addressTitle $addressTitle');
    emit(GetPositionState());
  }
}