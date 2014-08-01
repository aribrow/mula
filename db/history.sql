SELECT a.container_id, a.container_name, a.container_type, b.container_id, b.container_name, b.container_type, z.batch_type
FROM container AS a 
LEFT JOIN history AS h ON h.history_source_id = a.container_id
LEFT JOIN container AS b ON h.history_target_id = b.container_id
LEFT JOIN batch AS z ON h.history_batch_id = z.batch_id