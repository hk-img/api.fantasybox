<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Blog extends Model
{
    use HasFactory;
    
    protected $table = 'blog';
    protected $fillable = [
        'category_id',
        'title',
        'slug',
        'imagetitle',
        'imagealt',
        'description',
        'meta_title',
        'meta_keywords',
        'meta_description',
        'image',
        'status'
    ];
}
