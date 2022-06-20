<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Models\Soal;
use App\Models\Waktu;
use App\Models\Projur;
use GuzzleHttp\Client;
use App\Models\Jawaban;
use App\Models\Peserta;
use App\Models\Kategori;
use App\Models\BenarSalah;
use Illuminate\Http\Request;
use Barryvdh\DomPDF\Facade as PDF;
use Illuminate\Support\Facades\Auth;

class HomeController extends Controller
{
    public function datapeserta()
    {
        return Peserta::get();
    }

    public function superadmin()
    {
        $peserta    = $this->datapeserta()->count();
        $soal       = Soal::count();
        $kategori   = Kategori::count();
        $durasi     = Waktu::first()->durasi;

        $yangupload = Peserta::where('file', '!=', null)->get()->count();

        $data = $this->datapeserta()->map(function ($item) {
            $jawaban = Jawaban::where('peserta_id', $item->id)->get();
            $item->dijawab = $jawaban->count();
            $item->jml_soal = $this->soal($item->jurusan_id)->count();

            $item->benar = Jawaban::where('peserta_id', $item->id)
                ->get()->map(function ($item2) {
                    if ($item2->jawaban == $item2->soal->kunci) {
                        $item2->benar = 'Y';
                    } else {
                        $item2->benar = 'T';
                    }
                    return $item2;
                })->where('benar', 'Y')->count();

            return $item;
        })->sortByDesc('benar');

        return view('superadmin.home', compact('peserta', 'soal', 'kategori', 'durasi', 'data', 'yangupload'));
    }

    public function gantipass()
    {
        return view('superadmin.gantipass.index');
    }

    public function resetpass(Request $req)
    {
        if ($req->password1 == $req->password2) {
            $u = Auth::user();
            $u->password = bcrypt($req->password1);
            $u->save();

            Auth::logout();
            toastr()->success('Berhasil Di Ubah, Login Dengan Password Baru');
            return redirect('/');
        } else {
            toastr()->error('Password Tidak Sama');
            return back();
        }
    }

    public function soal($id)
    {
        return Soal::where('jurusan_id', $id)->get();
    }

    public function laporan()
    {
        return view('superadmin.laporan.index');
    }

    public function pdf_peserta()
    {

        $data = Peserta::get();

        $path = 'theme/smk.jpg';
        $datalogo = file_get_contents($path);
        $type = pathinfo($path, PATHINFO_EXTENSION);
        $logo = 'data:image/' . $type . ';base64,' . base64_encode($datalogo);



        $path1 = 'theme/smkbisa.png';
        $datalogo1 = file_get_contents($path1);
        $type1 = pathinfo($path1, PATHINFO_EXTENSION);
        $smk = 'data:image/' . $type1 . ';base64,' . base64_encode($datalogo1);

        $pdf = PDF::loadView('superadmin.laporan.pdf_peserta', compact('data', 'logo', 'smk'))->setPaper('legal');
        return $pdf->stream();
    }

    public function pdf_projur()
    {

        $path = 'theme/smk.jpg';
        $datalogo = file_get_contents($path);
        $type = pathinfo($path, PATHINFO_EXTENSION);
        $logo = 'data:image/' . $type . ';base64,' . base64_encode($datalogo);

        $path1 = 'theme/smkbisa.png';
        $datalogo1 = file_get_contents($path1);
        $type1 = pathinfo($path1, PATHINFO_EXTENSION);
        $smk = 'data:image/' . $type1 . ';base64,' . base64_encode($datalogo1);

        $data = Projur::get();
        $pdf = PDF::loadView('superadmin.laporan.pdf_projur', compact('data', 'logo', 'smk'))->setPaper('legal');
        return $pdf->stream();
    }

    public function pdf_hasiltest()
    {

        $path = 'theme/smk.jpg';
        $datalogo = file_get_contents($path);
        $type = pathinfo($path, PATHINFO_EXTENSION);
        $logo = 'data:image/' . $type . ';base64,' . base64_encode($datalogo);



        $path1 = 'theme/smkbisa.png';
        $datalogo1 = file_get_contents($path1);
        $type1 = pathinfo($path1, PATHINFO_EXTENSION);
        $smk = 'data:image/' . $type1 . ';base64,' . base64_encode($datalogo1);

        //$soal       = $this->soal()->count();
        $data = $this->datapeserta()->map(function ($item) {
            $jawaban = Jawaban::where('peserta_id', $item->id)->get();
            $item->dijawab = $jawaban->count();
            $item->jml_soal = $this->soal($item->jurusan_id)->count();
            $item->benar = Jawaban::where('peserta_id', $item->id)
                ->get()->map(function ($item2) {
                    if ($item2->jawaban == $item2->soal->kunci) {
                        $item2->benar = 'Y';
                    } else {
                        $item2->benar = 'T';
                    }
                    return $item2;
                })->where('benar', 'Y')->count();

            return $item;
        })->sortByDesc('benar');

        $pdf = PDF::loadView('superadmin.laporan.pdf_hasil', compact('data', 'logo', 'smk'))->setPaper('legal');
        return $pdf->stream();
    }

