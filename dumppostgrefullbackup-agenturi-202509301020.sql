--
-- PostgreSQL database dump
--

-- Dumped from database version 14.19 (Debian 14.19-1.pgdg13+1)
-- Dumped by pg_dump version 17.0

-- Started on 2025-09-30 10:20:11

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 231 (class 1255 OID 32769)
-- Name: actividadesreservadas(); Type: FUNCTION; Schema: public; Owner: carloszarate
--

CREATE FUNCTION public.actividadesreservadas() RETURNS TABLE(first_name character varying, last_name character varying, plan_name character varying, activity_name character varying, extra_cost numeric)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT 
        c.first_name,
        c.last_name,
        p.name AS plan_name,
        a.name AS activity_name,
        a.extra_cost
    FROM Customer c
    JOIN Booking b ON c.id_customer = b.id_customer
    JOIN BookingActivity ba ON b.id_booking = ba.id_booking
    JOIN Activity a ON ba.id_activity = a.id_activity
    JOIN Plan p ON b.id_plan = p.id_plan;
END;
$$;


ALTER FUNCTION public.actividadesreservadas() OWNER TO carloszarate;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 222 (class 1259 OID 25304)
-- Name: customer; Type: TABLE; Schema: public; Owner: carloszarate
--

CREATE TABLE public.customer (
    id_customer integer NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    email character varying(120),
    phone character varying(20)
);


ALTER TABLE public.customer OWNER TO carloszarate;

--
-- TOC entry 237 (class 1255 OID 32772)
-- Name: clientesempiezana(); Type: FUNCTION; Schema: public; Owner: carloszarate
--

CREATE FUNCTION public.clientesempiezana() RETURNS SETOF public.customer
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT * 
    FROM Customer
    WHERE first_name LIKE 'A%';
END;
$$;


ALTER FUNCTION public.clientesempiezana() OWNER TO carloszarate;

--
-- TOC entry 232 (class 1255 OID 32770)
-- Name: clientespagomayorpromedio(); Type: FUNCTION; Schema: public; Owner: carloszarate
--

CREATE FUNCTION public.clientespagomayorpromedio() RETURNS TABLE(id_customer integer, first_name character varying, last_name character varying, total_paid numeric)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT 
        c.id_customer,
        c.first_name,
        c.last_name,
        SUM(pay.amount) AS total_paid
    FROM Customer c
    JOIN Booking b ON c.id_customer = b.id_customer
    JOIN Payment pay ON b.id_booking = pay.id_booking
    GROUP BY c.id_customer, c.first_name, c.last_name
    HAVING SUM(pay.amount) > (SELECT AVG(amount) FROM Payment);
END;
$$;


ALTER FUNCTION public.clientespagomayorpromedio() OWNER TO carloszarate;

--
-- TOC entry 210 (class 1259 OID 25230)
-- Name: destination; Type: TABLE; Schema: public; Owner: carloszarate
--

CREATE TABLE public.destination (
    id_destination integer NOT NULL,
    name character varying(100) NOT NULL,
    country character varying(100),
    city character varying(100)
);


ALTER TABLE public.destination OWNER TO carloszarate;

--
-- TOC entry 238 (class 1255 OID 32773)
-- Name: destinosconco(); Type: FUNCTION; Schema: public; Owner: carloszarate
--

CREATE FUNCTION public.destinosconco() RETURNS SETOF public.destination
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT * 
    FROM Destination
    WHERE country LIKE '%co%';
END;
$$;


ALTER FUNCTION public.destinosconco() OWNER TO carloszarate;

--
-- TOC entry 250 (class 1255 OID 32777)
-- Name: pagos2025(); Type: FUNCTION; Schema: public; Owner: carloszarate
--

