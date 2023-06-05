<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class usuario extends Model
{
    use HasFactory;

    protected $table = "usuario";
    protected $primaryKey = "id_usuario";

    protected $fillable = [
        'nombre',
        'ap_pat',
        'ap_mat',
        'telefono',
        'id_tipo',
        'contraseña'
    ];

    protected $hidden = [
        'remember_token'
    ];

    public function tipo_usuario()
    {

        return $this->belongsTo(tipo_usuario::class, 'id_tipo');
    }
}
