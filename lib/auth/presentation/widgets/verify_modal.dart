import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marshmallow/auth/presentation/widgets/widgets.dart';
import 'package:marshmallow/auth/shared/provider.dart';
import 'package:marshmallow/core/presentation/widgets/widgets.dart';
import 'package:marshmallow/theme/theme.dart';
import 'package:marshmallow/utils/extensions.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:material_symbols_icons/symbols.dart';

//? Bottom Modal for verifying phone number or email address.
class VerifyPhoneOrEmailModal extends StatelessWidget {
  const VerifyPhoneOrEmailModal({super.key, required this.isPhone});
  final bool isPhone;

  @override
  Widget build(BuildContext context) {
    return DismissibleKeyboard(
      child: Container(
        height: MediaQuery.of(context).size.height - 80,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        width: double.infinity,
        child: VerifyPhoneEmailBody(
          isPhone: isPhone,
          isSignIn: true,
        ),
      ),
    );
  }
}

class VerifyPhoneEmailBody extends ConsumerStatefulWidget {
  const VerifyPhoneEmailBody({
    super.key,
    required this.isPhone,
    required this.isSignIn,
  });
  final bool isPhone;
  final bool isSignIn;

  @override
  ConsumerState<VerifyPhoneEmailBody> createState() =>
      _VerifyPhoneEmailBodyState();
}

