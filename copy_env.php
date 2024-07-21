<?php
if (file_exists(__DIR__ . '/.env')) {
    copy(__DIR__ . '/.env', __DIR__ . '/.env.local');
}