<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illumanate\Database\Eloquent\HasOne;
use App\Models\Category;

class Product extends Model
{
    use HasFactory;
    protected $fillable = [
        'name',
        'main_description',
        'target',
        'suited',
        'format',
        'ingredients',
        'description',
        'price',
        'quantity',
        'image',
        'category_id',
        'concern_id'
    ];

    public function category() {
        return $this->belongsTo(Category::class);
    }
    public function concern() {
        return $this->belongsTo(Concern::class);
    }

}
