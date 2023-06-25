BEGIN;

-- Type: ViolationStatus
CREATE TYPE public."ViolationStatus" AS ENUM ('APPROVED', 'PENDING', 'REJECTED', 'EXPIRED');
ALTER TYPE public."ViolationStatus" OWNER TO postgres;

-- Type: ViolationType
CREATE TYPE public."ViolationType" AS ENUM ('TRAFFIC_LIGHT', 'STOP_SIGN', 'JAYWALKING', 'LITTERING');
ALTER TYPE public."ViolationType" OWNER TO postgres;

CREATE TABLE IF NOT EXISTS public."City"
(
    "CityId"    serial                            NOT NULL,
    "CityName"  text COLLATE pg_catalog."default" NOT NULL,
    "IsClean"   boolean                           NOT NULL,
    "IsSafe"    boolean                           NOT NULL,
    "IsSane"    boolean                           NOT NULL,
    "CountryId" integer                           NOT NULL,
    CONSTRAINT "City_pkey" PRIMARY KEY ("CityId")
);

CREATE TABLE IF NOT EXISTS public."Country"
(
    "CountryId"   serial                            NOT NULL,
    "CountryName" text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Country_pkey" PRIMARY KEY ("CountryId")
);

CREATE TABLE IF NOT EXISTS public."Reporter"
(
    "blocked"      boolean                           NOT NULL,
    "phoneNumber"  text COLLATE pg_catalog."default" NOT NULL,
    "FalseReports" integer                           NOT NULL,
    CONSTRAINT "Reporter_pkey" PRIMARY KEY ("phoneNumber")
);

CREATE TABLE IF NOT EXISTS public."Media"
(
    "MediaId"   serial NOT NULL,
    "MediaData" bytea  NOT NULL,
    "MediaType" text   NOT NULL,
    CONSTRAINT "Media_pkey" PRIMARY KEY ("MediaId")
);

CREATE TABLE IF NOT EXISTS public."Violation"
(
    "ViolationId"     serial            NOT NULL,
    "ViolationDate"   date              NOT NULL DEFAULT now(),
    "ViolationType"   "ViolationType"   NOT NULL,
    "ViolationStatus" "ViolationStatus" NOT NULL,
    "ReporterNumber"  text              NOT NULL,
    "ViolatedCityId"  integer           NOT NULL,
    "MediaId"         integer           NOT NULL,
    CONSTRAINT "Violation_pkey" PRIMARY KEY ("ViolationId"),
    CONSTRAINT "Violation_Media_fkey" FOREIGN KEY ("MediaId") REFERENCES public."Media" ("MediaId"),
    CONSTRAINT "Violation_Media_uk" UNIQUE ("MediaId")
);

ALTER TABLE IF EXISTS public."City"
    ADD FOREIGN KEY ("CountryId")
        REFERENCES public."Country" ("CountryId") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID;

ALTER TABLE IF EXISTS public."Violation"
    ADD FOREIGN KEY ("ReporterNumber")
        REFERENCES public."Reporter" ("phoneNumber") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID;

ALTER TABLE IF EXISTS public."Violation"
    ADD FOREIGN KEY ("ViolatedCityId")
        REFERENCES public."City" ("CityId") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID;

COMMIT;
