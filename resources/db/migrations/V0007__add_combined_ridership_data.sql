CREATE TYPE IF NOT EXISTS service_type_t AS ENUM (
  -- FF(1-7)
  'Bus Rapid Transit',
  -- A, B, G, N
  'Commuter Rail',
  -- C, D, E, F, L, R, W
  'Light Rail',
  'Local',
  -- Both 'Mall' and 'Mall Shuttle' refer to the free mallride, the former was
  -- internally changed to the latter by RTD for 2024 onward
  'Mall',
  'Mall Shuttle',
  'MetroRide',
  'Regional',
  -- ATA
  'SkyRide'
);

CREATE TYPE IF NOT EXISTS service_mode_t AS ENUM (
  'Light Rail',
  'Commuter Rail',
  'Bus',
  'Bus Rapid Transit'
);

CREATE TABLE IF NOT EXISTS combined_ridership_data (
  schedule_name       TEXT            NOT NULL,
  route               TEXT            NOT NULL,
  branch              TEXT            NOT NULL,
  service_type        service_type_t,
  service_mode        service_mode_t  NOT NULL,
  direction_number    INTEGER,
  direction_name      TEXT            NOT NULL,
  trip_id             INTEGER         NOT NULL REFERENCES trips(trip_id),
  time_period         time_of_day_t   NOT NULL,
  sort_order          INTEGER         NOT NULL,
  stop_id             INTEGER         NOT NULL REFERENCES stops(stop_id),
  boardings           INTEGER         NOT NULL,
  alightings          INTEGER         NOT NULL,
  load                INTEGER,
  schedule_year       INTEGER         NOT NULL,
  schedule_month      INTEGER         NOT NULL,
  schedule_days       service_id_t    NOT NULL,
  service_schedule_id TEXT            NOT NULL
);

COMMENT ON COLUMN combined_ridership_data.branch IS 'Prefer this to `route`.';

COMMENT ON COLUMN service_schedule_id IS
  'Convenience column that is concatenation of `schedule_year`_`schedule_month`_`schedule_days`';
