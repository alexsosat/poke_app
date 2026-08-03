import "package:flutter/material.dart";
import "package:flutter_common_classes/errors/connection/http_call_exception.dart";
import "package:flutter_common_classes/errors/failure.dart";
import "package:flutter_common_classes/extensions/theme_extension.dart";
import "package:lottie/lottie.dart";

/// Widget that shows a [Failure] in a page.
///
/// Shows the user that an error occurred and allows them to retry the action.
class PokemonFailureView extends StatelessWidget {
  /// Widget that shows a [Failure] in a page.
  ///
  /// Shows the user that an error occurred and allows them to retry the action.
  const PokemonFailureView(
    this.failure, {
    super.key,
    this.onRetry,
    this.height,
  });

  /// The [Failure] to show in the page,
  final Failure failure;

  /// Size of the animation
  final double? height;

  /// The [Function] to call when the user wants to retry the action.
  @Deprecated("Please use the retry action from the PageLoaderWidget")
  final void Function()? onRetry;

  @override
  Widget build(BuildContext context) => Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 25),
          child: _FailureAnimation(
            failure: failure,
            height: height ?? MediaQuery.of(context).size.height * 0.5,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 15, left: 25, right: 25),
              child: Text(
                failure.title,
                textAlign: TextAlign.center,
                style: context.textTheme.titleLarge?.copyWith(
                  color: context.colorScheme.primary,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 15,
              ),
              child: Text(
                failure.message,
                textAlign: TextAlign.center,
                style: context.textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

class _FailureAnimation extends StatelessWidget {
  const _FailureAnimation({required this.failure, required this.height});

  final double height;

  /// The [Failure] to show in the animation.
  final Failure failure;

  @override
  Widget build(BuildContext context) =>
      Lottie.asset(height: height, switch (failure) {
        AppFailure _ => "assets/animations/failure/app_error.json",
        HttpCallFailure serverErrorFailure => _httpAnimation(
          serverErrorFailure.type,
        ),
        _ => "assets/animations/failure/unexpected.json",
      }, package: "flutter_common_classes");

  String _httpAnimation(HttpExceptions type) {
    switch (type) {
      case HttpExceptions.connectionError:
      case HttpExceptions.clientOffline:
        return "assets/animations/failure/no_internet.json";
      case HttpExceptions.serverDown:
      case HttpExceptions.serverError:
        return "assets/animations/failure/server_error.json";
      case HttpExceptions.unauthorized:
      case HttpExceptions.expiredToken:
        return "assets/animations/failure/unauthorized.json";
      case HttpExceptions.clientError:
      case HttpExceptions.badRequest:
        return "assets/animations/failure/bad_request.json";
      case HttpExceptions.cancelRequest:
        return "assets/animations/failure/canceled.json";
      case HttpExceptions.badCertificate:
      case HttpExceptions.notFound:
        return "assets/animations/failure/bad_certificate.json";
      case HttpExceptions.other:
        return "assets/animations/failure/unexpected.json";
    }
  }
}
