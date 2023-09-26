import { defineConfig } from 'vite';
import laravel from 'laravel-vite-plugin';
import ReactRefresh from 'react-refresh';
import react from '@vitejs/plugin-react';

export default defineConfig({
    plugins: [
        laravel({
            input: [
                'resources/sass/app.scss',
                'resources/js/app.js',
            ],
            refresh: true,
        }),
        ReactRefresh,
    ],
});