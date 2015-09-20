<?php
$app->group('/work', function() use ($app) {
  $app->get('/', function() use ($app) {
    $app->render('work.php');
  });
  $app->post('/data', function() use ($app) {
    $app->response->headers->set('Content-Type', 'application/json');
    $workData = new Work_Model();
    $json = $workData->getWorkData();
    echo $json;
  });
});