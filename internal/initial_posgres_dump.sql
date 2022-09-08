--
-- PostgreSQL database dump
--

-- Dumped from database version 12.0
-- Dumped by pg_dump version 14.4

-- Started on 2022-09-08 23:47:44 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 204 (class 1259 OID 26236)
-- Name: causal_inference_methods; Type: TABLE; Schema: public; Owner: pi
--

CREATE TABLE public.causal_inference_methods (
    method_name text,
    method_id text
);


ALTER TABLE public.causal_inference_methods OWNER TO pi;

--
-- TOC entry 211 (class 1259 OID 26278)
-- Name: countries; Type: TABLE; Schema: public; Owner: pi
--

CREATE TABLE public.countries (
    country_name text
);


ALTER TABLE public.countries OWNER TO pi;

--
-- TOC entry 208 (class 1259 OID 26260)
-- Name: data_models; Type: TABLE; Schema: public; Owner: pi
--

CREATE TABLE public.data_models (
    data_model_name text
);


ALTER TABLE public.data_models OWNER TO pi;

--
-- TOC entry 207 (class 1259 OID 26254)
-- Name: data_types; Type: TABLE; Schema: public; Owner: pi
--

CREATE TABLE public.data_types (
    data_type_name text
);


ALTER TABLE public.data_types OWNER TO pi;

--
-- TOC entry 205 (class 1259 OID 26242)
-- Name: datasets; Type: TABLE; Schema: public; Owner: pi
--

CREATE TABLE public.datasets (
    dataset_name text,
    dataset_id text
);


ALTER TABLE public.datasets OWNER TO pi;

--
-- TOC entry 213 (class 1259 OID 26290)
-- Name: estimation_techniques; Type: TABLE; Schema: public; Owner: pi
--

CREATE TABLE public.estimation_techniques (
    technique_name text
);


ALTER TABLE public.estimation_techniques OWNER TO pi;

--
-- TOC entry 203 (class 1259 OID 26230)
-- Name: extractions; Type: TABLE; Schema: public; Owner: pi
--

CREATE TABLE public.extractions (
    rct_name text,
    extractor text,
    extracted_data text,
    extraction_done double precision
);


ALTER TABLE public.extractions OWNER TO pi;

--
-- TOC entry 210 (class 1259 OID 26272)
-- Name: journals; Type: TABLE; Schema: public; Owner: pi
--

CREATE TABLE public.journals (
    journal_name text
);


ALTER TABLE public.journals OWNER TO pi;

--
-- TOC entry 212 (class 1259 OID 26284)
-- Name: populations; Type: TABLE; Schema: public; Owner: pi
--

CREATE TABLE public.populations (
    population_name text
);


ALTER TABLE public.populations OWNER TO pi;

--
-- TOC entry 206 (class 1259 OID 26248)
-- Name: provenance; Type: TABLE; Schema: public; Owner: pi
--

CREATE TABLE public.provenance (
    provenance_name text
);


ALTER TABLE public.provenance OWNER TO pi;

--
-- TOC entry 202 (class 1259 OID 26224)
-- Name: rcts; Type: TABLE; Schema: public; Owner: pi
--

CREATE TABLE public.rcts (
    rct_name text,
    pending_bskh integer,
    pending_rest integer,
    status integer,
    corresponding_author_name text,
    corresponding_author_email text,
    corresponding_author_first_contact timestamp with time zone,
    corresponding_author_second_contact timestamp with time zone,
    "stringsAsFactors" boolean
);


ALTER TABLE public.rcts OWNER TO pi;

--
-- TOC entry 214 (class 1259 OID 26296)
-- Name: software_languages; Type: TABLE; Schema: public; Owner: pi
--

CREATE TABLE public.software_languages (
    language_name text
);


ALTER TABLE public.software_languages OWNER TO pi;

--
-- TOC entry 215 (class 1259 OID 26302)
-- Name: software_libraries; Type: TABLE; Schema: public; Owner: pi
--

CREATE TABLE public.software_libraries (
    library_name text
);


ALTER TABLE public.software_libraries OWNER TO pi;

--
-- TOC entry 209 (class 1259 OID 26266)
-- Name: vocabs; Type: TABLE; Schema: public; Owner: pi
--

CREATE TABLE public.vocabs (
    vocab_name text
);


ALTER TABLE public.vocabs OWNER TO pi;

--
-- TOC entry 3251 (class 0 OID 26236)
-- Dependencies: 204
-- Data for Name: causal_inference_methods; Type: TABLE DATA; Schema: public; Owner: pi
--

COPY public.causal_inference_methods (method_name, method_id) FROM stdin;
Generalised linear model	4207b4b28a561165d39ccc6b356d063a
Propensity-score based	eb534997fe271c0703bfb43c6189a4df
Stratification-score based	284382ba4a203bbfc506446c390d96f0
Hierarchical modelling	c3e3dc97a7e1b12c29f1d6be1e0a8c51
Counterfactuals-as-missing	345cad85c22a64909fb13edf7bb15c23
Pre-specified DAG	5a00d343e43a009b51d7fd77988890b5
Causal discovery	9efb7d4f820ba903262c3cb87f868ebe
Causal structure learning	04d8e04933bb658b2d53421d0bb118b6
None	6adf97f83acf6453d4a6a4b1070f3754
\.


--
-- TOC entry 3258 (class 0 OID 26278)
-- Dependencies: 211
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: pi
--

COPY public.countries (country_name) FROM stdin;
Andorra
United Arab Emirates
Afghanistan
Antigua and Barbuda
Anguilla
Albania
Armenia
Angola
Antarctica
Argentina
American Samoa
Austria
Australia
Aruba
ï¿½land Islands
Azerbaijan
Bosnia and Herzegovina
Barbados
Bangladesh
Belgium
Burkina Faso
Bulgaria
Bahrain
Burundi
Benin
Saint Barthï¿½lemy
Bermuda
Brunei Darussalam
Bolivia
Caribbean Netherlands
Brazil
Bahamas
Bhutan
Bouvet Island
Botswana
Belarus
Belize
Canada
Cocos (Keeling) Islands
Congo, Democratic Republic of
Central African Republic
Congo
Switzerland
Cï¿½te d'Ivoire
Cook Islands
Chile
Cameroon
China
Colombia
Costa Rica
Cuba
Cape Verde
Curaï¿½ao
Christmas Island
Cyprus
Czech Republic
Germany
Djibouti
Denmark
Dominica
Dominican Republic
Algeria
Ecuador
Estonia
Egypt
Western Sahara
Eritrea
Spain
Ethiopia
Finland
Fiji
Falkland Islands
Micronesia, Federated States of
Faroe Islands
France
Gabon
United Kingdom
Grenada
Georgia
French Guiana
Guernsey
Ghana
Gibraltar
Greenland
Gambia
Guinea
Guadeloupe
Equatorial Guinea
Greece
South Georgia and the South Sandwich Islands
Guatemala
Guam
Guinea-Bissau
Guyana
Hong Kong
Heard and McDonald Islands
Honduras
Croatia
Haiti
Hungary
Indonesia
Ireland
Israel
Isle of Man
India
British Indian Ocean Territory
Iraq
Iran
Iceland
Italy
Jersey
Jamaica
Jordan
Japan
Kenya
Kyrgyzstan
Cambodia
Kiribati
Comoros
Saint Kitts and Nevis
North Korea
South Korea
Kuwait
Cayman Islands
Kazakhstan
Lao People's Democratic Republic
Lebanon
Saint Lucia
Liechtenstein
Sri Lanka
Liberia
Lesotho
Lithuania
Luxembourg
Latvia
Libya
Morocco
Monaco
Moldova
Montenegro
Saint-Martin (France)
Madagascar
Marshall Islands
Macedonia
Mali
Myanmar
Mongolia
Macau
Northern Mariana Islands
Martinique
Mauritania
Montserrat
Malta
Mauritius
Maldives
Malawi
Mexico
Malaysia
Mozambique
Namibia
New Caledonia
Niger
Norfolk Island
Nigeria
Nicaragua
The Netherlands
Norway
Nepal
Nauru
Niue
New Zealand
Oman
Panama
Peru
French Polynesia
Papua New Guinea
Philippines
Pakistan
Poland
St. Pierre and Miquelon
Pitcairn
Puerto Rico
Palestine, State of
Portugal
Palau
Paraguay
Qatar
Rï¿½union
Romania
Serbia
Russian Federation
Rwanda
Saudi Arabia
Solomon Islands
Seychelles
Sudan
Sweden
Singapore
Saint Helena
Slovenia
Svalbard and Jan Mayen Islands
Slovakia
Sierra Leone
San Marino
Senegal
Somalia
Suriname
South Sudan
Sao Tome and Principe
El Salvador
Sint Maarten (Dutch part)
Syria
Swaziland
Turks and Caicos Islands
Chad
French Southern Territories
Togo
Thailand
Tajikistan
Tokelau
Timor-Leste
Turkmenistan
Tunisia
Tonga
Turkey
Trinidad and Tobago
Tuvalu
Taiwan
Tanzania
Ukraine
Uganda
United States Minor Outlying Islands
United States of America
Uruguay
Uzbekistan
Vatican
Saint Vincent and the Grenadines
Venezuela
Virgin Islands (British)
Virgin Islands (U.S.)
Vietnam
Vanuatu
Wallis and Futuna Islands
Samoa
Yemen
Mayotte
South Africa
Zambia
Zimbabwe
Unreported
\.


--
-- TOC entry 3255 (class 0 OID 26260)
-- Dependencies: 208
-- Data for Name: data_models; Type: TABLE DATA; Schema: public; Owner: pi
--

COPY public.data_models (data_model_name) FROM stdin;
OMOP
FIHR
MIMIC-3
MIMIC-4
eICU
Unreported
\.


--
-- TOC entry 3254 (class 0 OID 26254)
-- Dependencies: 207
-- Data for Name: data_types; Type: TABLE DATA; Schema: public; Owner: pi
--

COPY public.data_types (data_type_name) FROM stdin;
Diagnosis codes
Procedure codes
Free text
Biochemistry
Medication
Unreported
\.


--
-- TOC entry 3252 (class 0 OID 26242)
-- Dependencies: 205
-- Data for Name: datasets; Type: TABLE DATA; Schema: public; Owner: pi
--

COPY public.datasets (dataset_name, dataset_id) FROM stdin;
MIMIC-3	64f645e9a85b03c6d5e6a5c5262e6fcc
MIMIC-4	cd8c8d6bce7993101f5ef715c3551c0f
eICU	38a817e4f89988ca216d028f78c9fe2d
None	6adf97f83acf6453d4a6a4b1070f3754
\.


--
-- TOC entry 3260 (class 0 OID 26290)
-- Dependencies: 213
-- Data for Name: estimation_techniques; Type: TABLE DATA; Schema: public; Owner: pi
--

COPY public.estimation_techniques (technique_name) FROM stdin;
Frequentist
Bayesian
Unreported
\.


--
-- TOC entry 3250 (class 0 OID 26230)
-- Dependencies: 203
-- Data for Name: extractions; Type: TABLE DATA; Schema: public; Owner: pi
--

