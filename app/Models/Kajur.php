<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Kajur extends Model
{
    use HasFactory;
    protected $table = 'kajur';
    protected $guarded = ['id'];

    public $timestamps = false;

    public function jurusan()
    {
        return $this->BelongsTo(Jurusan::class, 'jurusan_id');
    }
}
