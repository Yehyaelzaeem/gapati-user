import 'package:delivego/core/helpers/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../../../core/helpers/toast_states/enums.dart';
import '../../../../../../data/model/base/response_model.dart';
import '../../../../../../data/model/response/address_model.dart';
import '../../../../../../data/model/response/last_address_model.dart';
import '../../../../../../data/model/response/main_address_model.dart';
import '../../../../../../domain/request_body/address_body.dart';
import '../../../../../../domain/usecase/address/add_address_usecase.dart';
import '../../../../../../domain/usecase/address/address_usecase.dart';
import '../../../../../../domain/usecase/address/delete_address_usecase.dart';
import '../../../../../../domain/usecase/address/update_address_usecase.dart';
import '../../../../../component/google_map/address_location_model.dart';
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
  int typeAddress=0;
  AddressModelData? orderAddress;
  TextEditingController addressController =TextEditingController();
  TextEditingController phoneController =TextEditingController();
  TextEditingController locationController =TextEditingController();
  TextEditingController noteController =TextEditingController();

  static AddressCubit get(BuildContext context) => BlocProvider.of(context);

  Future<ResponseModel> getAllAddress() async {
    addressModel=null;
    emit(GetAllAddressLoadingState()) ;
    ResponseModel responseModel = await _addressUseCase.call();
    if (responseModel.isSuccess) {
      addressModel =responseModel.data;
     orderAddress=
      addressModel!=null && addressModel!.data!.isNotEmpty?
      addressModel!.data![0]:null;
      emit(GetAllAddressSuccessState()) ;
    }else{
      emit(GetAllAddressErrorState()) ;
    }
    return responseModel;
  }
  Future<ResponseModel> addAddress({required AddressBody addressBody,required BuildContext context,bool? pop}) async {
    emit(AddressLoadingState()) ;
    ResponseModel responseModel = await _addAddressUseCase.call(addressBody: addressBody);
    if (responseModel.isSuccess) {
      getAllAddress();
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
    return responseModel;
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
  Position? p ;
  AddressLocationModel? addressLocationModel;
  Future<LatLng> getLocation(context)async{
  final position=await Geolocator.getCurrentPosition().then((Position value)async {
      lat=value.latitude;
      long=value.longitude;
      emit(GetPositionState());
      return value;
    });
  p=position;

   return  await LatLng(position.latitude, position.longitude);
  }
}