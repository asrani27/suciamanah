<!DOCTYPE html
    PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta content="en-us" http-equiv="Content-Language" />
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
    <title>SMK2 TAMIANG LAYANG</title>
    {{-- <style type="text/css">
        .auto-style1 {
            font-family: Arial, Helvetica, sans-serif;
            font-size: x-small;
        }
    </style> --}}
    <style>
        @page {
            margin-top: 80px;
            margin-left: 50px;
        }

        header {
            position: fixed;
            top: -60px;
            left: 0px;
            right: 0px;
            height: 0px;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 12px;
            /** Extra personal styles **/
            /* background-color: #03a9f4;
            color: white;
            text-align: center; 
            line-height: 35px;*/
        }

        tr,
        th,
            {
            border: 2px solid #000;
            font-size: 10px;
            font-family: Arial, Helvetica, sans-serif;
        }

        td {
            font-weight: bold;
            border: 2px solid #000;
            font-size: 10px;
        }

        footer {
            position: fixed;
            bottom: -60px;
            left: 0px;
            right: 0px;
            height: 50px;
            font-size: 8px;
            font-family: Arial, Helvetica, sans-serif;
            /** Extra personal styles **/
            /* background-color: #03a9f4;
            color: white;
            text-align: center;
            line-height: 35px; */
        }
    </style>
</head>

<body>
    <header>
        <table border="0" width="100%">
            <tr>
                <td style="border: 0px;" align="center" width="30%">
                    <img width="50px" height="50px" src="{{$logo}}">
                </td>
                <td style="border: 0px;" valign="top" align="center" width="100%">
                    <h2>DINAS PENDIDIKAN DAN KEBUDAYAAN<BR /> KABUPATEN BARITO TIMUR<br /> SMK N 2 TAMIYANG LAYANG</h2>
                    Jl. Nansarunai, Tamiang Layang, Kec. Dusun Timur, Kab. Barito Timur, Kalimantan Tengah.

                </td>
                <td style="border: 0px;" align="center" width="30%">
                    <img width="50px" height="50px" src="{{$smk}}">
                </td>
            </tr>
        </table>
        <hr>
        <p><span class="auto-style1"><strong>LAPORAN DATA HASIL TEST </strong></span></p>
    </header>
    <footer>
        <hr>
        <p>Tanggal Cetak : {{\Carbon\Carbon::now()->format('d-m-Y H:i:s')}}
        </p>
    </footer>
    <br />
    <br />
    <br />
    <br />
    <main>
        <table cellpadding="5" cellspacing="0" width="100%">
            <thead>
                <tr>
                    <th>No</th>
                    <th>NIK</th>
                    <th>NISN</th>
                    <th>Nama</th>
                    <th>Jumlah Soal</th>
                    <th>Di Jawab</th>
                    <th>Belum Jawab</th>
                    <th>Benar</th>
                    <th>Salah</th>
                </tr>
            </thead>
            <tbody>
                @php
                $no = 1;
                @endphp
                @foreach ($data as $item)
                <tr>
                    <td>{{$no++}}</td>
                    <td>{{$item->nik}}</td>
                    <td>{{$item->nisn}}</td>
                    <td>{{$item->nama}}</td>
                    <td class="text-center">{{$soal}}</td>
                    <td class="text-center">{{$item->dijawab}}</td>
                    <td class="text-center">{{$soal - $item->dijawab}}</td>
                    <td class="text-center">{{$item->benar}}</td>
                    <td class="text-center">{{$soal - $item->benar}}</td>
                </tr>
                @endforeach

            </tbody>
        </table>
        <br />
        <table width="100%" border="0">
            <tr style="border: 0px;">
                <td width="70%" style="border: 0px;"></td>
                <td width="30%" style="border: 0px;">
                    TAMIYANG LAYANG, {{\Carbon\Carbon::now()->translatedFormat('d F Y')}}<br />
                    Mengetahui Kepala Sekolah,
                    <br />
                    <br />
                    <br />
                    <br />
                    (.............................)



                </td>
            </tr>
        </table>

    </main>
</body>

</html>