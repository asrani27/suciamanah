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
        <a href="/superadmin/peserta/create" class="btn btn-sm bg-gradient-purple"><i class="fas fa-plus"></i> Tambah
            Calon Siswa</a>
        <br /><br />
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">Data Calon Siswa</h3>
                <div class="card-tools">
                    <form method="get" action="/superadmin/peserta/search">
                        <div class="input-group input-group-sm" style="width: 250px;">
                            <input type="text" name="search" class="form-control float-right" value="{{old('search')}}"
                                placeholder="Nama / NIK">

                            <div class="input-group-append">
                                <button type="submit" class="btn btn-default"><i class="fas fa-search"></i></button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <!-- /.card-header -->
            <div class="card-body table-responsive p-0">
                <table class="table table-hover text-nowrap table-sm">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>NIK (username login)</th>
                            <th>NISN</th>
                            <th>Nama Siswa</th>
                            <th>Alamat</th>
                            <th>Tempat Lahir</th>
                            <th>Tgl lahir</th>
                            <th>Jkel</th>
                            <th>Nama Ayah</th>
                            <th>Nama Ibu</th>
                            <th>Jurusan</th>
                            <th>Aksi</th>
                        </tr>
                    </thead>
                    @php
                    $no =1;
                    @endphp
                    <tbody>
                        @foreach ($data as $key => $item)
                        <tr style="font-size:11px; font-family:Arial, Helvetica, sans-serif">
                            <td>{{$no++}}</td>
                            <td>{{$item->nik}}</td>
                            <td>{{$item->nisn}}</td>
                            <td>{{$item->nama}}</td>
                            <td>{{$item->alamat}}</td>
                            <td>{{$item->tempat_lahir}}</td>
                            <td>{{$item->tgl}}</td>
                            <td>{{$item->jkel == 'L' ? 'laki-laki':'perempian'}}</td>
                            <td>{{$item->ayah}}</td>
                            <td>{{$item->ibu}}</td>
                            <td>{{$item->djurusan->nama}}</td>
                            <td>

                                <form action="/superadmin/peserta/{{$item->id}}" method="post">
                                    <a href="/superadmin/peserta/{{$item->id}}/edit" class="btn btn-xs btn-success"><i
                                            class="fas fa-edit"></i> Edit</a>
                                    @csrf
                                    @method('delete')
                                    <button type="submit" class="btn btn-xs btn-danger"
                                        onclick="return confirm('yakin DI Hapus?');"><i class="fas fa-trash"></i>
                                        Delete</button>

                                    @if ($item->user == null)

                                    <a href="/superadmin/peserta/{{$item->id}}/akun" class="btn btn-xs btn-warning"><i
                                            class="fas fa-key"></i> Buat Akun</a>
                                    @else
                                    <a href="/superadmin/peserta/{{$item->id}}/pass" class="btn btn-xs btn-secondary"><i
                                            class="fas fa-key"></i> Reset Pass</a>
                                    @endif
                                </form>

                            </td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
            <!-- /.card-body -->
        </div>
        {{-- {{$data->links()}} --}}
    </div>
</div>

@endsection

@push('js')
@endpush