@extends('layouts.app')

@push('css')
<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
@endpush
@section('title')
ADMIN
@endsection
@section('content')
<br />
<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">LAPORAN</h3>
                <div class="card-tools">
                </div>
            </div>
            <!-- /.card-header -->
            <div class="card-body">
                <a href="/superadmin/laporan/peserta" class="btn btn-primary" target="_blank">Lap Calon Siswa</a>
                <a href="/superadmin/laporan/hasiltest" class="btn btn-primary" target="_blank">Lap Hasil Test</a>
                <a href="/superadmin/laporan/projur" class="btn btn-primary" target="_blank">Lap Profil Jurusan</a>
            </div>
            <!-- /.card-body -->
        </div>
        {{-- {{$data->links()}} --}}
    </div>
</div>

@endsection

@push('js')
@endpush