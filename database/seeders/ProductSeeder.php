<?php

namespace Database\Seeders;

use App\Models\Product;
use Illuminate\Database\Seeder;
use Illuminate\Support\Str;
use Haruncpi\LaravelIdGenerator\IdGenerator;

class ProductSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $iphoneModels = [
            'iPhone 11' => [
                'colors' => ['Black', 'Green', 'Yellow', 'Purple', 'Red', 'White'],
                'storage' => ['64GB', '128GB', '256GB'],
                'base_price' => 500
            ],
            'iPhone 11 Pro' => [
                'colors' => ['Gold', 'Space Gray', 'Silver', 'Midnight Green'],
                'storage' => ['64GB', '256GB', '512GB'],
                'base_price' => 700
            ],
            'iPhone 11 Pro Max' => [
                'colors' => ['Gold', 'Space Gray', 'Silver', 'Midnight Green'],
                'storage' => ['64GB', '256GB', '512GB'],
                'base_price' => 800
            ],
            'iPhone 12' => [
                'colors' => ['Black', 'White', 'Red', 'Green', 'Blue', 'Purple'],
                'storage' => ['64GB', '128GB', '256GB'],
                'base_price' => 600
            ],
            'iPhone 12 Mini' => [
                'colors' => ['Black', 'White', 'Red', 'Green', 'Blue', 'Purple'],
                'storage' => ['64GB', '128GB', '256GB'],
                'base_price' => 550
            ],
            'iPhone 12 Pro' => [
                'colors' => ['Silver', 'Graphite', 'Gold', 'Pacific Blue'],
                'storage' => ['128GB', '256GB', '512GB'],
                'base_price' => 800
            ],
            'iPhone 12 Pro Max' => [
                'colors' => ['Silver', 'Graphite', 'Gold', 'Pacific Blue'],
                'storage' => ['128GB', '256GB', '512GB'],
                'base_price' => 900
            ],
            'iPhone 13' => [
                'colors' => ['Starlight', 'Midnight', 'Blue', 'Pink', 'Red', 'Green'],
                'storage' => ['128GB', '256GB', '512GB'],
                'base_price' => 700
            ],
            'iPhone 13 Mini' => [
                'colors' => ['Starlight', 'Midnight', 'Blue', 'Pink', 'Red', 'Green'],
                'storage' => ['128GB', '256GB', '512GB'],
                'base_price' => 650
            ],
            'iPhone 13 Pro' => [
                'colors' => ['Silver', 'Graphite', 'Gold', 'Sierra Blue', 'Alpine Green'],
                'storage' => ['128GB', '256GB', '512GB', '1TB'],
                'base_price' => 900
            ],
            'iPhone 13 Pro Max' => [
                'colors' => ['Silver', 'Graphite', 'Gold', 'Sierra Blue', 'Alpine Green'],
                'storage' => ['128GB', '256GB', '512GB', '1TB'],
                'base_price' => 1000
            ],
            'iPhone 14' => [
                'colors' => ['Midnight', 'Purple', 'Starlight', 'Blue', 'Red', 'Yellow'],
                'storage' => ['128GB', '256GB', '512GB'],
                'base_price' => 800
            ],
            'iPhone 14 Plus' => [
                'colors' => ['Midnight', 'Purple', 'Starlight', 'Blue', 'Red', 'Yellow'],
                'storage' => ['128GB', '256GB', '512GB'],
                'base_price' => 900
            ],
            'iPhone 14 Pro' => [
                'colors' => ['Space Black', 'Silver', 'Gold', 'Deep Purple'],
                'storage' => ['128GB', '256GB', '512GB', '1TB'],
                'base_price' => 1000
            ],
            'iPhone 14 Pro Max' => [
                'colors' => ['Space Black', 'Silver', 'Gold', 'Deep Purple'],
                'storage' => ['128GB', '256GB', '512GB', '1TB'],
                'base_price' => 1100
            ],
            'iPhone 15' => [
                'colors' => ['Black', 'Blue', 'Green', 'Yellow', 'Pink'],
                'storage' => ['128GB', '256GB', '512GB'],
                'base_price' => 900
            ],
            'iPhone 15 Plus' => [
                'colors' => ['Black', 'Blue', 'Green', 'Yellow', 'Pink'],
                'storage' => ['128GB', '256GB', '512GB'],
                'base_price' => 1000
            ],
            'iPhone 15 Pro' => [
                'colors' => ['Black Titanium', 'White Titanium', 'Blue Titanium', 'Natural Titanium'],
                'storage' => ['128GB', '256GB', '512GB', '1TB'],
                'base_price' => 1100
            ],
            'iPhone 15 Pro Max' => [
                'colors' => ['Black Titanium', 'White Titanium', 'Blue Titanium', 'Natural Titanium'],
                'storage' => ['256GB', '512GB', '1TB'],
                'base_price' => 1200
            ],
            'iPhone 16' => [
                'colors' => ['Black', 'White', 'Pink', 'Teal', 'Ultramarine'],
                'storage' => ['128GB', '256GB', '512GB'],
                'base_price' => 1000
            ],
            'iPhone 16 Plus' => [
                'colors' => ['Black', 'White', 'Pink', 'Teal', 'Ultramarine'],
                'storage' => ['128GB', '256GB', '512GB'],
                'base_price' => 1100
            ],
            'iPhone 16e' => [
                'colors' => ['Black', 'White'],
                'storage' => ['128GB'],
                'base_price' => 950
            ],
            'iPhone 16 Pro' => [
                'colors' => ['Black Titanium', 'White Titanium', 'Natural Titanium', 'Desert Titanium'],
                'storage' => ['128GB', '256GB', '512GB', '1TB'],
                'base_price' => 1200
            ],
            'iPhone 16 Pro Max' => [
                'colors' => ['Black Titanium', 'White Titanium', 'Natural Titanium', 'Desert Titanium'],
                'storage' => ['256GB', '512GB', '1TB'],
                'base_price' => 1300
            ],
            'iPhone 17' => [
                'colors' => ['Black', 'White', 'Mist Blue', 'Sage', 'Lavender'],
                'storage' => ['256GB', '512GB'],
                'base_price' => 1100
            ],
            'iPhone Air' => [
                'colors' => ['Sky Blue', 'Light Gold', 'Cloud White', 'Space Black'],
                'storage' => ['256GB', '512GB', '1TB'],
                'base_price' => 1200
            ],
            'iPhone 17 Pro' => [
                'colors' => ['Cosmic Orange', 'Deep Blue', 'Silver', 'Space Black'],
                'storage' => ['256GB', '512GB', '1TB', '2TB'],
                'base_price' => 1300
            ],
            'iPhone 17 Pro Max' => [
                'colors' => ['Cosmic Orange', 'Deep Blue', 'Silver', 'Space Black'],
                'storage' => ['256GB', '512GB', '1TB', '2TB'],
                'base_price' => 1400
            ],
        ];

        foreach ($iphoneModels as $model => $details) {
            foreach ($details['colors'] as $color) {
                foreach ($details['storage'] as $storage) {
                    $productName = "{$model} {$color} {$storage}";

                    // Adjust price based on storage
                    $priceModifier = 0;
                    if ($storage === '128GB') $priceModifier = 0;
                    if ($storage === '256GB') $priceModifier = 100;
                    if ($storage === '512GB') $priceModifier = 200;
                    if ($storage === '1TB') $priceModifier = 400;
                    if ($storage === '2TB') $priceModifier = 600;

                    $sellingPrice = $details['base_price'] + $priceModifier;
                    $buyingPrice = $sellingPrice * 0.8; // 20% margin

                    Product::create([
                        'name' => $productName,
                        'slug' => Str::slug($productName),
                        'code' => IdGenerator::generate([
                            'table' => 'products',
                            'field' => 'code',
                            'length' => 10,
                            'prefix' => 'PRD-'
                        ]),
                        'category_id' => 1, // Smartphones
                        'stock' => rand(5, 20),
                        'buying_price' => $buyingPrice,
                        'selling_price' => $sellingPrice,
                        'buying_date' => now()->subDays(rand(1, 30)),
                        'expire_date' => now()->addYear(),
                        'image' => null,
                    ]);
                }
            }
        }
    }
}
