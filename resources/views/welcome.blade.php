<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>E - Commerce Program Test</title>
    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,600" rel="stylesheet">
    <!-- Styles -->
    <link rel="stylesheet" href="{{ asset('assets/css/app.css') }}">
    @vite(['resources/sass/app.scss', 'resources/js/app.js'])
</head>
<body>
    <div id="navbar"></div>
    <div id="example"></div>
    <div id="footer"></div>
</body>

</html>
