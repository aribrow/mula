<?php
require_once "vendor/autoload.php";

require_once "entities/Client.php";
// require_once "entities/Keg.php";
// require_once "entities/";
// bootstrap.php
// Include Composer Autoload (relative to project root).
if(!class_exists("Doctrine\Common\Version", false)) {
    require_once "bootstrap_doctrine.php";
}