COPY public.extractions (rct_name, extractor, extracted_data, extraction_done) FROM stdin;
65 trial 2020	initial	{"rct_name":"65 trial 2020","doi_principal_report":"10.1001/jama.2020.0930","journal_principal_report":"JAMA","publication_year_principal_report":2020,"n_centres":65,"n_enrolled_participants":2598,"intervention_type":"Management","full_covidence_id":"154522/1909","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%231909","only_covid_patients":"No"}	0
ACCOST-HH 2022	initial	{"rct_name":"ACCOST-HH 2022","doi_principal_report":"10.1016/S2213-2600(21)00439-2","journal_principal_report":"Lancet Respir Med","publication_year_principal_report":2022,"n_centres":4,"n_enrolled_participants":150,"intervention_type":"Drug","full_covidence_id":"154522/7096","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%237096","only_covid_patients":"No"}	0
ACIdoSIS 2021	initial	{"rct_name":"ACIdoSIS 2021","doi_principal_report":"10.1186/s13054-021-03774-4","journal_principal_report":"Crit Care","publication_year_principal_report":2021,"n_centres":12,"n_enrolled_participants":355,"intervention_type":"Drug","full_covidence_id":"154522/6683","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%236683","only_covid_patients":"No"}	0
ACTS 2020	initial	{"rct_name":"ACTS 2020","doi_principal_report":"10.1001/jama.2020.11946","journal_principal_report":"JAMA","publication_year_principal_report":2020,"n_centres":14,"n_enrolled_participants":205,"intervention_type":"Drug","full_covidence_id":"154522/3172","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%233172","only_covid_patients":"No"}	0
Adlbrecht 2020	initial	{"rct_name":"Adlbrecht 2020","full_covidence_id":"154522/2291","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%232291","covidence_id":"2291"}	0
ADRENAL 2018	initial	{"rct_name":"ADRENAL 2018","doi_principal_report":"10.1056/NEJMoa1705835","journal_principal_report":"NEJM","publication_year_principal_report":2018,"n_centres":69,"n_enrolled_participants":3800,"intervention_type":"Drug","full_covidence_id":"154522/4478","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%234478","only_covid_patients":"No"}	0
AdrenOSS-2 2021	initial	{"rct_name":"AdrenOSS-2 2021","doi_principal_report":"10.1007/s00134-021-06537-5","journal_principal_report":"Intensive Care Med","publication_year_principal_report":2021,"n_centres":30,"n_enrolled_participants":301,"intervention_type":"Drug","full_covidence_id":"154522/6728","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%236728","only_covid_patients":"No"}	0
AGATE 2021	initial	{"rct_name":"AGATE 2021","doi_principal_report":"10.1016/j.chest.2021.03.007","journal_principal_report":"Chest","publication_year_principal_report":2021,"n_centres":13,"n_enrolled_participants":437,"intervention_type":"Device","full_covidence_id":"154522/3607","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%233607","only_covid_patients":"No"}	0
AKIKI 2 2021	initial	{"rct_name":"AKIKI 2 2021","doi_principal_report":"10.1016/S0140-6736(21)00350-0","journal_principal_report":"Lancet","publication_year_principal_report":2021,"n_centres":39,"n_enrolled_participants":278,"intervention_type":"Management","full_covidence_id":"154522/3883","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%233883","only_covid_patients":"No"}	0
AKIKI 2016	initial	{"rct_name":"AKIKI 2016","doi_principal_report":"10.1056/NEJMoa1603017","journal_principal_report":"NEJM","publication_year_principal_report":2016,"n_centres":31,"n_enrolled_participants":620,"intervention_type":"Management","full_covidence_id":"154522/4483","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%234483","only_covid_patients":"No"}	0
ALBIOS 2014	initial	{"rct_name":"ALBIOS 2014","doi_principal_report":"10.1056/NEJMoa1305727","full_covidence_id":"154522/5546","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%235546","covidence_id":"5546"}	0
ANALGESIC 2021	initial	{"rct_name":"ANALGESIC 2021","doi_principal_report":"10.1164/rccm.202106-1515OC","journal_principal_report":"Am J Respir Crit Care Med","publication_year_principal_report":2021,"n_centres":2,"n_enrolled_participants":737,"intervention_type":"Drug","full_covidence_id":"154522/6638","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%236638","only_covid_patients":"No"}	0
ANDROMEDA SHOCK 2019	initial	{"rct_name":"ANDROMEDA SHOCK 2019","doi_principal_report":"10.1001/jama.2019.0071","journal_principal_report":"JAMA","publication_year_principal_report":2019,"n_centres":28,"n_enrolled_participants":424,"intervention_type":"Management","full_covidence_id":"154522/315","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%23315","only_covid_patients":"No"}	0
ANTHARTIC 2019	initial	{"rct_name":"ANTHARTIC 2019","doi_principal_report":"10.1056/NEJMoa1812379","journal_principal_report":"NEJM","publication_year_principal_report":2019,"n_centres":16,"n_enrolled_participants":198,"intervention_type":"Drug","full_covidence_id":"154522/1792","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%231792","only_covid_patients":"No"}	0
APROCCHSS 2018	initial	{"rct_name":"APROCCHSS 2018","doi_principal_report":"10.1056/NEJMoa1705716","journal_principal_report":"NEJM","publication_year_principal_report":2018,"n_centres":34,"n_enrolled_participants":1241,"intervention_type":"Drug","full_covidence_id":"154522/5317","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%235317","only_covid_patients":"No"}	0
Arabi 2020	initial	{"rct_name":"Arabi 2020","doi_principal_report":"10.1056/NEJMoa2015294","journal_principal_report":"NEJM","publication_year_principal_report":2020,"n_centres":19,"n_enrolled_participants":95,"intervention_type":"Drug","full_covidence_id":"154522/3444","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%233444","only_covid_patients":"No"}	0
ARISE 2014	initial	{"rct_name":"ARISE 2014","doi_principal_report":"10.1056/NEJMoa1404380","journal_principal_report":"NEJM","publication_year_principal_report":2014,"n_centres":51,"n_enrolled_participants":1600,"intervention_type":"Management","full_covidence_id":"154522/640","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%23640","only_covid_patients":"No"}	0
ASPECT-NP 2019	initial	{"rct_name":"ASPECT-NP 2019","doi_principal_report":"10.1016/S1473-3099(19)30403-7","full_covidence_id":"154522/6434","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%236434","covidence_id":"6434"}	0
Atan 2018	initial	{"rct_name":"Atan 2018","doi_principal_report":"10.1097/CCM.0000000000003350","journal_principal_report":"Crit Care Med","publication_year_principal_report":2018,"n_centres":1,"n_enrolled_participants":76,"intervention_type":"Device","full_covidence_id":"154522/5051","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%235051","only_covid_patients":"No"}	0
ATESS 2020	initial	{"rct_name":"ATESS 2020","doi_principal_report":"10.1007/s00134-020-06191-3","journal_principal_report":"Intensive Care Med","publication_year_principal_report":2020,"n_centres":4,"n_enrolled_participants":116,"intervention_type":"Drug","full_covidence_id":"154522/3143","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%233143","only_covid_patients":"No"}	0
ATHOS-3 2017	initial	{"rct_name":"ATHOS-3 2017","doi_principal_report":"10.1056/NEJMoa1704154","full_covidence_id":"154522/2886","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%232886","covidence_id":"2886"}	0
BACLOREA 2021	initial	{"rct_name":"BACLOREA 2021","doi_principal_report":"10.1001/jama.2021.0658","journal_principal_report":"JAMA","publication_year_principal_report":2021,"n_centres":18,"n_enrolled_participants":314,"intervention_type":"Drug","full_covidence_id":"154522/4150","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%234150","only_covid_patients":"No"}	0
Barrett 2022	initial	{"rct_name":"Barrett 2022","doi_principal_report":"10.1016/j.chest.2021.09.024","journal_principal_report":"Chest","publication_year_principal_report":2022,"n_centres":8,"n_enrolled_participants":50,"intervention_type":"Drug","full_covidence_id":"154522/6710","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%236710","only_covid_patients":"Yes"}	0
BaSICs 2021	initial	{"rct_name":"BaSICs 2021","doi_principal_report":"10.1001/jama.2021.11444","journal_principal_report":"JAMA","publication_year_principal_report":2021,"n_centres":75,"n_enrolled_participants":11052,"intervention_type":"Drug","full_covidence_id":"154522/6655","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%236655","only_covid_patients":"No"}	0
Beitler 2019	initial	{"rct_name":"Beitler 2019","doi_principal_report":"10.1001/jama.2019.0555","journal_principal_report":"JAMA","publication_year_principal_report":2019,"n_centres":14,"n_enrolled_participants":202,"intervention_type":"Management","full_covidence_id":"154522/317","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%23317","only_covid_patients":"No"}	0
Benitez-Cano 2020	initial	{"rct_name":"Benitez-Cano 2020","full_covidence_id":"154522/1931","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%231931","covidence_id":"1931"}	0
BICAR-ICU 2018	initial	{"rct_name":"BICAR-ICU 2018","doi_principal_report":"10.1016/S0140-6736(18)31080-8","journal_principal_report":"Lancet","publication_year_principal_report":2018,"n_centres":26,"n_enrolled_participants":400,"intervention_type":"Drug","full_covidence_id":"154522/4763","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%234763","only_covid_patients":"No"}	0
Borges 2020	initial	{"rct_name":"Borges 2020","full_covidence_id":"154522/2478","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%232478","covidence_id":"2478"}	0
BOUGIE 2021	initial	{"rct_name":"BOUGIE 2021","doi_principal_report":"10.1001/jama.2021.22002","journal_principal_report":"JAMA","publication_year_principal_report":2021,"n_centres":15,"n_enrolled_participants":1106,"intervention_type":"Device","full_covidence_id":"154522/7072","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%237072","only_covid_patients":"No"}	0
BPCTrea 2018	initial	{"rct_name":"BPCTrea 2018","full_covidence_id":"154522/4894","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%234894","covidence_id":"4894"}	0
BREATHE 2022	initial	{"rct_name":"BREATHE 2022","doi_principal_report":"10.1164/rccm.202108-1859OC","journal_principal_report":"Am J Respir Crit Care Med","publication_year_principal_report":2022,"n_centres":21,"n_enrolled_participants":227,"intervention_type":"Drug","full_covidence_id":"154522/7523","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%237523","only_covid_patients":"Yes"}	0
Buchtele 2022	initial	{"rct_name":"Buchtele 2022","full_covidence_id":"154522/7684","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%237684","covidence_id":"7684"}	0
Campos 2022	initial	{"rct_name":"Campos 2022","doi_principal_report":"10.1097/CCM.0000000000005557","journal_principal_report":"Crit Care Med","publication_year_principal_report":2022,"n_centres":1,"n_enrolled_participants":139,"intervention_type":"Management","full_covidence_id":"154522/7666","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%237666","only_covid_patients":"No"}	0
CAPE COVID 2020	initial	{"rct_name":"CAPE COVID 2020","doi_principal_report":"10.1001/jama.2020.16761","journal_principal_report":"JAMA","publication_year_principal_report":2020,"n_centres":9,"n_enrolled_participants":149,"intervention_type":"Drug","full_covidence_id":"154522/2915","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%232915","only_covid_patients":"Yes"}	0
CAPITAL CHILL 2021	initial	{"rct_name":"CAPITAL CHILL 2021","doi_principal_report":"10.1001/jama.2021.15703","journal_principal_report":"JAMA","publication_year_principal_report":2021,"n_centres":1,"n_enrolled_participants":389,"intervention_type":"Management","full_covidence_id":"154522/6809","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%236809","only_covid_patients":"No"}	0
Carteron 2021	initial	{"rct_name":"Carteron 2021","full_covidence_id":"154522/3345","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%233345","covidence_id":"3345"}	0
CASS 2018	initial	{"rct_name":"CASS 2018","doi_principal_report":"10.1016/S2213-2600(18)30004-3","journal_principal_report":"Lancet Respir Med","publication_year_principal_report":2018,"n_centres":10,"n_enrolled_participants":436,"intervention_type":"Management","full_covidence_id":"154522/4456","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%234456","only_covid_patients":"No"}	0
Chang 2020	initial	{"rct_name":"Chang 2020","full_covidence_id":"154522/2088","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%232088","covidence_id":"2088"}	0
CHARLI 2021	initial	{"rct_name":"CHARLI 2021","doi_principal_report":"10.1016/S2213-2600(20)30470-7","journal_principal_report":"Lancet Respir Med","publication_year_principal_report":2021,"n_centres":9,"n_enrolled_participants":256,"intervention_type":"Drug","full_covidence_id":"154522/3366","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%233366","only_covid_patients":"No"}	0
Check-UP 2018	initial	{"rct_name":"Check-UP 2018","doi_principal_report":"10.1016/j.chest.2017.08.1163","journal_principal_report":"Chest","publication_year_principal_report":2018,"n_centres":5,"n_enrolled_participants":267,"intervention_type":"Management","full_covidence_id":"154522/4559","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%234559","only_covid_patients":"No"}	0
Chlan 2014	initial	{"rct_name":"Chlan 2014","doi_principal_report":"10.1001/jama.2013.5670","journal_principal_report":"JAMA","publication_year_principal_report":2014,"n_centres":12,"n_enrolled_participants":373,"intervention_type":"Device","full_covidence_id":"154522/4973","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%234973","only_covid_patients":"No"}	0
CHORAL 2021	initial	{"rct_name":"CHORAL 2021","full_covidence_id":"154522/6746","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%236746","covidence_id":"6746"}	0
CIGMA 2018	initial	{"rct_name":"CIGMA 2018","doi_principal_report":"10.1007/s00134-018-5143-7","journal_principal_report":"Intensive Care Med","publication_year_principal_report":2018,"n_centres":24,"n_enrolled_participants":160,"intervention_type":"Drug","full_covidence_id":"154522/4870","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%234870","only_covid_patients":"No"}	0
CITRIS-ALI 2019	initial	{"rct_name":"CITRIS-ALI 2019","doi_principal_report":"10.1001/jama.2019.11825","journal_principal_report":"JAMA","publication_year_principal_report":2019,"n_centres":7,"n_enrolled_participants":170,"intervention_type":"Drug","full_covidence_id":"154522/1202","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%231202","only_covid_patients":"No"}	0
CO-ILEPSS 2019	initial	{"rct_name":"CO-ILEPSS 2019","full_covidence_id":"154522/1543","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%231543","covidence_id":"1543"}	0
COBI 2021	initial	{"rct_name":"COBI 2021","doi_principal_report":"10.1001/jama.2021.5561","journal_principal_report":"JAMA","publication_year_principal_report":2021,"n_centres":9,"n_enrolled_participants":370,"intervention_type":"Drug","full_covidence_id":"154522/4292","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%234292","only_covid_patients":"No"}	0
CoDEX 2020	initial	{"rct_name":"CoDEX 2020","doi_principal_report":"10.1001/jama.2020.17021","journal_principal_report":"JAMA","publication_year_principal_report":2020,"n_centres":41,"n_enrolled_participants":299,"intervention_type":"Drug","full_covidence_id":"154522/2918","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%232918","only_covid_patients":"Yes"}	0
COMACARE 2018	initial	{"rct_name":"COMACARE 2018","doi_principal_report":"10.1007/s00134-018-5446-8","journal_principal_report":"Intensive Care Med","publication_year_principal_report":2018,"n_centres":6,"n_enrolled_participants":123,"intervention_type":"Management","full_covidence_id":"154522/53","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%2353","only_covid_patients":"No"}	0
COMBAT-COVID 2022	initial	{"rct_name":"COMBAT-COVID 2022","doi_principal_report":"10.1164/rccm.202108-1855OC","journal_principal_report":"Am J Respir Crit Care Med","publication_year_principal_report":2022,"n_centres":5,"n_enrolled_participants":80,"intervention_type":"Drug","full_covidence_id":"154522/7001","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%237001","only_covid_patients":"Yes"}	0
COMPACT-2 2021	initial	{"rct_name":"COMPACT-2 2021","doi_principal_report":"10.1007/s00134-021-06501-3","journal_principal_report":"Intensive Care Med","publication_year_principal_report":2021,"n_centres":12,"n_enrolled_participants":115,"intervention_type":"Management","full_covidence_id":"154522/6725","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%236725","only_covid_patients":"No"}	0
CONTROLING 2021	initial	{"rct_name":"CONTROLING 2021","full_covidence_id":"154522/6709","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%236709","covidence_id":"6709"}	0
Corti-TC 2014	initial	{"rct_name":"Corti-TC 2014","doi_principal_report":"10.1016/S2213-2600(14)70144-4","full_covidence_id":"154522/1595","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%231595","covidence_id":"1595"}	0
COV-AID 2021	initial	{"rct_name":"COV-AID 2021","doi_principal_report":"10.1016/S2213-2600(21)00377-5","journal_principal_report":"Lancet Respir Med","publication_year_principal_report":2021,"n_centres":16,"n_enrolled_participants":342,"intervention_type":"Drug","full_covidence_id":"154522/6918","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%236918","only_covid_patients":"Yes"}	0
COV-BARRIER 2022	initial	{"rct_name":"COV-BARRIER 2022","doi_principal_report":"10.1016/S2213-2600(22)00006-6","journal_principal_report":"Lancet Respir Med","publication_year_principal_report":2022,"n_centres":18,"n_enrolled_participants":101,"intervention_type":"Drug","full_covidence_id":"154522/7347","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%237347","only_covid_patients":"Yes"}	0
COVID STEROID 2 2021	initial	{"rct_name":"COVID STEROID 2 2021","doi_principal_report":"10.1001/jama.2021.18295","journal_principal_report":"JAMA","publication_year_principal_report":2021,"n_centres":31,"n_enrolled_participants":1000,"intervention_type":"Drug","full_covidence_id":"154522/6835","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%236835","only_covid_patients":"Yes"}	0
COVINTOC 2021	initial	{"rct_name":"COVINTOC 2021","doi_principal_report":"10.1016/S2213-2600(21)00081-3","journal_principal_report":"Lancet Respir Med","publication_year_principal_report":2021,"n_centres":12,"n_enrolled_participants":180,"intervention_type":"Drug","full_covidence_id":"154522/4221","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%234221","only_covid_patients":"Yes"}	0
CYCOV 2021	initial	{"rct_name":"CYCOV 2021","full_covidence_id":"154522/4076","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%234076","covidence_id":"4076"}	0
CytoResc 2022	initial	{"rct_name":"CytoResc 2022","full_covidence_id":"154522/7367","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%237367","covidence_id":"7367"}	0
Dadam 2021	initial	{"rct_name":"Dadam 2021","full_covidence_id":"154522/4226","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%234226","covidence_id":"4226"}	0
deGrooth 2018	initial	{"rct_name":"deGrooth 2018","full_covidence_id":"154522/5363","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%235363","covidence_id":"5363"}	0
DESIRE 2017	initial	{"rct_name":"DESIRE 2017","doi_principal_report":"10.1001/jama.2017.2088","journal_principal_report":"JAMA","publication_year_principal_report":2017,"n_centres":8,"n_enrolled_participants":201,"intervention_type":"Drug","full_covidence_id":"154522/3138","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%233138","only_covid_patients":"No"}	0
deVries 2022	initial	{"rct_name":"deVries 2022","full_covidence_id":"154522/7314","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%237314","covidence_id":"7314"}	0
DEXACET 2019	initial	{"rct_name":"DEXACET 2019","doi_principal_report":"10.1001/jama.2019.0234","journal_principal_report":"JAMA","publication_year_principal_report":2019,"n_centres":1,"n_enrolled_participants":121,"intervention_type":"Drug","full_covidence_id":"154522/325","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%23325","only_covid_patients":"No"}	0
Doig 2015	initial	{"rct_name":"Doig 2015","doi_principal_report":"10.1007/s00134-015-3827-9","journal_principal_report":"Intensive Care Med","publication_year_principal_report":2015,"n_centres":16,"n_enrolled_participants":474,"intervention_type":"Drug","full_covidence_id":"154522/4623","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%234623","only_covid_patients":"No"}	0
DOREMI 2021	initial	{"rct_name":"DOREMI 2021","full_covidence_id":"154522/6379","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%236379","covidence_id":"6379"}	0
Douglas 2010	initial	{"rct_name":"Douglas 2010","full_covidence_id":"154522/2209","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%232209","covidence_id":"2209"}	0
DOVSS 2018	initial	{"rct_name":"DOVSS 2018","full_covidence_id":"154522/4641","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%234641","covidence_id":"4641"}	0
Drewry 2022	initial	{"rct_name":"Drewry 2022","doi_principal_report":"10.1097/CCM.0000000000005470","journal_principal_report":"Crit Care Med","publication_year_principal_report":2022,"n_centres":1,"n_enrolled_participants":56,"intervention_type":"Management","full_covidence_id":"154522/7337","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%237337","only_covid_patients":"No"}	0
DURAPOP 2018	initial	{"rct_name":"DURAPOP 2018","full_covidence_id":"154522/5748","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%235748","covidence_id":"5748"}	0
ECMO-PT 2020	initial	{"rct_name":"ECMO-PT 2020","doi_principal_report":"10.1007/s00134-020-05994-8","journal_principal_report":"Intensive Care Med","publication_year_principal_report":2020,"n_centres":3,"n_enrolled_participants":20,"intervention_type":"Management","full_covidence_id":"154522/1974","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%231974","only_covid_patients":"No"}	0
Ehrmann 2021	initial	{"rct_name":"Ehrmann 2021","full_covidence_id":"154522/6483","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%236483","covidence_id":"6483"}	0
EOLIA 2018	initial	{"rct_name":"EOLIA 2018","doi_principal_report":"10.1056/NEJMoa1800385","journal_principal_report":"NEJM","publication_year_principal_report":2018,"n_centres":64,"n_enrolled_participants":249,"intervention_type":"Device","full_covidence_id":"154522/4650","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%234650","only_covid_patients":"No"}	0
ETTS 2019	initial	{"rct_name":"ETTS 2019","full_covidence_id":"154522/761","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%23761","covidence_id":"761"}	0
EUPHRATES 2018	initial	{"rct_name":"EUPHRATES 2018","doi_principal_report":"10.1001/jama.2018.14618","journal_principal_report":"JAMA","publication_year_principal_report":2018,"n_centres":55,"n_enrolled_participants":450,"intervention_type":"Drug","full_covidence_id":"154522/5623","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%235623","only_covid_patients":"No"}	0
EvK Clinical Trial 2022	initial	{"rct_name":"EvK Clinical Trial 2022","full_covidence_id":"154522/7103","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%237103","covidence_id":"7103"}	0
FIBRES 2019	initial	{"rct_name":"FIBRES 2019","full_covidence_id":"154522/1296","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%231296","covidence_id":"1296"}	0
FLORALI-2 2019	initial	{"rct_name":"FLORALI-2 2019","full_covidence_id":"154522/573","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%23573","covidence_id":"573"}	0
FLORALI-IM 2022	initial	{"rct_name":"FLORALI-IM 2022","doi_principal_report":"10.1016/S2213-2600(22)00096-0","journal_principal_report":"Lancet Respir Med","publication_year_principal_report":2022,"n_centres":29,"n_enrolled_participants":300,"intervention_type":"Device","full_covidence_id":"154522/7574","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%237574","only_covid_patients":"No"}	0
Fluids After Bypass Study 2021	initial	{"rct_name":"Fluids After Bypass Study 2021","doi_principal_report":"10.1097/CCM.0000000000004883","journal_principal_report":"Crit Care Med","publication_year_principal_report":2021,"n_centres":5,"n_enrolled_participants":715,"intervention_type":"Drug","full_covidence_id":"154522/3390","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%233390","only_covid_patients":"No"}	0
Fossat 2018	initial	{"rct_name":"Fossat 2018","doi_principal_report":"10.1001/jama.2018.9592","journal_principal_report":"JAMA","publication_year_principal_report":2018,"n_centres":1,"n_enrolled_participants":314,"intervention_type":"Management","full_covidence_id":"154522/5013","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%235013","only_covid_patients":"No"}	0
Francois 2018	initial	{"rct_name":"Francois 2018","full_covidence_id":"154522/5666","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%235666","covidence_id":"5666"}	0
Francois 2020	initial	{"rct_name":"Francois 2020","doi_principal_report":"10.1007/s00134-020-06109-z","journal_principal_report":"Intensive Care Med","publication_year_principal_report":2020,"n_centres":11,"n_enrolled_participants":50,"intervention_type":"Drug","full_covidence_id":"154522/2460","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%232460","only_covid_patients":"No"}	0
FROST-I 2018	initial	{"rct_name":"FROST-I 2018","doi_principal_report":"10.1007/s00134-018-5256-z","journal_principal_report":"Intensive Care Med","publication_year_principal_report":2018,"n_centres":16,"n_enrolled_participants":150,"intervention_type":"Management","full_covidence_id":"154522/5667","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%235667","only_covid_patients":"No"}	0
Gandolfi 2020	initial	{"rct_name":"Gandolfi 2020","full_covidence_id":"154522/3075","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%233075","covidence_id":"3075"}	0
Garrouste-Orgeas 2019	initial	{"rct_name":"Garrouste-Orgeas 2019","doi_principal_report":"10.1001/jama.2019.9058","journal_principal_report":"JAMA","publication_year_principal_report":2019,"n_centres":35,"n_enrolled_participants":657,"intervention_type":"Management","full_covidence_id":"154522/1063","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%231063","only_covid_patients":"No"}	0
Gehlbach 2018	initial	{"rct_name":"Gehlbach 2018","full_covidence_id":"154522/5372","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%235372","covidence_id":"5372"}	0
Gelissen 2021	initial	{"rct_name":"Gelissen 2021","doi_principal_report":"10.1001/jama.2021.13011","journal_principal_report":"JAMA","publication_year_principal_report":2021,"n_centres":4,"n_enrolled_participants":574,"intervention_type":"Drug","full_covidence_id":"154522/6530","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%236530","only_covid_patients":"No"}	0
Georgevici 2021	initial	{"rct_name":"Georgevici 2021","full_covidence_id":"154522/3909","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%233909","covidence_id":"3909"}	0
Gobatto 2019	initial	{"rct_name":"Gobatto 2019","doi_principal_report":"10.1186/s13054-018-2273-9","journal_principal_report":"Crit Care","publication_year_principal_report":2019,"n_centres":2,"n_enrolled_participants":47,"intervention_type":"Drug","full_covidence_id":"154522/527","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%23527","only_covid_patients":"No"}	0
Grifols Antithrombin Research Award study 2020	initial	{"rct_name":"Grifols Antithrombin Research Award study 2020","full_covidence_id":"154522/3026","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%233026","covidence_id":"3026"}	0
Guimaraes 2021	initial	{"rct_name":"Guimaraes 2021","full_covidence_id":"154522/3760","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%233760","covidence_id":"3760"}	0
Guinot 2020	initial	{"rct_name":"Guinot 2020","full_covidence_id":"154522/2754","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%232754","covidence_id":"2754"}	0
Hadfield 2020	initial	{"rct_name":"Hadfield 2020","doi_principal_report":"10.1186/s13054-020-02923-5","journal_principal_report":"Crit Care","publication_year_principal_report":2020,"n_centres":4,"n_enrolled_participants":78,"intervention_type":"Device","full_covidence_id":"154522/2372","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%232372","only_covid_patients":"No"}	0
HARP-2 2014	initial	{"rct_name":"HARP-2 2014","doi_principal_report":"10.1056/NEJMoa1403285","journal_principal_report":"NEJM","publication_year_principal_report":2014,"n_centres":40,"n_enrolled_participants":540,"intervention_type":"Drug","full_covidence_id":"154522/5055","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%235055","only_covid_patients":"No"}	0
Hassan 2018	initial	{"rct_name":"Hassan 2018","doi_principal_report":"10.1097/CCM.0000000000002695","journal_principal_report":"Crit Care Med","publication_year_principal_report":2018,"n_centres":1,"n_enrolled_participants":133,"intervention_type":"Drug","full_covidence_id":"154522/4547","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%234547","only_covid_patients":"No"}	0
He 2019	initial	{"rct_name":"He 2019","full_covidence_id":"154522/1537","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%231537","covidence_id":"1537"}	0
He 2021	initial	{"rct_name":"He 2021","doi_principal_report":"10.1186/s13054-021-03645-y","journal_principal_report":"Crit Care","publication_year_principal_report":2021,"n_centres":1,"n_enrolled_participants":126,"intervention_type":"Device","full_covidence_id":"154522/6193","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%236193","only_covid_patients":"No"}	0
HELP-ECMO 2019	initial	{"rct_name":"HELP-ECMO 2019","full_covidence_id":"154522/697","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%23697","covidence_id":"697"}	0
HENIVOT 2021	initial	{"rct_name":"HENIVOT 2021","doi_principal_report":"10.1001/jama.2021.4682","journal_principal_report":"JAMA","publication_year_principal_report":2021,"n_centres":4,"n_enrolled_participants":110,"intervention_type":"Device","full_covidence_id":"154522/3659","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%233659","only_covid_patients":"Yes"}	0
HERACLES 2020	initial	{"rct_name":"HERACLES 2020","full_covidence_id":"154522/2809","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%232809","covidence_id":"2809"}	0
HiFLo-COVID 2021	initial	{"rct_name":"HiFLo-COVID 2021","doi_principal_report":"10.1001/jama.2021.20714","journal_principal_report":"JAMA","publication_year_principal_report":2021,"n_centres":3,"n_enrolled_participants":250,"intervention_type":"Device","full_covidence_id":"154522/7056","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%237056","only_covid_patients":"Yes"}	0
HIGH 2018	initial	{"rct_name":"HIGH 2018","full_covidence_id":"154522/5693","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%235693","covidence_id":"5693"}	0
HIGH-WEAN 2018	initial	{"rct_name":"HIGH-WEAN 2018","full_covidence_id":"154522/1215","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%231215","covidence_id":"1215"}	0
Hirshberg 2018	initial	{"rct_name":"Hirshberg 2018","doi_principal_report":"10.1097/CCM.0000000000003437","journal_principal_report":"Crit Care Med","publication_year_principal_report":2018,"n_centres":4,"n_enrolled_participants":52,"intervention_type":"Management","full_covidence_id":"154522/5565","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%235565","only_covid_patients":"No"}	0
Ho 2019	initial	{"rct_name":"Ho 2019","full_covidence_id":"154522/1006","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%231006","covidence_id":"1006"}	0
HOT-ICU 2021	initial	{"rct_name":"HOT-ICU 2021","doi_principal_report":"10.1056/NEJMoa2032510","journal_principal_report":"NEJM","publication_year_principal_report":2021,"n_centres":35,"n_enrolled_participants":2928,"intervention_type":"Drug","full_covidence_id":"154522/3343","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%233343","only_covid_patients":"No"}	0
Hotchkiss 2019	initial	{"rct_name":"Hotchkiss 2019","full_covidence_id":"154522/1208","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%231208","covidence_id":"1208"}	0
Hotchkiss 2019	initial	{"rct_name":"Hotchkiss 2019","full_covidence_id":"154522/287","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%23287","covidence_id":"287"}	0
Hu 2018	initial	{"rct_name":"Hu 2018","full_covidence_id":"154522/72","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%2372","covidence_id":"72"}	0
HYPERION 2019	initial	{"rct_name":"HYPERION 2019","doi_principal_report":"10.1056/NEJMoa1906661","journal_principal_report":"NEJM","publication_year_principal_report":2019,"n_centres":25,"n_enrolled_participants":584,"intervention_type":"Management","full_covidence_id":"154522/1217","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%231217","only_covid_patients":"No"}	0
HYPERS2S 2017	initial	{"rct_name":"HYPERS2S 2017","doi_principal_report":"10.1016/S2213-2600(17)30046-2","journal_principal_report":"Lancet Respir Med","publication_year_principal_report":2017,"n_centres":22,"n_enrolled_participants":442,"intervention_type":"Drug","full_covidence_id":"154522/1946","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%231946","only_covid_patients":"No"}	0
HYPO-ECMO 2022	initial	{"rct_name":"HYPO-ECMO 2022","doi_principal_report":"10.1001/jama.2021.24776","journal_principal_report":"JAMA","publication_year_principal_report":2022,"n_centres":20,"n_enrolled_participants":374,"intervention_type":"Management","full_covidence_id":"154522/7321","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%237321","only_covid_patients":"No"}	0
Ibarra-Estrada 2022	initial	{"rct_name":"Ibarra-Estrada 2022","doi_principal_report":"10.1097/CCM.0000000000005312","journal_principal_report":"Crit Care Med","publication_year_principal_report":2022,"n_centres":1,"n_enrolled_participants":101,"intervention_type":"Device","full_covidence_id":"154522/6713","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%236713","only_covid_patients":"Yes"}	0
ICAR 2022	initial	{"rct_name":"ICAR 2022","doi_principal_report":"10.1016/S2213-2600(21)00440-9","journal_principal_report":"Lancet Respir Med","publication_year_principal_report":2022,"n_centres":43,"n_enrolled_participants":146,"intervention_type":"Drug","full_covidence_id":"154522/6946","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%236946","only_covid_patients":"Yes"}	0
ICU Visits 2019	initial	{"rct_name":"ICU Visits 2019","doi_principal_report":"10.1001/jama.2019.8766","journal_principal_report":"JAMA","publication_year_principal_report":2019,"n_centres":36,"n_enrolled_participants":1685,"intervention_type":"Management","full_covidence_id":"154522/1062","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%231062","only_covid_patients":"No"}	0
ICU-ROX 2020	initial	{"rct_name":"ICU-ROX 2020","doi_principal_report":"10.1056/NEJMoa1903297","journal_principal_report":"NEJM","publication_year_principal_report":2020,"n_centres":21,"n_enrolled_participants":1000,"intervention_type":"Drug","full_covidence_id":"154522/1263","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%231263","only_covid_patients":"No"}	0
IDEAL-ICU 2018	initial	{"rct_name":"IDEAL-ICU 2018","doi_principal_report":"10.1056/NEJMoa1803213","journal_principal_report":"NEJM","publication_year_principal_report":2018,"n_centres":29,"n_enrolled_participants":488,"intervention_type":"Management","full_covidence_id":"154522/5626","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%235626","only_covid_patients":"No"}	0
INSPIRATION 2021	initial	{"rct_name":"INSPIRATION 2021","doi_principal_report":"10.1001/jama.2021.4152","journal_principal_report":"JAMA","publication_year_principal_report":2021,"n_centres":10,"n_enrolled_participants":600,"intervention_type":"Drug","full_covidence_id":"154522/3627","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%233627","only_covid_patients":"Yes"}	0
INSPIRATION-S 2022	initial	{"rct_name":"INSPIRATION-S 2022","doi_principal_report":"10.1136/bmj-2021-068407","journal_principal_report":"BMJ","publication_year_principal_report":2022,"n_centres":11,"n_enrolled_participants":605,"intervention_type":"Drug","full_covidence_id":"154522/7199","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%237199","only_covid_patients":"Yes"}	0
INTEREST 2020	initial	{"rct_name":"INTEREST 2020","doi_principal_report":"10.1001/jama.2019.22525","journal_principal_report":"JAMA","publication_year_principal_report":2020,"n_centres":47,"n_enrolled_participants":301,"intervention_type":"Drug","full_covidence_id":"154522/1929","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%231929","only_covid_patients":"No"}	0
IRIHS 2021	initial	{"rct_name":"IRIHS 2021","doi_principal_report":"10.1186/s13054-021-03509-5","journal_principal_report":"Crit Care","publication_year_principal_report":2021,"n_centres":4,"n_enrolled_participants":171,"intervention_type":"Drug","full_covidence_id":"154522/4234","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%234234","only_covid_patients":"No"}	0
ISOCRATE 2021	initial	{"rct_name":"ISOCRATE 2021","doi_principal_report":"10.1186/s13054-021-03842-9","journal_principal_report":"Crit Care","publication_year_principal_report":2021,"n_centres":1,"n_enrolled_participants":50,"intervention_type":"Management","full_covidence_id":"154522/7132","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%237132","only_covid_patients":"No"}	0
J-LAND 3S 2020	initial	{"rct_name":"J-LAND 3S 2020","doi_principal_report":"10.1016/S2213-2600(20)30037-0","journal_principal_report":"Lancet Respir Med","publication_year_principal_report":2020,"n_centres":54,"n_enrolled_participants":151,"intervention_type":"Drug","full_covidence_id":"154522/2086","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%232086","only_covid_patients":"No"}	0
Jaiswal 2019	initial	{"rct_name":"Jaiswal 2019","doi_principal_report":"10.1097/CCM.0000000000004004","journal_principal_report":"Crit Care Med","publication_year_principal_report":2019,"n_centres":1,"n_enrolled_participants":120,"intervention_type":"Drug","full_covidence_id":"154522/1195","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%231195","only_covid_patients":"No"}	0
Jonkman 2020	initial	{"rct_name":"Jonkman 2020","full_covidence_id":"154522/3218","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%233218","covidence_id":"3218"}	0
Kacmarek 2020	initial	{"rct_name":"Kacmarek 2020","doi_principal_report":"10.1007/s00134-020-06181-5","journal_principal_report":"Intensive Care Med","publication_year_principal_report":2020,"n_centres":15,"n_enrolled_participants":310,"intervention_type":"Management","full_covidence_id":"154522/2951","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%232951","only_covid_patients":"No"}	0
Klarin 2018	initial	{"rct_name":"Klarin 2018","full_covidence_id":"154522/5716","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%235716","covidence_id":"5716"}	0
Kredentser 2018	initial	{"rct_name":"Kredentser 2018","doi_principal_report":"10.1097/CCM.0000000000003367","journal_principal_report":"Crit Care Med","publication_year_principal_report":2018,"n_centres":1,"n_enrolled_participants":58,"intervention_type":"Management","full_covidence_id":"154522/5099","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%235099","only_covid_patients":"No"}	0
LaSRS 2006	initial	{"rct_name":"LaSRS 2006","doi_principal_report":"10.1056/NEJMoa051693","journal_principal_report":"NEJM","publication_year_principal_report":2006,"n_centres":25,"n_enrolled_participants":180,"intervention_type":"Drug","full_covidence_id":"154522/5276","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%235276","only_covid_patients":"No"}	0
LeoPARDS 2016	initial	{"rct_name":"LeoPARDS 2016","doi_principal_report":"10.1056/NEJMoa1609409","journal_principal_report":"NEJM","publication_year_principal_report":2016,"n_centres":34,"n_enrolled_participants":516,"intervention_type":"Drug","full_covidence_id":"154522/1471","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%231471","only_covid_patients":"No"}	0
Li 2018	initial	{"rct_name":"Li 2018","full_covidence_id":"154522/4325","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%234325","covidence_id":"4325"}	0
Li 2020	initial	{"rct_name":"Li 2020","doi_principal_report":"10.1001/jama.2020.10044","journal_principal_report":"JAMA","publication_year_principal_report":2020,"n_centres":7,"n_enrolled_participants":103,"intervention_type":"Drug","full_covidence_id":"154522/2480","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%232480","only_covid_patients":"Yes"}	0
Liu 2018	initial	{"rct_name":"Liu 2018","doi_principal_report":"10.1007/s00134-018-5267-9","journal_principal_report":"Intensive Care Med","publication_year_principal_report":2018,"n_centres":21,"n_enrolled_participants":617,"intervention_type":"Drug","full_covidence_id":"154522/5425","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%235425","only_covid_patients":"No"}	0
LIVE 2019	initial	{"rct_name":"LIVE 2019","doi_principal_report":"10.1016/S2213-2600(19)30138-9","journal_principal_report":"Lancet Respir Med","publication_year_principal_report":2019,"n_centres":20,"n_enrolled_participants":420,"intervention_type":"Management","full_covidence_id":"154522/1430","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%231430","only_covid_patients":"No"}	0
LOCO2 2020	initial	{"rct_name":"LOCO2 2020","full_covidence_id":"154522/2327","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%232327","covidence_id":"2327"}	0
Longhini 2020	initial	{"rct_name":"Longhini 2020","full_covidence_id":"154522/2690","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%232690","covidence_id":"2690"}	0
Ma 2019	initial	{"rct_name":"Ma 2019","full_covidence_id":"154522/1257","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%231257","covidence_id":"1257"}	0
Magic Bullet study 2019	initial	{"rct_name":"Magic Bullet study 2019","full_covidence_id":"154522/1403","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%231403","covidence_id":"1403"}	0
Martinez 2020	initial	{"rct_name":"Martinez 2020","full_covidence_id":"154522/2968","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%232968","covidence_id":"2968"}	0
McCaughey 2019	initial	{"rct_name":"McCaughey 2019","full_covidence_id":"154522/1091","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%231091","covidence_id":"1091"}	0
McNelly 2020	initial	{"rct_name":"McNelly 2020","full_covidence_id":"154522/2092","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%232092","covidence_id":"2092"}	0
MENDS2 2021	initial	{"rct_name":"MENDS2 2021","doi_principal_report":"10.1056/NEJMoa2024922","journal_principal_report":"NEJM","publication_year_principal_report":2021,"n_centres":13,"n_enrolled_participants":423,"intervention_type":"Drug","full_covidence_id":"154522/3471","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%233471","only_covid_patients":"No"}	0
Merz 2019	initial	{"rct_name":"Merz 2019","full_covidence_id":"154522/1020","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%231020","covidence_id":"1020"}	0
MIDAS 2020	initial	{"rct_name":"MIDAS 2020","full_covidence_id":"154522/2933","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%232933","covidence_id":"2933"}	0
MIND-USA 2018	initial	{"rct_name":"MIND-USA 2018","doi_principal_report":"10.1056/NEJMoa1808217","journal_principal_report":"NEJM","publication_year_principal_report":2018,"n_centres":16,"n_enrolled_participants":566,"intervention_type":"Drug","full_covidence_id":"154522/5676","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%235676","only_covid_patients":"No"}	0
MOTION 2020	initial	{"rct_name":"MOTION 2020","full_covidence_id":"154522/1861","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%231861","covidence_id":"1861"}	0
Muscedere 2018	initial	{"rct_name":"Muscedere 2018","full_covidence_id":"154522/5478","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%235478","covidence_id":"5478"}	0
MUST-ARDS 2022	initial	{"rct_name":"MUST-ARDS 2022","doi_principal_report":"10.1007/s00134-021-06570-4","journal_principal_report":"Intensive Care Med","publication_year_principal_report":2022,"n_centres":12,"n_enrolled_participants":30,"intervention_type":"Drug","full_covidence_id":"154522/6989","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%236989","only_covid_patients":"No"}	0
Nakanishi 2020	initial	{"rct_name":"Nakanishi 2020","doi_principal_report":"10.1097/CCM.0000000000004522","journal_principal_report":"Crit Care Med","publication_year_principal_report":2020,"n_centres":2,"n_enrolled_participants":42,"intervention_type":"Device","full_covidence_id":"154522/2962","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%232962","only_covid_patients":"No"}	0
NEED 2022	initial	{"rct_name":"NEED 2022","doi_principal_report":"10.1186/s13054-022-03921-5","journal_principal_report":"Crit Care","publication_year_principal_report":2022,"n_centres":97,"n_enrolled_participants":2772,"intervention_type":"Management","full_covidence_id":"154522/7412","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%237412","only_covid_patients":"No"}	0
Nguyen 2018	initial	{"rct_name":"Nguyen 2018","full_covidence_id":"154522/5093","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%235093","covidence_id":"5093"}	0
Nishikimi 2018	initial	{"rct_name":"Nishikimi 2018","full_covidence_id":"154522/4844","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%234844","covidence_id":"4844"}	0
NONSEDA 2020	initial	{"rct_name":"NONSEDA 2020","doi_principal_report":"10.1056/NEJMoa1906759","journal_principal_report":"NEJM","publication_year_principal_report":2020,"n_centres":8,"n_enrolled_participants":710,"intervention_type":"Drug","full_covidence_id":"154522/1934","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%231934","only_covid_patients":"No"}	0
NUTRIREA-2 2018	initial	{"rct_name":"NUTRIREA-2 2018","doi_principal_report":"10.1016/S0140-6736(17)32146-3","journal_principal_report":"Lancet","publication_year_principal_report":2018,"n_centres":44,"n_enrolled_participants":2410,"intervention_type":"Drug","full_covidence_id":"154522/4331","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%234331","only_covid_patients":"No"}	0
ObiWEAN 2021	initial	{"rct_name":"ObiWEAN 2021","doi_principal_report":"10.1007/s00134-021-06450-x","journal_principal_report":"Intensive Care Med","publication_year_principal_report":2021,"n_centres":1,"n_enrolled_participants":106,"intervention_type":"Management","full_covidence_id":"154522/6116","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%236116","only_covid_patients":"No"}	0
ORANGES 2020	initial	{"rct_name":"ORANGES 2020","doi_principal_report":"10.1016/j.chest.2020.02.049","journal_principal_report":"Chest","publication_year_principal_report":2020,"n_centres":2,"n_enrolled_participants":140,"intervention_type":"Drug","full_covidence_id":"154522/2004","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%232004","only_covid_patients":"No"}	0
ORI2 2019	initial	{"rct_name":"ORI2 2019","doi_principal_report":"10.1007/s00134-019-05732-9","journal_principal_report":"Intensive Care Med","publication_year_principal_report":2019,"n_centres":1,"n_enrolled_participants":150,"intervention_type":"Management","full_covidence_id":"154522/1449","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%231449","only_covid_patients":"No"}	0
Paonessa 2019	initial	{"rct_name":"Paonessa 2019","full_covidence_id":"154522/321","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%23321","covidence_id":"321"}	0
Park 2019	initial	{"rct_name":"Park 2019","doi_principal_report":"10.1097/CCM.0000000000003900","journal_principal_report":"Crit Care Med","publication_year_principal_report":2019,"n_centres":1,"n_enrolled_participants":360,"intervention_type":"Drug","full_covidence_id":"154522/1107","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%231107","only_covid_patients":"No"}	0
Pascale 2020	initial	{"rct_name":"Pascale 2020","full_covidence_id":"154522/2944","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%232944","covidence_id":"2944"}	0
Patel 2016	initial	{"rct_name":"Patel 2016","doi_principal_report":"10.1001/jama.2016.6338","journal_principal_report":"JAMA","publication_year_principal_report":2016,"n_centres":1,"n_enrolled_participants":83,"intervention_type":"Device","full_covidence_id":"154522/4845","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%234845","only_covid_patients":"No"}	0
PEPTIC 2020	initial	{"rct_name":"PEPTIC 2020","full_covidence_id":"154522/1743","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%231743","covidence_id":"1743"}	0
Perkins 2018	initial	{"rct_name":"Perkins 2018","doi_principal_report":"10.1001/jama.2018.13763","journal_principal_report":"JAMA","publication_year_principal_report":2018,"n_centres":41,"n_enrolled_participants":364,"intervention_type":"Management","full_covidence_id":"154522/5682","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%235682","only_covid_patients":"No"}	0
PHARLAP 2019	initial	{"rct_name":"PHARLAP 2019","doi_principal_report":"10.1164/rccm.201901-0109OC","journal_principal_report":"Am J Respir Crit Care Med","publication_year_principal_report":2019,"n_centres":35,"n_enrolled_participants":115,"intervention_type":"Management","full_covidence_id":"154522/1104","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%231104","only_covid_patients":"No"}	0
PLUS 2022	initial	{"rct_name":"PLUS 2022","doi_principal_report":"10.1056/NEJMoa2114464","journal_principal_report":"NEJM","publication_year_principal_report":2022,"n_centres":53,"n_enrolled_participants":5037,"intervention_type":"Drug","full_covidence_id":"154522/7247","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%237247","only_covid_patients":"No"}	0
POLAR 2018	initial	{"rct_name":"POLAR 2018","doi_principal_report":"10.1001/jama.2018.17075","journal_principal_report":"JAMA","publication_year_principal_report":2018,"n_centres":14,"n_enrolled_participants":511,"intervention_type":"Management","full_covidence_id":"154522/5692","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%235692","only_covid_patients":"No"}	0
POPPI 2019	initial	{"rct_name":"POPPI 2019","doi_principal_report":"10.1001/jama.2019.0073","journal_principal_report":"JAMA","publication_year_principal_report":2019,"n_centres":24,"n_enrolled_participants":1458,"intervention_type":"Management","full_covidence_id":"154522/318","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%23318","only_covid_patients":"No"}	0
POSA-FLU 2021	initial	{"rct_name":"POSA-FLU 2021","full_covidence_id":"154522/4311","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%234311","covidence_id":"4311"}	0
Postle 2022	initial	{"rct_name":"Postle 2022","full_covidence_id":"154522/7070","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%237070","covidence_id":"7070"}	0
PrePARE 2019	initial	{"rct_name":"PrePARE 2019","doi_principal_report":"10.1016/S2213-2600(19)30246-2","journal_principal_report":"Lancet Respir Med","publication_year_principal_report":2019,"n_centres":9,"n_enrolled_participants":337,"intervention_type":"Drug","full_covidence_id":"154522/1228","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%231228","only_covid_patients":"No"}	0
PREVAIL 2016	initial	{"rct_name":"PREVAIL 2016","doi_principal_report":"10.1186/s13063-016-1590-z","full_covidence_id":"154522/374","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%23374","covidence_id":"374"}	0
PReVENT 2018	initial	{"rct_name":"PReVENT 2018","doi_principal_report":"10.1001/jama.2018.14280","journal_principal_report":"JAMA","publication_year_principal_report":2018,"n_centres":6,"n_enrolled_participants":961,"intervention_type":"Management","full_covidence_id":"154522/5690","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%235690","only_covid_patients":"No"}	0
PreVent 2019	initial	{"rct_name":"PreVent 2019","doi_principal_report":"10.1056/NEJMoa1812405","journal_principal_report":"NEJM","publication_year_principal_report":2019,"n_centres":7,"n_enrolled_participants":401,"intervention_type":"Device","full_covidence_id":"154522/707","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%23707","only_covid_patients":"No"}	0
PREVENT 2019	initial	{"rct_name":"PREVENT 2019","doi_principal_report":"10.1056/NEJMoa1816150","journal_principal_report":"NEJM","publication_year_principal_report":2019,"n_centres":20,"n_enrolled_participants":2003,"intervention_type":"Device","full_covidence_id":"154522/709","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%23709","only_covid_patients":"No"}	0
Pro-MEDIC 2022	initial	{"rct_name":"Pro-MEDIC 2022","doi_principal_report":"10.1007/s00134-022-06638-9","journal_principal_report":"Intensive Care Med","publication_year_principal_report":2022,"n_centres":12,"n_enrolled_participants":847,"intervention_type":"Drug","full_covidence_id":"154522/7464","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%237464","only_covid_patients":"No"}	0
ProCESS 2014	initial	{"rct_name":"ProCESS 2014","doi_principal_report":"10.1056/NEJMoa1401602","journal_principal_report":"NEJM","publication_year_principal_report":2014,"n_centres":31,"n_enrolled_participants":1351,"intervention_type":"Management","full_covidence_id":"154522/62","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%2362","only_covid_patients":"No"}	0
PROGRESS 2021	initial	{"rct_name":"PROGRESS 2021","full_covidence_id":"154522/2705","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%232705","covidence_id":"2705"}	0
PROHIBIT 2018	initial	{"rct_name":"PROHIBIT 2018","full_covidence_id":"154522/4389","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%234389","covidence_id":"4389"}	0
PROMOTE 2019	initial	{"rct_name":"PROMOTE 2019","doi_principal_report":"10.1007/s00134-019-05593-2","journal_principal_report":"Intensive Care Med","publication_year_principal_report":2019,"n_centres":20,"n_enrolled_participants":120,"intervention_type":"Drug","full_covidence_id":"154522/754","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%23754","only_covid_patients":"No"}	0
PROPEL 2020	initial	{"rct_name":"PROPEL 2020","doi_principal_report":"10.1097/CCM.0000000000004176","journal_principal_report":"Crit Care Med","publication_year_principal_report":2020,"n_centres":12,"n_enrolled_participants":159,"intervention_type":"Device","full_covidence_id":"154522/1691","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%231691","only_covid_patients":"No"}	0
PROPER 2021	initial	{"rct_name":"PROPER 2021","doi_principal_report":"10.1164/rccm.202009-3561OC","journal_principal_report":"Am J Respir Crit Care Med","publication_year_principal_report":2021,"n_centres":2,"n_enrolled_participants":751,"intervention_type":"Management","full_covidence_id":"154522/3877","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%233877","only_covid_patients":"No"}	0
PROSPECT-FULL 2021	initial	{"rct_name":"PROSPECT-FULL 2021","full_covidence_id":"154522/6644","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%236644","covidence_id":"6644"}	0
PROTECTION 2021	initial	{"rct_name":"PROTECTION 2021","doi_principal_report":"10.1016/j.chest.2020.10.079","journal_principal_report":"Chest","publication_year_principal_report":2021,"n_centres":20,"n_enrolled_participants":258,"intervention_type":"Management","full_covidence_id":"154522/3309","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%233309","only_covid_patients":"No"}	0
PROTRACH 2019	initial	{"rct_name":"PROTRACH 2019","full_covidence_id":"154522/181","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%23181","covidence_id":"181"}	0
RADAR-2 2022	initial	{"rct_name":"RADAR-2 2022","doi_principal_report":"10.1007/s00134-021-06596-8","journal_principal_report":"Intensive Care Med","publication_year_principal_report":2022,"n_centres":8,"n_enrolled_participants":180,"intervention_type":"Management","full_covidence_id":"154522/7120","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%237120","only_covid_patients":"No"}	0
REACTOR 2019	initial	{"rct_name":"REACTOR 2019","doi_principal_report":"10.1007/s00134-019-05729-4","journal_principal_report":"Intensive Care Med","publication_year_principal_report":2019,"n_centres":9,"n_enrolled_participants":184,"intervention_type":"Management","full_covidence_id":"154522/1209","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%231209","only_covid_patients":"No"}	0
REDOXS 2013	initial	{"rct_name":"REDOXS 2013","doi_principal_report":"10.1056/NEJMoa1212722","journal_principal_report":"NEJM","publication_year_principal_report":2013,"n_centres":40,"n_enrolled_participants":1223,"intervention_type":"Drug","full_covidence_id":"154522/7463","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%237463","only_covid_patients":"No"}	0
REDUCE 2018	initial	{"rct_name":"REDUCE 2018","doi_principal_report":"10.1001/jama.2018.0160","journal_principal_report":"JAMA","publication_year_principal_report":2018,"n_centres":21,"n_enrolled_participants":1796,"intervention_type":"Drug","full_covidence_id":"154522/5722","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%235722","only_covid_patients":"No"}	0
RELAx 2020	initial	{"rct_name":"RELAx 2020","doi_principal_report":"10.1001/jama.2020.23517","journal_principal_report":"JAMA","publication_year_principal_report":2020,"n_centres":8,"n_enrolled_participants":980,"intervention_type":"Management","full_covidence_id":"154522/3699","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%233699","only_covid_patients":"No"}	0
RELEASE 2019	initial	{"rct_name":"RELEASE 2019","full_covidence_id":"154522/603","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%23603","covidence_id":"603"}	0
REMAP-CAP (antiplatelet domain) 2022	initial	{"rct_name":"REMAP-CAP (antiplatelet domain) 2022","doi_principal_report":"10.1001/jama.2022.2910","journal_principal_report":"JAMA","publication_year_principal_report":2022,"n_centres":105,"n_enrolled_participants":1842,"intervention_type":"Drug","full_covidence_id":"154522/7551","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%237551","only_covid_patients":"Yes"}	0
REMAP-CAP (antiviral domain) 2021	initial	{"rct_name":"REMAP-CAP (antiviral domain) 2021","doi_principal_report":"10.1007/s00134-021-06448-5","journal_principal_report":"Intensive Care Med","publication_year_principal_report":2021,"n_centres":99,"n_enrolled_participants":694,"intervention_type":"Drug","full_covidence_id":"154522/6255","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%236255","only_covid_patients":"Yes"}	0
REMAP-CAP (IL-6 domain) 2021	initial	{"rct_name":"REMAP-CAP (IL-6 domain) 2021","doi_principal_report":"10.1056/NEJMoa2100433","journal_principal_report":"NEJM","publication_year_principal_report":2021,"n_centres":113,"n_enrolled_participants":826,"intervention_type":"Drug","full_covidence_id":"154522/4174","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%234174","only_covid_patients":"Yes"}	0
REMAP-CAP (immunoglobulin domain) 2021	initial	{"rct_name":"REMAP-CAP (immunoglobulin domain) 2021","doi_principal_report":"10.1001/jama.2021.18178","journal_principal_report":"JAMA","publication_year_principal_report":2021,"n_centres":129,"n_enrolled_participants":2097,"intervention_type":"Drug","full_covidence_id":"154522/6729","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%236729","only_covid_patients":"Yes"}	0
REMAP-CAP (steroid domain) 2020	initial	{"rct_name":"REMAP-CAP (steroid domain) 2020","doi_principal_report":"10.1001/jama.2020.17022","journal_principal_report":"JAMA","publication_year_principal_report":2020,"n_centres":113,"n_enrolled_participants":403,"intervention_type":"Drug","full_covidence_id":"154522/2919","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%232919","only_covid_patients":"Yes"}	0
REMAP-CAP, ACTIV-4a, ATTACC (anticoagulation) 2021	initial	{"rct_name":"REMAP-CAP, ACTIV-4a, ATTACC (anticoagulation) 2021","doi_principal_report":"10.1056/NEJMoa2103417","journal_principal_report":"NEJM","publication_year_principal_report":2021,"n_centres":393,"n_enrolled_participants":1207,"intervention_type":"Drug","full_covidence_id":"154522/6389","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%236389","only_covid_patients":"Yes"}	0
RESCUE-2 2022	initial	{"rct_name":"RESCUE-2 2022","full_covidence_id":"154522/7328","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%237328","covidence_id":"7328"}	0
REST 2021	initial	{"rct_name":"REST 2021","doi_principal_report":"10.1001/jama.2021.13374","journal_principal_report":"JAMA","publication_year_principal_report":2021,"n_centres":51,"n_enrolled_participants":412,"intervention_type":"Device","full_covidence_id":"154522/6531","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%236531","only_covid_patients":"No"}	0
REVERSE-AKI 2021	initial	{"rct_name":"REVERSE-AKI 2021","doi_principal_report":"10.1007/s00134-021-06401-6","journal_principal_report":"Intensive Care Med","publication_year_principal_report":2021,"n_centres":7,"n_enrolled_participants":100,"intervention_type":"Management","full_covidence_id":"154522/4025","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%234025","only_covid_patients":"No"}	0
RICH 2020	initial	{"rct_name":"RICH 2020","doi_principal_report":"10.1001/jama.2020.18618","journal_principal_report":"JAMA","publication_year_principal_report":2020,"n_centres":26,"n_enrolled_participants":638,"intervention_type":"Drug","full_covidence_id":"154522/3197","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%233197","only_covid_patients":"No"}	0
Ridley 2018	initial	{"rct_name":"Ridley 2018","doi_principal_report":"10.1186/s13054-018-1939-7","journal_principal_report":"Crit Care","publication_year_principal_report":2018,"n_centres":6,"n_enrolled_participants":100,"intervention_type":"Drug","full_covidence_id":"154522/4499","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%234499","only_covid_patients":"No"}	0
RIFTS 2019	initial	{"rct_name":"RIFTS 2019","doi_principal_report":"10.1097/CCM.0000000000003779","journal_principal_report":"Crit Care Med","publication_year_principal_report":2019,"n_centres":2,"n_enrolled_participants":113,"intervention_type":"Drug","full_covidence_id":"154522/641","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%23641","only_covid_patients":"No"}	0
ROCIT 2021	initial	{"rct_name":"ROCIT 2021","doi_principal_report":"10.1007/s00134-020-06322-w","journal_principal_report":"Intensive Care Med","publication_year_principal_report":2021,"n_centres":5,"n_enrolled_participants":221,"intervention_type":"Drug","full_covidence_id":"154522/3520","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%233520","only_covid_patients":"No"}	0
ROSE 2019	initial	{"rct_name":"ROSE 2019","doi_principal_report":"10.1056/NEJMoa1901686","journal_principal_report":"NEJM","publication_year_principal_report":2019,"n_centres":48,"n_enrolled_participants":1008,"intervention_type":"Drug","full_covidence_id":"154522/818","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%23818","only_covid_patients":"No"}	0
Rosengrave 2022	initial	{"rct_name":"Rosengrave 2022","full_covidence_id":"154522/7284","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%237284","covidence_id":"7284"}	0
Rosetti 2020	initial	{"rct_name":"Rosetti 2020","doi_principal_report":"10.1001/jamaneurol.2020.2264","journal_principal_report":"JAMA Neurol","publication_year_principal_report":2020,"n_centres":3,"n_enrolled_participants":402,"intervention_type":"Device","full_covidence_id":"154522/6694","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%236694","only_covid_patients":"No"}	0
Rozencwajg 2019	initial	{"rct_name":"Rozencwajg 2019","full_covidence_id":"154522/1421","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%231421","covidence_id":"1421"}	0
RSVP 2020	initial	{"rct_name":"RSVP 2020","full_covidence_id":"154522/3932","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%233932","covidence_id":"3932"}	0
SALT 2017	initial	{"rct_name":"SALT 2017","doi_principal_report":"10.1164/rccm.201607-1345OC","full_covidence_id":"154522/4619","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%234619","covidence_id":"4619"}	0
Schujmann 2019	initial	{"rct_name":"Schujmann 2019","doi_principal_report":"10.1097/CCM.0000000000004181","journal_principal_report":"Crit Care Med","publication_year_principal_report":2019,"n_centres":1,"n_enrolled_participants":135,"intervention_type":"Management","full_covidence_id":"154522/2017","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%232017","only_covid_patients":"No"}	0
SCOPE-DKA 2021	initial	{"rct_name":"SCOPE-DKA 2021","full_covidence_id":"154522/6745","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%236745","covidence_id":"6745"}	0
Sedaconda 2021	initial	{"rct_name":"Sedaconda 2021","doi_principal_report":"10.1016/S2213-2600(21)00323-4","journal_principal_report":"Lancet Respir Med","publication_year_principal_report":2021,"n_centres":24,"n_enrolled_participants":301,"intervention_type":"Drug","full_covidence_id":"154522/6518","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%236518","only_covid_patients":"No"}	0
SedaEN 2019	initial	{"rct_name":"SedaEN 2019","doi_principal_report":"10.1186/s13054-018-2280-x","journal_principal_report":"Crit Care","publication_year_principal_report":2019,"n_centres":12,"n_enrolled_participants":348,"intervention_type":"Drug","full_covidence_id":"154522/119","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%23119","only_covid_patients":"No"}	0
Sehgal 2021	initial	{"rct_name":"Sehgal 2021","doi_principal_report":"10.1016/j.chest.2021.03.062","journal_principal_report":"Chest","publication_year_principal_report":2021,"n_centres":5,"n_enrolled_participants":202,"intervention_type":"Drug","full_covidence_id":"154522/3918","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%233918","only_covid_patients":"No"}	0
Semler 2018	initial	{"rct_name":"Semler 2018","doi_principal_report":"10.1056/NEJMoa1711584","full_covidence_id":"154522/4619","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%234619","covidence_id":"4619"}	0
SENIOR 2019	initial	{"rct_name":"SENIOR 2019","doi_principal_report":"10.1097/CCM.0000000000003722","full_covidence_id":"154522/603","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%23603","covidence_id":"603"}	0
SEPSIS-ACT 2019	initial	{"rct_name":"SEPSIS-ACT 2019","doi_principal_report":"10.1001/jama.2019.14607","journal_principal_report":"JAMA","publication_year_principal_report":2019,"n_centres":63,"n_enrolled_participants":868,"intervention_type":"Drug","full_covidence_id":"154522/1214","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%231214","only_covid_patients":"No"}	0
SETPOINT2 2022	initial	{"rct_name":"SETPOINT2 2022","doi_principal_report":"10.1001/jama.2022.4798","journal_principal_report":"JAMA","publication_year_principal_report":2022,"n_centres":26,"n_enrolled_participants":382,"intervention_type":"Management","full_covidence_id":"154522/7755","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%237755","only_covid_patients":"No"}	0
Shimizu 2018	initial	{"rct_name":"Shimizu 2018","full_covidence_id":"154522/5547","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%235547","covidence_id":"5547"}	0
SMART 2018	initial	{"rct_name":"SMART 2018","doi_principal_report":"10.1056/NEJMoa1711584","journal_principal_report":"NEJM","publication_year_principal_report":2018,"n_centres":5,"n_enrolled_participants":15802,"intervention_type":"Drug","full_covidence_id":"154522/5749","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%235749","only_covid_patients":"No"}	0
Song 2019	initial	{"rct_name":"Song 2019","full_covidence_id":"154522/861","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%23861","covidence_id":"861"}	0
SPICE III 2019	initial	{"rct_name":"SPICE III 2019","doi_principal_report":"10.1056/NEJMoa1904710","journal_principal_report":"NEJM","publication_year_principal_report":2019,"n_centres":74,"n_enrolled_participants":4000,"intervention_type":"Drug","full_covidence_id":"154522/817","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%23817","only_covid_patients":"No"}	0
Srisawat 2018	initial	{"rct_name":"Srisawat 2018","doi_principal_report":"10.1186/s13054-018-2077-y","journal_principal_report":"Crit Care","publication_year_principal_report":2018,"n_centres":5,"n_enrolled_participants":60,"intervention_type":"Drug","full_covidence_id":"154522/5713","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%235713","only_covid_patients":"No"}	0
STAR 2021	initial	{"rct_name":"STAR 2021","full_covidence_id":"154522/6965","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%236965","covidence_id":"6965"}	0
STARRT-AKI 2020	initial	{"rct_name":"STARRT-AKI 2020","doi_principal_report":"10.1056/NEJMoa2000741","journal_principal_report":"NEJM","publication_year_principal_report":2020,"n_centres":168,"n_enrolled_participants":3019,"intervention_type":"Management","full_covidence_id":"154522/2588","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%232588","only_covid_patients":"No"}	0
START 2019	initial	{"rct_name":"START 2019","doi_principal_report":"10.1016/S2213-2600(18)30418-1","journal_principal_report":"Lancet Respir Med","publication_year_principal_report":2019,"n_centres":5,"n_enrolled_participants":63,"intervention_type":"Drug","full_covidence_id":"154522/60","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%2360","only_covid_patients":"No"}	0
STOP-AKI 2018	initial	{"rct_name":"STOP-AKI 2018","doi_principal_report":"10.1001/jama.2018.14283","journal_principal_report":"JAMA","publication_year_principal_report":2018,"n_centres":53,"n_enrolled_participants":301,"intervention_type":"Drug","full_covidence_id":"154522/5694","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%235694","only_covid_patients":"No"}	0
STROMA-CoV-2 2022	initial	{"rct_name":"STROMA-CoV-2 2022","doi_principal_report":"10.1186/s13054-022-03930-4","journal_principal_report":"Crit Care","publication_year_principal_report":2022,"n_centres":10,"n_enrolled_participants":47,"intervention_type":"Drug","full_covidence_id":"154522/7425","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%237425","only_covid_patients":"Yes"}	0
STYLETO 2021	initial	{"rct_name":"STYLETO 2021","doi_principal_report":"10.1007/s00134-021-06417-y","journal_principal_report":"Intensive Care Med","publication_year_principal_report":2021,"n_centres":32,"n_enrolled_participants":1040,"intervention_type":"Device","full_covidence_id":"154522/4294","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%234294","only_covid_patients":"No"}	0
Subira 2019	initial	{"rct_name":"Subira 2019","full_covidence_id":"154522/896","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%23896","covidence_id":"896"}	0
SUP-ICU 2018	initial	{"rct_name":"SUP-ICU 2018","doi_principal_report":"10.1056/NEJMoa1714919","journal_principal_report":"NEJM","publication_year_principal_report":2018,"n_centres":33,"n_enrolled_participants":3350,"intervention_type":"Drug","full_covidence_id":"154522/5686","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%235686","only_covid_patients":"No"}	0
Supinski 2021	initial	{"rct_name":"Supinski 2021","full_covidence_id":"154522/6506","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%236506","covidence_id":"6506"}	0
SWIPE 2018	initial	{"rct_name":"SWIPE 2018","full_covidence_id":"154522/5665","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%235665","covidence_id":"5665"}	0
Tan 2020	initial	{"rct_name":"Tan 2020","full_covidence_id":"154522/3123","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%233123","covidence_id":"3123"}	0
TARGET 2018	initial	{"rct_name":"TARGET 2018","doi_principal_report":"10.1056/NEJMoa1811687","journal_principal_report":"NEJM","publication_year_principal_report":2018,"n_centres":46,"n_enrolled_participants":3997,"intervention_type":"Drug","full_covidence_id":"154522/5675","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%235675","only_covid_patients":"No"}	0
TARGET 2022	initial	{"rct_name":"TARGET 2022","doi_principal_report":"10.1007/s00134-021-06609-6","journal_principal_report":"Intensive Care Med","publication_year_principal_report":2022,"n_centres":13,"n_enrolled_participants":254,"intervention_type":"Management","full_covidence_id":"154522/7327","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%237327","only_covid_patients":"No"}	0
TELSTAR 2022	initial	{"rct_name":"TELSTAR 2022","doi_principal_report":"10.1056/NEJMoa2115998","journal_principal_report":"NEJM","publication_year_principal_report":2022,"n_centres":11,"n_enrolled_participants":179,"intervention_type":"Drug","full_covidence_id":"154522/7443","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%237443","only_covid_patients":"No"}	0
Tholen 2021	initial	{"rct_name":"Tholen 2021","full_covidence_id":"154522/6106","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%236106","covidence_id":"6106"}	0
TOPMAST 2019	initial	{"rct_name":"TOPMAST 2019","full_covidence_id":"154522/1212","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%231212","covidence_id":"1212"}	0
TRANSFUSE 2017	initial	{"rct_name":"TRANSFUSE 2017","doi_principal_report":"10.1056/NEJMoa1707572","journal_principal_report":"NEJM","publication_year_principal_report":2017,"n_centres":59,"n_enrolled_participants":4994,"intervention_type":"Drug","full_covidence_id":"154522/668","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%23668","only_covid_patients":"No"}	0
TRICS III 2017	initial	{"rct_name":"TRICS III 2017","doi_principal_report":"10.1056/NEJMoa1711818","full_covidence_id":"154522/5146","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%235146","covidence_id":"5146"}	0
TTM 2013	initial	{"rct_name":"TTM 2013","doi_principal_report":"10.1056/NEJMoa1310519","journal_principal_report":"NEJM","publication_year_principal_report":2013,"n_centres":36,"n_enrolled_participants":950,"intervention_type":"Management","full_covidence_id":"154522/765","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%23765","only_covid_patients":"No"}	0
TTM2 2021	initial	{"rct_name":"TTM2 2021","doi_principal_report":"10.1056/NEJMoa2100591","journal_principal_report":"NEJM","publication_year_principal_report":2021,"n_centres":61,"n_enrolled_participants":1900,"intervention_type":"Management","full_covidence_id":"154522/6125","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%236125","only_covid_patients":"No"}	0
UNDERPIN-ICU 2021	initial	{"rct_name":"UNDERPIN-ICU 2021","doi_principal_report":"10.1164/rccm.202101-0082OC","journal_principal_report":"Am J Respir Crit Care Med","publication_year_principal_report":2021,"n_centres":10,"n_enrolled_participants":1749,"intervention_type":"Management","full_covidence_id":"154522/6167","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%236167","only_covid_patients":"No"}	0
VA/NIH 2008	initial	{"rct_name":"VA/NIH 2008","doi_principal_report":"10.1056/NEJMoa0802639","journal_principal_report":"NEJM","publication_year_principal_report":2008,"n_centres":27,"n_enrolled_participants":1124,"intervention_type":"Management","full_covidence_id":"154522/2465","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%232465","only_covid_patients":"No"}	0
van Meenen 2018	initial	{"rct_name":"van Meenen 2018","doi_principal_report":"10.1001/jama.2018.0949","journal_principal_report":"JAMA","publication_year_principal_report":2018,"n_centres":7,"n_enrolled_participants":944,"intervention_type":"Drug","full_covidence_id":"154522/5754","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%235754","only_covid_patients":"No"}	0
VANCS II 2019	initial	{"rct_name":"VANCS II 2019","doi_principal_report":"10.1097/CCM.0000000000004023","journal_principal_report":"Crit Care Med","publication_year_principal_report":2019,"n_centres":1,"n_enrolled_participants":250,"intervention_type":"Drug","full_covidence_id":"154522/1258","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%231258","only_covid_patients":"No"}	0
VANISH 2016	initial	{"rct_name":"VANISH 2016","doi_principal_report":"10.1001/jama.2016.10485","full_covidence_id":"154522/5708","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%235708","covidence_id":"5708"}	0
vanZanten 2018	initial	{"rct_name":"vanZanten 2018","full_covidence_id":"154522/4743","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%234743","covidence_id":"4743"}	0
VAPORISE 2020	initial	{"rct_name":"VAPORISE 2020","doi_principal_report":"10.1007/s00134-019-05914-5","journal_principal_report":"Intensive Care Med","publication_year_principal_report":2020,"n_centres":1,"n_enrolled_participants":26,"intervention_type":"Drug","full_covidence_id":"154522/1781","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%231781","only_covid_patients":"No"}	0
VAPrapid2 2020	initial	{"rct_name":"VAPrapid2 2020","doi_principal_report":"10.1016/S2213-2600(19)30367-4","journal_principal_report":"Lancet Respir Med","publication_year_principal_report":2020,"n_centres":24,"n_enrolled_participants":210,"intervention_type":"Management","full_covidence_id":"154522/1603","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%231603","only_covid_patients":"No"}	0
Vaschetto 2019	initial	{"rct_name":"Vaschetto 2019","full_covidence_id":"154522/428","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%23428","covidence_id":"428"}	0
VICTAS 2021	initial	{"rct_name":"VICTAS 2021","doi_principal_report":"10.1001/jama.2020.24505","journal_principal_report":"JAMA","publication_year_principal_report":2021,"n_centres":43,"n_enrolled_participants":501,"intervention_type":"Drug","full_covidence_id":"154522/4149","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%234149","only_covid_patients":"No"}	0
Villar 2020	initial	{"rct_name":"Villar 2020","doi_principal_report":"10.1016/ S2213-2600(19)30417-5","journal_principal_report":"Lancet Respir Med","publication_year_principal_report":2020,"n_centres":17,"n_enrolled_participants":277,"intervention_type":"Drug","full_covidence_id":"154522/1900","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%231900","only_covid_patients":"No"}	0
VIOLET 2019	initial	{"rct_name":"VIOLET 2019","doi_principal_report":"10.1056/NEJMoa1911124","journal_principal_report":"NEJM","publication_year_principal_report":2019,"n_centres":44,"n_enrolled_participants":1360,"intervention_type":"Drug","full_covidence_id":"154522/1625","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%231625","only_covid_patients":"No"}	0
VITAMINS 2020	initial	{"rct_name":"VITAMINS 2020","doi_principal_report":"10.1001/jama.2019.22176","journal_principal_report":"JAMA","publication_year_principal_report":2020,"n_centres":10,"n_enrolled_participants":216,"intervention_type":"Drug","full_covidence_id":"154522/1744","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%231744","only_covid_patients":"No"}	0
VITdAL-ICU 2014	initial	{"rct_name":"VITdAL-ICU 2014","doi_principal_report":"10.1001/jama.2014.13204","journal_principal_report":"JAMA","publication_year_principal_report":2014,"n_centres":5,"n_enrolled_participants":492,"intervention_type":"Drug","full_covidence_id":"154522/1193","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%231193","only_covid_patients":"No"}	0
VivaITN 2018	initial	{"rct_name":"VivaITN 2018","full_covidence_id":"154522/5521","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%235521","covidence_id":"5521"}	0
Wacker 2022	initial	{"rct_name":"Wacker 2022","full_covidence_id":"154522/7181","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%237181","covidence_id":"7181"}	0
Wang 2020	initial	{"rct_name":"Wang 2020","doi_principal_report":"10.1097/CCM.0000000000004445","journal_principal_report":"Crit Care Med","publication_year_principal_report":2020,"n_centres":1,"n_enrolled_participants":104,"intervention_type":"Management","full_covidence_id":"154522/2877","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%232877","only_covid_patients":"No"}	0
Weidhase 2020	initial	{"rct_name":"Weidhase 2020","full_covidence_id":"154522/3274","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%233274","covidence_id":"3274"}	0
Wiberg 2016	initial	{"rct_name":"Wiberg 2016","doi_principal_report":"10.1161/CIRCULATIONAHA.116.024088","journal_principal_report":"Circulation","publication_year_principal_report":2016,"n_centres":2,"n_enrolled_participants":120,"intervention_type":"Drug","full_covidence_id":"154522/4355","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%234355","only_covid_patients":"No"}	0
Wittekamp 2018	initial	{"rct_name":"Wittekamp 2018","full_covidence_id":"154522/5681","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%235681","covidence_id":"5681"}	0
You 2018	initial	{"rct_name":"You 2018","full_covidence_id":"154522/5453","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%235453","covidence_id":"5453"}	0
Zhou 2022	initial	{"rct_name":"Zhou 2022","full_covidence_id":"154522/7754","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%237754","covidence_id":"7754"}	0
Zhu 2018	initial	{"rct_name":"Zhu 2018","full_covidence_id":"154522/5440","covidence_link":"https://app.covidence.org/reviews/154522/review_studies/search?utf8=\\u2713&search%5Bterm%5D=%235440","covidence_id":"5440"}	0
\.


