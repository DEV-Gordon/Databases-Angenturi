--
-- PostgreSQL database dump
--

-- Dumped from database version 14.19 (Debian 14.19-1.pgdg13+1)
-- Dumped by pg_dump version 17.0

-- Started on 2025-09-24 23:41:00

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

SELECT pg_catalog.setval('public.destination_id_destination_seq', 4, true);


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


-- Completed on 2025-09-24 23:41:00

--
-- PostgreSQL database dump complete
--

