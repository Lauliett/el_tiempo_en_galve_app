import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../providers/providers.dart';
import '../../widgets/widgets.dart';

class LoginScreen extends ConsumerWidget {
  static const name = 'login_screen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //Esto me da acceso al state
    final loginForm = ref.watch(loginFormProvider);

    final theme = Theme.of(context);
    final Size screenSize = MediaQuery.of(context).size;

    return BackgroundGradient(
      widget: Scaffold(
        appBar: AppBar(
          title: const Text("El tiempo en Galve"),
          backgroundColor: Colors.transparent,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30),
                    SizedBox(
                      height: 200,
                      child: Image.asset(
                        'assets/images/logo/white_logo_app.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      "Login",
                      style: theme.textTheme.displayMedium,
                    ),
                    const SizedBox(height: 30),
                    //ref.read(loginFormProvider.notifier).onEmailChange,
                    //loginForm.email.errorMessage,
                    CustomInputText(
                      textLabel: "Email",
                      keyboardType: TextInputType.emailAddress,
                      errorMessage: loginForm.email.errorMessage,
                      onChanged: ref.read(loginFormProvider.notifier).onEmailChange,
                    ),
                    const SizedBox(height: 10),
                    InputPassword(
                      textLabel: "Contraseña",
                      errorMessage: loginForm.password.errorMessage,
                      onChanged: ref.read(loginFormProvider.notifier).onPasswordChanged,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "¿No tienes una cuenta?",
                          style: theme.textTheme.bodyMedium,
                        ),
                        TextButton(
                          onPressed: () {
                            context.replace('/register');
                          },
                          child: const Text(
                            "Regístrate",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                    FilledButton(
                      child: const Text(
                        'Ingresar',
                        style: TextStyle(fontSize: 25),
                      ),
                      onPressed: () {
                        ref.read(loginFormProvider.notifier).onFormSubmit();  
                      },
                    ),
                    const SizedBox(height: 20),
                    LineFigure(size: screenSize)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