--
-- TOC entry 3257 (class 0 OID 26272)
-- Dependencies: 210
-- Data for Name: journals; Type: TABLE DATA; Schema: public; Owner: pi
--

COPY public.journals (journal_name) FROM stdin;
Am J Respir Crit Care Med
BMJ
Chest
Circulation
Crit Care
Crit Care Med
Intensive Care Med
JAMA
JAMA Neurol
Lancet
Lancet Respir Med
NEJM
\.


--
-- TOC entry 3259 (class 0 OID 26284)
-- Dependencies: 212
-- Data for Name: populations; Type: TABLE DATA; Schema: public; Owner: pi
--

COPY public.populations (population_name) FROM stdin;
Critically ill
In-hospital
Internal medicine
Surgical
Primary sector
Previous RCT(s)
Unreported
Other
\.


--
-- TOC entry 3253 (class 0 OID 26248)
-- Dependencies: 206
-- Data for Name: provenance; Type: TABLE DATA; Schema: public; Owner: pi
--

COPY public.provenance (provenance_name) FROM stdin;
Clinical observations
ICU apparatus
National register(s)
Patient records
Unreported
\.


--
-- TOC entry 3249 (class 0 OID 26224)
-- Dependencies: 202
-- Data for Name: rcts; Type: TABLE DATA; Schema: public; Owner: pi
--

