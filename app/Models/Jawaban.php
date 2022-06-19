<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Jawaban extends Model
{
    use HasFactory;
    protected $table = 'jawaban';
    protected $guarded = ['id'];

    public function soal()
    {
        return $this->BelongsTo(Soal::class, 'soal_id');
    }
}
