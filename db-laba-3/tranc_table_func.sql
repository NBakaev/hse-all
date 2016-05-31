CREATE OR REPLACE FUNCTION f_trancute_table_db(dbname text, table_name text)
  RETURNS integer AS
$func$
BEGIN

IF NOT EXISTS (SELECT 1 FROM pg_database WHERE datname = dbname) THEN
   RAISE NOTICE 'Database not exists'; 
ELSE
   PERFORM dblink_exec('dbname=' || dbname,   -- current db
       'TRUNCATE TABLE ' || quote_ident(table_name) );

END IF;
RETURN 1;
END
$func$ LANGUAGE plpgsql;