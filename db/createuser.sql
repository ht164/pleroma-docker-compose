CREATE ROLE pleroma;
ALTER ROLE pleroma WITH ENCRYPTED PASSWORD 'pleroma';
GRANT ALL ON ALL tables IN SCHEMA public TO pleroma;
GRANT ALL ON ALL sequences IN SCHEMA public TO pleroma;
ALTER ROLE pleroma LOGIN SUPERUSER;
