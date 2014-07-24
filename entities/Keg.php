<?php
// Keg.php
class Keg {
    protected $id;
    protected $code;

    public function getId(){
        return $this->id;
    }

    public function getCode(){
        return $this->code;
    }

    public function setCode($code){
        $this->code = $code;
    }
}
