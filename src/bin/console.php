<?php
//#!/usr/bin/env php
// absolute filesystem path to the application root
/** @deprecated  */
define('APP_DIR', __DIR__ . '/../app');

// absolute filesystem path to the file dir
/** @deprecated  */
define('FILE_DIR', __DIR__ . '/../files');

// absolute filesystem path to the raw file dir
/** @deprecated  */
define('FILE_DIR_PUBLIC', __DIR__ . '/../www/upload');

/** @var Nette\DI\Container $container */
$container = require __DIR__ . '/../app/bootstrap.php';

// Get application from DI container.
/** @var \Contributte\Console\Application $application */
$application = $container->getByType(Contributte\Console\Application::class);

// Run application.
exit($application->run());