<?php

namespace App\Http\Controllers;

use App\Models\Kajur;
use App\Models\Projur;
use App\Models\Jurusan;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class ProjurController extends Controller
{
    public function index()
    {
        $data = Projur::paginate(10);
        return view('superadmin.projur.index', compact('data'));
    }

    public function create()
    {
        $jurusan = Jurusan::get();
        $kajur = Kajur::get();
        return view('superadmin.projur.create', compact('jurusan', 'kajur'));
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'jurusan_id' =>  'unique:projur',
        ]);

        if ($validator->fails()) {
            $request->flash();
            toastr()->error('kode projur sudah ada');
            return back();
        }
        Projur::create($request->all());

        toastr()->success('Sukses Di Simpan');
        return redirect('/superadmin/projur');
    }

    public function show($id)
    {
        //
    }

    public function edit($id)
    {
        $jurusan = Jurusan::get();
        $kajur = Kajur::get();
        $data = Projur::find($id);

        return view('superadmin.projur.edit', compact('data', 'kajur', 'jurusan'));
    }

    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'jurusan_id' =>  'unique:projur,jurusan_id,' . $id,
        ]);

        if ($validator->fails()) {
            $request->flash();
            toastr()->error('projur sudah ada');
            return back();
        }

        $attr = $request->all();

        Projur::find($id)->update($attr);

        toastr()->success('Sukses Di Update');
        return redirect('/superadmin/projur');
    }

    public function destroy($id)
    {
        Projur::find($id)->delete();
        toastr()->success('Sukses Di Hapus');
        return back();
    }
}
