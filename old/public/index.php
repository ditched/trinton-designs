<?php
error_reporting(-1);
ini_set('display_errors', 'On');

session_cache_limiter(false);
session_start();

require('../vendor/autoload.php');
require('../config.php');

$app = new \Slim\Slim(array(
  'debug' => true,
  'templates.path' => '../views'
));

$plugins = glob('../plugins/*.plugin.php');
foreach ($plugins as $plugin) {
  require $plugin;
}

$routes = glob('../routes/*.route.php');
foreach ($routes as $route) {
  require $route;
}

$models = glob('../models/*.model.php');
foreach ($models as $model) {
  require $model;
}

$app->add(new Csrf());

$app->run();
?>