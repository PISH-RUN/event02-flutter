import 'package:http/http.dart';
import 'package:kid_need_pishrun_event_02/application/get_server_error_message.dart';
import 'package:kid_need_pishrun_event_02/application/texts.dart';
import '../../failures.dart';

const int AUTHENTICATION_IS_WRONG_STATUS_CODE = 401;

class ServerFailure extends Failure {
  final int statusCode;

  ServerFailure(Response response)
      : statusCode = response.statusCode,
        super(getServerErrorMessage(response), failureType: FailureType.serverError);

  const ServerFailure.noInternet()
      : statusCode = -1,
        super(Texts.noNet, failureType: FailureType.noInternet);

  const ServerFailure.notLoggedInYet()
      : statusCode = AUTHENTICATION_IS_WRONG_STATUS_CODE,
        super(Texts.pleaseSignInFirst, failureType: FailureType.authentication);

  const ServerFailure.somethingWentWrong()
      : statusCode = -2,
        super(Texts.someThingWentWrongInServer, failureType: FailureType.somethingWentWrong);
}
