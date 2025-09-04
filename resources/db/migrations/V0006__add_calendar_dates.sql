CREATE TYPE IF NOT EXISTS exception_type_t AS ENUM (
  'Service Added'
  'Service Removed'
);

CREATE TABLE IF NOT EXISTS calendar_dates (
  exception_date DATE             NOT NULL,
  exception_type exception_type_t NOT NULL,
  service_id     TEXT             NOT NULL REFERENCES calendar(service_id)
  PRIMARY KEY(service_id, exception_date)
);

COMMENT ON TABLE calendar_dates IS
  'Identifies a set of dates when a service exception occurs for one or more
  routes. If a service_id value appears in both `calendar` and `calendar_dates`,
  the information in `calendar_dates` modifies the service information
  specified in `calendar`.';
