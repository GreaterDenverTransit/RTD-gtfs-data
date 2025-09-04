CREATE TABLE IF NOT EXISTS calendar (
  service_id     TEXT    NOT NULL,
  sunday         BOOLEAN NOT NULL,
  monday         BOOLEAN NOT NULL,
  tuesday        BOOLEAN NOT NULL,
  wednesday      BOOLEAN NOT NULL,
  thursday       BOOLEAN NOT NULL,
  friday         BOOLEAN NOT NULL,
  saturday       BOOLEAN NOT NULL,
  start_date     DATE    NOT NULL,
  end_date       DATE    NOT NULL,
  days_in_range  INTEGER NOT NULL,
  weeks_in_range INTEGER NOT NULL,
  PRIMARY KEY(service_id)
);

COMMENT ON COLUMN calendar.service_id IS
  'In format YYYY_MM_WT where WT ∈ {
    SA, SU, WK, FR, MT, BVSD, DPS, DPSWK, P_FriWK, P_MonWK, P_ThFWK, P_ThuWK,
    P_Fri
   }';

COMMENT ON COLUMN calendar.monday IS
  'Indicates whether the service operates on all Mondays in the date range
  specified by the start_date and end_date fields.';

COMMENT ON COLUMN calendar.tuesday IS
  'Same as `monday` but for Tuesdays';

COMMENT ON COLUMN calendar.wednesday IS
  'Same as `monday` but for Wednesdays';

COMMENT ON COLUMN calendar.thursday IS
  'Same as `monday` but for Thursdays';

COMMENT ON COLUMN calendar.friday IS
  'Same as `monday` but for Fridays';

COMMENT ON COLUMN calendar.saturday IS
  'Same as `monday` but for Saturdays';

COMMENT ON COLUMN calendar.sunday IS
  'Same as `monday` but for Sundays';
