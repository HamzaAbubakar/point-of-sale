@extends('dashboard.body.main')

@section('container')
    <div class="container">
        <h1>Database Backups</h1>

        @if(session('success'))
            <div class="alert alert-success">{{ session('success') }}</div>
        @endif

        <a href="{{ route('backup.create') }}" class="btn btn-primary mb-3">
            Run Backup
        </a>

        @if(count($files) > 0)
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Size</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($files as $file)
                        <tr>
                            <td>{{ $file->getFilename() }}</td>
                            <td>{{ format_bytes($file->getSize()) }}</td>
                            <td>
                                <a href="{{ route('backup.download', $file->getFilename()) }}" class="btn btn-sm btn-success">Download</a>
                                <form action="{{ route('backup.delete', $file->getFilename()) }}" method="POST" style="display:inline">
                                    @csrf
                                    @method('DELETE')
                                    <button type="submit" class="btn btn-sm btn-danger" onclick="return confirm('Delete this backup?')">Delete</button>
                                </form>
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        @else
            <p>No backups found.</p>
        @endif
    </div>
@endsection
