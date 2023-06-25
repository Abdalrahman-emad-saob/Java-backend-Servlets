-- -- Insert test data into the "Country" table
-- INSERT INTO public."Country" ("CountryName")
-- VALUES ('Australia');
-- INSERT INTO public."Country" ("CountryName")
-- VALUES ('Germany');
-- INSERT INTO public."Country" ("CountryName")
-- VALUES ('France');
-- INSERT INTO public."Country" ("CountryName")
-- VALUES ('Japan');
-- INSERT INTO public."Country" ("CountryName")
-- VALUES ('Brazil');
-- INSERT INTO public."Country" ("CountryName")
-- VALUES ('India');
-- INSERT INTO public."Country" ("CountryName")
-- VALUES ('Mexico');
-- INSERT INTO public."Country" ("CountryName")
-- VALUES ('Italy');
-- INSERT INTO public."Country" ("CountryName")
-- VALUES ('Spain');
-- INSERT INTO public."Country" ("CountryName")
-- VALUES ('South Africa');
--
-- -- Insert test data into the "City" table
-- -- City names for Australia
-- INSERT INTO public."City" ("CityName", "IsClean", "IsSafe", "IsSane", "CountryId")
-- VALUES ('Sydney', true, true, true, 1);
-- INSERT INTO public."City" ("CityName", "IsClean", "IsSafe", "IsSane", "CountryId")
-- VALUES ('Melbourne', true, true, true, 1);
-- INSERT INTO public."City" ("CityName", "IsClean", "IsSafe", "IsSane", "CountryId")
-- VALUES ('Brisbane', true, true, true, 1);
--
-- -- City names for Germany
-- INSERT INTO public."City" ("CityName", "IsClean", "IsSafe", "IsSane", "CountryId")
-- VALUES ('Berlin', true, true, true, 2);
-- INSERT INTO public."City" ("CityName", "IsClean", "IsSafe", "IsSane", "CountryId")
-- VALUES ('Munich', true, true, true, 2);
-- INSERT INTO public."City" ("CityName", "IsClean", "IsSafe", "IsSane", "CountryId")
-- VALUES ('Hamburg', true, true, true, 2);
--
-- -- City names for France
-- INSERT INTO public."City" ("CityName", "IsClean", "IsSafe", "IsSane", "CountryId")
-- VALUES ('Paris', true, true, true, 3);
-- INSERT INTO public."City" ("CityName", "IsClean", "IsSafe", "IsSane", "CountryId")
-- VALUES ('Marseille', true, true, true, 3);
-- INSERT INTO public."City" ("CityName", "IsClean", "IsSafe", "IsSane", "CountryId")
-- VALUES ('Lyon', true, true, true, 3);
--
-- -- City names for Japan
-- INSERT INTO public."City" ("CityName", "IsClean", "IsSafe", "IsSane", "CountryId")
-- VALUES ('Tokyo', true, true, true, 4);
-- INSERT INTO public."City" ("CityName", "IsClean", "IsSafe", "IsSane", "CountryId")
-- VALUES ('Osaka', true, true, true, 4);
-- INSERT INTO public."City" ("CityName", "IsClean", "IsSafe", "IsSane", "CountryId")
-- VALUES ('Kyoto', true, true, true, 4);
--
-- -- City names for Brazil
-- INSERT INTO public."City" ("CityName", "IsClean", "IsSafe", "IsSane", "CountryId")
-- VALUES ('Sao Paulo', true, true, true, 5);
-- INSERT INTO public."City" ("CityName", "IsClean", "IsSafe", "IsSane", "CountryId")
-- VALUES ('Rio de Janeiro', true, true, true, 5);
-- INSERT INTO public."City" ("CityName", "IsClean", "IsSafe", "IsSane", "CountryId")
-- VALUES ('Brasilia', true, true, true, 5);
--
-- -- City names for India
-- INSERT INTO public."City" ("CityName", "IsClean", "IsSafe", "IsSane", "CountryId")
-- VALUES ('Mumbai', true, true, true, 6);
-- INSERT INTO public."City" ("CityName", "IsClean", "IsSafe", "IsSane", "CountryId")
-- VALUES ('Delhi', true, true, true, 6);
-- INSERT INTO public."City" ("CityName", "IsClean", "IsSafe", "IsSane", "CountryId")
-- VALUES ('Bangalore', true, true, true, 6);
--
-- -- City names for Mexico
-- INSERT INTO public."City" ("CityName", "IsClean", "IsSafe", "IsSane", "CountryId")
-- VALUES ('Mexico City', true, true, true, 7);
-- INSERT INTO public."City" ("CityName", "IsClean", "IsSafe", "IsSane", "CountryId")
-- VALUES ('Guadalajara', true, true, true, 7);
-- INSERT INTO public."City" ("CityName", "IsClean", "IsSafe", "IsSane", "CountryId")
-- VALUES ('Monterrey', true, true, true, 7);
--
-- -- City names for Italy
-- INSERT INTO public."City" ("CityName", "IsClean", "IsSafe", "IsSane", "CountryId")
-- VALUES ('Rome', true, true, true, 8);
-- INSERT INTO public."City" ("CityName", "IsClean", "IsSafe", "IsSane", "CountryId")
-- VALUES ('Milan', true, true, true, 8);
-- INSERT INTO public."City" ("CityName", "IsClean", "IsSafe", "IsSane", "CountryId")
-- VALUES ('Naples', true, true, true, 8);
--
-- -- City names for Spain
-- INSERT INTO public."City" ("CityName", "IsClean", "IsSafe", "IsSane", "CountryId")
-- VALUES ('Madrid', true, true, true, 9);
-- INSERT INTO public."City" ("CityName", "IsClean", "IsSafe", "IsSane", "CountryId")
-- VALUES ('Barcelona', true, true, true, 9);
-- INSERT INTO public."City" ("CityName", "IsClean", "IsSafe", "IsSane", "CountryId")
-- VALUES ('Valencia', true, true, true, 9);
--
-- -- City names for South Africa
-- INSERT INTO public."City" ("CityName", "IsClean", "IsSafe", "IsSane", "CountryId")
-- VALUES ('Johannesburg', true, true, true, 10);
-- INSERT INTO public."City" ("CityName", "IsClean", "IsSafe", "IsSane", "CountryId")
-- VALUES ('Cape Town', true, true, true, 10);
-- INSERT INTO public."City" ("CityName", "IsClean", "IsSafe", "IsSane", "CountryId")
-- VALUES ('Durban', true, true, true, 10);
--
--
-- -- Insert test data into the "Reporter" table
-- -- Sample data for "Reporter" table
-- INSERT INTO public."Reporter" ("phoneNumber", "FalseReports", "blocked")
-- VALUES ('+1234567890', 2, false);
-- INSERT INTO public."Reporter" ("phoneNumber", "FalseReports", "blocked")
-- VALUES ('+9876543210', 1, false);
-- INSERT INTO public."Reporter" ("phoneNumber", "FalseReports", "blocked")
-- VALUES ('+5555555555', 3, true);
-- INSERT INTO public."Reporter" ("phoneNumber", "FalseReports", "blocked")
-- VALUES ('+1111111111', 0, false);
-- INSERT INTO public."Reporter" ("phoneNumber", "FalseReports", "blocked")
-- VALUES ('+9999999999', 2, false);
--


