BEGIN IF NOT EXISTS (
  SELECT
  FROM
    pg_database
  WHERE
    datname = 'rooms'
) THEN CREATE DATABASE rooms;

END IF;

IF NOT EXISTS (
  SELECT
  FROM
    pg_database
  WHERE
    datname = 'booking'
) THEN CREATE DATABASE booking;

END IF;

IF NOT EXISTS (
  SELECT
  FROM
    pg_database
  WHERE
    datname = 'users'
) THEN CREATE DATABASE users;

END IF;

IF NOT EXISTS (
  SELECT
  FROM
    pg_database
  WHERE
    datname = 'reports'
) THEN CREATE DATABASE reports;

END IF;

IF NOT EXISTS (
  SELECT
  FROM
    pg_database
  WHERE
    datname = 'hosts'
) THEN CREATE DATABASE hosts;

END IF;

IF NOT EXISTS (
  SELECT
  FROM
    pg_database
  WHERE
    datname = 'payments'
) THEN CREATE DATABASE payments;

END IF;

END