class _VerifyPhoneEmailBodyState extends ConsumerState<VerifyPhoneEmailBody>
    with WidgetsBindingObserver {
  String phoneNumberOrEmail = '';
  String phoneCountryCode = '';
  String? sentPhoneNumberOrEmail;
  List<String?> verificationCode = List.generate(6, (index) => null);
  bool? isVerificationCodeCorrect;
  bool areTermsOfUseAccepted = true;
  final phoneFormatter = MaskTextInputFormatter(mask: '###-###-####');
  Timer? _timer;
  int _countDownTimer = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    _timer?.cancel();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      ref.read(authNotifierProvider.notifier).retrieveAuthDynamicLink(
            fromColdState: false,
            shouldSignIn: widget.isSignIn,
          );
    }
  }

  void startTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }
    _countDownTimer = 60;
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        if (_countDownTimer == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _countDownTimer--;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(authNotifierProvider, (_, state) {
      state.maybeWhen(
        orElse: () {},
        failure: (failure) {
          showCupertinoDialog(
            context: context,
            builder: (context) => CupertinoAlertDialog(
              title: const Text('Error'),
              content: Text(failure.message.toString()),
              actions: <CupertinoDialogAction>[
                CupertinoDialogAction(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Okay',
                    style: TextStyle(
                      color: AppColors.blue,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    });
    final authProvider = ref.read(authNotifierProvider.notifier);
    return Column(
      children: [
        const SizedBox(height: 38),
        RichText(
          text: TextSpan(
            text: "What's your ",
            style: TextStyle(
              color: AppColors.textColor.withOpacity(0.7),
              fontFamily: 'Lexend',
              fontSize: 15,
            ),
            children: [
              TextSpan(
                text: widget.isPhone ? 'phone number' : 'E-mail Address',
                style: const TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Lexend',
                  fontSize: 15,
                ),
              ),
              TextSpan(
                text: '?',
                style: TextStyle(
                  color: AppColors.textColor.withOpacity(0.7),
                  fontFamily: 'Lexend',
                  fontSize: 15,
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 42),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 33),
          child: Row(
            children: [
              if (widget.isPhone)
                SizedBox(
                  width: 52,
                  height: 33,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    maxLength: 3,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    cursorColor: AppColors.textColor,
                    decoration: const InputDecoration(
                      counterText: '',
                      prefixText: '+',
                      contentPadding: EdgeInsets.only(bottom: 5),
                    ),
                    onChanged: (val) {
                      setState(() {
                        phoneCountryCode = val;
                      });
                    },
                  ),
                ),
              if (widget.isPhone) const SizedBox(width: 14),
              SizedBox(
                width: MediaQuery.of(context).size.width -
                    (widget.isPhone ? 132 : 66),
                height: 33,
                child: Center(
                  child: TextField(
                    textAlign: TextAlign.center,
                    keyboardType: widget.isPhone
                        ? TextInputType.number
                        : TextInputType.emailAddress,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: AppColors.textColor,
                      fontSize: 15,
                    ),
                    cursorColor: AppColors.textColor,
                    maxLength: widget.isPhone ? 12 : null,
                    decoration: const InputDecoration(
                      counterText: '',
                      contentPadding: EdgeInsets.only(bottom: 5),
                    ),
                    inputFormatters: widget.isPhone ? [phoneFormatter] : [],
                    onChanged: (val) {
                      setState(() {
                        phoneNumberOrEmail = val;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 33),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                // width: MediaQuery.of(context).size.width - 100,
                child: Row(
                  children: [
                    Text(
                      widget.isPhone
                          ? 'SMS with a code will be sent to: '
                          : 'You will receive the link at ',
                      style: TextStyle(
                        color: AppColors.textColor.withOpacity(0.7),
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                      ),
                    ),
                    Text(
                      widget.isPhone
                          ? (phoneNumberOrEmail == '' && phoneCountryCode == ''
                              ? '+00 000-000-0000'
                              : '+$phoneCountryCode $phoneNumberOrEmail')
                          : phoneNumberOrEmail,
                      style: TextStyle(
                        color: AppColors.textColor.withOpacity(0.7),
                        fontWeight: FontWeight.w500,
                        overflow: TextOverflow.ellipsis,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    _countDownTimer == 0
                        ? '00:00'
                        : _countDownTimer == 60
                            ? '01:00'
                            : _countDownTimer < 10
                                ? '00:0$_countDownTimer'
                                : '00:$_countDownTimer',
                    style: TextStyle(
                      color: AppColors.textColor.withOpacity(0.7),
                      fontWeight: FontWeight.w700,
                      fontSize: 10,
                    ),
                  ),
                  if (!widget.isPhone)
                    const SizedBox(
                      height: 10,
                    ),
                  if (!widget.isPhone)
                    GestureDetector(
                      onTap: () async {
                        if (_countDownTimer == 0 &&
                            sentPhoneNumberOrEmail != null) {
                          startTimer();
                          if (widget.isPhone) {
                            await authProvider.initializeSignInWithPhone(
                              sentPhoneNumberOrEmail!,
                            );
                          } else {
                            authProvider.sendEmailLink(sentPhoneNumberOrEmail!);
                          }
                        }
                      },
                      child: Text(
                        'Resend Link',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: _countDownTimer == 0 &&
                                  sentPhoneNumberOrEmail != null
                              ? AppColors.primaryColor
                              : AppColors.secondaryTextColor,
                          fontSize: 10,
                        ),
                      ),
                    ),
                ],
              )
            ],
          ),
        ),
        SizedBox(height: widget.isPhone ? 20 : 40),
        if (!widget.isPhone)
          Container(
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 33),
            color: AppColors.textFieldBackground,
            child: Row(
              children: [
                Image.asset(
                  'assets/images/smiling-marshmallow.png',
                  width: 40,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Flexible(
                  child: Text(
                    'Make sure your e-mail is correct, before you send it!',
                    style: TextStyle(
                      fontSize: 10,
                      color: AppColors.secondaryTextColor,
                    ),
                  ),
                )
              ],
            ),
          ),
        if (widget.isPhone)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 33),
            child: PillButton(
              title: 'Send',
              onTap: () async {
                if (phoneCountryCode.isNotEmpty &&
                    phoneNumberOrEmail.length >= 12 &&
                    (sentPhoneNumberOrEmail == null ||
                        sentPhoneNumberOrEmail !=
                            '+$phoneCountryCode$phoneNumberOrEmail')) {
                  sentPhoneNumberOrEmail =
                      '+$phoneCountryCode$phoneNumberOrEmail';
                  setState(() {});
                  startTimer();
                  await authProvider
                      .initializeSignInWithPhone(sentPhoneNumberOrEmail!);
                }
              },
              backgroundColor: (phoneCountryCode.isNotEmpty &&
                      phoneNumberOrEmail.length >= 12 &&
                      (sentPhoneNumberOrEmail == null ||
                          sentPhoneNumberOrEmail !=
                              '+$phoneCountryCode$phoneNumberOrEmail'))
                  ? AppColors.textColor
                  : Colors.white,
              fontColor: (phoneCountryCode.isNotEmpty &&
                      phoneNumberOrEmail.length >= 12 &&
                      (sentPhoneNumberOrEmail == null ||
                          sentPhoneNumberOrEmail !=
                              '+$phoneCountryCode$phoneNumberOrEmail'))
                  ? Colors.white
                  : AppColors.textColor,
              borderColor: AppColors.textFieldBorder.withOpacity(0.5),
            ),
          ),
        const SizedBox(height: 20),
        if (widget.isPhone)
          GestureDetector(
            onTap: () async {
              if (_countDownTimer == 0 && sentPhoneNumberOrEmail != null) {
                startTimer();
                await authProvider
                    .initializeSignInWithPhone(sentPhoneNumberOrEmail!);
              }
            },
            child: Text(
              'Resend code',
              style: TextStyle(
                color: _countDownTimer == 0 && sentPhoneNumberOrEmail != null
                    ? AppColors.primaryColor
                    : AppColors.disabledGray,
                fontWeight: FontWeight.w500,
                fontSize: 10,
              ),
            ),
          ),
        const SizedBox(height: 55),
        if (widget.isPhone)
          Text(
            'When you receive it, type the code here:',
            style: TextStyle(
              color: AppColors.textColor.withOpacity(0.8),
              fontSize: 10,
            ),
          ),
        const SizedBox(height: 12),
        if (widget.isPhone)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 33),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PhoneOTPTextField(
                      sentPhone: sentPhoneNumberOrEmail,
                      onChanged: (val) async {
                        if (val == '') {
                          verificationCode[0] = null;
                        } else {
                          verificationCode[0] = val;
                        }
                        setState(() {});
                      },
                    ),
                    PhoneOTPTextField(
                      sentPhone: sentPhoneNumberOrEmail,
                      onChanged: (val) async {
                        if (val == '') {
                          verificationCode[1] = null;
                        } else {
                          verificationCode[1] = val;
                        }
                        setState(() {});
                      },
                    ),
                    PhoneOTPTextField(
                      sentPhone: sentPhoneNumberOrEmail,
                      onChanged: (val) async {
                        if (val == '') {
                          verificationCode[2] = null;
                        } else {
                          verificationCode[2] = val;
                        }
                        setState(() {});
                      },
                    ),
                    PhoneOTPTextField(
                      sentPhone: sentPhoneNumberOrEmail,
                      onChanged: (val) async {
                        if (val == '') {
                          verificationCode[3] = null;
                        } else {
                          verificationCode[3] = val;
                        }
                        setState(() {});
                      },
                    ),
                    PhoneOTPTextField(
                      sentPhone: sentPhoneNumberOrEmail,
                      onChanged: (val) async {
                        if (val == '') {
                          verificationCode[4] = null;
                        } else {
                          verificationCode[4] = val;
                        }
                        setState(() {});
                      },
                    ),
                    PhoneOTPTextField(
                      sentPhone: sentPhoneNumberOrEmail,
                      onChanged: (val) async {
                        if (val == '') {
                          verificationCode[5] = null;
                        } else {
                          verificationCode[5] = val;
                        }
                        setState(() {});
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                if (isVerificationCodeCorrect != null)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Symbols.info,
                        color: isVerificationCodeCorrect!
                            ? AppColors.green
                            : AppColors.errorRed,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        isVerificationCodeCorrect!
                            ? 'The code is correct!'
                            : 'The code is wrong. Check your phone number.',
                        style: TextStyle(
                          color: isVerificationCodeCorrect!
                              ? AppColors.green
                              : AppColors.errorRed,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        const Spacer(),
        if (widget.isSignIn)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 33),
            child: Row(
              children: [
                SizedBox(
                  height: 32,
                  width: 32,
                  child: Checkbox(
                    value: areTermsOfUseAccepted,
                    onChanged: (val) {
                      setState(() {
                        areTermsOfUseAccepted = !areTermsOfUseAccepted;
                      });
                    },
                    fillColor:
                        MaterialStateProperty.all(AppColors.primaryColor),
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: 'Users must accept the ',
                    style: TextStyle(
                      color: AppColors.textColor.withOpacity(0.7),
                      fontFamily: 'Lexend',
                      fontSize: 10,
                    ),
                    children: [
                      const TextSpan(
                        text: 'Terms of Use',
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Lexend',
                          fontSize: 10,
                        ),
                      ),
                      TextSpan(
                        text: ' & ',
                        style: TextStyle(
                          color: AppColors.textColor.withOpacity(0.7),
                          fontFamily: 'Lexend',
                          fontSize: 10,
                        ),
                      ),
                      const TextSpan(
                        text: 'Privacy Policy',
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Lexend',
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 33),
          child: PillButton(
            title: widget.isPhone ? 'Continue' : 'Send',
            onTap: () async {
              if (widget.isPhone &&
                  (!verificationCode.contains(null)) &&
                  areTermsOfUseAccepted) {
                //? Check auth OTP
                isVerificationCodeCorrect =
                    await authProvider.verifyUserOTPCode(
                  verificationCode.join(),
                  sentPhoneNumberOrEmail!.substring(1).replaceAll('-', ''),
                  shouldSignIn: widget.isSignIn,
                );
                setState(() {});
              } else {
                //? Send email link
                if ((phoneNumberOrEmail.isValidEmail() &&
                        (sentPhoneNumberOrEmail == null ||
                            sentPhoneNumberOrEmail != phoneNumberOrEmail)) &&
                    areTermsOfUseAccepted) {
                  sentPhoneNumberOrEmail = phoneNumberOrEmail;

                  startTimer();
                  authProvider.sendEmailLink(sentPhoneNumberOrEmail!);
                }
              }
            },
            backgroundColor: (widget.isPhone
                        ? (!verificationCode.contains(null))
                        : (phoneNumberOrEmail.isValidEmail() &&
                            (sentPhoneNumberOrEmail == null ||
                                sentPhoneNumberOrEmail !=
                                    phoneNumberOrEmail))) &&
                    areTermsOfUseAccepted
                ? AppColors.textColor
                : Colors.white,
            fontColor: (widget.isPhone
                        ? (!verificationCode.contains(null))
                        : (phoneNumberOrEmail.isValidEmail() &&
                            (sentPhoneNumberOrEmail == null ||
                                sentPhoneNumberOrEmail !=
                                    phoneNumberOrEmail))) &&
                    areTermsOfUseAccepted
                ? Colors.white
                : AppColors.textColor,
            borderColor: AppColors.textFieldBorder.withOpacity(0.5),
            boxShadow: [
              BoxShadow(
                offset: const Offset(1.5, 1.5),
                blurRadius: 4,
                color: AppColors.textColor.withOpacity(0.2),
              )
            ],
          ),
        ),
        const SizedBox(height: 24),
        if (widget.isSignIn)
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const ColoredBox(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Go back',
                  style: TextStyle(
                    color: AppColors.secondaryTextColor,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
        const SizedBox(height: 55),
      ],
    );
  }
}
