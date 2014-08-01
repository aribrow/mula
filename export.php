<?php
$cme = new \Doctrine\ORM\Tools\Export\ClassMetadataExporter();
$exporter = $cme->getExporter('yml', './export/');
