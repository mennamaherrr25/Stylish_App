// import 'package:dio/dio.dart';
import 'package:dio/dio.dart';
import 'package:stylish_app/core/errors/failure.dart';

class ServerException implements Exception {
  final ErrorModel errorModel;

  ServerException({required this.errorModel});

  factory ServerException.handleDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw ServerException(
          errorModel: ErrorModel.fromJson(e.response!.data),
        );

      case DioExceptionType.connectionError:
        throw ServerException(
          errorModel: ErrorModel.fromJson(e.response!.data),
        );

      case DioExceptionType.cancel:
        throw ServerException(
          errorModel: ErrorModel.fromJson(e.response!.data),
        );

      case DioExceptionType.badCertificate:
        throw ServerException(
          errorModel: ErrorModel.fromJson(e.response!.data),
        );

      case DioExceptionType.unknown:
        throw ServerException(
          errorModel: ErrorModel.fromJson(e.response!.data),
        );

      case DioExceptionType.badResponse:
        switch (e.response!.statusCode) {
          case 400:
            throw ServerException(
              errorModel: ErrorModel(
                error: 'Invalid request. Please check your input.',
                status: 400,
              ),
            );
          case 401:
            throw ServerException(
              errorModel: ErrorModel(
                error: 'Session expired. Please log in again.',
                status: 401,
              ),
            );
          case 403:
            throw ServerException(
              errorModel: ErrorModel(
                error: 'You don\'t have permission to do this.',
                status: 403,
              ),
            );
          case 404:
            throw ServerException(
              errorModel: ErrorModel(
                error: 'The requested data was not found.',
                status: 404,
              ),
            );
          case 409:
            throw ServerException(
              errorModel: ErrorModel(
                error: 'This account already exists. Please log in.',
                status: 409,
              ),
            );
          case 500:
            throw ServerException(
              errorModel: ErrorModel(
                error: 'Server error. Please try again later.',
                status: 500,
              ),
            );
          default:
            throw ServerException(
              errorModel: ErrorModel(
                error: e.response?.data['message'] ?? 'Something went wrong.',
                status: e.response?.statusCode ?? 0,
              ),
            );
        }
    }
  }
}
//    import 'package:dio/dio.dart';
// import 'package:stylish_app/core/errors/failure.dart';

// class ServerException implements Exception {
//   final ErrorModel errorModel;

//   ServerException({required this.errorModel});

//   factory ServerException.handleDioError(DioException e) {
//     switch (e.type) {
//       case DioExceptionType.connectionTimeout:
//       case DioExceptionType.sendTimeout:
//       case DioExceptionType.receiveTimeout:
//         return ServerException(
//           errorModel: ErrorModel(
//             error: 'Connection timed out. Please try again.',
//           ),
//         );

//       case DioExceptionType.connectionError:
//         return ServerException(
//           errorModel: ErrorModel(
//             error: 'No internet connection. Please check your Wi-Fi or data.',
//           ),
//         );

//       case DioExceptionType.cancel:
//         return ServerException(
//           errorModel: ErrorModel(error: 'Request was cancelled.'),
//         );

//       case DioExceptionType.badCertificate:
//         return ServerException(
//           errorModel: ErrorModel(
//             error: 'Secure connection failed. Please try again.',
//           ),
//         );

//       case DioExceptionType.unknown:
//         return ServerException(
//           errorModel: ErrorModel(
//             error: 'Something went wrong. Please try again.',
//           ),
//         );