INSERT INTO public."Country" ("CountryName")
VALUES ('CountryA');
INSERT INTO public."Country" ("CountryName")
VALUES ('CountryB');
INSERT INTO public."Country" ("CountryName")
VALUES ('CountryC');
INSERT INTO public."Country" ("CountryName")
VALUES ('CountryD');
INSERT INTO public."Country" ("CountryName")
VALUES ('CountryE');
INSERT INTO public."City" ("CityName", "IsClean", "IsSafe", "IsSane", "CountryId")
VALUES ('CityA', True, True, True, 1);
INSERT INTO public."City" ("CityName", "IsClean", "IsSafe", "IsSane", "CountryId")
VALUES ('CityB', True, True, True, 2);
INSERT INTO public."City" ("CityName", "IsClean", "IsSafe", "IsSane", "CountryId")
VALUES ('CityC', False, True, True, 3);
INSERT INTO public."City" ("CityName", "IsClean", "IsSafe", "IsSane", "CountryId")
VALUES ('CityD', True, True, False, 4);
INSERT INTO public."City" ("CityName", "IsClean", "IsSafe", "IsSane", "CountryId")
VALUES ('CityE', False, False, True, 5);
INSERT INTO public."City" ("CityName", "IsClean", "IsSafe", "IsSane", "CountryId")
VALUES ('CityF', True, True, True, 1);
INSERT INTO public."City" ("CityName", "IsClean", "IsSafe", "IsSane", "CountryId")
VALUES ('CityG', True, True, True, 2);
INSERT INTO public."City" ("CityName", "IsClean", "IsSafe", "IsSane", "CountryId")
VALUES ('CityH', False, True, True, 3);
INSERT INTO public."City" ("CityName", "IsClean", "IsSafe", "IsSane", "CountryId")
VALUES ('CityI', True, True, False, 4);
INSERT INTO public."City" ("CityName", "IsClean", "IsSafe", "IsSane", "CountryId")
VALUES ('CityJ', False, False, True, 5);
INSERT INTO public."City" ("CityName", "IsClean", "IsSafe", "IsSane", "CountryId")
VALUES ('CityK', True, True, True, 1);
INSERT INTO public."City" ("CityName", "IsClean", "IsSafe", "IsSane", "CountryId")
VALUES ('CityL', True, True, True, 2);
INSERT INTO public."City" ("CityName", "IsClean", "IsSafe", "IsSane", "CountryId")
VALUES ('CityL', False, True, True, 3);
INSERT INTO public."City" ("CityName", "IsClean", "IsSafe", "IsSane", "CountryId")
VALUES ('CityM', True, True, False, 4);
INSERT INTO public."City" ("CityName", "IsClean", "IsSafe", "IsSane", "CountryId")
VALUES ('CityN', False, False, True, 5);
INSERT INTO public."City" ("CityName", "IsClean", "IsSafe", "IsSane", "CountryId")
VALUES ('CityO', True, True, True, 1);
INSERT INTO public."City" ("CityName", "IsClean", "IsSafe", "IsSane", "CountryId")
VALUES ('CityP', True, True, True, 2);
INSERT INTO public."City" ("CityName", "IsClean", "IsSafe", "IsSane", "CountryId")
VALUES ('CityQ', False, True, True, 3);
INSERT INTO public."City" ("CityName", "IsClean", "IsSafe", "IsSane", "CountryId")
VALUES ('CityR', True, True, False, 4);
INSERT INTO public."City" ("CityName", "IsClean", "IsSafe", "IsSane", "CountryId")
VALUES ('CityS', False, False, True, 5);
INSERT INTO public."Reporter" ("blocked", "phoneNumber", "FalseReports")
VALUES (False, '1133713293', 1);
INSERT INTO public."Reporter" ("blocked", "phoneNumber", "FalseReports")
VALUES (False, '6349233663', 2);
INSERT INTO public."Reporter" ("blocked", "phoneNumber", "FalseReports")
VALUES (True, '9489891704', 3);
INSERT INTO public."Reporter" ("blocked", "phoneNumber", "FalseReports")
VALUES (False, '3598912739', 0);
INSERT INTO public."Reporter" ("blocked", "phoneNumber", "FalseReports")
VALUES (False, '7933363110', 3);
INSERT INTO public."Reporter" ("blocked", "phoneNumber", "FalseReports")
VALUES (False, '7289320095', 2);
INSERT INTO public."Reporter" ("blocked", "phoneNumber", "FalseReports")
VALUES (False, '4992986191', 2);
INSERT INTO public."Reporter" ("blocked", "phoneNumber", "FalseReports")
VALUES (False, '9051936870', 1);
INSERT INTO public."Reporter" ("blocked", "phoneNumber", "FalseReports")
VALUES (False, '1126491177', 0);
INSERT INTO public."Reporter" ("blocked", "phoneNumber", "FalseReports")
VALUES (True, '1547340562', 3);
INSERT INTO public."Media" ("MediaData", "MediaType")
VALUES ('MediaData1', 'image/jpeg');
INSERT INTO public."Media" ("MediaData", "MediaType")
VALUES ('MediaData2', 'image/jpeg');
INSERT INTO public."Media" ("MediaData", "MediaType")
VALUES ('MediaData3', 'image/jpeg');
INSERT INTO public."Media" ("MediaData", "MediaType")
VALUES ('MediaData4', 'image/jpeg');
INSERT INTO public."Media" ("MediaData", "MediaType")
VALUES ('MediaData5', 'image/jpeg');
INSERT INTO public."Media" ("MediaData", "MediaType")
VALUES ('MediaData6', 'image/jpeg');
INSERT INTO public."Media" ("MediaData", "MediaType")
VALUES ('MediaData7', 'image/jpeg');
INSERT INTO public."Media" ("MediaData", "MediaType")
VALUES ('MediaData8', 'image/jpeg');
INSERT INTO public."Media" ("MediaData", "MediaType")
VALUES ('MediaData9', 'image/jpeg');
INSERT INTO public."Media" ("MediaData", "MediaType")
VALUES ('MediaData10', 'image/jpeg');
INSERT INTO public."Media" ("MediaData", "MediaType")
VALUES ('MediaData11', 'image/jpeg');
INSERT INTO public."Media" ("MediaData", "MediaType")
VALUES ('MediaData12', 'image/jpeg');
INSERT INTO public."Media" ("MediaData", "MediaType")
VALUES ('MediaData13', 'image/jpeg');
INSERT INTO public."Media" ("MediaData", "MediaType")
VALUES ('MediaData1', 'image/jpeg');
INSERT INTO public."Media" ("MediaData", "MediaType")
VALUES ('MediaData2', 'image/jpeg');
INSERT INTO public."Media" ("MediaData", "MediaType")
VALUES ('MediaData3', 'image/jpeg');
INSERT INTO public."Media" ("MediaData", "MediaType")
VALUES ('MediaData4', 'image/jpeg');
INSERT INTO public."Media" ("MediaData", "MediaType")
VALUES ('MediaData5', 'image/jpeg');
INSERT INTO public."Media" ("MediaData", "MediaType")
VALUES ('MediaData6', 'image/jpeg');
INSERT INTO public."Media" ("MediaData", "MediaType")
VALUES ('MediaData7', 'image/jpeg');
INSERT INTO public."Media" ("MediaData", "MediaType")
VALUES ('MediaData8', 'image/jpeg');
INSERT INTO public."Media" ("MediaData", "MediaType")
VALUES ('MediaData9', 'image/jpeg');
INSERT INTO public."Media" ("MediaData", "MediaType")
VALUES ('MediaData10', 'image/jpeg');
INSERT INTO public."Media" ("MediaData", "MediaType")
VALUES ('MediaData11', 'image/jpeg');
INSERT INTO public."Media" ("MediaData", "MediaType")
VALUES ('MediaData12', 'image/jpeg');
INSERT INTO public."Media" ("MediaData", "MediaType")
VALUES ('MediaData13', 'image/jpeg');
INSERT INTO public."Violation" ("ViolationDate", "ViolationType", "ViolationStatus", "ReporterNumber",
                                "ViolatedCityId", "MediaId")
