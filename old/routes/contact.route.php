<?php
$app->group('/contact', function() use ($app) {
  $app->get('/', function() use ($app) {
    $app->render('contact.php');
  });
  $app->post('/submit', function($req) use ($app) {

  });
});