abstract class OtpState {}
class OtpStateInit extends OtpState{}
class LoadingVerification extends OtpState{}
class LoadingSuccess extends OtpState{}
class LoadingError extends OtpState{}
class LoadingCheckCode extends OtpState{}
class LoadingCheckSuccess extends OtpState{}
class LoadingCheckError extends OtpState{}