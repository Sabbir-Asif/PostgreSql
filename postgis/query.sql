CREATE TABLE global_points (
    id SERIAL PRIMARY KEY,
    name VARCHAR(64),
    location geography(POINT,4326)
  );


DELETE FROM global_points;

INSERT INTO global_points (name, location) VALUES
  ('Dhaka', ST_GeogFromText('SRID=4326;POINT(90.4152 23.8041)')),
  ('Chattogram', ST_GeogFromText('SRID=4326;POINT(91.8349 22.3752)')),
  ('Sirajganj', ST_GeogFromText('SRID=4326;POINT(89.7053 24.4616)')),
  ('Bogura', ST_GeogFromText('SRID=4326;POINT(89.3730 24.8526)')),
  ('Rajshahi', ST_GeogFromText('SRID=4326;POINT(88.6004 24.3746)')),
  ('Cox''s Bazar', ST_GeogFromText('SRID=4326;POINT(92.0061 21.4272)')),
  ('Rangamati', ST_GeogFromText('SRID=4326;POINT(92.1611 22.6620)')),
  ('Sylhet', ST_GeogFromText('SRID=4326;POINT(91.8600 24.9048)')),
  ('Barisal', ST_GeogFromText('SRID=4326;POINT(90.3496 22.7133)')),
  ('Mymensingh', ST_GeogFromText('SRID=4326;POINT(90.4179 24.7460)'));


SELECT * FROM global_points;

SELECT
  name,
  ST_X(location::geometry) AS longitude,
  ST_Y(location::geometry) AS latitude
FROM global_points;


SELECT
  gp.name AS city,
  ST_Distance(dhaka.location, gp.location) / 1000.0 AS distance_km
FROM
  global_points AS gp,
  (SELECT location FROM global_points WHERE name = 'Dhaka') AS dhaka
WHERE
  gp.name <> 'Dhaka'
ORDER BY
  distance_km;
