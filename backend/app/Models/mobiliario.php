<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class mobiliario extends Model
{
    use HasFactory;

    protected $table = "mobiliario";
    protected $primaryKey = "id_mobiliario";

    protected $fillable = [
        'nombre',
        'descripcion'
    ];
}