    public function peserta()
    {
        $peserta    = Auth::user()->peserta;

        $jmlsoal    = $this->soal()->count();
        $jam        = Carbon::now()->format('H:i');
        $waktu      = Waktu::first()->durasi;

        $listSoal   = $this->soal()->map(function ($item) use ($peserta) {
            $check = Jawaban::where('peserta_id', $peserta->id)->where('soal_id', $item->id)->first();
            if ($check == null) {
                $item->dijawab = false;
            } else {
                $item->dijawab = $check->jawaban;
            }
            return $item;
        });

        $jmlbelumjawab = $listSoal->where('dijawab', false)->count();

        //hitung skor Benar
        $skor = Jawaban::where('peserta_id', $peserta->id)
            ->get()->map(function ($item2) {
                if ($item2->jawaban == $item2->soal->kunci) {
                    $item2->benar = 'Y';
                } else {
                    $item2->benar = 'T';
                }
                return $item2;
            })->where('benar', 'Y')->count();

        //check selesai ujian
        if ($peserta->selesai_ujian == 1) {
            return view('peserta.selesai', compact('jmlsoal', 'jam', 'waktu', 'peserta', 'jmlbelumjawab', 'skor'));
        } else {

            $mulai     = Waktu::first()->tanggal_mulai;
            $selesai   = Waktu::first()->tanggal_selesai;
            $check     = Carbon::now()->between($mulai, $selesai);
            $now       = Carbon::now();

            if ($now <= Carbon::parse(Waktu::first()->tanggal_mulai)) {
                return view('peserta.start', compact('jmlsoal', 'jam', 'waktu', 'peserta', 'jmlbelumjawab', 'mulai', 'selesai'));
            } elseif ($now > Waktu::first()->tanggal_selesai) {
                return view('peserta.selesai', compact('jmlsoal', 'jam', 'waktu', 'peserta', 'jmlbelumjawab', 'skor'));
            } else {
                $soalPertama = Soal::first()->id;
                return redirect('/peserta/ujian/soal/' . $soalPertama);
            }
        }
    }

    public function testapi()
    {
        $token = null;
        $data = [];
        return view('testapi', compact('token', 'data'));
    }

    public function gettoken(Request $req)
    {
        $client = new Client(['base_uri' => 'http://cat.asrandev.com/api/']);
        $response = $client->request('POST', 'login', [
            'form_params' => [
                'username' => $req->username,
                'password' => $req->password,
            ]
        ]);
        $resp = json_decode($response->getBody()->getContents());

        $token = $resp->api_token;
        $req->flash();
        $data = [];
        return view('testapi', compact('token', 'data'));
    }

    public function getnilai(Request $req)
    {
        $token = $req->token;
        $client = new Client(['base_uri' => 'http://cat.asrandev.com/api/']);
        $headers = [
            'Authorization' => 'Bearer ' . $token,
            'Accept'        => 'application/json',
        ];
        //get Profile
        $profile = $client->request('GET', 'profile', [
            'headers' => $headers
        ]);
        $resp_profile = json_decode($profile->getBody()->getContents())->data;

        //get kunci
        $kunci = $client->request('GET', 'kunci', [
            'headers' => $headers
        ]);
        $resp_kunci = json_decode($kunci->getBody()->getContents())->data;

        //get jawabanku
        $jawaban = $client->request('GET', 'jawabanku', [
            'headers' => $headers
        ]);
        $resp_jawaban = json_decode($jawaban->getBody()->getContents())->data;

        $data = collect($resp_kunci)->map(function ($item) use ($resp_jawaban) {
            if (collect($resp_jawaban)->where('soal_id', $item->id)->first() == null) {
                $item->jawabanku = null;
            } else {
                $item->jawabanku = collect($resp_jawaban)->where('soal_id', $item->id)->first()->jawaban;
            }
            return $item;
        });

        return view('testapi', compact('token', 'data'));
    }
}
