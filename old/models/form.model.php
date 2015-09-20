<?php

class Form {

  public function submit($details) {
    global $config;

    $email = '';
    $email .= '<ul>';
    $email .= '<li>Name:' . $details['name'] .'</li><br><br>';
    $email .= '<li>Email: '. $details['emails'] .'</li><br><br>';
    $email .= '<li>Budget: '. $details['budget'] .'</li><br><br>';
    $email .= '<li>Message: <br>'. $details['message'] .'</li>';
    $email .= '</ul>';

    $mail = new PHPMailer();
    $mail->isSMTP();
    $mail->Host = $config['smtp']['hostname'];
    $mail->SMTPAuth = true;
    $mail->Username = $config['smtp']['username'];
    $mail->Password = $config['smtp']['password'];
    $mail->SMTPSecure = $config['smtp']['algo'];
    $mail->Port = $config['smtp']['port'];
    $mail->setFrom($config['smtp']['from']['email'], $config['smtp']['from']['name']);
    foreach($config['smtp']['emails'] as $address) {
        $mail->addAddress($address);
    }
    $mail->WordWrap = 50;
    $mail->isHTML(true);
    $mail->Body = $email;
    $mail->AltBody = $email;
    if($mail->send()) {
        return true;
    }
    return false;
  }

}