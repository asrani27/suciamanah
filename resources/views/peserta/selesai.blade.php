@extends('peserta.layouts.app')

@push('css')

@endpush

@section('content')

<div class="row">
  <div class="col-md-12">
    <div class="card card-primary">
      <div class="card-body text-center">
        <h1>UJIAN TELAH SELESAI</h1></br>
        <h1>SKOR ANDA : {{$skor}}</h1></br>
      </div>
    </div>
  </div>
</div>

@endsection

@push('js')

@endpush