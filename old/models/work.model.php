<?php
class Work_Model {
  public function getWorkData() {
    $json = file_get_contents('../data/work.json');
    return $json;
  }
}