VALUES ('2023-06-03', 'TRAFFIC_LIGHT', 'APPROVED', '7933363110', 2, 1);
INSERT INTO public."Violation" ("ViolationDate", "ViolationType", "ViolationStatus", "ReporterNumber",
                                "ViolatedCityId", "MediaId")
VALUES ('2023-06-03', 'TRAFFIC_LIGHT', 'APPROVED', '7933363110', 2, 2);
INSERT INTO public."Violation" ("ViolationDate", "ViolationType", "ViolationStatus", "ReporterNumber",
                                "ViolatedCityId", "MediaId")
VALUES ('2023-06-03', 'TRAFFIC_LIGHT', 'APPROVED', '7933363110', 2, 3);
INSERT INTO public."Violation" ("ViolationDate", "ViolationType", "ViolationStatus", "ReporterNumber",
                                "ViolatedCityId", "MediaId")
VALUES ('2023-06-03', 'TRAFFIC_LIGHT', 'APPROVED', '7933363110', 2, 4);
INSERT INTO public."Violation" ("ViolationDate", "ViolationType", "ViolationStatus", "ReporterNumber",
                                "ViolatedCityId", "MediaId")
VALUES ('2023-05-03', 'TRAFFIC_LIGHT', 'APPROVED', '7933363110', 2, 5);
INSERT INTO public."Violation" ("ViolationDate", "ViolationType", "ViolationStatus", "ReporterNumber",
                                "ViolatedCityId", "MediaId")
