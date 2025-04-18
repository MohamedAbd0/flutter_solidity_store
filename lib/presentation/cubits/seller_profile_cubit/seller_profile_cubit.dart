import 'package:flutter_solidity_store/export.dart';
import 'package:injectable/injectable.dart';
part 'seller_profile_state.dart';

@injectable
class SellerProfileCubit extends Cubit<SellerProfileState> {
  final StoreUsecases storeUsecases;
  SellerProfileCubit(this.storeUsecases) : super(SellerProfileState());

  Future<void> fetchSellerProducts(String sellerAddress) async {
    emit(state.copyWith(cubitStatus: CubitStatus.loading));

    await Future.delayed(Duration(seconds: 1));

    final result =
        await storeUsecases.fetchSellerProducts(sellerAddress: sellerAddress);
    result.fold((l) {
      emit(
        state.copyWith(
          cubitStatus: CubitStatus.error,
          errorMessage: l.message,
        ),
      );
    }, (r) {
      emit(state.copyWith(
        cubitStatus: CubitStatus.done,
        products: r,
      ));
    });
  }
}
