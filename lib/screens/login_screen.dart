import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:listamobx/stores/login_store.dart';
import 'package:listamobx/widgets/custom_icon_button.dart';
import 'package:listamobx/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

import 'list_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginStore loginStore = LoginStore();

  @override
  Widget build(BuildContext context) {
    loginStore = Provider.of<LoginStore>(context);

    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(32),
          child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 16,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Observer(
                      builder: (_) {
                        return CustomTextField(
                          hint: 'E-mail',
                          prefix: Icon(Icons.account_circle),
                          textInputType: TextInputType.emailAddress,
                          onChanged: loginStore.setEmail,
                          enabled: !loginStore.loading,
                        );
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Observer(
                      builder: (_) {
                        return CustomTextField(
                          hint: 'Senha',
                          prefix: Icon(Icons.lock),
                          obscure: !loginStore.passwordVisible,
                          onChanged: loginStore.setPassword,
                          enabled: !loginStore.loading,
                          suffix: CustomIconButton(
                            radius: 32,
                            iconData: loginStore.passwordVisible
                                ? Icons.visibility_off_outlined
                                : Icons.visibility,
                            onTap: loginStore.togglePasswordVisibility,
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Observer(builder: (_) {
                      return SizedBox(
                        height: 44,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32),
                            ),
                            backgroundColor: Theme.of(context).primaryColor,
                            disabledBackgroundColor:
                                Theme.of(context).primaryColor.withAlpha(100),
                          ),
                          child: loginStore.loading
                              ? CircularProgressIndicator()
                              : Text(
                                  style: TextStyle(color: Colors.white),
                                  'Login'),
                          onPressed: loginStore.isFormValid
                              ? () {
                                  loginStore.login();
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => ListScreen()),
                                  );
                                }
                              : null,
                        ),
                      );
                    })
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