VALUES ('2023-02-03', 'TRAFFIC_LIGHT', 'APPROVED', '7933363110', 2, 6);
INSERT INTO public."Violation" ("ViolationDate", "ViolationType", "ViolationStatus", "ReporterNumber",
                                "ViolatedCityId", "MediaId")
VALUES ('2023-06-03', 'TRAFFIC_LIGHT', 'APPROVED', '7933363110', 2, 7);
INSERT INTO public."Violation" ("ViolationDate", "ViolationType", "ViolationStatus", "ReporterNumber",
                                "ViolatedCityId", "MediaId")
VALUES ('2023-04-03', 'TRAFFIC_LIGHT', 'APPROVED', '7933363110', 2, 8);
INSERT INTO public."Violation" ("ViolationDate", "ViolationType", "ViolationStatus", "ReporterNumber",
                                "ViolatedCityId", "MediaId")
VALUES ('2023-06-03', 'STOP_SIGN', 'PENDING', '7933363110', 2, 9);
INSERT INTO public."Violation" ("ViolationDate", "ViolationType", "ViolationStatus", "ReporterNumber",
                                "ViolatedCityId", "MediaId")
VALUES ('2023-06-03', 'STOP_SIGN', 'APPROVED', '7933363110', 2, 10);
INSERT INTO public."Violation" ("ViolationDate", "ViolationType", "ViolationStatus", "ReporterNumber",
                                "ViolatedCityId", "MediaId")
