<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;

class RoleAndPermissionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Permission::create(['name' => 'gamemerge']);

        $superadminRole = Role::create(['name' => 'superadmin']);
        $adminRole = Role::create(['name' => 'admin']);
        $cricketRole = Role::create(['name' => 'cricket']);
        $footballRole = Role::create(['name' => 'football']);
        $basketballRole = Role::create(['name' => 'basketball']);
        $stockRole = Role::create(['name' => 'stock']);
        $stockrRole = Role::create(['name' => 'kabaddi']);
        $userRole = Role::create(['name' => 'user']);

        $superadminRole->givePermissionTo([
            'gamemerge',
        ]);
        
    }
}
