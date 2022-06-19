<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Projur extends Model
{
    use HasFactory;
    protected $table = 'projur';
    protected $guarded = ['id'];

    public $timestamps = false;

    public function jurusan()
    {
        return $this->BelongsTo(Jurusan::class, 'jurusan_id');
    }

    public function kajur()
    {
        return $this->BelongsTo(Kajur::class, 'kajur_id');
    }
}
