<?php
// bootstrap_doctrine.php
use Doctrine\ORM\Tools\Setup;
use Symfony\Component\Yaml\Parser;
use Doctrine\ORM\EntityManager;

$isDevMode = true;

// database configuration parameters
$conn = array(
    'driver' => 'pdo_mysql',
    'host' => 'localhost',
    'dbname' => 'mula',
    'user' => 'root',
    'password' => '31415926',
    
    
);

$config = Setup::createYAMLMetadataConfiguration(array(__DIR__."/config/yaml"), $isDevMode);
$entityManager = \Doctrine\ORM\EntityManager::create($conn, $config);