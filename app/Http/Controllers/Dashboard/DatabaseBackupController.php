<?php

namespace App\Http\Controllers\Dashboard;

use File;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Redirect;

class DatabaseBackupController extends Controller
{    public function index()
    {
        // use Laravel's default storage/app directory instead of a custom POS folder
        $dir = storage_path('app');

        // ensure directory exists (it always should in a fresh installation)
        if (! File::exists($dir)) {
            File::makeDirectory($dir, 0755, true);
        }

        return view('database.index', [
            'files' => File::allFiles($dir)
        ]);
    }

    // Backup database is not working, and you need to enter manually in terminal with command php artisan backup:run.
    public function create(){
        \Artisan::call('backup:run');

        return Redirect::route('backup.index')->with('success', 'Database Backup Successfully!');
    }

    public function download(String $getFileName)
    {
        // files are stored directly in storage/app
        $path = storage_path('app/' . $getFileName);

        return response()->download($path);
    }

    public function delete(String $getFileName)
    {
        // Storage::delete uses the default "local" disk which maps to storage/app
        Storage::delete($getFileName);

        return Redirect::route('backup.index')->with('success', 'Database Deleted Successfully!');
    }
}
