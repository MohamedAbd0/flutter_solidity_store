import 'dart:io';

import 'package:dartz/dartz.dart';
import '../../../export.dart';

abstract class StoreSmartContractRepo {
  Future<Either<Failure, StoreInfo>> fetchStoreInfo();
}
