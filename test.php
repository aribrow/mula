<?php

//test.php
require_once "bootstrap.php";
header('type','json/text');
$newClient = $_GET['name'];

$client = new Client();
$client->setName($newClient);

$entityManager->persist($client);
$entityManager->flush();


echo json_encode($response);