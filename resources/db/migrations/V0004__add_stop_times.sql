CREATE TYPE IF NOT EXISTS pickup_dropoff_t AS ENUM (
  'Regularly scheduled'
  'Not available'
  'Must phone agency to arrange'
  'Must coordinate with driver to arrange'
);

CREATE TABLE IF NOT EXISTS stop_times (
	arrival_time	       TEXT             NOT NULL,
	arrival_time_24_hr   TIME             NOT NULL,
	departure_time	     TEXT             NOT NULL,
  departure_time_24_hr TIME             NOT NULL,
	drop_off_type	     pickup_dropoff_t NOT NULL,
	pickup_type	       pickup_dropoff_t NOT NULL,
  route_name           TEXT,
	shape_dist_traveled  REAL,
	stop_headsign	     TEXT,
	stop_id	           INTEGER          NOT NULL REFERENCES stops(stop_id),
	stop_sequence        INTEGER          NOT NULL,
	timepoint	         BOOLEAN,
	trip_id	           INTEGER                   REFERENCES trips(trip_id),
	PRIMARY KEY(trip_id,stop_sequence)
);

COMMENT ON COLUMN stop_times.arrival_time_24_hr IS
  'Like arrival_time but guaranteed to be compliant with 00:00:00-23:59:59
  format in cases where trip spans two days.';

COMMENT ON COLUMN stop_times.stop_sequence IS
  'Order of stops for a particular trip. Must be ascending for a particular trip
  (e.g. start at 1 and increment by 1 for each consecutive stop)';

COMMENT ON COLUMN stop_times.timepoint IS
  'Indicates if arrival and departure times for a stop are strictly adhered to by
  the vehicle (false) or if they are instead approximate and/or interpolated
  times (true). This field allows a GTFS producer to provide interpolated
  stop-times, while indicating that the times are approximate.'
