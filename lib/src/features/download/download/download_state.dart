part of 'download_bloc.dart';

abstract class DownloadState extends Equatable {
  const DownloadState();
}

class DownloadInitial extends DownloadState {
  @override
  List<Object> get props => [];
}

class DownloadLoading extends DownloadState {
  @override
  List<Object> get props => [];
}

class DownloadDone extends DownloadState {
  @override
  List<Object> get props => [];
}

class DownloadFailed extends DownloadState {
  final Failure failure;

  DownloadFailed(this.failure);

  @override
  List<Object> get props => [failure];
}
