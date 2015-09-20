<?php

$config['db']['hostname'] = '127.0.0.1';
$config['db']['username'] = 'root';
$config['db']['password'] = 'prosperityis';
$config['db']['database'] = 'trinton_designs';

$config['smtp']['hostname'] = 'smtp.sendgrid.net';
$config['smtp']['username'] = 'killazombiecow';
$config['smtp']['password'] = 'prosperity1';
$config['smtp']['port']     = 587;
$config['smtp']['algo']     = 'tls';
$config['smtp']['from']     = [
  'email' => 'contact@trintondesigns.com',
  'name' => 'Trinton Designs Contact Form'
];
$config['smtp']['emails']   = [
  'sbthat@hotmail.com',
  'justjaaayy@gmail.com'
];