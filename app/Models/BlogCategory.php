<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BlogCategory extends Model
{
    use HasFactory;
    
    protected $table = 'blogcategory';
    protected $fillable = [
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
