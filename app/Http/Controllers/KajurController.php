<?php

namespace App\Http\Controllers;

use App\Models\Kajur;
use App\Models\Jurusan;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class KajurController extends Controller
{
    public function index()
    {
        $data = Kajur::paginate(10);
        return view('superadmin.kajur.index', compact('data'));
    }

    public function create()
    {
        $jurusan = Jurusan::get();
        return view('superadmin.kajur.create', compact('jurusan'));
    }

    public function store(Request $request)
    {
        // $validator = Validator::make($request->all(), [
        //     'jurusan_id' =>  'unique:kajur',
        // ]);

        // if ($validator->fails()) {
        //     $request->flash();
        //     toastr()->error(' kajur sudah ada');
        //     return back();
        // }
        Kajur::create($request->all());

        toastr()->success('Sukses Di Simpan');
        return redirect('/superadmin/kajur');
    }

    public function show($id)
    {
        //
    }

    public function edit($id)
    {
        $data = Kajur::find($id);

        $jurusan = Jurusan::get();
        return view('superadmin.kajur.edit', compact('data', 'jurusan'));
    }

    public function update(Request $request, $id)
    {
        // $validator = Validator::make($request->all(), [
        //     'kode' =>  'unique:kajur,nama,' . $id,
        // ]);

        // if ($validator->fails()) {
        //     $request->flash();
        //     toastr()->error('kajur sudah ada');
        //     return back();
        // }

        $attr = $request->all();

        Kajur::find($id)->update($attr);

        toastr()->success('Sukses Di Update');
        return redirect('/superadmin/kajur');
    }

    public function destroy($id)
    {
        Kajur::find($id)->delete();
        toastr()->success('Sukses Di Hapus');
        return back();
    }
}
