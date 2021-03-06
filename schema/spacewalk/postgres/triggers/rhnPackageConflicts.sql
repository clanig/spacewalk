-- oracle equivalent source sha1 c1da4e12c713dc64e0ca2c379c2edfeba8141e6b

create or replace function rhn_pkg_conflicts_mod_trig_fun() returns trigger as
$$
begin
	new.modified := current_timestamp;
       
	return new;
end;
$$ language plpgsql;

create trigger
rhn_pkg_conflicts_mod_trig
before insert or update on rhnPackageConflicts
for each row
execute procedure rhn_pkg_conflicts_mod_trig_fun();

