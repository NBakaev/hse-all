CREATE OR REPLACE FUNCTION f_drop_db(dbname text)
  RETURNS integer AS
$func$
BEGIN

IF EXISTS (SELECT 1 FROM pg_database WHERE datname = dbname) THEN
PERFORM dblink_exec('dbname=' || current_database()   -- current db
                     , 'DROP DATABASE ' || quote_ident(dbname));
ELSE
   RAISE NOTICE 'No such database'; 
END IF;
RETURN 1;
END
$func$ LANGUAGE plpgsql;