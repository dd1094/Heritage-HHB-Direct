\connect hhbdirect

ALTER TABLE ONLY operation
ADD CONSTRAINT ck_exclusivite CHECK(
    (chequier_num IS NULL AND carte_num IS NOT NULL)
    OR (chequier_num IS NOT NULL AND carte_num IS NULL)
    OR (chequier_num IS NULL AND carte_num IS NULL)
);