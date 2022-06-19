<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Peserta extends Model
{
    use HasFactory;
    protected $table = 'peserta';
    protected $guarded = ['id'];

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function djurusan()
    {
        return $this->belongsTo(Jurusan::class, 'jurusan_id');
    }

    public function jawaban()
    {
        return $this->hasMany(Jawaban::class, 'peserta_id');
    }
}