VALUES ('2023-06-03', 'STOP_SIGN', 'APPROVED', '7933363110', 2, 11);
INSERT INTO public."Violation" ("ViolationDate", "ViolationType", "ViolationStatus", "ReporterNumber",
                                "ViolatedCityId", "MediaId")
VALUES ('2023-06-03', 'STOP_SIGN', 'PENDING', '7933363110', 2, 12);
INSERT INTO public."Violation" ("ViolationDate", "ViolationType", "ViolationStatus", "ReporterNumber",
                                "ViolatedCityId", "MediaId")
VALUES ('2023-06-03', 'TRAFFIC_LIGHT', 'PENDING', '7933363110', 2, 13);
INSERT INTO public."Violation" ("ViolationDate", "ViolationType", "ViolationStatus", "ReporterNumber",
                                "ViolatedCityId", "MediaId")
VALUES ('2023-04-03', 'TRAFFIC_LIGHT', 'APPROVED', '7933363110', 1, 14);
INSERT INTO public."Violation" ("ViolationDate", "ViolationType", "ViolationStatus", "ReporterNumber",
                                "ViolatedCityId", "MediaId")
VALUES ('2023-06-03', 'TRAFFIC_LIGHT', 'APPROVED', '7933363110', 1, 15);
INSERT INTO public."Violation" ("ViolationDate", "ViolationType", "ViolationStatus", "ReporterNumber",
                                "ViolatedCityId", "MediaId")
VALUES ('2023-06-03', 'JAYWALKING', 'APPROVED', '7933363110', 1, 16);
INSERT INTO public."Violation" ("ViolationDate", "ViolationType", "ViolationStatus", "ReporterNumber",
                                "ViolatedCityId", "MediaId")
VALUES ('2023-06-03', 'JAYWALKING', 'APPROVED', '7933363110', 1, 17);
INSERT INTO public."Violation" ("ViolationDate", "ViolationType", "ViolationStatus", "ReporterNumber",
                                "ViolatedCityId", "MediaId")
VALUES ('2023-06-03', 'JAYWALKING', 'APPROVED', '7933363110', 1, 18);
INSERT INTO public."Violation" ("ViolationDate", "ViolationType", "ViolationStatus", "ReporterNumber",
                                "ViolatedCityId", "MediaId")
VALUES ('2023-06-03', 'JAYWALKING', 'APPROVED', '7933363110', 1, 19);
INSERT INTO public."Violation" ("ViolationDate", "ViolationType", "ViolationStatus", "ReporterNumber",
                                "ViolatedCityId", "MediaId")
VALUES ('2023-06-03', 'JAYWALKING', 'APPROVED', '7933363110', 1, 20);
INSERT INTO public."Violation" ("ViolationDate", "ViolationType", "ViolationStatus", "ReporterNumber",
                                "ViolatedCityId", "MediaId")
VALUES ('2023-06-03', 'JAYWALKING', 'APPROVED', '7933363110', 1, 21);
INSERT INTO public."Violation" ("ViolationDate", "ViolationType", "ViolationStatus", "ReporterNumber",
                                "ViolatedCityId", "MediaId")
VALUES ('2023-06-03', 'JAYWALKING', 'PENDING', '7933363110', 1, 22);
INSERT INTO public."Violation" ("ViolationDate", "ViolationType", "ViolationStatus", "ReporterNumber",
                                "ViolatedCityId", "MediaId")
VALUES ('2023-06-03', 'JAYWALKING', 'APPROVED', '7933363110', 1, 23);
INSERT INTO public."Violation" ("ViolationDate", "ViolationType", "ViolationStatus", "ReporterNumber",
                                "ViolatedCityId", "MediaId")
VALUES ('2023-04-03', 'JAYWALKING', 'APPROVED', '7933363110', 1, 24);
INSERT INTO public."Violation" ("ViolationDate", "ViolationType", "ViolationStatus", "ReporterNumber",
                                "ViolatedCityId", "MediaId")
VALUES ('2023-04-03', 'JAYWALKING', 'PENDING', '7933363110', 1, 25);
INSERT INTO public."Violation" ("ViolationDate", "ViolationType", "ViolationStatus", "ReporterNumber",
                                "ViolatedCityId", "MediaId")
VALUES ('2023-06-03', 'JAYWALKING', 'PENDING', '7933363110', 1, 26);