CREATE FUNCTION public.pagos2025() RETURNS TABLE(id_payment integer, amount numeric, payment_date date, method character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT 
        id_payment, 
        amount, 
        payment_date, 
        method
    FROM Payment
    WHERE payment_date BETWEEN '2025-01-01' AND '2025-12-31';
END;
$$;


ALTER FUNCTION public.pagos2025() OWNER TO carloszarate;

--
-- TOC entry 212 (class 1259 OID 25237)
-- Name: plan; Type: TABLE; Schema: public; Owner: carloszarate
--

CREATE TABLE public.plan (
    id_plan integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    base_price numeric(10,2) NOT NULL,
    id_destination integer
);


ALTER TABLE public.plan OWNER TO carloszarate;

--
-- TOC entry 239 (class 1255 OID 32774)
-- Name: planesid2(); Type: FUNCTION; Schema: public; Owner: carloszarate
--

CREATE FUNCTION public.planesid2() RETURNS SETOF public.plan
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT * 
    FROM Plan
    WHERE id_plan = 2;
END;
$$;


ALTER FUNCTION public.planesid2() OWNER TO carloszarate;

--
-- TOC entry 236 (class 1255 OID 32771)
-- Name: planespreciomayorpromedio(); Type: FUNCTION; Schema: public; Owner: carloszarate
--

CREATE FUNCTION public.planespreciomayorpromedio() RETURNS TABLE(id_plan integer, plan_name character varying, base_price numeric)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT 
        id_plan,
        name AS plan_name,
        base_price
    FROM Plan
    WHERE base_price > (SELECT AVG(base_price) FROM Plan);
END;
$$;


ALTER FUNCTION public.planespreciomayorpromedio() OWNER TO carloszarate;

--
-- TOC entry 247 (class 1255 OID 32776)
-- Name: planesrango5001500(); Type: FUNCTION; Schema: public; Owner: carloszarate
--

CREATE FUNCTION public.planesrango5001500() RETURNS TABLE(id_plan integer, name character varying, base_price numeric)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT 
        id_plan,
        name,
        base_price
    FROM Plan
    WHERE base_price BETWEEN 500 AND 1500;
END;
$$;


ALTER FUNCTION public.planesrango5001500() OWNER TO carloszarate;

--
-- TOC entry 224 (class 1259 OID 25313)
-- Name: booking; Type: TABLE; Schema: public; Owner: carloszarate
--

CREATE TABLE public.booking (
    id_booking integer NOT NULL,
    booking_date date NOT NULL,
    status character varying(20) DEFAULT 'pending'::character varying,
    id_customer integer,
    id_plan integer,
    CONSTRAINT booking_status_check CHECK (((status)::text = ANY ((ARRAY['pending'::character varying, 'paid'::character varying, 'canceled'::character varying])::text[])))
);


ALTER TABLE public.booking OWNER TO carloszarate;

--
-- TOC entry 240 (class 1255 OID 32775)
-- Name: reservaspagadas(); Type: FUNCTION; Schema: public; Owner: carloszarate
--

CREATE FUNCTION public.reservaspagadas() RETURNS SETOF public.booking
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT * 
    FROM Booking
    WHERE status = 'paid';
END;
$$;


ALTER FUNCTION public.reservaspagadas() OWNER TO carloszarate;

--
-- TOC entry 230 (class 1255 OID 32768)
-- Name: todasreservasnombreclienteplan(); Type: FUNCTION; Schema: public; Owner: carloszarate
--

CREATE FUNCTION public.todasreservasnombreclienteplan() RETURNS TABLE(id_booking integer, first_name character varying, last_name character varying, plan_name character varying, destination_name character varying, status character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT 
        b.id_booking,
        c.first_name,
        c.last_name,
        p.name AS plan_name,
        d.name AS destination_name,
        b.status
    FROM Booking b
    JOIN Customer c ON b.id_customer = c.id_customer
    JOIN Plan p ON b.id_plan = p.id_plan
    JOIN Destination d ON p.id_destination = d.id_destination;
END;
$$;


ALTER FUNCTION public.todasreservasnombreclienteplan() OWNER TO carloszarate;

--
-- TOC entry 218 (class 1259 OID 25280)
-- Name: accommodation; Type: TABLE; Schema: public; Owner: carloszarate
--

CREATE TABLE public.accommodation (
    id_accommodation integer NOT NULL,
    name character varying(100) NOT NULL,
    type character varying(50),
    address character varying(150),
    id_destination integer
);


ALTER TABLE public.accommodation OWNER TO carloszarate;

--
-- TOC entry 217 (class 1259 OID 25279)
-- Name: accommodation_id_accommodation_seq; Type: SEQUENCE; Schema: public; Owner: carloszarate
--

CREATE SEQUENCE public.accommodation_id_accommodation_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.accommodation_id_accommodation_seq OWNER TO carloszarate;

--
-- TOC entry 3527 (class 0 OID 0)
-- Dependencies: 217
-- Name: accommodation_id_accommodation_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carloszarate
--

ALTER SEQUENCE public.accommodation_id_accommodation_seq OWNED BY public.accommodation.id_accommodation;


--
-- TOC entry 216 (class 1259 OID 25265)
-- Name: activity; Type: TABLE; Schema: public; Owner: carloszarate
--

CREATE TABLE public.activity (
    id_activity integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    extra_cost numeric(10,2) DEFAULT 0,
    id_itinerary integer
);


ALTER TABLE public.activity OWNER TO carloszarate;

--
-- TOC entry 215 (class 1259 OID 25264)
-- Name: activity_id_activity_seq; Type: SEQUENCE; Schema: public; Owner: carloszarate
--

CREATE SEQUENCE public.activity_id_activity_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.activity_id_activity_seq OWNER TO carloszarate;

--
-- TOC entry 3528 (class 0 OID 0)
-- Dependencies: 215
-- Name: activity_id_activity_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carloszarate
--

ALTER SEQUENCE public.activity_id_activity_seq OWNED BY public.activity.id_activity;


--
-- TOC entry 223 (class 1259 OID 25312)
-- Name: booking_id_booking_seq; Type: SEQUENCE; Schema: public; Owner: carloszarate
--

CREATE SEQUENCE public.booking_id_booking_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.booking_id_booking_seq OWNER TO carloszarate;

--
-- TOC entry 3529 (class 0 OID 0)
-- Dependencies: 223
-- Name: booking_id_booking_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carloszarate
--

ALTER SEQUENCE public.booking_id_booking_seq OWNED BY public.booking.id_booking;


--
-- TOC entry 229 (class 1259 OID 25355)
-- Name: bookingactivity; Type: TABLE; Schema: public; Owner: carloszarate
--

CREATE TABLE public.bookingactivity (
    id_booking integer NOT NULL,
    id_activity integer NOT NULL
);


ALTER TABLE public.bookingactivity OWNER TO carloszarate;

--
-- TOC entry 221 (class 1259 OID 25303)
-- Name: customer_id_customer_seq; Type: SEQUENCE; Schema: public; Owner: carloszarate
--

CREATE SEQUENCE public.customer_id_customer_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customer_id_customer_seq OWNER TO carloszarate;

--
-- TOC entry 3530 (class 0 OID 0)
-- Dependencies: 221
-- Name: customer_id_customer_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carloszarate
--

ALTER SEQUENCE public.customer_id_customer_seq OWNED BY public.customer.id_customer;


--
-- TOC entry 209 (class 1259 OID 25229)
-- Name: destination_id_destination_seq; Type: SEQUENCE; Schema: public; Owner: carloszarate
--

CREATE SEQUENCE public.destination_id_destination_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.destination_id_destination_seq OWNER TO carloszarate;

--
-- TOC entry 3531 (class 0 OID 0)
-- Dependencies: 209
-- Name: destination_id_destination_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carloszarate
--

ALTER SEQUENCE public.destination_id_destination_seq OWNED BY public.destination.id_destination;


--
-- TOC entry 228 (class 1259 OID 25344)
-- Name: guide; Type: TABLE; Schema: public; Owner: carloszarate
--

CREATE TABLE public.guide (
    id_guide integer NOT NULL,
    name character varying(100) NOT NULL,
    phone character varying(20),
    language character varying(50),
    id_plan integer
);


ALTER TABLE public.guide OWNER TO carloszarate;

--
-- TOC entry 227 (class 1259 OID 25343)
-- Name: guide_id_guide_seq; Type: SEQUENCE; Schema: public; Owner: carloszarate
--

CREATE SEQUENCE public.guide_id_guide_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.guide_id_guide_seq OWNER TO carloszarate;

--
-- TOC entry 3532 (class 0 OID 0)
-- Dependencies: 227
-- Name: guide_id_guide_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carloszarate
--

ALTER SEQUENCE public.guide_id_guide_seq OWNED BY public.guide.id_guide;


--
-- TOC entry 214 (class 1259 OID 25251)
-- Name: itinerary; Type: TABLE; Schema: public; Owner: carloszarate
--

CREATE TABLE public.itinerary (
    id_itinerary integer NOT NULL,
    day integer NOT NULL,
    description text,
    id_plan integer
);


ALTER TABLE public.itinerary OWNER TO carloszarate;

--
-- TOC entry 213 (class 1259 OID 25250)
-- Name: itinerary_id_itinerary_seq; Type: SEQUENCE; Schema: public; Owner: carloszarate
--

CREATE SEQUENCE public.itinerary_id_itinerary_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.itinerary_id_itinerary_seq OWNER TO carloszarate;

--
-- TOC entry 3533 (class 0 OID 0)
-- Dependencies: 213
-- Name: itinerary_id_itinerary_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carloszarate
--

ALTER SEQUENCE public.itinerary_id_itinerary_seq OWNED BY public.itinerary.id_itinerary;


--
-- TOC entry 226 (class 1259 OID 25332)
-- Name: payment; Type: TABLE; Schema: public; Owner: carloszarate
--

CREATE TABLE public.payment (
    id_payment integer NOT NULL,
    amount numeric(10,2) NOT NULL,
    payment_date date NOT NULL,
    method character varying(50),
    id_booking integer
);


ALTER TABLE public.payment OWNER TO carloszarate;

--
-- TOC entry 225 (class 1259 OID 25331)
-- Name: payment_id_payment_seq; Type: SEQUENCE; Schema: public; Owner: carloszarate
--

CREATE SEQUENCE public.payment_id_payment_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payment_id_payment_seq OWNER TO carloszarate;

--
-- TOC entry 3534 (class 0 OID 0)
-- Dependencies: 225
-- Name: payment_id_payment_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carloszarate
--

ALTER SEQUENCE public.payment_id_payment_seq OWNED BY public.payment.id_payment;


--
-- TOC entry 211 (class 1259 OID 25236)
-- Name: plan_id_plan_seq; Type: SEQUENCE; Schema: public; Owner: carloszarate
--

CREATE SEQUENCE public.plan_id_plan_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.plan_id_plan_seq OWNER TO carloszarate;

--
-- TOC entry 3535 (class 0 OID 0)
-- Dependencies: 211
-- Name: plan_id_plan_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carloszarate
--

ALTER SEQUENCE public.plan_id_plan_seq OWNED BY public.plan.id_plan;


--
-- TOC entry 220 (class 1259 OID 25292)
-- Name: transport; Type: TABLE; Schema: public; Owner: carloszarate
--

CREATE TABLE public.transport (
    id_transport integer NOT NULL,
    type character varying(50),
    company character varying(100),
    id_destination integer
);


ALTER TABLE public.transport OWNER TO carloszarate;

--
-- TOC entry 219 (class 1259 OID 25291)
-- Name: transport_id_transport_seq; Type: SEQUENCE; Schema: public; Owner: carloszarate
--

CREATE SEQUENCE public.transport_id_transport_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.transport_id_transport_seq OWNER TO carloszarate;

--
-- TOC entry 3536 (class 0 OID 0)
-- Dependencies: 219
-- Name: transport_id_transport_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carloszarate
--

ALTER SEQUENCE public.transport_id_transport_seq OWNED BY public.transport.id_transport;


--
-- TOC entry 3318 (class 2604 OID 25283)
-- Name: accommodation id_accommodation; Type: DEFAULT; Schema: public; Owner: carloszarate
--

ALTER TABLE ONLY public.accommodation ALTER COLUMN id_accommodation SET DEFAULT nextval('public.accommodation_id_accommodation_seq'::regclass);


--
-- TOC entry 3316 (class 2604 OID 25268)
-- Name: activity id_activity; Type: DEFAULT; Schema: public; Owner: carloszarate
--

ALTER TABLE ONLY public.activity ALTER COLUMN id_activity SET DEFAULT nextval('public.activity_id_activity_seq'::regclass);


--
-- TOC entry 3321 (class 2604 OID 25316)
-- Name: booking id_booking; Type: DEFAULT; Schema: public; Owner: carloszarate
--

ALTER TABLE ONLY public.booking ALTER COLUMN id_booking SET DEFAULT nextval('public.booking_id_booking_seq'::regclass);


--
-- TOC entry 3320 (class 2604 OID 25307)
-- Name: customer id_customer; Type: DEFAULT; Schema: public; Owner: carloszarate
--

ALTER TABLE ONLY public.customer ALTER COLUMN id_customer SET DEFAULT nextval('public.customer_id_customer_seq'::regclass);


--
-- TOC entry 3313 (class 2604 OID 25233)
-- Name: destination id_destination; Type: DEFAULT; Schema: public; Owner: carloszarate
--

ALTER TABLE ONLY public.destination ALTER COLUMN id_destination SET DEFAULT nextval('public.destination_id_destination_seq'::regclass);


--
-- TOC entry 3324 (class 2604 OID 25347)
-- Name: guide id_guide; Type: DEFAULT; Schema: public; Owner: carloszarate
--

ALTER TABLE ONLY public.guide ALTER COLUMN id_guide SET DEFAULT nextval('public.guide_id_guide_seq'::regclass);


--
-- TOC entry 3315 (class 2604 OID 25254)
-- Name: itinerary id_itinerary; Type: DEFAULT; Schema: public; Owner: carloszarate
--

ALTER TABLE ONLY public.itinerary ALTER COLUMN id_itinerary SET DEFAULT nextval('public.itinerary_id_itinerary_seq'::regclass);


--
-- TOC entry 3323 (class 2604 OID 25335)
-- Name: payment id_payment; Type: DEFAULT; Schema: public; Owner: carloszarate
--

ALTER TABLE ONLY public.payment ALTER COLUMN id_payment SET DEFAULT nextval('public.payment_id_payment_seq'::regclass);


--
-- TOC entry 3314 (class 2604 OID 25240)
-- Name: plan id_plan; Type: DEFAULT; Schema: public; Owner: carloszarate
--

ALTER TABLE ONLY public.plan ALTER COLUMN id_plan SET DEFAULT nextval('public.plan_id_plan_seq'::regclass);


--
-- TOC entry 3319 (class 2604 OID 25295)
-- Name: transport id_transport; Type: DEFAULT; Schema: public; Owner: carloszarate
--

ALTER TABLE ONLY public.transport ALTER COLUMN id_transport SET DEFAULT nextval('public.transport_id_transport_seq'::regclass);


--
-- TOC entry 3509 (class 0 OID 25280)
-- Dependencies: 218
-- Data for Name: accommodation; Type: TABLE DATA; Schema: public; Owner: carloszarate
--

COPY public.accommodation (id_accommodation, name, type, address, id_destination) FROM stdin;
1	Hotel Caribe	Hotel	Av. Bocagrande 123	1
2	Hostal Andino	Hostal	Calle Sacsayhuamán 45	2
3	Refugio del Trekking	Refugio	Parque Nacional Torres del Paine	3
4	Resort Cancún Paradise	Resort	Zona Hotelera Km 15	4
5	Luxury Hotel 5	Hotel	Street 50, Block 1	5
6	Boutique Hostel 6	Hostel	Street 60, Block 2	6
7	Mountain Lodge 7	Lodge	Street 70, Block 3	7
8	City Apartment 8	Apartment	Street 80, Block 4	8
9	Luxury Hotel 9	Hotel	Street 90, Block 5	9
10	Boutique Hostel 10	Hostel	Street 100, Block 1	10
11	Mountain Lodge 11	Lodge	Street 110, Block 2	11
12	City Apartment 12	Apartment	Street 120, Block 3	12
13	Luxury Hotel 13	Hotel	Street 130, Block 4	13
14	Boutique Hostel 14	Hostel	Street 140, Block 5	14
15	Mountain Lodge 15	Lodge	Street 150, Block 1	15
16	City Apartment 16	Apartment	Street 160, Block 2	16
17	Luxury Hotel 17	Hotel	Street 170, Block 3	17
18	Boutique Hostel 18	Hostel	Street 180, Block 4	18
19	Mountain Lodge 19	Lodge	Street 190, Block 5	19
20	City Apartment 20	Apartment	Street 200, Block 1	20
21	Luxury Hotel 21	Hotel	Street 210, Block 2	21
22	Boutique Hostel 22	Hostel	Street 220, Block 3	22
23	Mountain Lodge 23	Lodge	Street 230, Block 4	23
24	City Apartment 24	Apartment	Street 240, Block 5	24
25	Luxury Hotel 25	Hotel	Street 250, Block 1	25
26	Boutique Hostel 26	Hostel	Street 260, Block 2	26
27	Mountain Lodge 27	Lodge	Street 270, Block 3	27
28	City Apartment 28	Apartment	Street 280, Block 4	28
29	Luxury Hotel 29	Hotel	Street 290, Block 5	29
30	Boutique Hostel 30	Hostel	Street 300, Block 1	30
31	Mountain Lodge 31	Lodge	Street 310, Block 2	31
32	City Apartment 32	Apartment	Street 320, Block 3	32
33	Luxury Hotel 33	Hotel	Street 330, Block 4	33
34	Boutique Hostel 34	Hostel	Street 340, Block 5	34
35	Mountain Lodge 35	Lodge	Street 350, Block 1	35
36	City Apartment 36	Apartment	Street 360, Block 2	36
37	Luxury Hotel 37	Hotel	Street 370, Block 3	37
38	Boutique Hostel 38	Hostel	Street 380, Block 4	38
39	Mountain Lodge 39	Lodge	Street 390, Block 5	39
40	City Apartment 40	Apartment	Street 400, Block 1	40
41	Luxury Hotel 41	Hotel	Street 410, Block 2	41
42	Boutique Hostel 42	Hostel	Street 420, Block 3	42
43	Mountain Lodge 43	Lodge	Street 430, Block 4	43
44	City Apartment 44	Apartment	Street 440, Block 5	44
45	Luxury Hotel 45	Hotel	Street 450, Block 1	45
46	Boutique Hostel 46	Hostel	Street 460, Block 2	46
47	Mountain Lodge 47	Lodge	Street 470, Block 3	47
48	City Apartment 48	Apartment	Street 480, Block 4	48
49	Luxury Hotel 49	Hotel	Street 490, Block 5	49
50	Boutique Hostel 50	Hostel	Street 500, Block 1	50
51	Mountain Lodge 51	Lodge	Street 510, Block 2	51
52	City Apartment 52	Apartment	Street 520, Block 3	52
53	Luxury Hotel 53	Hotel	Street 530, Block 4	53
54	Boutique Hostel 54	Hostel	Street 540, Block 5	54
55	Mountain Lodge 55	Lodge	Street 550, Block 1	55
56	City Apartment 56	Apartment	Street 560, Block 2	56
57	Luxury Hotel 57	Hotel	Street 570, Block 3	57
58	Boutique Hostel 58	Hostel	Street 580, Block 4	58
59	Mountain Lodge 59	Lodge	Street 590, Block 5	59
60	City Apartment 60	Apartment	Street 600, Block 1	60
61	Luxury Hotel 61	Hotel	Street 610, Block 2	61
62	Boutique Hostel 62	Hostel	Street 620, Block 3	62
63	Mountain Lodge 63	Lodge	Street 630, Block 4	63
64	City Apartment 64	Apartment	Street 640, Block 5	64
65	Luxury Hotel 65	Hotel	Street 650, Block 1	65
66	Boutique Hostel 66	Hostel	Street 660, Block 2	66
67	Mountain Lodge 67	Lodge	Street 670, Block 3	67
68	City Apartment 68	Apartment	Street 680, Block 4	68
69	Luxury Hotel 69	Hotel	Street 690, Block 5	69
70	Boutique Hostel 70	Hostel	Street 700, Block 1	70
71	Mountain Lodge 71	Lodge	Street 710, Block 2	71
72	City Apartment 72	Apartment	Street 720, Block 3	72
73	Luxury Hotel 73	Hotel	Street 730, Block 4	73
74	Boutique Hostel 74	Hostel	Street 740, Block 5	74
75	Mountain Lodge 75	Lodge	Street 750, Block 1	75
76	City Apartment 76	Apartment	Street 760, Block 2	76
77	Luxury Hotel 77	Hotel	Street 770, Block 3	77
78	Boutique Hostel 78	Hostel	Street 780, Block 4	78
79	Mountain Lodge 79	Lodge	Street 790, Block 5	79
80	City Apartment 80	Apartment	Street 800, Block 1	80
81	Luxury Hotel 81	Hotel	Street 810, Block 2	81
82	Boutique Hostel 82	Hostel	Street 820, Block 3	82
83	Mountain Lodge 83	Lodge	Street 830, Block 4	83
84	City Apartment 84	Apartment	Street 840, Block 5	84
85	Luxury Hotel 85	Hotel	Street 850, Block 1	85
86	Boutique Hostel 86	Hostel	Street 860, Block 2	86
87	Mountain Lodge 87	Lodge	Street 870, Block 3	87
88	City Apartment 88	Apartment	Street 880, Block 4	88
89	Luxury Hotel 89	Hotel	Street 890, Block 5	89
90	Boutique Hostel 90	Hostel	Street 900, Block 1	90
91	Mountain Lodge 91	Lodge	Street 910, Block 2	91
92	City Apartment 92	Apartment	Street 920, Block 3	92
93	Luxury Hotel 93	Hotel	Street 930, Block 4	93
94	Boutique Hostel 94	Hostel	Street 940, Block 5	94
95	Mountain Lodge 95	Lodge	Street 950, Block 1	95
96	City Apartment 96	Apartment	Street 960, Block 2	96
97	Luxury Hotel 97	Hotel	Street 970, Block 3	97
98	Boutique Hostel 98	Hostel	Street 980, Block 4	98
99	Mountain Lodge 99	Lodge	Street 990, Block 5	99
100	City Apartment 100	Apartment	Street 1000, Block 1	100
\.


--
-- TOC entry 3507 (class 0 OID 25265)
-- Dependencies: 216
-- Data for Name: activity; Type: TABLE DATA; Schema: public; Owner: carloszarate
--

COPY public.activity (id_activity, name, description, extra_cost, id_itinerary) FROM stdin;
1	City Tour	Recorrido por el centro histórico	50.00	1
2	Playa Blanca	Día de sol y mar	30.00	2
3	Ruinas Incas	Visita arqueológica guiada	60.00	3
4	Montaña Huayna Picchu	Escalada con vista panorámica	80.00	4
5	Senderismo Valle Francés	Excursión de 8 horas	70.00	5
6	Kayak en lago	Navegación en aguas tranquilas	40.00	6
7	Snorkel	Exploración de arrecifes	50.00	8
8	Fiesta mexicana	Show de danza y música	20.00	7
9	Guided Walking Tour	Tour por los zocos de Marrakech y la Medina.	0.00	9
10	Museum Entry	Entrada al Museo del Caucho en Manaus (Costo Extra 45.00).	45.00	10
11	Guided Walking Tour	Tour guiado por el pueblo de Banff.	0.00	11
12	Museum Entry	Entrada al Museo Arqueológico Nacional de Atenas.	25.50	12
13	Sunset Cruise	Crucero al atardecer en la costa de Seminyak.	50.00	13
14	Local Cooking Class	Clase de cocina suiza: fondue y raclette.	10.00	14
15	Guided Walking Tour	Tour por Central Park y la Quinta Avenida.	0.00	15
16	Museum Entry	Entrada al Museo Egipcio en El Cairo.	25.50	16
17	Sunset Cruise	Crucero por el puerto de Ciudad del Cabo.	50.00	17
18	Local Cooking Class	Clase de cocina para hacer ceviche peruano.	10.00	18
19	Guided Walking Tour	Tour a pie por el barrio de Mitte y sus galerías.	0.00	19
20	Museum Entry	Entrada a la Galería de Arte de Nueva Gales del Sur (Costo Extra 45.00).	45.00	20
21	Guided Walking Tour	Tour a pie por el centro histórico.	0.00	21
22	Museum Entry	Visita al Museo de Historia Natural.	25.50	22
23	Sunset Cruise	Paseo en velero al atardecer.	50.00	23
24	Local Cooking Class	Clase de cocina tradicional.	10.00	24
25	Guided Walking Tour	Tour de arquitectura moderna.	0.00	25
26	Museum Entry	Entrada a una galería de arte contemporáneo.	25.50	26
27	Sunset Cruise	Crucero por la bahía.	50.00	27
28	Local Cooking Class	Taller de repostería.	10.00	28
29	Guided Walking Tour	Tour por los jardines botánicos.	0.00	29
30	Museum Entry	Entrada al museo de ciencias (Costo Extra 45.00).	45.00	30
31	Guided Walking Tour	Tour a pie por el parque central.	0.00	31
32	Museum Entry	Visita al museo de bellas artes.	25.50	32
33	Sunset Cruise	Paseo en catamarán.	50.00	33
34	Local Cooking Class	Clase de cocina asiática.	10.00	34
35	Guided Walking Tour	Recorrido por el barrio bohemio.	0.00	35
36	Museum Entry	Entrada al museo de coches antiguos.	25.50	36
37	Sunset Cruise	Crucero nocturno por el río.	50.00	37
38	Local Cooking Class	Taller de panadería.	10.00	38
39	Guided Walking Tour	Tour por la zona portuaria.	0.00	39
40	Museum Entry	Entrada al museo de tecnología (Costo Extra 45.00).	45.00	40
41	Guided Walking Tour	Tour por la zona financiera.	0.00	41
42	Museum Entry	Visita a un museo de arte pop.	25.50	42
43	Sunset Cruise	Paseo en bote con fondo de cristal.	50.00	43
44	Local Cooking Class	Clase de cocina gourmet.	10.00	44
45	Guided Walking Tour	Recorrido por el barrio gótico.	0.00	45
46	Museum Entry	Entrada al museo de fotografía.	25.50	46
47	Sunset Cruise	Crucero con cena incluida.	50.00	47
48	Local Cooking Class	Taller de cócteles.	10.00	48
49	Guided Walking Tour	Tour de la arquitectura renacentista.	0.00	49
50	Museum Entry	Entrada al museo naval (Costo Extra 45.00).	45.00	50
51	Free Time	Tiempo libre para compras de recuerdos.	0.00	51
52	Guided Walking Tour	Tour por el barrio de Triana.	25.50	52
53	Museum Entry	Entrada al Museo Nacional de Historia.	50.00	53
54	Sunset Cruise	Navegación por el Lago Argentino.	10.00	54
55	Local Cooking Class	Clase de cocina vietnamita.	0.00	55
56	Free Time	Relajación en el spa geotérmico.	25.50	56
57	Guided Walking Tour	Visita guiada a la Galería de la Academia.	50.00	57
58	Museum Entry	Entrada al Castillo de Eilean Donan.	10.00	58
59	Sunset Cruise	Campamento bajo las estrellas del Sáhara.	0.00	59
60	Local Cooking Class	Taller de supervivencia en la selva (Costo Extra 45.00).	45.00	60
61	Free Time	Senderismo libre en el Parque Nacional Banff.	0.00	61
62	Guided Walking Tour	Tour por el Ágora Antigua de Atenas.	25.50	62
63	Museum Entry	Visita al Museo Puri Lukisan en Ubud.	50.00	63
64	Sunset Cruise	Paseo en teleférico a Harder Kulm.	10.00	64
65	Local Cooking Class	Clase de pastelería neoyorquina.	0.00	65
66	Free Time	Visita a la Mezquita de Al-Azhar.	25.50	66
67	Guided Walking Tour	Tour por Bo-Kaap (barrio malayo).	50.00	67
68	Museum Entry	Visita al Museo Precolombino en Cusco.	10.00	68
69	Sunset Cruise	Crucero por el río Spree.	0.00	69
70	Local Cooking Class	Clase de cocina australiana (Costo Extra 45.00).	45.00	70
71	Free Time	Tarde libre en la playa.	0.00	71
72	Guided Walking Tour	Tour de los murales de la ciudad.	25.50	72
73	Museum Entry	Visita a un museo de historia local.	50.00	73
74	Sunset Cruise	Paseo en yate.	10.00	74
75	Local Cooking Class	Taller de postres europeos.	0.00	75
76	Free Time	Compras de artesanía local.	25.50	76
77	Guided Walking Tour	Tour por la selva.	50.00	77
78	Museum Entry	Visita al museo marítimo.	10.00	78
79	Sunset Cruise	Crucero por el Mediterráneo.	0.00	79
80	Local Cooking Class	Taller de parrilla africana (Costo Extra 45.00).	45.00	80
81	Free Time	Día de descanso y lectura.	0.00	81
82	Guided Walking Tour	Tour de tacos y mezcal.	25.50	82
83	Museum Entry	Visita a un ashram y meditación.	50.00	83
84	Sunset Cruise	Paseo en longtail boat.	10.00	84
85	Local Cooking Class	Clase de bacalao à brás.	0.00	85
86	Free Time	Día de playa en Santa Mónica.	25.50	86
87	Guided Walking Tour	Tour de arte callejero en Barranco.	50.00	87
88	Museum Entry	Visita al Fuerte Rojo.	10.00	88
89	Sunset Cruise	Paseo en barco por el río Chao Phraya.	0.00	89
90	Local Cooking Class	Taller de Pastéis de Nata (Costo Extra 45.00).	45.00	90
91	Free Time	Visita a museos de la ciudad.	0.00	91
92	Guided Walking Tour	Tour por Tulum y sus ruinas.	25.50	92
93	Museum Entry	Entrada al Palacio del Maharajá.	50.00	93
94	Sunset Cruise	Crucero en Koh Lanta.	10.00	94
95	Local Cooking Class	Clase de Sardinhas Assadas.	0.00	95
96	Free Time	Exploración del Strip de Las Vegas.	25.50	96
97	Guided Walking Tour	Tour de arte y gastronomía en La Roma.	50.00	97
98	Museum Entry	Visita al Museo Nacional.	10.00	98
99	Sunset Cruise	Paseo en barco en Phuket.	0.00	99
100	Local Cooking Class	Taller de vino de Oporto (Costo Extra 45.00).	45.00	100
\.


--
-- TOC entry 3515 (class 0 OID 25313)
-- Dependencies: 224
-- Data for Name: booking; Type: TABLE DATA; Schema: public; Owner: carloszarate
--

COPY public.booking (id_booking, booking_date, status, id_customer, id_plan) FROM stdin;
1	2025-09-20	paid	1	1
2	2025-09-21	pending	2	2
3	2025-09-22	canceled	3	3
4	2025-09-23	paid	4	4
5	2024-05-11	paid	5	5
6	2024-05-13	canceled	6	6
7	2024-05-15	pending	7	7
8	2024-05-17	paid	8	8
9	2024-05-19	canceled	9	9
10	2024-05-21	pending	10	10
11	2024-05-23	paid	11	11
12	2024-05-25	canceled	12	12
13	2024-05-27	pending	13	13
14	2024-05-29	paid	14	14
15	2024-05-31	canceled	15	15
16	2024-06-02	pending	16	16
17	2024-06-04	paid	17	17
18	2024-06-06	canceled	18	18
19	2024-06-08	pending	19	19
20	2024-06-10	paid	20	20
21	2024-06-12	canceled	21	21
22	2024-06-14	pending	22	22
23	2024-06-16	paid	23	23
24	2024-06-18	canceled	24	24
25	2024-06-20	pending	25	25
26	2024-06-22	paid	26	26
27	2024-06-24	canceled	27	27
28	2024-06-26	pending	28	28
29	2024-06-28	paid	29	29
30	2024-06-30	canceled	30	30
31	2024-07-02	pending	31	31
32	2024-07-04	paid	32	32
33	2024-07-06	canceled	33	33
34	2024-07-08	pending	34	34
35	2024-07-10	paid	35	35
36	2024-07-12	canceled	36	36
37	2024-07-14	pending	37	37
38	2024-07-16	paid	38	38
39	2024-07-18	canceled	39	39
40	2024-07-20	pending	40	40
41	2024-07-22	paid	41	41
42	2024-07-24	canceled	42	42
43	2024-07-26	pending	43	43
44	2024-07-28	paid	44	44
45	2024-07-30	canceled	45	45
46	2024-08-01	pending	46	46
47	2024-08-03	paid	47	47
48	2024-08-05	canceled	48	48
49	2024-08-07	pending	49	49
50	2024-08-09	paid	50	50
51	2024-08-11	canceled	51	51
52	2024-08-13	pending	52	52
53	2024-08-15	paid	53	53
54	2024-08-17	canceled	54	54
55	2024-08-19	pending	55	55
56	2024-08-21	paid	56	56
57	2024-08-23	canceled	57	57
58	2024-08-25	pending	58	58
59	2024-08-27	paid	59	59
60	2024-08-29	canceled	60	60
61	2024-08-31	pending	61	61
62	2024-09-02	paid	62	62
63	2024-09-04	canceled	63	63
64	2024-09-06	pending	64	64
65	2024-09-08	paid	65	65
66	2024-09-10	canceled	66	66
67	2024-09-12	pending	67	67
68	2024-09-14	paid	68	68
69	2024-09-16	canceled	69	69
70	2024-09-18	pending	70	70
71	2024-09-20	paid	71	71
72	2024-09-22	canceled	72	72
73	2024-09-24	pending	73	73
74	2024-09-26	paid	74	74
75	2024-09-28	canceled	75	75
76	2024-09-30	pending	76	76
77	2024-10-02	paid	77	77
78	2024-10-04	canceled	78	78
79	2024-10-06	pending	79	79
80	2024-10-08	paid	80	80
81	2024-10-10	canceled	81	81
82	2024-10-12	pending	82	82
83	2024-10-14	paid	83	83
84	2024-10-16	canceled	84	84
85	2024-10-18	pending	85	85
86	2024-10-20	paid	86	86
87	2024-10-22	canceled	87	87
88	2024-10-24	pending	88	88
89	2024-10-26	paid	89	89
90	2024-10-28	canceled	90	90
91	2024-10-30	pending	91	91
92	2024-11-01	paid	92	92
93	2024-11-03	canceled	93	93
94	2024-11-05	pending	94	94
95	2024-11-07	paid	95	95
96	2024-11-09	canceled	96	96
97	2024-11-11	pending	97	97
98	2024-11-13	paid	98	98
99	2024-11-15	canceled	99	99
100	2024-11-17	paid	100	100
\.


--
-- TOC entry 3520 (class 0 OID 25355)
-- Dependencies: 229
-- Data for Name: bookingactivity; Type: TABLE DATA; Schema: public; Owner: carloszarate
--

COPY public.bookingactivity (id_booking, id_activity) FROM stdin;
1	1
1	2
2	3
2	4
3	5
3	6
4	7
4	8
\.


--
-- TOC entry 3513 (class 0 OID 25304)
-- Dependencies: 222
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: carloszarate
--

COPY public.customer (id_customer, first_name, last_name, email, phone) FROM stdin;
1	Carlos	Zárate	carlos@example.com	+57 3011234567
2	María	Gómez	maria@example.com	+51 987654321
3	Juan	Pérez	juanp@example.com	+56 998877665
4	Ana	Martínez	ana@example.com	+52 443322110
5	Lucas	Miller	customer5@example.com	800-555-0005
6	Liam	Smith	customer6@example.com	800-555-0006
7	Olivia	Jones	customer7@example.com	800-555-0007
8	Noah	Brown	customer8@example.com	800-555-0008
9	Emma	Garcia	customer9@example.com	800-555-0009
10	Lucas	Miller	customer10@example.com	800-555-0010
11	Liam	Smith	customer11@example.com	800-555-0011
12	Olivia	Jones	customer12@example.com	800-555-0012
13	Noah	Brown	customer13@example.com	800-555-0013
14	Emma	Garcia	customer14@example.com	800-555-0014
15	Lucas	Miller	customer15@example.com	800-555-0015
16	Liam	Smith	customer16@example.com	800-555-0016
17	Olivia	Jones	customer17@example.com	800-555-0017
18	Noah	Brown	customer18@example.com	800-555-0018
19	Emma	Garcia	customer19@example.com	800-555-0019
20	Lucas	Miller	customer20@example.com	800-555-0020
21	Liam	Smith	customer21@example.com	800-555-0021
22	Olivia	Jones	customer22@example.com	800-555-0022
23	Noah	Brown	customer23@example.com	800-555-0023
24	Emma	Garcia	customer24@example.com	800-555-0024
25	Lucas	Miller	customer25@example.com	800-555-0025
26	Liam	Smith	customer26@example.com	800-555-0026
27	Olivia	Jones	customer27@example.com	800-555-0027
28	Noah	Brown	customer28@example.com	800-555-0028
29	Emma	Garcia	customer29@example.com	800-555-0029
30	Lucas	Miller	customer30@example.com	800-555-0030
31	Liam	Smith	customer31@example.com	800-555-0031
32	Olivia	Jones	customer32@example.com	800-555-0032
33	Noah	Brown	customer33@example.com	800-555-0033
34	Emma	Garcia	customer34@example.com	800-555-0034
35	Lucas	Miller	customer35@example.com	800-555-0035
36	Liam	Smith	customer36@example.com	800-555-0036
37	Olivia	Jones	customer37@example.com	800-555-0037
38	Noah	Brown	customer38@example.com	800-555-0038
39	Emma	Garcia	customer39@example.com	800-555-0039
40	Lucas	Miller	customer40@example.com	800-555-0040
41	Liam	Smith	customer41@example.com	800-555-0041
42	Olivia	Jones	customer42@example.com	800-555-0042
43	Noah	Brown	customer43@example.com	800-555-0043
44	Emma	Garcia	customer44@example.com	800-555-0044
45	Lucas	Miller	customer45@example.com	800-555-0045
46	Liam	Smith	customer46@example.com	800-555-0046
47	Olivia	Jones	customer47@example.com	800-555-0047
48	Noah	Brown	customer48@example.com	800-555-0048
49	Emma	Garcia	customer49@example.com	800-555-0049
50	Lucas	Miller	customer50@example.com	800-555-0050
51	Liam	Smith	customer51@example.com	800-555-0051
52	Olivia	Jones	customer52@example.com	800-555-0052
53	Noah	Brown	customer53@example.com	800-555-0053
54	Emma	Garcia	customer54@example.com	800-555-0054
55	Lucas	Miller	customer55@example.com	800-555-0055
56	Liam	Smith	customer56@example.com	800-555-0056
57	Olivia	Jones	customer57@example.com	800-555-0057
58	Noah	Brown	customer58@example.com	800-555-0058
59	Emma	Garcia	customer59@example.com	800-555-0059
60	Lucas	Miller	customer60@example.com	800-555-0060
61	Liam	Smith	customer61@example.com	800-555-0061
62	Olivia	Jones	customer62@example.com	800-555-0062
63	Noah	Brown	customer63@example.com	800-555-0063
64	Emma	Garcia	customer64@example.com	800-555-0064
65	Lucas	Miller	customer65@example.com	800-555-0065
66	Liam	Smith	customer66@example.com	800-555-0066
67	Olivia	Jones	customer67@example.com	800-555-0067
68	Noah	Brown	customer68@example.com	800-555-0068
69	Emma	Garcia	customer69@example.com	800-555-0069
70	Lucas	Miller	customer70@example.com	800-555-0070
71	Liam	Smith	customer71@example.com	800-555-0071
72	Olivia	Jones	customer72@example.com	800-555-0072
73	Noah	Brown	customer73@example.com	800-555-0073
74	Emma	Garcia	customer74@example.com	800-555-0074
75	Lucas	Miller	customer75@example.com	800-555-0075
76	Liam	Smith	customer76@example.com	800-555-0076
77	Olivia	Jones	customer77@example.com	800-555-0077
78	Noah	Brown	customer78@example.com	800-555-0078
79	Emma	Garcia	customer79@example.com	800-555-0079
80	Lucas	Miller	customer80@example.com	800-555-0080
81	Liam	Smith	customer81@example.com	800-555-0081
82	Olivia	Jones	customer82@example.com	800-555-0082
83	Noah	Brown	customer83@example.com	800-555-0083
84	Emma	Garcia	customer84@example.com	800-555-0084
85	Lucas	Miller	customer85@example.com	800-555-0085
86	Liam	Smith	customer86@example.com	800-555-0086
87	Olivia	Jones	customer87@example.com	800-555-0087
88	Noah	Brown	customer88@example.com	800-555-0088
89	Emma	Garcia	customer89@example.com	800-555-0089
90	Lucas	Miller	customer90@example.com	800-555-0090
91	Liam	Smith	customer91@example.com	800-555-0091
92	Olivia	Jones	customer92@example.com	800-555-0092
93	Noah	Brown	customer93@example.com	800-555-0093
94	Emma	Garcia	customer94@example.com	800-555-0094
95	Lucas	Miller	customer95@example.com	800-555-0095
96	Liam	Smith	customer96@example.com	800-555-0096
97	Olivia	Jones	customer97@example.com	800-555-0097
98	Noah	Brown	customer98@example.com	800-555-0098
99	Emma	Garcia	customer99@example.com	800-555-0099
100	Lucas	Miller	customer100@example.com	800-555-0100
\.


--
-- TOC entry 3501 (class 0 OID 25230)
-- Dependencies: 210
-- Data for Name: destination; Type: TABLE DATA; Schema: public; Owner: carloszarate
--

COPY public.destination (id_destination, name, country, city) FROM stdin;
1	Playa Blanca	Colombia	Cartagena
2	Machu Picchu	Perú	Cusco
3	Torres del Paine	Chile	Puerto Natales
4	Cancún	México	Quintana Roo
5	Parisian Romance	France	Paris
6	Tokyo Neon Dreams	Japan	Tokyo
7	NYC Metropolitan	USA	New York
8	Rio Carnival Vibe	Brazil	Rio de Janeiro
9	Rome Ancient Wonders	Italy	Rome
10	Cape Town Safari Gate	South Africa	Cape Town
11	Sydney Coastal Escape	Australia	Sydney
12	Machu Picchu Trek	Peru	Cusco
13	Dubai Desert Skyline	UAE	Dubai
14	Prague Old Town Charm	Czech Republic	Prague
15	Bangkok Street Eats	Thailand	Bangkok
16	London Royal History	UK	London
17	Barcelona Gothic Quarters	Spain	Barcelona
18	Cairo Pyramids	Egypt	Cairo
19	Vienna Classical Music	Austria	Vienna
20	Seoul Tech & Culture	South Korea	Seoul
21	Berlin Modern History	Germany	Berlin
22	Amsterdam Canals	Netherlands	Amsterdam
23	Santorini Sunset Views	Greece	Santorini
24	Reykjavik Northern Lights	Iceland	Reykjavik
25	Bali Island Retreat	Indonesia	Ubud
26	Vancouver Nature Hub	Canada	Vancouver
27	Moscow Kremlin	Russia	Moscow
28	Marrakech Souks	Morocco	Marrakech
29	Hanoi Old Quarter	Vietnam	Hanoi
30	Edinburgh Castle Tours	UK	Edinburgh
31	San Francisco Bay Area	USA	San Francisco
32	Hong Kong City Lights	China	Hong Kong
33	Kuala Lumpur Twin Towers	Malaysia	Kuala Lumpur
34	Dublin Pub Crawls	Ireland	Dublin
35	Auckland Harborside	New Zealand	Auckland
36	Geneva Swiss Alps	Switzerland	Geneva
37	Stockholm Archipelago	Sweden	Stockholm
38	Oslo Fjord Exploration	Norway	Oslo
39	Lisbon Tram Rides	Portugal	Lisbon
40	Mumbai Bollywood City	India	Mumbai
41	Istanbul Grand Bazaar	Turkey	Istanbul
42	Mexico City Murals	Mexico	Mexico City
43	Buenos Aires Tango	Argentina	Buenos Aires
44	Santiago Wine Country	Chile	Santiago
45	Copenhagen Fairy Tales	Denmark	Copenhagen
46	Helsinki Sauna & Sea	Finland	Helsinki
47	Brussels European Hub	Belgium	Brussels
48	Athens Acropolis	Greece	Athens
49	Singapore Gardens	Singapore	Singapore
50	Las Vegas Strip	USA	Las Vegas
51	Florence Renaissance	Italy	Florence
52	Phuket Beaches	Thailand	Phuket
53	Nairobi Wildlife	Kenya	Nairobi
54	Tel Aviv Beaches	Israel	Tel Aviv
55	Monte Carlo Luxury	Monaco	Monte Carlo
56	Caracas Mountain Views	Venezuela	Caracas
57	Quito Historic Center	Ecuador	Quito
58	Bogota Gold Museum	Colombia	Bogota
59	Lima Culinary Tour	Peru	Lima
60	Dakar Markets	Senegal	Dakar
61	Accra Coastal Life	Ghana	Accra
62	Lagos Eko Atlantic	Nigeria	Lagos
63	Algiers Mediterranean	Algeria	Algiers
64	Tunis Medina	Tunisia	Tunis
65	Amman Petra Gate	Jordan	Amman
66	Doha Modern Architecture	Qatar	Doha
67	Muscat Tradition	Oman	Muscat
68	Manila Archipelago	Philippines	Manila
69	Jakarta Old Batavia	Indonesia	Jakarta
70	Taipei Night Markets	Taiwan	Taipei
71	Shanghai Bund	China	Shanghai
72	Kyoto Temples	Japan	Kyoto
73	Miami Beach	USA	Miami
74	Seattle Coffee Scene	USA	Seattle
75	Dallas Oil History	USA	Dallas
76	Boston Freedom Trail	USA	Boston
77	Toronto CN Tower	Canada	Toronto
78	Montreal French Vibe	Canada	Montreal
79	Dublin Cliffs	Ireland	Cork
80	Manchester Football	UK	Manchester
81	Marseille Port	France	Marseille
82	Hamburg Harbor City	Germany	Hamburg
83	Munich Beer Halls	Germany	Munich
84	Milan Fashion Capital	Italy	Milan
85	Naples Pizza	Italy	Naples
86	Porto Douro Valley	Portugal	Porto
87	Seville Flamenco	Spain	Seville
88	Valencia Paella Coast	Spain	Valencia
89	Zurich Finance Hub	Switzerland	Zurich
90	Brussels Chocolate	Belgium	Bruges
91	Budapest Thermal Baths	Hungary	Budapest
92	Warsaw History	Poland	Warsaw
93	Krakow Wawel Castle	Poland	Krakow
94	Bucharest Palace	Romania	Bucharest
95	Sofia Orthodox	Bulgaria	Sofia
96	Zagreb Upper Town	Croatia	Zagreb
97	Belgrade Fortress	Serbia	Belgrade
98	Kyiv Golden Gates	Ukraine	Kyiv
99	Vilnius Old Town	Lithuania	Vilnius
100	Riga Art Nouveau	Latvia	Riga
101	Tallinn Medieval Walls	Estonia	Tallinn
102	Canberra Parliament	Australia	Canberra
103	Wellington Film Capital	New Zealand	Wellington
104	Perth Western Coast	Australia	Perth
105	Adelaide Wine Region	Australia	Adelaide
106	Brisbane River City	Australia	Brisbane
107	Guanajuato Colorful City	Mexico	Guanajuato
108	Cartagena Walled City	Colombia	Cartagena
\.


--
-- TOC entry 3519 (class 0 OID 25344)
-- Dependencies: 228
-- Data for Name: guide; Type: TABLE DATA; Schema: public; Owner: carloszarate
--

COPY public.guide (id_guide, name, phone, language, id_plan) FROM stdin;
1	Luis Herrera	+57 3001112233	Español	1
2	Sofía Rojas	+51 987112233	Inglés	2
3	Pedro Ramírez	+56 991223344	Español	3
4	Laura González	+52 555112233	Inglés	4
5	Aisha Khan	555-1005	English	5
6	Guide 6	555-1006	Local Dialect	6
7	Guide 7	555-1007	English	7
8	Guide 8	555-1008	Spanish	8
9	Guide 9	555-1009	French	9
10	Guide 10	555-1010	Local Dialect	10
11	Guide 11	555-1011	English	11
12	Guide 12	555-1012	Spanish	12
13	Guide 13	555-1013	French	13
14	Guide 14	555-1014	Local Dialect	14
15	Guide 15	555-1015	English	15
16	Guide 16	555-1016	Spanish	16
17	Guide 17	555-1017	French	17
18	Guide 18	555-1018	Local Dialect	18
19	Guide 19	555-1019	English	19
20	Guide 20	555-1020	Spanish	20
21	Guide 21	555-1021	French	21
22	Guide 22	555-1022	Local Dialect	22
23	Guide 23	555-1023	English	23
24	Guide 24	555-1024	Spanish	24
25	Guide 25	555-1025	French	25
26	Guide 26	555-1026	Local Dialect	26
27	Guide 27	555-1027	English	27
28	Guide 28	555-1028	Spanish	28
29	Guide 29	555-1029	French	29
30	Guide 30	555-1030	Local Dialect	30
31	Guide 31	555-1031	English	31
32	Guide 32	555-1032	Spanish	32
33	Guide 33	555-1033	French	33
34	Guide 34	555-1034	Local Dialect	34
35	Guide 35	555-1035	English	35
36	Guide 36	555-1036	Spanish	36
37	Guide 37	555-1037	French	37
38	Guide 38	555-1038	Local Dialect	38
39	Guide 39	555-1039	English	39
40	Guide 40	555-1040	Spanish	40
41	Guide 41	555-1041	French	41
42	Guide 42	555-1042	Local Dialect	42
43	Guide 43	555-1043	English	43
44	Guide 44	555-1044	Spanish	44
45	Guide 45	555-1045	French	45
46	Guide 46	555-1046	Local Dialect	46
47	Guide 47	555-1047	English	47
48	Guide 48	555-1048	Spanish	48
49	Guide 49	555-1049	French	49
50	Guide 50	555-1050	Local Dialect	50
51	Guide 51	555-1051	English	51
52	Guide 52	555-1052	Spanish	52
53	Guide 53	555-1053	French	53
54	Guide 54	555-1054	Local Dialect	54
55	Guide 55	555-1055	English	55
56	Guide 56	555-1056	Spanish	56
57	Guide 57	555-1057	French	57
58	Guide 58	555-1058	Local Dialect	58
59	Guide 59	555-1059	English	59
60	Guide 60	555-1060	Spanish	60
61	Guide 61	555-1061	French	61
62	Guide 62	555-1062	Local Dialect	62
63	Guide 63	555-1063	English	63
64	Guide 64	555-1064	Spanish	64
65	Guide 65	555-1065	French	65
66	Guide 66	555-1066	Local Dialect	66
67	Guide 67	555-1067	English	67
68	Guide 68	555-1068	Spanish	68
69	Guide 69	555-1069	French	69
70	Guide 70	555-1070	Local Dialect	70
71	Guide 71	555-1071	English	71
72	Guide 72	555-1072	Spanish	72
73	Guide 73	555-1073	French	73
74	Guide 74	555-1074	Local Dialect	74
75	Guide 75	555-1075	English	75
76	Guide 76	555-1076	Spanish	76
77	Guide 77	555-1077	French	77
78	Guide 78	555-1078	Local Dialect	78
79	Guide 79	555-1079	English	79
80	Guide 80	555-1080	Spanish	80
81	Guide 81	555-1081	French	81
82	Guide 82	555-1082	Local Dialect	82
83	Guide 83	555-1083	English	83
84	Guide 84	555-1084	Spanish	84
85	Guide 85	555-1085	French	85
86	Guide 86	555-1086	Local Dialect	86
87	Guide 87	555-1087	English	87
88	Guide 88	555-1088	Spanish	88
89	Guide 89	555-1089	French	89
90	Guide 90	555-1090	Local Dialect	90
91	Guide 91	555-1091	English	91
92	Guide 92	555-1092	Spanish	92
93	Guide 93	555-1093	French	93
94	Guide 94	555-1094	Local Dialect	94
95	Guide 95	555-1095	English	95
96	Guide 96	555-1096	Spanish	96
97	Guide 97	555-1097	French	97
98	Guide 98	555-1098	Local Dialect	98
99	Guide 99	555-1099	English	99
100	Guide 100	555-1100	Spanish	100
\.


--
-- TOC entry 3505 (class 0 OID 25251)
-- Dependencies: 214
-- Data for Name: itinerary; Type: TABLE DATA; Schema: public; Owner: carloszarate
--

COPY public.itinerary (id_itinerary, day, description, id_plan) FROM stdin;
1	1	Llegada y recorrido por la ciudad	1
2	2	Excursión a las playas	1
3	1	Visita guiada a las ruinas	2
4	2	Ascenso a la montaña	2
5	1	Inicio del trekking en la base del parque	3
6	2	Campamento en el valle	3
7	1	Check-in en el hotel y cena buffet	4
8	2	Tour acuático y deportes de playa	4
9	1	Llegada a Marrakech. Cena en la plaza Jemaa el-Fna.	9
10	1	Traslado en barco por el Río Negro. Check-in en eco-lodge.	10
11	1	Llegada y exploración de Banff. Paseo por el Lago Louise.	11
12	1	Visita a la Acrópolis y el Partenón. Cena con vista.	12
13	1	Clase de meditación y yoga. Masaje balinés de bienvenida.	13
14	1	Viaje en tren panorámico a Interlaken. Parapente opcional.	14
15	1	Recorrido por Times Square y Broadway. Cena en Midtown.	15
16	1	Visita a las Pirámides de Giza y la Esfinge.	16
17	1	Recorrido en coche por la carretera de la Costa Atlántica.	17
18	1	Día de aclimatación en Cusco. Visita al mercado local.	18
19	1	Tour histórico del Muro de Berlín y Checkpoint Charlie.	19
20	1	Paseo en ferry por el puerto de Sídney. Cena en Darling Harbour.	20
21	1	Mañana de descanso. Tarde de exploración del centro de la ciudad.	21
22	1	Visita a un museo local. Noche de jazz en vivo.	22
23	1	Tour en bicicleta por la playa. Cena de mariscos.	23
24	1	Caminata a una cascada. Almuerzo de picnic.	24
25	1	Visita a un parque nacional. Noche de observación de estrellas.	25
26	1	Recorrido de arte callejero. Taller de artesanía local.	26
27	1	Exploración de la vida nocturna. Cata de cervezas artesanales.	27
28	1	Visita a un antiguo templo. Paseo en barco.	28
29	1	Día de compras en un mercado tradicional. Prueba de dulces locales.	29
30	1	Clase de cocina regional. Noche de cine al aire libre.	30
31	1	Visita a un jardín botánico. Tarde de lectura tranquila.	31
32	1	Día en un parque temático. Cena elegante.	32
33	1	Exploración de cuevas. Baño en aguas termales.	33
34	1	Día de avistamiento de aves. Noche en un campamento.	34
35	1	Clase de baile local. Visita a un bar con música en vivo.	35
36	1	Excursión a un volcán. Almuerzo con vista panorámica.	36
37	1	Paseo a caballo por la montaña. Cena campestre.	37
38	1	Visita a una bodega y degustación de vinos.	38
39	1	Día de kayak en el río. BBQ en la orilla.	39
40	1	Tour en helicóptero. Cena en un restaurante de altura.	40
41	1	Visita a un acuario. Tarde de relajación en el spa.	41
42	1	Clase de alfarería local. Compras de recuerdos.	42
43	1	Día de surf en la playa. Noche de fogata.	43
44	1	Paseo en globo aerostático al amanecer. Desayuno champagne.	44
45	1	Visita a un castillo medieval. Cena de gala.	45
46	1	Tour de observación de aves. Tarde de fotografía.	46
47	1	Caminata por el bosque. Picnic gourmet.	47
48	1	Visita a un teatro local. Obra de teatro.	48
49	1	Día de golf en un campo profesional. Cena en el club.	49
50	1	Exploración de un mercado de pulgas. Tarde de café.	50
51	2	Día completo de visitas a templos y jardines Zen. Ceremonia del té.	1
52	2	Tour de la Giralda y el Alcázar. Espectáculo de flamenco por la noche.	2
53	2	Visita al Castillo de Bran (Drácula). Cena medieval.	3
54	2	Trekking sobre el glaciar con crampones. Cena de cordero patagónico.	4
55	2	Tour en Ha Long Bay. Noche en junco tradicional.	5
56	2	Visita a la Laguna Azul. Búsqueda de auroras boreales.	6
57	2	Recorrido por Florencia: Duomo y Uffizi. Cena elegante.	7
58	2	Excursión al Lago Ness. Visita a la destilería de whisky.	8
59	2	Paseo en camello por el desierto. Noche en campamento bereber.	9
60	2	Caminata de día completo en la selva. Avistamiento de fauna.	10
61	2	Día completo de senderismo en Johnston Canyon. Cena con vista.	11
62	2	Excursión a Delfos. Almuerzo tradicional griego.	12
63	2	Clase de cocina balinesa. Visita a arrozales de Tegalalang.	13
64	2	Senderismo alpino en Grindelwald. Cena de fondue.	14
65	2	Visita a la Estatua de la Libertad y Ellis Island. Noche en West Village.	15
66	2	Crucero por el Nilo al atardecer. Cena con espectáculo.	16
67	2	Ascenso a Table Mountain. Cata de vinos en Stellenbosch.	17
68	2	Inicio del Camino Inca (primer tramo). Cena de campamento.	18
69	2	Visita al Reichstag y la Puerta de Brandenburgo. Cena moderna.	19
70	2	Visita a la Ópera de Sídney. Tarde libre en Bondi Beach.	20
71	2	Recorrido por la costa. Almuerzo en un café frente al mar.	21
72	2	Exploración de mercados de especias y telas. Visita a una galería.	22
73	2	Día de senderismo ligero. Almuerzo con comida de la granja.	23
74	2	Día de snorkel y buceo. Cena en la playa.	24
75	2	Clase de historia local. Tarde de degustación de quesos.	25
76	2	Visita a una aldea tradicional. Espectáculo cultural nocturno.	26
77	2	Tour de naturaleza y observación de aves. Cena de barbacoa.	27
78	2	Día de relax en el lago. Pesca deportiva.	28
79	2	Visita a ruinas antiguas. Tarde de té en un jardín.	29
80	2	Safari al amanecer. Desayuno en la sabana.	30
81	2	Clase de fotografía de paisaje. Puesta de sol en la montaña.	31
82	2	Tour gastronómico por la ciudad. Degustación de tequila.	32
83	2	Día de spa y bienestar. Cena vegetariana.	33
84	2	Paseo en bote por el río. Visita a un pueblo flotante.	34
85	2	Clase de azulejos portugueses. Cena de Fado.	35
86	2	Tour por Hollywood. Cena de lujo en Beverly Hills.	36
87	2	Avistamiento de ballenas. Cena de mariscos frescos.	37
88	2	Visita al Taj Mahal al amanecer. Desayuno tradicional indio.	38
89	2	Tour por las islas Phi Phi. Snorkel en la bahía.	39
90	2	Exploración de Lisboa en tranvía. Cena con vino verde.	40
91	2	Día de playa en California. Almuerzo de tacos.	41
92	2	Visita a Chichén Itzá. Nado en un cenote.	42
93	2	Recorrido por el desierto de Rajastán en camello. Cena bajo las estrellas.	43
94	2	Tour de la ciudad de Bangkok. Visita al Gran Palacio.	44
95	2	Exploración del Algarve. Cena con vistas al mar.	45
96	2	Visita al Gran Cañón en helicóptero. Picnic gourmet.	46
97	2	Tour por Guadalajara. Clase de mariachi.	47
98	2	Recorrido por la Mumbai moderna. Cena Bollywood.	48
99	2	Día de trekking en Chiang Mai. Masaje tailandés.	49
100	2	Visita a Oporto y cata de vino. Cena de mariscos.	50
\.


--
-- TOC entry 3517 (class 0 OID 25332)
-- Dependencies: 226
-- Data for Name: payment; Type: TABLE DATA; Schema: public; Owner: carloszarate
--

COPY public.payment (id_payment, amount, payment_date, method, id_booking) FROM stdin;
1	1200.00	2025-09-20	Tarjeta de crédito	1
2	1500.00	2025-09-21	Efectivo	2
3	2000.00	2025-09-22	Transferencia bancaria	3
4	1800.00	2025-09-23	PayPal	4
5	635.00	2024-05-12	Credit Card	5
6	0.00	2024-05-14	Canceled	6
7	685.00	2024-05-16	Bank Transfer	7
8	710.00	2024-05-18	Digital Wallet	8
9	0.00	2024-05-20	Canceled	9
10	760.00	2024-05-22	Credit Card	10
11	785.00	2024-05-24	Bank Transfer	11
12	0.00	2024-05-26	Canceled	12
13	835.00	2024-05-28	Digital Wallet	13
14	860.00	2024-05-30	Credit Card	14
15	0.00	2024-06-01	Canceled	15
16	910.00	2024-06-03	Bank Transfer	16
17	935.00	2024-06-05	Digital Wallet	17
18	0.00	2024-06-07	Canceled	18
19	985.00	2024-06-09	Credit Card	19
20	1010.00	2024-06-11	Bank Transfer	20
21	0.00	2024-06-13	Canceled	21
22	1060.00	2024-06-15	Digital Wallet	22
23	0.00	2024-06-17	Canceled	23
24	1110.00	2024-06-19	Credit Card	24
25	1135.00	2024-06-21	Bank Transfer	25
26	0.00	2024-06-23	Canceled	26
27	1185.00	2024-06-25	Digital Wallet	27
28	1210.00	2024-06-27	Credit Card	28
29	0.00	2024-06-29	Canceled	29
30	1260.00	2024-07-01	Bank Transfer	30
31	1285.00	2024-07-03	Digital Wallet	31
32	0.00	2024-07-05	Canceled	32
33	1335.00	2024-07-07	Credit Card	33
34	1360.00	2024-07-09	Bank Transfer	34
35	0.00	2024-07-11	Canceled	35
36	1410.00	2024-07-13	Digital Wallet	36
37	1435.00	2024-07-15	Credit Card	37
38	0.00	2024-07-17	Canceled	38
39	1485.00	2024-07-19	Bank Transfer	39
40	1510.00	2024-07-21	Digital Wallet	40
41	0.00	2024-07-23	Canceled	41
42	1560.00	2024-07-25	Credit Card	42
43	1585.00	2024-07-27	Bank Transfer	43
44	0.00	2024-07-29	Canceled	44
45	1635.00	2024-07-31	Digital Wallet	45
46	1660.00	2024-08-02	Credit Card	46
47	0.00	2024-08-04	Canceled	47
48	1710.00	2024-08-06	Bank Transfer	48
49	1735.00	2024-08-08	Digital Wallet	49
50	0.00	2024-08-10	Canceled	50
\.


--
-- TOC entry 3503 (class 0 OID 25237)
-- Dependencies: 212
-- Data for Name: plan; Type: TABLE DATA; Schema: public; Owner: carloszarate
--

COPY public.plan (id_plan, name, description, base_price, id_destination) FROM stdin;
1	Plan Caribeño	Tour por las playas del Caribe Colombiano	1200.00	1
2	Aventura Inca	Exploración de las ruinas de Machu Picchu	1500.00	2
3	Trekking Patagónico	Excursión de 5 días en Torres del Paine	2000.00	3
4	Resort en Cancún	Todo incluido en hotel de lujo	1800.00	4
5	Basic Discovery 5	Un viaje de 7 días explorando Hanoi Street Food Adventure	625.00	5
6	Adventure Seeker 6	Un viaje de 5 días explorando Iceland Ring Road Explorer	650.00	6
7	Relaxation Package 7	Un viaje de 7 días explorando Tuscan Wine Country	675.00	7
8	Historical Immersion 8	Un viaje de 5 días explorando Highland Lochs & Castles	700.00	8
9	Culinary Journey 9	Un viaje de 7 días explorando Sahara Desert Expedition	725.00	9
10	Basic Discovery 10	Un viaje de 5 días explorando Amazon Rainforest Trek	750.00	10
11	Adventure Seeker 11	Un viaje de 7 días explorando Canadian Rockies Retreat	775.00	11
12	Relaxation Package 12	Un viaje de 5 días explorando Ancient Greek Wonders	800.00	12
13	Historical Immersion 13	Un viaje de 7 días explorando Balinese Serenity	825.00	13
14	Culinary Journey 14	Un viaje de 5 días explorando Swiss Alps Panorama	850.00	14
15	Basic Discovery 15	Un viaje de 7 días explorando New York City Lights	875.00	15
16	Adventure Seeker 16	Un viaje de 5 días explorando Cairo Pyramids & Nile	900.00	16
17	Relaxation Package 17	Un viaje de 7 días explorando Cape Town Coastal Drive	925.00	17
18	Historical Immersion 18	Un viaje de 5 días explorando Peruvian Inca Trail	950.00	18
19	Culinary Journey 19	Un viaje de 7 días explorando Berlin Historical Journey	975.00	19
20	Basic Discovery 20	Un viaje de 5 días explorando Sydney Harbour Delights	1000.00	20
21	Adventure Seeker 21	Un viaje de 7 días explorando Coastal Town Escape	1025.00	21
22	Relaxation Package 22	Un viaje de 5 días explorando Mountain Hiking Trail	1050.00	22
23	Historical Immersion 23	Un viaje de 7 días explorando Desert Oasis Stay	1075.00	23
24	Culinary Journey 24	Un viaje de 5 días explorando Tropical Beach Resort	1100.00	24
25	Basic Discovery 25	Un viaje de 7 días explorando European City Break	1125.00	25
26	Adventure Seeker 26	Un viaje de 5 días explorando Asian Metropolis Exploration	1150.00	26
27	Relaxation Package 27	Un viaje de 7 días explorando South American Wildlife Tour	1175.00	27
28	Historical Immersion 28	Un viaje de 5 días explorando Baltic Sea Voyage	1200.00	28
29	Culinary Journey 29	Un viaje de 7 días explorando Middle Eastern History	1225.00	29
30	Basic Discovery 30	Un viaje de 5 días explorando Safari Experience	1250.00	30
31	Adventure Seeker 31	Un viaje de 7 días explorando Destination 31	1275.00	31
32	Relaxation Package 32	Un viaje de 5 días explorando Destination 32	1300.00	32
33	Historical Immersion 33	Un viaje de 7 días explorando Destination 33	1325.00	33
34	Culinary Journey 34	Un viaje de 5 días explorando Destination 34	1350.00	34
35	Basic Discovery 35	Un viaje de 7 días explorando Destination 35	1375.00	35
36	Adventure Seeker 36	Un viaje de 5 días explorando Destination 36	1400.00	36
37	Relaxation Package 37	Un viaje de 7 días explorando Destination 37	1425.00	37
38	Historical Immersion 38	Un viaje de 5 días explorando Destination 38	1450.00	38
39	Culinary Journey 39	Un viaje de 7 días explorando Destination 39	1475.00	39
40	Basic Discovery 40	Un viaje de 5 días explorando Destination 40	1500.00	40
41	Adventure Seeker 41	Un viaje de 7 días explorando Destination 41	1525.00	41
42	Relaxation Package 42	Un viaje de 5 días explorando Destination 42	1550.00	42
43	Historical Immersion 43	Un viaje de 7 días explorando Destination 43	1575.00	43
44	Culinary Journey 44	Un viaje de 5 días explorando Destination 44	1600.00	44
45	Basic Discovery 45	Un viaje de 7 días explorando Destination 45	1625.00	45
46	Adventure Seeker 46	Un viaje de 5 días explorando Destination 46	1650.00	46
47	Relaxation Package 47	Un viaje de 7 días explorando Destination 47	1675.00	47
48	Historical Immersion 48	Un viaje de 5 días explorando Destination 48	1700.00	48
49	Culinary Journey 49	Un viaje de 7 días explorando Destination 49	1725.00	49
50	Basic Discovery 50	Un viaje de 5 días explorando Destination 50	1750.00	50
51	Adventure Seeker 51	Un viaje de 7 días explorando Destination 51	1775.00	51
52	Relaxation Package 52	Un viaje de 5 días explorando Destination 52	1800.00	52
53	Historical Immersion 53	Un viaje de 7 días explorando Destination 53	1825.00	53
54	Culinary Journey 54	Un viaje de 5 días explorando Destination 54	1850.00	54
55	Basic Discovery 55	Un viaje de 7 días explorando Destination 55	1875.00	55
56	Adventure Seeker 56	Un viaje de 5 días explorando Destination 56	1900.00	56
57	Relaxation Package 57	Un viaje de 7 días explorando Destination 57	1925.00	57
58	Historical Immersion 58	Un viaje de 5 días explorando Destination 58	1950.00	58
59	Culinary Journey 59	Un viaje de 7 días explorando Destination 59	1975.00	59
60	Basic Discovery 60	Un viaje de 5 días explorando Destination 60	2000.00	60
61	Adventure Seeker 61	Un viaje de 7 días explorando Destination 61	2025.00	61
62	Relaxation Package 62	Un viaje de 5 días explorando Destination 62	2050.00	62
63	Historical Immersion 63	Un viaje de 7 días explorando Destination 63	2075.00	63
64	Culinary Journey 64	Un viaje de 5 días explorando Destination 64	2100.00	64
65	Basic Discovery 65	Un viaje de 7 días explorando Destination 65	2125.00	65
66	Adventure Seeker 66	Un viaje de 5 días explorando Destination 66	2150.00	66
67	Relaxation Package 67	Un viaje de 7 días explorando Destination 67	2175.00	67
68	Historical Immersion 68	Un viaje de 5 días explorando Destination 68	2200.00	68
69	Culinary Journey 69	Un viaje de 7 días explorando Destination 69	2225.00	69
70	Basic Discovery 70	Un viaje de 5 días explorando Destination 70	2250.00	70
71	Adventure Seeker 71	Un viaje de 7 días explorando Destination 71	2275.00	71
72	Relaxation Package 72	Un viaje de 5 días explorando Destination 72	2300.00	72
73	Historical Immersion 73	Un viaje de 7 días explorando Destination 73	2325.00	73
74	Culinary Journey 74	Un viaje de 5 días explorando Destination 74	2350.00	74
75	Basic Discovery 75	Un viaje de 7 días explorando Destination 75	2375.00	75
76	Adventure Seeker 76	Un viaje de 5 días explorando Destination 76	2400.00	76
77	Relaxation Package 77	Un viaje de 7 días explorando Destination 77	2425.00	77
78	Historical Immersion 78	Un viaje de 5 días explorando Destination 78	2450.00	78
79	Culinary Journey 79	Un viaje de 7 días explorando Destination 79	2475.00	79
80	Basic Discovery 80	Un viaje de 5 días explorando Destination 80	2500.00	80
81	Adventure Seeker 81	Un viaje de 7 días explorando Destination 81	2525.00	81
82	Relaxation Package 82	Un viaje de 5 días explorando Destination 82	2550.00	82
83	Historical Immersion 83	Un viaje de 7 días explorando Destination 83	2575.00	83
84	Culinary Journey 84	Un viaje de 5 días explorando Destination 84	2600.00	84
85	Basic Discovery 85	Un viaje de 7 días explorando Destination 85	2625.00	85
86	Adventure Seeker 86	Un viaje de 5 días explorando Destination 86	2650.00	86
87	Relaxation Package 87	Un viaje de 7 días explorando Destination 87	2675.00	87
88	Historical Immersion 88	Un viaje de 5 días explorando Destination 88	2700.00	88
89	Culinary Journey 89	Un viaje de 7 días explorando Destination 89	2725.00	89
90	Basic Discovery 90	Un viaje de 5 días explorando Destination 90	2750.00	90
91	Adventure Seeker 91	Un viaje de 7 días explorando Destination 91	2775.00	91
92	Relaxation Package 92	Un viaje de 5 días explorando Destination 92	2800.00	92
93	Historical Immersion 93	Un viaje de 7 días explorando Destination 93	2825.00	93
94	Culinary Journey 94	Un viaje de 5 días explorando Destination 94	2850.00	94
95	Basic Discovery 95	Un viaje de 7 días explorando Destination 95	2875.00	95
96	Adventure Seeker 96	Un viaje de 5 días explorando Destination 96	2900.00	96
97	Relaxation Package 97	Un viaje de 7 días explorando Destination 97	2925.00	97
98	Historical Immersion 98	Un viaje de 5 días explorando Destination 98	2950.00	98
99	Culinary Journey 99	Un viaje de 7 días explorando Destination 99	2975.00	99
100	Basic Discovery 100	Un viaje de 5 días explorando Destination 100	3000.00	100
\.


--
-- TOC entry 3511 (class 0 OID 25292)
-- Dependencies: 220
-- Data for Name: transport; Type: TABLE DATA; Schema: public; Owner: carloszarate
--

COPY public.transport (id_transport, type, company, id_destination) FROM stdin;
1	Avión	Avianca	1
2	Bus turístico	PeruBus	2
3	Barco	Navimag	3
4	Avión	Aeroméxico	4
5	Flight	Company 5	5
6	High-Speed Train	Global Airlines	6
7	Luxury Coach	EuroRail	7
8	Ferry	Local Bus Co.	8
9	Flight	Ocean Liners	9
10	High-Speed Train	Company 10	10
11	Luxury Coach	Global Airlines	11
12	Ferry	EuroRail	12
13	Flight	Local Bus Co.	13
14	High-Speed Train	Ocean Liners	14
15	Luxury Coach	Company 15	15
16	Ferry	Global Airlines	16
17	Flight	EuroRail	17
18	High-Speed Train	Local Bus Co.	18
19	Luxury Coach	Ocean Liners	19
20	Ferry	Company 20	20
21	Flight	Global Airlines	21
22	High-Speed Train	EuroRail	22
23	Luxury Coach	Local Bus Co.	23
24	Ferry	Ocean Liners	24
25	Flight	Company 25	25
26	High-Speed Train	Global Airlines	26
27	Luxury Coach	EuroRail	27
28	Ferry	Local Bus Co.	28
29	Flight	Ocean Liners	29
30	High-Speed Train	Company 30	30
31	Luxury Coach	Global Airlines	31
32	Ferry	EuroRail	32
33	Flight	Local Bus Co.	33
34	High-Speed Train	Ocean Liners	34
35	Luxury Coach	Company 35	35
36	Ferry	Global Airlines	36
37	Flight	EuroRail	37
38	High-Speed Train	Local Bus Co.	38
39	Luxury Coach	Ocean Liners	39
40	Ferry	Company 40	40
41	Flight	Global Airlines	41
42	High-Speed Train	EuroRail	42
43	Luxury Coach	Local Bus Co.	43
44	Ferry	Ocean Liners	44
45	Flight	Company 45	45
46	High-Speed Train	Global Airlines	46
47	Luxury Coach	EuroRail	47
48	Ferry	Local Bus Co.	48
49	Flight	Ocean Liners	49
50	High-Speed Train	Company 50	50
51	Luxury Coach	Global Airlines	51
52	Ferry	EuroRail	52
53	Flight	Local Bus Co.	53
54	High-Speed Train	Ocean Liners	54
55	Luxury Coach	Company 55	55
56	Ferry	Global Airlines	56
57	Flight	EuroRail	57
58	High-Speed Train	Local Bus Co.	58
59	Luxury Coach	Ocean Liners	59
60	Ferry	Company 60	60
61	Flight	Global Airlines	61
62	High-Speed Train	EuroRail	62
63	Luxury Coach	Local Bus Co.	63
64	Ferry	Ocean Liners	64
65	Flight	Company 65	65
66	High-Speed Train	Global Airlines	66
67	Luxury Coach	EuroRail	67
68	Ferry	Local Bus Co.	68
69	Flight	Ocean Liners	69
70	High-Speed Train	Company 70	70
71	Luxury Coach	Global Airlines	71
72	Ferry	EuroRail	72
73	Flight	Local Bus Co.	73
74	High-Speed Train	Ocean Liners	74
75	Luxury Coach	Company 75	75
76	Ferry	Global Airlines	76
77	Flight	EuroRail	77
78	High-Speed Train	Local Bus Co.	78
79	Luxury Coach	Ocean Liners	79
80	Ferry	Company 80	80
81	Flight	Global Airlines	81
82	High-Speed Train	EuroRail	82
83	Luxury Coach	Local Bus Co.	83
84	Ferry	Ocean Liners	84
85	Flight	Company 85	85
86	High-Speed Train	Global Airlines	86
87	Luxury Coach	EuroRail	87
88	Ferry	Local Bus Co.	88
89	Flight	Ocean Liners	89
90	High-Speed Train	Company 90	90
91	Luxury Coach	Global Airlines	91
92	Ferry	EuroRail	92
93	Flight	Local Bus Co.	93
94	High-Speed Train	Ocean Liners	94
95	Luxury Coach	Company 95	95
96	Ferry	Global Airlines	96
97	Flight	EuroRail	97
98	High-Speed Train	Local Bus Co.	98
99	Luxury Coach	Ocean Liners	99
100	Ferry	Company 100	100
\.


--
-- TOC entry 3537 (class 0 OID 0)
-- Dependencies: 217
-- Name: accommodation_id_accommodation_seq; Type: SEQUENCE SET; Schema: public; Owner: carloszarate
--

SELECT pg_catalog.setval('public.accommodation_id_accommodation_seq', 4, true);


--
-- TOC entry 3538 (class 0 OID 0)
-- Dependencies: 215
-- Name: activity_id_activity_seq; Type: SEQUENCE SET; Schema: public; Owner: carloszarate
--

SELECT pg_catalog.setval('public.activity_id_activity_seq', 8, true);


--
-- TOC entry 3539 (class 0 OID 0)
-- Dependencies: 223
-- Name: booking_id_booking_seq; Type: SEQUENCE SET; Schema: public; Owner: carloszarate
--

SELECT pg_catalog.setval('public.booking_id_booking_seq', 4, true);


--
-- TOC entry 3540 (class 0 OID 0)
-- Dependencies: 221
-- Name: customer_id_customer_seq; Type: SEQUENCE SET; Schema: public; Owner: carloszarate
--

SELECT pg_catalog.setval('public.customer_id_customer_seq', 4, true);


--
-- TOC entry 3541 (class 0 OID 0)
-- Dependencies: 209
-- Name: destination_id_destination_seq; Type: SEQUENCE SET; Schema: public; Owner: carloszarate
--

SELECT pg_catalog.setval('public.destination_id_destination_seq', 108, true);


--
-- TOC entry 3542 (class 0 OID 0)
-- Dependencies: 227
-- Name: guide_id_guide_seq; Type: SEQUENCE SET; Schema: public; Owner: carloszarate
--

SELECT pg_catalog.setval('public.guide_id_guide_seq', 4, true);


--
-- TOC entry 3543 (class 0 OID 0)
-- Dependencies: 213
-- Name: itinerary_id_itinerary_seq; Type: SEQUENCE SET; Schema: public; Owner: carloszarate
--

SELECT pg_catalog.setval('public.itinerary_id_itinerary_seq', 8, true);


--
-- TOC entry 3544 (class 0 OID 0)
-- Dependencies: 225
-- Name: payment_id_payment_seq; Type: SEQUENCE SET; Schema: public; Owner: carloszarate
--

SELECT pg_catalog.setval('public.payment_id_payment_seq', 4, true);


--
-- TOC entry 3545 (class 0 OID 0)
-- Dependencies: 211
-- Name: plan_id_plan_seq; Type: SEQUENCE SET; Schema: public; Owner: carloszarate
--

SELECT pg_catalog.setval('public.plan_id_plan_seq', 4, true);


--
-- TOC entry 3546 (class 0 OID 0)
-- Dependencies: 219
-- Name: transport_id_transport_seq; Type: SEQUENCE SET; Schema: public; Owner: carloszarate
--

SELECT pg_catalog.setval('public.transport_id_transport_seq', 4, true);


--
-- TOC entry 3335 (class 2606 OID 25285)
-- Name: accommodation accommodation_pkey; Type: CONSTRAINT; Schema: public; Owner: carloszarate
--

ALTER TABLE ONLY public.accommodation
    ADD CONSTRAINT accommodation_pkey PRIMARY KEY (id_accommodation);


--
-- TOC entry 3333 (class 2606 OID 25273)
-- Name: activity activity_pkey; Type: CONSTRAINT; Schema: public; Owner: carloszarate
--

ALTER TABLE ONLY public.activity
    ADD CONSTRAINT activity_pkey PRIMARY KEY (id_activity);


--
-- TOC entry 3343 (class 2606 OID 25320)
-- Name: booking booking_pkey; Type: CONSTRAINT; Schema: public; Owner: carloszarate
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT booking_pkey PRIMARY KEY (id_booking);


--
-- TOC entry 3349 (class 2606 OID 25359)
-- Name: bookingactivity bookingactivity_pkey; Type: CONSTRAINT; Schema: public; Owner: carloszarate
--

ALTER TABLE ONLY public.bookingactivity
    ADD CONSTRAINT bookingactivity_pkey PRIMARY KEY (id_booking, id_activity);


--
-- TOC entry 3339 (class 2606 OID 25311)
-- Name: customer customer_email_key; Type: CONSTRAINT; Schema: public; Owner: carloszarate
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_email_key UNIQUE (email);


--
-- TOC entry 3341 (class 2606 OID 25309)
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: carloszarate
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (id_customer);


--
-- TOC entry 3327 (class 2606 OID 25235)
-- Name: destination destination_pkey; Type: CONSTRAINT; Schema: public; Owner: carloszarate
--

ALTER TABLE ONLY public.destination
    ADD CONSTRAINT destination_pkey PRIMARY KEY (id_destination);


--
-- TOC entry 3347 (class 2606 OID 25349)
-- Name: guide guide_pkey; Type: CONSTRAINT; Schema: public; Owner: carloszarate
--

ALTER TABLE ONLY public.guide
    ADD CONSTRAINT guide_pkey PRIMARY KEY (id_guide);


--
-- TOC entry 3331 (class 2606 OID 25258)
-- Name: itinerary itinerary_pkey; Type: CONSTRAINT; Schema: public; Owner: carloszarate
--

ALTER TABLE ONLY public.itinerary
    ADD CONSTRAINT itinerary_pkey PRIMARY KEY (id_itinerary);


--
-- TOC entry 3345 (class 2606 OID 25337)
-- Name: payment payment_pkey; Type: CONSTRAINT; Schema: public; Owner: carloszarate
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_pkey PRIMARY KEY (id_payment);


--
-- TOC entry 3329 (class 2606 OID 25244)
-- Name: plan plan_pkey; Type: CONSTRAINT; Schema: public; Owner: carloszarate
--

ALTER TABLE ONLY public.plan
    ADD CONSTRAINT plan_pkey PRIMARY KEY (id_plan);


--
-- TOC entry 3337 (class 2606 OID 25297)
-- Name: transport transport_pkey; Type: CONSTRAINT; Schema: public; Owner: carloszarate
--

ALTER TABLE ONLY public.transport
    ADD CONSTRAINT transport_pkey PRIMARY KEY (id_transport);


--
-- TOC entry 3353 (class 2606 OID 25286)
-- Name: accommodation accommodation_id_destination_fkey; Type: FK CONSTRAINT; Schema: public; Owner: carloszarate
--

ALTER TABLE ONLY public.accommodation
    ADD CONSTRAINT accommodation_id_destination_fkey FOREIGN KEY (id_destination) REFERENCES public.destination(id_destination);


--
-- TOC entry 3352 (class 2606 OID 25274)
-- Name: activity activity_id_itinerary_fkey; Type: FK CONSTRAINT; Schema: public; Owner: carloszarate
--

ALTER TABLE ONLY public.activity
    ADD CONSTRAINT activity_id_itinerary_fkey FOREIGN KEY (id_itinerary) REFERENCES public.itinerary(id_itinerary);


--
-- TOC entry 3355 (class 2606 OID 25321)
-- Name: booking booking_id_customer_fkey; Type: FK CONSTRAINT; Schema: public; Owner: carloszarate
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT booking_id_customer_fkey FOREIGN KEY (id_customer) REFERENCES public.customer(id_customer);


--
-- TOC entry 3356 (class 2606 OID 25326)
-- Name: booking booking_id_plan_fkey; Type: FK CONSTRAINT; Schema: public; Owner: carloszarate
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT booking_id_plan_fkey FOREIGN KEY (id_plan) REFERENCES public.plan(id_plan);


--
-- TOC entry 3359 (class 2606 OID 25365)
-- Name: bookingactivity bookingactivity_id_activity_fkey; Type: FK CONSTRAINT; Schema: public; Owner: carloszarate
--

ALTER TABLE ONLY public.bookingactivity
    ADD CONSTRAINT bookingactivity_id_activity_fkey FOREIGN KEY (id_activity) REFERENCES public.activity(id_activity);


--
-- TOC entry 3360 (class 2606 OID 25360)
-- Name: bookingactivity bookingactivity_id_booking_fkey; Type: FK CONSTRAINT; Schema: public; Owner: carloszarate
--

ALTER TABLE ONLY public.bookingactivity
    ADD CONSTRAINT bookingactivity_id_booking_fkey FOREIGN KEY (id_booking) REFERENCES public.booking(id_booking);


--
-- TOC entry 3358 (class 2606 OID 25350)
-- Name: guide guide_id_plan_fkey; Type: FK CONSTRAINT; Schema: public; Owner: carloszarate
--

ALTER TABLE ONLY public.guide
    ADD CONSTRAINT guide_id_plan_fkey FOREIGN KEY (id_plan) REFERENCES public.plan(id_plan);


--
-- TOC entry 3351 (class 2606 OID 25259)
-- Name: itinerary itinerary_id_plan_fkey; Type: FK CONSTRAINT; Schema: public; Owner: carloszarate
--

ALTER TABLE ONLY public.itinerary
    ADD CONSTRAINT itinerary_id_plan_fkey FOREIGN KEY (id_plan) REFERENCES public.plan(id_plan);


--
-- TOC entry 3357 (class 2606 OID 25338)
-- Name: payment payment_id_booking_fkey; Type: FK CONSTRAINT; Schema: public; Owner: carloszarate
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_id_booking_fkey FOREIGN KEY (id_booking) REFERENCES public.booking(id_booking);


--
-- TOC entry 3350 (class 2606 OID 25245)
-- Name: plan plan_id_destination_fkey; Type: FK CONSTRAINT; Schema: public; Owner: carloszarate
--

ALTER TABLE ONLY public.plan
    ADD CONSTRAINT plan_id_destination_fkey FOREIGN KEY (id_destination) REFERENCES public.destination(id_destination);


--
-- TOC entry 3354 (class 2606 OID 25298)
-- Name: transport transport_id_destination_fkey; Type: FK CONSTRAINT; Schema: public; Owner: carloszarate
--

ALTER TABLE ONLY public.transport
    ADD CONSTRAINT transport_id_destination_fkey FOREIGN KEY (id_destination) REFERENCES public.destination(id_destination);


--
-- TOC entry 3526 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2025-09-30 10:20:11

--
-- PostgreSQL database dump complete
--