COPY public.rcts (rct_name, pending_bskh, pending_rest, status, corresponding_author_name, corresponding_author_email, corresponding_author_first_contact, corresponding_author_second_contact, "stringsAsFactors") FROM stdin;
65 trial 2020	1	1	0	\N	\N	\N	\N	f
ACCOST-HH 2022	1	1	0	\N	\N	\N	\N	f
ACIdoSIS 2021	1	1	0	\N	\N	\N	\N	f
ACTS 2020	1	1	0	\N	\N	\N	\N	f
ADRENAL 2018	1	1	0	\N	\N	\N	\N	f
AdrenOSS-2 2021	1	1	0	\N	\N	\N	\N	f
AGATE 2021	1	1	0	\N	\N	\N	\N	f
AKIKI 2 2021	1	1	0	\N	\N	\N	\N	f
AKIKI 2016	1	1	0	\N	\N	\N	\N	f
ANALGESIC 2021	1	1	0	\N	\N	\N	\N	f
ANDROMEDA SHOCK 2019	1	1	0	\N	\N	\N	\N	f
ANTHARTIC 2019	1	1	0	\N	\N	\N	\N	f
APROCCHSS 2018	1	1	0	\N	\N	\N	\N	f
Arabi 2020	1	1	0	\N	\N	\N	\N	f
ARISE 2014	1	1	0	\N	\N	\N	\N	f
Atan 2018	1	1	0	\N	\N	\N	\N	f
ATESS 2020	1	1	0	\N	\N	\N	\N	f
BACLOREA 2021	1	1	0	\N	\N	\N	\N	f
Barrett 2022	1	1	0	\N	\N	\N	\N	f
BaSICs 2021	1	1	0	\N	\N	\N	\N	f
Beitler 2019	1	1	0	\N	\N	\N	\N	f
BICAR-ICU 2018	1	1	0	\N	\N	\N	\N	f
BOUGIE 2021	1	1	0	\N	\N	\N	\N	f
BREATHE 2022	1	1	0	\N	\N	\N	\N	f
Campos 2022	1	1	0	\N	\N	\N	\N	f
CAPE COVID 2020	1	1	0	\N	\N	\N	\N	f
CAPITAL CHILL 2021	1	1	0	\N	\N	\N	\N	f
CASS 2018	1	1	0	\N	\N	\N	\N	f
CHARLI 2021	1	1	0	\N	\N	\N	\N	f
Check-UP 2018	1	1	0	\N	\N	\N	\N	f
Chlan 2014	1	1	0	\N	\N	\N	\N	f
CIGMA 2018	1	1	0	\N	\N	\N	\N	f
CITRIS-ALI 2019	1	1	0	\N	\N	\N	\N	f
COBI 2021	1	1	0	\N	\N	\N	\N	f
CoDEX 2020	1	1	0	\N	\N	\N	\N	f
COMACARE 2018	1	1	0	\N	\N	\N	\N	f
COMBAT-COVID 2022	1	1	0	\N	\N	\N	\N	f
COMPACT-2 2021	1	1	0	\N	\N	\N	\N	f
COV-AID 2021	1	1	0	\N	\N	\N	\N	f
COV-BARRIER 2022	1	1	0	\N	\N	\N	\N	f
COVID STEROID 2 2021	1	1	0	\N	\N	\N	\N	f
COVINTOC 2021	1	1	0	\N	\N	\N	\N	f
DESIRE 2017	1	1	0	\N	\N	\N	\N	f
DEXACET 2019	1	1	0	\N	\N	\N	\N	f
Doig 2015	1	1	0	\N	\N	\N	\N	f
Drewry 2022	1	1	0	\N	\N	\N	\N	f
ECMO-PT 2020	1	1	0	\N	\N	\N	\N	f
EOLIA 2018	1	1	0	\N	\N	\N	\N	f
EUPHRATES 2018	1	1	0	\N	\N	\N	\N	f
FLORALI-IM 2022	1	1	0	\N	\N	\N	\N	f
Fluids After Bypass Study 2021	1	1	0	\N	\N	\N	\N	f
Fossat 2018	1	1	0	\N	\N	\N	\N	f
Francois 2020	1	1	0	\N	\N	\N	\N	f
FROST-I 2018	1	1	0	\N	\N	\N	\N	f
Garrouste-Orgeas 2019	1	1	0	\N	\N	\N	\N	f
Gelissen 2021	1	1	0	\N	\N	\N	\N	f
Gobatto 2019	1	1	0	\N	\N	\N	\N	f
Hadfield 2020	1	1	0	\N	\N	\N	\N	f
HARP-2 2014	1	1	0	\N	\N	\N	\N	f
Hassan 2018	1	1	0	\N	\N	\N	\N	f
He 2021	1	1	0	\N	\N	\N	\N	f
HENIVOT 2021	1	1	0	\N	\N	\N	\N	f
HiFLo-COVID 2021	1	1	0	\N	\N	\N	\N	f
Hirshberg 2018	1	1	0	\N	\N	\N	\N	f
HOT-ICU 2021	1	1	0	\N	\N	\N	\N	f
HYPERION 2019	1	1	0	\N	\N	\N	\N	f
HYPERS2S 2017	1	1	0	\N	\N	\N	\N	f
HYPO-ECMO 2022	1	1	0	\N	\N	\N	\N	f
Ibarra-Estrada 2022	1	1	0	\N	\N	\N	\N	f
ICAR 2022	1	1	0	\N	\N	\N	\N	f
ICU Visits 2019	1	1	0	\N	\N	\N	\N	f
ICU-ROX 2020	1	1	0	\N	\N	\N	\N	f
IDEAL-ICU 2018	1	1	0	\N	\N	\N	\N	f
INSPIRATION 2021	1	1	0	\N	\N	\N	\N	f
INSPIRATION-S 2022	1	1	0	\N	\N	\N	\N	f
INTEREST 2020	1	1	0	\N	\N	\N	\N	f
IRIHS 2021	1	1	0	\N	\N	\N	\N	f
ISOCRATE 2021	1	1	0	\N	\N	\N	\N	f
J-LAND 3S 2020	1	1	0	\N	\N	\N	\N	f
Jaiswal 2019	1	1	0	\N	\N	\N	\N	f
Kacmarek 2020	1	1	0	\N	\N	\N	\N	f
Kredentser 2018	1	1	0	\N	\N	\N	\N	f
LaSRS 2006	1	1	0	\N	\N	\N	\N	f
LeoPARDS 2016	1	1	0	\N	\N	\N	\N	f
Li 2020	1	1	0	\N	\N	\N	\N	f
Liu 2018	1	1	0	\N	\N	\N	\N	f
LIVE 2019	1	1	0	\N	\N	\N	\N	f
MENDS2 2021	1	1	0	\N	\N	\N	\N	f
MIND-USA 2018	1	1	0	\N	\N	\N	\N	f
MUST-ARDS 2022	1	1	0	\N	\N	\N	\N	f
Nakanishi 2020	1	1	0	\N	\N	\N	\N	f
NEED 2022	1	1	0	\N	\N	\N	\N	f
NONSEDA 2020	1	1	0	\N	\N	\N	\N	f
NUTRIREA-2 2018	1	1	0	\N	\N	\N	\N	f
ObiWEAN 2021	1	1	0	\N	\N	\N	\N	f
ORANGES 2020	1	1	0	\N	\N	\N	\N	f
ORI2 2019	1	1	0	\N	\N	\N	\N	f
Park 2019	1	1	0	\N	\N	\N	\N	f
Patel 2016	1	1	0	\N	\N	\N	\N	f
Perkins 2018	1	1	0	\N	\N	\N	\N	f
PHARLAP 2019	1	1	0	\N	\N	\N	\N	f
PLUS 2022	1	1	0	\N	\N	\N	\N	f
POLAR 2018	1	1	0	\N	\N	\N	\N	f
POPPI 2019	1	1	0	\N	\N	\N	\N	f
PrePARE 2019	1	1	0	\N	\N	\N	\N	f
PReVENT 2018	1	1	0	\N	\N	\N	\N	f
PREVENT 2019	1	1	0	\N	\N	\N	\N	f
PreVent 2019	1	1	0	\N	\N	\N	\N	f
Pro-MEDIC 2022	1	1	0	\N	\N	\N	\N	f
ProCESS 2014	1	1	0	\N	\N	\N	\N	f
PROMOTE 2019	1	1	0	\N	\N	\N	\N	f
PROPEL 2020	1	1	0	\N	\N	\N	\N	f
PROPER 2021	1	1	0	\N	\N	\N	\N	f
PROTECTION 2021	1	1	0	\N	\N	\N	\N	f
RADAR-2 2022	1	1	0	\N	\N	\N	\N	f
REACTOR 2019	1	1	0	\N	\N	\N	\N	f
REDOXS 2013	1	1	0	\N	\N	\N	\N	f
REDUCE 2018	1	1	0	\N	\N	\N	\N	f
RELAx 2020	1	1	0	\N	\N	\N	\N	f
REMAP-CAP (antiplatelet domain) 2022	1	1	0	\N	\N	\N	\N	f
REMAP-CAP (antiviral domain) 2021	1	1	0	\N	\N	\N	\N	f
REMAP-CAP (IL-6 domain) 2021	1	1	0	\N	\N	\N	\N	f
REMAP-CAP (immunoglobulin domain) 2021	1	1	0	\N	\N	\N	\N	f
REMAP-CAP (steroid domain) 2020	1	1	0	\N	\N	\N	\N	f
REMAP-CAP, ACTIV-4a, ATTACC (anticoagulation) 2021	1	1	0	\N	\N	\N	\N	f
REST 2021	1	1	0	\N	\N	\N	\N	f
REVERSE-AKI 2021	1	1	0	\N	\N	\N	\N	f
RICH 2020	1	1	0	\N	\N	\N	\N	f
Ridley 2018	1	1	0	\N	\N	\N	\N	f
RIFTS 2019	1	1	0	\N	\N	\N	\N	f
ROCIT 2021	1	1	0	\N	\N	\N	\N	f
ROSE 2019	1	1	0	\N	\N	\N	\N	f
Rosetti 2020	1	1	0	\N	\N	\N	\N	f
Schujmann 2019	1	1	0	\N	\N	\N	\N	f
Sedaconda 2021	1	1	0	\N	\N	\N	\N	f
SedaEN 2019	1	1	0	\N	\N	\N	\N	f
Sehgal 2021	1	1	0	\N	\N	\N	\N	f
SEPSIS-ACT 2019	1	1	0	\N	\N	\N	\N	f
SETPOINT2 2022	1	1	0	\N	\N	\N	\N	f
SMART 2018	1	1	0	\N	\N	\N	\N	f
SPICE III 2019	1	1	0	\N	\N	\N	\N	f
Srisawat 2018	1	1	0	\N	\N	\N	\N	f
STARRT-AKI 2020	1	1	0	\N	\N	\N	\N	f
START 2019	1	1	0	\N	\N	\N	\N	f
STOP-AKI 2018	1	1	0	\N	\N	\N	\N	f
STROMA-CoV-2 2022	1	1	0	\N	\N	\N	\N	f
STYLETO 2021	1	1	0	\N	\N	\N	\N	f
SUP-ICU 2018	1	1	0	\N	\N	\N	\N	f
TARGET 2018	1	1	0	\N	\N	\N	\N	f
TARGET 2022	1	1	0	\N	\N	\N	\N	f
TELSTAR 2022	1	1	0	\N	\N	\N	\N	f
TRANSFUSE 2017	1	1	0	\N	\N	\N	\N	f
TTM 2013	1	1	0	\N	\N	\N	\N	f
TTM2 2021	1	1	0	\N	\N	\N	\N	f
UNDERPIN-ICU 2021	1	1	0	\N	\N	\N	\N	f
VA/NIH 2008	1	1	0	\N	\N	\N	\N	f
van Meenen 2018	1	1	0	\N	\N	\N	\N	f
VANCS II 2019	1	1	0	\N	\N	\N	\N	f
VAPORISE 2020	1	1	0	\N	\N	\N	\N	f
VAPrapid2 2020	1	1	0	\N	\N	\N	\N	f
VICTAS 2021	1	1	0	\N	\N	\N	\N	f
Villar 2020	1	1	0	\N	\N	\N	\N	f
VIOLET 2019	1	1	0	\N	\N	\N	\N	f
VITAMINS 2020	1	1	0	\N	\N	\N	\N	f
VITdAL-ICU 2014	1	1	0	\N	\N	\N	\N	f
Wang 2020	1	1	0	\N	\N	\N	\N	f
Wiberg 2016	1	1	0	\N	\N	\N	\N	f
CytoResc 2022	1	1	0	\N	\N	\N	\N	f
DOREMI 2021	1	1	0	\N	\N	\N	\N	f
STAR 2021	1	1	0	\N	\N	\N	\N	f
deVries 2022	1	1	0	\N	\N	\N	\N	f
Wacker 2022	1	1	0	\N	\N	\N	\N	f
Rosengrave 2022	1	1	0	\N	\N	\N	\N	f
Tholen 2021	1	1	0	\N	\N	\N	\N	f
Supinski 2021	1	1	0	\N	\N	\N	\N	f
Postle 2022	1	1	0	\N	\N	\N	\N	f
EvK Clinical Trial 2022	1	1	0	\N	\N	\N	\N	f
RESCUE-2 2022	1	1	0	\N	\N	\N	\N	f
SCOPE-DKA 2021	1	1	0	\N	\N	\N	\N	f
CHORAL 2021	1	1	0	\N	\N	\N	\N	f
PROSPECT-FULL 2021	1	1	0	\N	\N	\N	\N	f
CONTROLING 2021	1	1	0	\N	\N	\N	\N	f
Buchtele 2022	1	1	0	\N	\N	\N	\N	f
Zhou 2022	1	1	0	\N	\N	\N	\N	f
Ehrmann 2021	1	1	0	\N	\N	\N	\N	f
Francois 2018	1	1	0	\N	\N	\N	\N	f
Vaschetto 2019	1	1	0	\N	\N	\N	\N	f
DURAPOP 2018	1	1	0	\N	\N	\N	\N	f
SWIPE 2018	1	1	0	\N	\N	\N	\N	f
Muscedere 2018	1	1	0	\N	\N	\N	\N	f
PROGRESS 2021	1	1	0	\N	\N	\N	\N	f
Longhini 2020	1	1	0	\N	\N	\N	\N	f
Merz 2019	1	1	0	\N	\N	\N	\N	f
MOTION 2020	1	1	0	\N	\N	\N	\N	f
HIGH-WEAN 2018	1	1	0	\N	\N	\N	\N	f
VivaITN 2018	1	1	0	\N	\N	\N	\N	f
Gehlbach 2018	1	1	0	\N	\N	\N	\N	f
vanZanten 2018	1	1	0	\N	\N	\N	\N	f
PROHIBIT 2018	1	1	0	\N	\N	\N	\N	f
Hotchkiss 2019	1	1	0	\N	\N	\N	\N	f
HERACLES 2020	1	1	0	\N	\N	\N	\N	f
Zhu 2018	1	1	0	\N	\N	\N	\N	f
You 2018	1	1	0	\N	\N	\N	\N	f
Wittekamp 2018	1	1	0	\N	\N	\N	\N	f
Weidhase 2020	1	1	0	\N	\N	\N	\N	f
Klarin 2018	1	1	0	\N	\N	\N	\N	f
Rozencwajg 2019	1	1	0	\N	\N	\N	\N	f
Martinez 2020	1	1	0	\N	\N	\N	\N	f
Guinot 2020	1	1	0	\N	\N	\N	\N	f
Shimizu 2018	1	1	0	\N	\N	\N	\N	f
Gandolfi 2020	1	1	0	\N	\N	\N	\N	f
PROTRACH 2019	1	1	0	\N	\N	\N	\N	f
Chang 2020	1	1	0	\N	\N	\N	\N	f
RSVP 2020	1	1	0	\N	\N	\N	\N	f
Subira 2019	1	1	0	\N	\N	\N	\N	f
Song 2019	1	1	0	\N	\N	\N	\N	f
Georgevici 2021	1	1	0	\N	\N	\N	\N	f
Ma 2019	1	1	0	\N	\N	\N	\N	f
Dadam 2021	1	1	0	\N	\N	\N	\N	f
Guimaraes 2021	1	1	0	\N	\N	\N	\N	f
Borges 2020	1	1	0	\N	\N	\N	\N	f
CYCOV 2021	1	1	0	\N	\N	\N	\N	f
McNelly 2020	1	1	0	\N	\N	\N	\N	f
Hotchkiss 2019	1	1	0	\N	\N	\N	\N	f
FIBRES 2019	1	1	0	\N	\N	\N	\N	f
Paonessa 2019	1	1	0	\N	\N	\N	\N	f
FLORALI-2 2019	1	1	0	\N	\N	\N	\N	f
Nishikimi 2018	1	1	0	\N	\N	\N	\N	f
Nguyen 2018	1	1	0	\N	\N	\N	\N	f
Douglas 2010	1	1	0	\N	\N	\N	\N	f
deGrooth 2018	1	1	0	\N	\N	\N	\N	f
Magic Bullet study 2019	1	1	0	\N	\N	\N	\N	f
MIDAS 2020	1	1	0	\N	\N	\N	\N	f
POSA-FLU 2021	1	1	0	\N	\N	\N	\N	f
BPCTrea 2018	1	1	0	\N	\N	\N	\N	f
Carteron 2021	1	1	0	\N	\N	\N	\N	f
PEPTIC 2020	1	1	0	\N	\N	\N	\N	f
DOVSS 2018	1	1	0	\N	\N	\N	\N	f
RELEASE 2019	1	1	0	\N	\N	\N	\N	f
Jonkman 2020	1	1	0	\N	\N	\N	\N	f
CO-ILEPSS 2019	1	1	0	\N	\N	\N	\N	f
Benitez-Cano 2020	1	1	0	\N	\N	\N	\N	f
LOCO2 2020	1	1	0	\N	\N	\N	\N	f
HIGH 2018	1	1	0	\N	\N	\N	\N	f
HELP-ECMO 2019	1	1	0	\N	\N	\N	\N	f
Adlbrecht 2020	1	1	0	\N	\N	\N	\N	f
ETTS 2019	1	1	0	\N	\N	\N	\N	f
Hu 2018	1	1	0	\N	\N	\N	\N	f
Tan 2020	1	1	0	\N	\N	\N	\N	f
Li 2018	1	1	0	\N	\N	\N	\N	f
McCaughey 2019	1	1	0	\N	\N	\N	\N	f
Grifols Antithrombin Research Award study 2020	1	1	0	\N	\N	\N	\N	f
Ho 2019	1	1	0	\N	\N	\N	\N	f
He 2019	1	1	0	\N	\N	\N	\N	f
TOPMAST 2019	1	1	0	\N	\N	\N	\N	f
Pascale 2020	1	1	0	\N	\N	\N	\N	f
ASPECT-NP 2019	1	1	0	\N	\N	\N	\N	f
SALT 2017	1	1	0	\N	\N	\N	\N	f
Semler 2018	1	1	0	\N	\N	\N	\N	f
PREVAIL 2016	1	1	0	\N	\N	\N	\N	f
Corti-TC 2014	1	1	0	\N	\N	\N	\N	f
TRICS III 2017	1	1	0	\N	\N	\N	\N	f
SENIOR 2019	1	1	0	\N	\N	\N	\N	f
ALBIOS 2014	1	1	0	\N	\N	\N	\N	f
VANISH 2016	1	1	0	\N	\N	\N	\N	f
ATHOS-3 2017	1	1	0	\N	\N	\N	\N	f
\.


--
-- TOC entry 3261 (class 0 OID 26296)
-- Dependencies: 214
-- Data for Name: software_languages; Type: TABLE DATA; Schema: public; Owner: pi
--

COPY public.software_languages (language_name) FROM stdin;
R
Python
SPSS
SAS
Stata
Matlab
Other
Unreported
\.


--
-- TOC entry 3262 (class 0 OID 26302)
-- Dependencies: 215
-- Data for Name: software_libraries; Type: TABLE DATA; Schema: public; Owner: pi
--

COPY public.software_libraries (library_name) FROM stdin;
None
\.


--
-- TOC entry 3256 (class 0 OID 26266)
-- Dependencies: 209
-- Data for Name: vocabs; Type: TABLE DATA; Schema: public; Owner: pi
--

COPY public.vocabs (vocab_name) FROM stdin;
ICD-8
ICD-9
ICD-10
ATC
RxNorm
SNOMED-CT
LOINC
Unreported
\.


-- Completed on 2022-09-08 23:47:44 CEST

--
-- PostgreSQL database dump complete
--

