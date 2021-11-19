import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_utils/src/extensions/duration_extensions.dart';
import 'package:get/get_utils/src/extensions/num_extensions.dart';
import 'package:the_movies/infra/mixin/loader_mixin.dart';
import 'package:the_movies/infra/mixin/message_mixin.dart';
import 'package:the_movies/infra/services/auth/auth_services.dart';

class LoginController extends GetxController with LoaderMixin, MessageMixin {
  final loading = false.obs;
  final message = Rxn<MessageModel>();
  final AuthServices _authService;

  LoginController({required AuthServices authService})
      : _authService = authService;

  @override
  void onInit() {
    super.onInit();
    loadrListener(loading);
    messageListener(message);
  }

  Future<void> auth() async {
    try {
      loading.value = true;
      await _authService.auth();
      await 2.seconds.delay();
      loading.value = false;

      message(MessageModel.info('Sucess', 'Auth done'));
    } on Exception catch (e) {
       loading.value = false;

      message(MessageModel.error('Login Error ', e.toString()));
    }
  }
}
