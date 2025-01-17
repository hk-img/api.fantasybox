<?php

namespace Database\Seeders;
use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Userverify;
use App\Models\Userbalance;

class AdminSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $insertId1 = User::create([
            'name' => 'superadmin',
            'email' => 'superadmin@gmail.com',
            'email_verified_at' => now(),
            'password' => '$2y$10$MoWX1xa0S9kGG5YvE4ShCOBmoHQNeTb5I1VlEvS1RtTcOi/2eXMLG', // password
        ])->assignRole('superadmin','admin','cricket','football','basketball','kabaddi','stock','user');

        Userverify::create(['userid' => $insertId1->id,'email_verify'=>1]);
        Userbalance::create(['user_id' => $insertId1->id]);

        $insertId2 = User::create([
            'name' => 'admin',
            'email' => 'admin@gmail.com',
            'email_verified_at' => now(),
            'password' => '$2y$10$MoWX1xa0S9kGG5YvE4ShCOBmoHQNeTb5I1VlEvS1RtTcOi/2eXMLG', // password
        ])->assignRole('admin','cricket','football','basketball','kabaddi','stock','user');
        Userverify::create(['userid' => $insertId2->id,'email_verify'=>1]);
        Userbalance::create(['user_id' => $insertId2->id]);

        $insertId3 = User::create([
            'name' => 'cricket',
            'email' => 'cricket@gmail.com',
            'email_verified_at' => now(),
            'password' => '$2y$10$MoWX1xa0S9kGG5YvE4ShCOBmoHQNeTb5I1VlEvS1RtTcOi/2eXMLG', // password
        ])->assignRole('cricket');
        Userverify::create(['userid' => $insertId3->id,'email_verify'=>1]);
        Userbalance::create(['user_id' => $insertId3->id]);


        $insertId4 = User::create([
            'name' => 'football',
            'email' => 'football@gmail.com',
            'email_verified_at' => now(),
            'password' => '$2y$10$MoWX1xa0S9kGG5YvE4ShCOBmoHQNeTb5I1VlEvS1RtTcOi/2eXMLG', // password
        ])->assignRole('football');
        Userverify::create(['userid' => $insertId4->id,'email_verify'=>1]);
        Userbalance::create(['user_id' => $insertId4->id]);


        $insertId5 = User::create([
            'name' => 'basketball',
            'email' => 'basketball@gmail.com',
            'email_verified_at' => now(),
            'password' => '$2y$10$MoWX1xa0S9kGG5YvE4ShCOBmoHQNeTb5I1VlEvS1RtTcOi/2eXMLG', // password
        ])->assignRole('basketball');
        Userverify::create(['userid' => $insertId5->id,'email_verify'=>1]);
        Userbalance::create(['user_id' => $insertId5->id]);


        $insertId6 = User::create([
            'name' => 'kabaddi',
            'email' => 'kabaddi@gmail.com',
            'email_verified_at' => now(),
            'password' => '$2y$10$MoWX1xa0S9kGG5YvE4ShCOBmoHQNeTb5I1VlEvS1RtTcOi/2eXMLG', // password
        ])->assignRole('kabaddi');
        Userverify::create(['userid' => $insertId6->id,'email_verify'=>1]);
        Userbalance::create(['user_id' => $insertId6->id]);


        $insertId7 = User::create([
            'name' => 'stock',
            'email' => 'stock@gmail.com',
            'email_verified_at' => now(),
            'password' => '$2y$10$MoWX1xa0S9kGG5YvE4ShCOBmoHQNeTb5I1VlEvS1RtTcOi/2eXMLG', // password
        ])->assignRole('stock');
        Userverify::create(['userid' => $insertId7->id,'email_verify'=>1]);
        Userbalance::create(['user_id' => $insertId7->id]);


    }
}
