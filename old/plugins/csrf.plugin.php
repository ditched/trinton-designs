<?php

class Csrf extends \Slim\Middleware {

  protected $key = 'csrf_token';

  public function call() {
    $this->app->hook('slim.before', [$this, 'check']);
    $this->next->call();
  }

  public function check() {
    $_SESSION[$this->key] = base64_encode(openssl_random_pseudo_bytes(16));
    
    $token = $_SESSION[$this->key];

    $this->app->view()->appendData([
      'csrf_key' => $this->key,
      'csrf_token' => $token
    ]);
  }

}