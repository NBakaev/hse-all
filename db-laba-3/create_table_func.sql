CREATE OR REPLACE FUNCTION f_create_db(dbname text)
  RETURNS integer AS
$func$
BEGIN

IF EXISTS (SELECT 1 FROM pg_database WHERE datname = dbname) THEN
   RAISE NOTICE 'Database already exists'; 
ELSE
   PERFORM dblink_exec('dbname=' || current_database()   -- current db
                     , 'CREATE DATABASE ' || quote_ident(dbname));
END IF;
RETURN 1;
END
$func$ LANGUAGE plpgsql;