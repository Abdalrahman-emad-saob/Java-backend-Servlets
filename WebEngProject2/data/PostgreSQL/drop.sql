-- Drop foreign key constraints
ALTER TABLE IF EXISTS public."Violation"
    DROP CONSTRAINT IF EXISTS "Violation_Media_fkey";

-- Drop tables in reverse order of creation

-- Drop table "Violation"
DROP TABLE IF EXISTS public."Violation";

-- Drop table "Media"
DROP TABLE IF EXISTS public."Media";

-- Drop table "Reporter"
DROP TABLE IF EXISTS public."Reporter";

-- Drop table "City"
DROP TABLE IF EXISTS public."City";

-- Drop table "Country"
DROP TABLE IF EXISTS public."Country";

-- Drop custom types

-- Drop type "ViolationStatus"
DROP TYPE IF EXISTS public."ViolationStatus";

-- Drop type "ViolationType"
DROP TYPE IF EXISTS public."ViolationType";

-- Drop sequences

-- Drop sequence "Violation_ViolationId_seq"
DROP SEQUENCE IF EXISTS public."Violation_ViolationId_seq";

-- Drop sequence "Media_MediaId_seq"
DROP SEQUENCE IF EXISTS public."Media_MediaId_seq";

-- Drop sequence "Reporter_phoneNumber_seq"
DROP SEQUENCE IF EXISTS public."Reporter_phoneNumber_seq";

-- Drop sequence "City_CityId_seq"
DROP SEQUENCE IF EXISTS public."City_CityId_seq";

-- Drop sequence "Country_CountryId_seq"
DROP SEQUENCE IF EXISTS public."Country_CountryId_seq";
