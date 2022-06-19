<?php

namespace App\Http\Controllers;

use App\Models\Jurusan;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class JurusanController extends Controller
{

    public function index()
    {
        $data = Jurusan::paginate(10);
        return view('superadmin.jurusan.index', compact('data'));
    }

    public function create()
    {
        return view('superadmin.jurusan.create');
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'kode' =>  'unique:jurusan',
        ]);

        if ($validator->fails()) {
            $request->flash();
            toastr()->error('kode jurusan sudah ada');
            return back();
        }
        Jurusan::create($request->all());

        toastr()->success('Sukses Di Simpan');
        return redirect('/superadmin/jurusan');
    }

    public function show($id)
    {
        //
    }

    public function edit($id)
    {
        $data = Jurusan::find($id);

        return view('superadmin.jurusan.edit', compact('data'));
    }

    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'kode' =>  'unique:jurusan,nama,' . $id,
        ]);

        if ($validator->fails()) {
            $request->flash();
            toastr()->error('jurusan sudah ada');
            return back();
        }

        $attr = $request->all();

        Jurusan::find($id)->update($attr);

        toastr()->success('Sukses Di Update');
        return redirect('/superadmin/jurusan');
    }

    public function destroy($id)
    {
        Jurusan::find($id)->delete();
        toastr()->success('Sukses Di Hapus');
        return back();
    }
}