//       case DioExceptionType.badResponse:
//         switch (e.response!.statusCode) {
//           case 400:
//             return ServerException(
//               errorModel: ErrorModel(
//                 error: 'Invalid request. Please check your input.',
//                 status: 400,
//               ),
//             );
//           case 401:
//             return ServerException(
//               errorModel: ErrorModel(
//                 error: 'Session expired. Please log in again.',
//                 status: 401,
//               ),
//             );
//           case 403:
//             return ServerException(
//               errorModel: ErrorModel(
//                 error: 'You don\'t have permission to do this.',
//                 status: 403,
//               ),
//             );
//           case 404:
//             return ServerException(
//               errorModel: ErrorModel(
//                 error: 'The requested data was not found.',
//                 status: 404,
//               ),
//             );
//           case 409:
//             return ServerException(
//               errorModel: ErrorModel(
//                 error: 'This account already exists. Please log in.',
//                 status: 409,
//               ),
//             );
//           case 500:
//             return ServerException(
//               errorModel: ErrorModel(
//                 error: 'Server error. Please try again later.',
//                 status: 500,
//               ),
//             );
//           default:
//             return ServerException(
//               errorModel: ErrorModel(
//                 error: e.response?.data['message'] ?? 'Something went wrong.',
//                 status: e.response?.statusCode ?? 0,
//               ),
//             );
//         }
//     }
//   }
// }

/////////////////////////////////////////////
// import 'package:dio/dio.dart';
// import 'package:stylish_app/core/errors/failure.dart';

// class ServerException implements Exception {
//   final ErrorModel errorModel;

//   ServerException({required this.errorModel});

//   factory ServerException.handleDioError(DioException e) {
//     switch (e.type) {
//       // الموبايل بعت request بس الـ server مردش في الوقت المحدد
//       case DioExceptionType.connectionTimeout:
//         return ServerException(
//           errorModel: e.response!.data,
//           // errorMessage: 'Connection timed out. Please try again.',
//         );

//       // الموبايل اتأخر في إرسال الـ request للـ server
//       case DioExceptionType.sendTimeout:
//         return ServerException(
//           errorModel: e.response!.data,
//           // errorMessage: 'Slow internet. Please check your connection.',
//         );

//       // الـ server استلم الـ request بس اتأخر في الرد
//       case DioExceptionType.receiveTimeout:
//         return ServerException(
//           errorModel: e.response!.data,
//           // errorMessage: 'Server is not responding. Try again later.',
//         );

//       // مفيش انترنت خالص
//       case DioExceptionType.connectionError:
//         return ServerException(
//           errorModel: e.response!.data,
//           // errorMessage:
//           //     'No internet connection. Please check your Wi-Fi or data.',
//         );

//       // اليوزر أو الكود أوقف الـ request قبل ما يكمل
//       case DioExceptionType.cancel:
//         return ServerException(
//           errorModel: e.response!.data,
//           // errorMessage: 'Request was cancelled.'
//         );

//       // شهادة الـ SSL مش صح أو منتهية
//       case DioExceptionType.badCertificate:
//         return ServerException(
//           errorModel: e.response!.data,
//           // errorMessage: 'Secure connection failed. Please try again.',
//         );

//       // أي error تاني مش متعرف عليه
//       case DioExceptionType.unknown:
//         return ServerException(
//           errorModel: e.response!.data,
//           // errorMessage: 'Something went wrong. Please try again.',
//         );

//       // الـ server رد بـ error code (400, 401, 404...)
//       case DioExceptionType.badResponse:
//         switch (e.response!.statusCode) {
//           case 400:
//             return 'Invalid request. Please check your input.';

//           case 401:
//             return 'Session expired. Please log in again.';

//           case 403:
//             return 'You don\'t have permission to do this.';

//           case 404:
//             return 'The requested data was not found.';

//           case 409:
//             return 'This account already exists. Please log in.';

//           case 500:
//             return 'Server error. Please try again later.';

//           default:
//             return 'Something went wrong. Please try again.';
//         }
//     }
//   }
// }

// //   static String _handleStatusCode(int? statusCode, dynamic data) {
// //     if (data is Map<String, dynamic>) {
// //       // ✅ ياخد error
// //       if (data['error'] != null) {
// //         return data['error'].toString();
// //       }
// //     }

// //     switch (statusCode) {
// //       case 400:
// //         return 'Invalid request. Please check your input.';

// //       case 401:
// //         return 'Session expired. Please log in again.';

// //       case 403:
// //         return 'You don\'t have permission to do this.';

// //       case 404:
// //         return 'The requested data was not found.';

// //       case 409:
// //         return 'This account already exists. Please log in.';

// //       case 500:
// //         return 'Server error. Please try again later.';

// //       default:
// //         return 'Something went wrong. Please try again.';
// //     }
// //   }
// // }
