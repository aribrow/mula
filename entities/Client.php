<?php
// Client.php
use Doctrine\Common\Collections\ArrayCollection;

class Client {
    protected $id;
    protected $name;

    protected $kegs = null;

    public function __construct(){
        $this->kegs = new ArrayCollection();
    }

    public function getId(){
        return $this->id;
    }

    public function getName(){
        return $this->name;
    }

    public function setName($name){
        $this->name = $name;
    }
}
