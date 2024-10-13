--
-- PostgreSQL database dump
--

-- Dumped from database version 14.13 (Homebrew)
-- Dumped by pg_dump version 14.13 (Homebrew)

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
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: derrek
--

CREATE TABLE IF NOT EXISTS public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO derrek;

--
-- Name: bom_change_log; Type: TABLE; Schema: public; Owner: derrek
--

CREATE TABLE IF NOT EXISTS public.bom_change_log (
    id integer NOT NULL,
    bom_id integer,
    field_name character varying,
    old_value character varying,
    new_value character varying,
    change_type character varying,
    "timestamp" timestamp without time zone
);


ALTER TABLE public.bom_change_log OWNER TO derrek;

--
-- Name: bom_change_log_id_seq; Type: SEQUENCE; Schema: public; Owner: derrek
--

CREATE SEQUENCE public.bom_change_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bom_change_log_id_seq OWNER TO derrek;

--
-- Name: bom_change_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: derrek
--

ALTER SEQUENCE public.bom_change_log_id_seq OWNED BY public.bom_change_log.id;


--
-- Name: bom_history; Type: TABLE; Schema: public; Owner: derrek
--

CREATE TABLE IF NOT EXISTS public.bom_history (
    id integer NOT NULL,
    bom_id integer,
    component_type character varying,
    phx_class character varying,
    supplier_manufacturer character varying,
    address character varying,
    email character varying,
    contact_number character varying,
    supplier_mfg_lt integer,
    transit_lt integer,
    amz_safety_days integer,
    wh_safety_days integer,
    po_issue_days integer,
    master_pack integer,
    moq integer,
    ordering_uom character varying,
    unit_price double precision,
    shipping_cost double precision,
    landed_cost double precision,
    conversion double precision,
    converted_unit_price double precision,
    ims_unit character varying,
    supplier_payment_terms character varying,
    product_link character varying,
    supplier_product_id character varying,
    description character varying,
    remarks character varying,
    alternative_supplier_1 character varying,
    alternative_supplier_2 character varying,
    monthly_usage double precision,
    monthly_spend double precision,
    total_lt_bom_master integer,
    comments character varying,
    version integer,
    "timestamp" timestamp without time zone
);


ALTER TABLE public.bom_history OWNER TO derrek;

--
-- Name: bom_history_id_seq; Type: SEQUENCE; Schema: public; Owner: derrek
--

CREATE SEQUENCE public.bom_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bom_history_id_seq OWNER TO derrek;

--
-- Name: bom_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: derrek
--

ALTER SEQUENCE public.bom_history_id_seq OWNED BY public.bom_history.id;


--
-- Name: boms; Type: TABLE; Schema: public; Owner: derrek
--

CREATE TABLE IF NOT EXISTS public.boms (
    id integer NOT NULL,
    bom_id character varying,
    component_type character varying,
    phx_class character varying,
    supplier_manufacturer character varying,
    address character varying,
    email character varying,
    contact_number character varying,
    supplier_mfg_lt integer,
    transit_lt integer,
    amz_safety_days integer,
    wh_safety_days integer,
    po_issue_days integer,
    master_pack integer,
    moq integer,
    ordering_uom character varying,
    unit_price double precision,
    shipping_cost double precision,
    landed_cost double precision,
    conversion double precision,
    converted_unit_price double precision,
    ims_unit character varying,
    supplier_payment_terms character varying,
    product_link character varying,
    supplier_product_id character varying,
    description character varying,
    remarks character varying,
    alternative_supplier_1 character varying,
    alternative_supplier_2 character varying,
    monthly_usage double precision,
    monthly_spend double precision,
    total_lt_bom_master integer,
    comments character varying,
    version integer,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone
);


ALTER TABLE public.boms OWNER TO derrek;

--
-- Name: boms_id_seq; Type: SEQUENCE; Schema: public; Owner: derrek
--

CREATE SEQUENCE public.boms_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.boms_id_seq OWNER TO derrek;

--
-- Name: boms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: derrek
--

ALTER SEQUENCE public.boms_id_seq OWNED BY public.boms.id;


--
-- Name: finished_goods; Type: TABLE; Schema: public; Owner: derrek
--

CREATE TABLE IF NOT EXISTS public.finished_goods (
    id integer NOT NULL,
    isku character varying,
    asin character varying,
    common_name character varying,
    phoenix_class character varying,
    brand character varying,
    size character varying,
    material_cost double precision,
    labor_cost double precision,
    total_unit_cost double precision,
    replenishment_type character varying,
    manufacturing_class character varying,
    lead_time integer,
    amz_safety_days integer,
    wh_safety_days integer,
    reorder_qty_days integer,
    "similar" integer,
    in_bom_mapping boolean,
    duplicate_asin boolean,
    count_tkfg integer,
    status character varying,
    batch_run character varying
);


ALTER TABLE public.finished_goods OWNER TO derrek;

--
-- Name: finished_goods_change_log; Type: TABLE; Schema: public; Owner: derrek
--

CREATE TABLE IF NOT EXISTS public.finished_goods_change_log (
    id integer NOT NULL,
    finished_goods_id integer,
    field_name character varying,
    old_value character varying,
    new_value character varying,
    changed_at timestamp with time zone DEFAULT now(),
    changed_by character varying
);


ALTER TABLE public.finished_goods_change_log OWNER TO derrek;

--
-- Name: finished_goods_change_log_id_seq; Type: SEQUENCE; Schema: public; Owner: derrek
--

CREATE SEQUENCE public.finished_goods_change_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.finished_goods_change_log_id_seq OWNER TO derrek;

--
-- Name: finished_goods_change_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: derrek
--

ALTER SEQUENCE public.finished_goods_change_log_id_seq OWNED BY public.finished_goods_change_log.id;


--
-- Name: finished_goods_history; Type: TABLE; Schema: public; Owner: derrek
--

CREATE TABLE IF NOT EXISTS public.finished_goods_history (
    id integer NOT NULL,
    finished_goods_id integer,
    isku character varying,
    common_name character varying,
    total_unit_cost double precision,
    status character varying,
    recorded_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.finished_goods_history OWNER TO derrek;

--
-- Name: finished_goods_history_id_seq; Type: SEQUENCE; Schema: public; Owner: derrek
--

CREATE SEQUENCE public.finished_goods_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.finished_goods_history_id_seq OWNER TO derrek;

--
-- Name: finished_goods_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: derrek
--

ALTER SEQUENCE public.finished_goods_history_id_seq OWNED BY public.finished_goods_history.id;


--
-- Name: finished_goods_id_seq; Type: SEQUENCE; Schema: public; Owner: derrek
--

CREATE SEQUENCE public.finished_goods_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.finished_goods_id_seq OWNER TO derrek;

--
-- Name: finished_goods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: derrek
--

ALTER SEQUENCE public.finished_goods_id_seq OWNED BY public.finished_goods.id;


--
-- Name: finished_goods_inventory; Type: TABLE; Schema: public; Owner: derrek
--

CREATE TABLE IF NOT EXISTS public.finished_goods_inventory (
    id integer NOT NULL,
    isku character varying,
    brand character varying,
    phx_class character varying,
    theoretical_qty double precision,
    location character varying,
    actual_count double precision,
    date_counted timestamp without time zone,
    uom character varying,
    mfg_after_date_counted double precision,
    received_qty_after_actual_count double precision,
    fo_after_date_counted double precision,
    fo_after_date_counted_from_bundles double precision,
    ihf_after_date_counted double precision,
    duplicate boolean,
    asin character varying,
    fba_veloz_ranking integer,
    past_30_mo double precision,
    past_30_fo double precision,
    manufactured_fulfilled double precision,
    theo_count_static double precision,
    actual_count_2 double precision,
    date_counted_2 timestamp without time zone,
    warehouse_remarks character varying,
    variance double precision,
    not_in_wir_fg character varying,
    category character varying
);


ALTER TABLE public.finished_goods_inventory OWNER TO derrek;

--
-- Name: finished_goods_inventory_change_log; Type: TABLE; Schema: public; Owner: derrek
--

CREATE TABLE IF NOT EXISTS public.finished_goods_inventory_change_log (
    id integer NOT NULL,
    inventory_id integer,
    field_name character varying,
    old_value character varying,
    new_value character varying,
    changed_at timestamp with time zone DEFAULT now(),
    changed_by character varying
);


ALTER TABLE public.finished_goods_inventory_change_log OWNER TO derrek;

--
-- Name: finished_goods_inventory_change_log_id_seq; Type: SEQUENCE; Schema: public; Owner: derrek
--

CREATE SEQUENCE public.finished_goods_inventory_change_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.finished_goods_inventory_change_log_id_seq OWNER TO derrek;

--
-- Name: finished_goods_inventory_change_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: derrek
--

ALTER SEQUENCE public.finished_goods_inventory_change_log_id_seq OWNED BY public.finished_goods_inventory_change_log.id;


--
-- Name: finished_goods_inventory_history; Type: TABLE; Schema: public; Owner: derrek
--

CREATE TABLE IF NOT EXISTS public.finished_goods_inventory_history (
    id integer NOT NULL,
    inventory_id integer,
    isku character varying,
    theoretical_qty double precision,
    actual_count double precision,
    date_counted timestamp without time zone,
    recorded_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.finished_goods_inventory_history OWNER TO derrek;

--
-- Name: finished_goods_inventory_history_id_seq; Type: SEQUENCE; Schema: public; Owner: derrek
--

CREATE SEQUENCE public.finished_goods_inventory_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.finished_goods_inventory_history_id_seq OWNER TO derrek;

--
-- Name: finished_goods_inventory_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: derrek
--

ALTER SEQUENCE public.finished_goods_inventory_history_id_seq OWNED BY public.finished_goods_inventory_history.id;


--
-- Name: finished_goods_inventory_id_seq; Type: SEQUENCE; Schema: public; Owner: derrek
--

CREATE SEQUENCE public.finished_goods_inventory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.finished_goods_inventory_id_seq OWNER TO derrek;

--
-- Name: finished_goods_inventory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: derrek
--

ALTER SEQUENCE public.finished_goods_inventory_id_seq OWNED BY public.finished_goods_inventory.id;


--
-- Name: inventory_fba; Type: TABLE; Schema: public; Owner: derrek
--

CREATE TABLE IF NOT EXISTS public.inventory_fba (
    id integer NOT NULL,
    date date,
    fnsku character varying,
    asin character varying,
    product_name character varying,
    total_supply_quantity integer
);


ALTER TABLE public.inventory_fba OWNER TO derrek;

--
-- Name: inventory_fba_id_seq; Type: SEQUENCE; Schema: public; Owner: derrek
--

CREATE SEQUENCE public.inventory_fba_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.inventory_fba_id_seq OWNER TO derrek;

--
-- Name: inventory_fba_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: derrek
--

ALTER SEQUENCE public.inventory_fba_id_seq OWNED BY public.inventory_fba.id;


--
-- Name: sales_and_traffic; Type: TABLE; Schema: public; Owner: derrek
--

CREATE TABLE IF NOT EXISTS public.sales_and_traffic (
    id integer NOT NULL,
    date date,
    total_order_items integer,
    ordered_product_sales double precision,
    units_ordered integer
);


ALTER TABLE public.sales_and_traffic OWNER TO derrek;

--
-- Name: sales_and_traffic_id_seq; Type: SEQUENCE; Schema: public; Owner: derrek
--

CREATE SEQUENCE public.sales_and_traffic_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sales_and_traffic_id_seq OWNER TO derrek;

--
-- Name: sales_and_traffic_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: derrek
--

ALTER SEQUENCE public.sales_and_traffic_id_seq OWNED BY public.sales_and_traffic.id;


--
-- Name: tampa_bom_inventory; Type: TABLE; Schema: public; Owner: derrek
--

CREATE TABLE IF NOT EXISTS public.tampa_bom_inventory (
    id integer NOT NULL,
    bom_id character varying,
    type character varying,
    phx_class character varying,
    theoretical_qty double precision,
    location character varying,
    cycle_count double precision,
    date_counted timestamp without time zone,
    uom character varying,
    theo_x_actual_variance double precision,
    past_30_mo double precision,
    past_30_fo double precision,
    manufactured_fulfilled double precision,
    used_for_mfg_after_actual double precision,
    conversion double precision,
    received_qty_after_actual_count double precision,
    ranking integer,
    current_internal_lot_number character varying,
    used_in_ihf_shipstation_after_count double precision,
    theo_count_static double precision,
    actual_count double precision,
    wh_remarks character varying,
    variance double precision,
    random_count double precision,
    subtype character varying
);


ALTER TABLE public.tampa_bom_inventory OWNER TO derrek;

--
-- Name: tampa_bom_inventory_change_log; Type: TABLE; Schema: public; Owner: derrek
--

CREATE TABLE IF NOT EXISTS public.tampa_bom_inventory_change_log (
    id integer NOT NULL,
    inventory_id integer,
    field_name character varying,
    old_value character varying,
    new_value character varying,
    changed_at timestamp with time zone DEFAULT now(),
    changed_by character varying
);


ALTER TABLE public.tampa_bom_inventory_change_log OWNER TO derrek;

--
-- Name: tampa_bom_inventory_change_log_id_seq; Type: SEQUENCE; Schema: public; Owner: derrek
--

CREATE SEQUENCE public.tampa_bom_inventory_change_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tampa_bom_inventory_change_log_id_seq OWNER TO derrek;

--
-- Name: tampa_bom_inventory_change_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: derrek
--

ALTER SEQUENCE public.tampa_bom_inventory_change_log_id_seq OWNED BY public.tampa_bom_inventory_change_log.id;


--
-- Name: tampa_bom_inventory_history; Type: TABLE; Schema: public; Owner: derrek
--

CREATE TABLE IF NOT EXISTS public.tampa_bom_inventory_history (
    id integer NOT NULL,
    inventory_id integer,
    bom_id character varying,
    type character varying,
    theoretical_qty double precision,
    actual_count double precision,
    date_counted timestamp without time zone,
    recorded_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.tampa_bom_inventory_history OWNER TO derrek;

--
-- Name: tampa_bom_inventory_history_id_seq; Type: SEQUENCE; Schema: public; Owner: derrek
--

CREATE SEQUENCE public.tampa_bom_inventory_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tampa_bom_inventory_history_id_seq OWNER TO derrek;

--
-- Name: tampa_bom_inventory_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: derrek
--

ALTER SEQUENCE public.tampa_bom_inventory_history_id_seq OWNED BY public.tampa_bom_inventory_history.id;


--
-- Name: tampa_bom_inventory_id_seq; Type: SEQUENCE; Schema: public; Owner: derrek
--

CREATE SEQUENCE public.tampa_bom_inventory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tampa_bom_inventory_id_seq OWNER TO derrek;

--
-- Name: tampa_bom_inventory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: derrek
--

ALTER SEQUENCE public.tampa_bom_inventory_id_seq OWNED BY public.tampa_bom_inventory.id;


--
-- Name: bom_change_log id; Type: DEFAULT; Schema: public; Owner: derrek
--

ALTER TABLE ONLY public.bom_change_log ALTER COLUMN id SET DEFAULT nextval('public.bom_change_log_id_seq'::regclass);


--
-- Name: bom_history id; Type: DEFAULT; Schema: public; Owner: derrek
--

ALTER TABLE ONLY public.bom_history ALTER COLUMN id SET DEFAULT nextval('public.bom_history_id_seq'::regclass);


--
-- Name: boms id; Type: DEFAULT; Schema: public; Owner: derrek
--

ALTER TABLE ONLY public.boms ALTER COLUMN id SET DEFAULT nextval('public.boms_id_seq'::regclass);


--
-- Name: finished_goods id; Type: DEFAULT; Schema: public; Owner: derrek
--

ALTER TABLE ONLY public.finished_goods ALTER COLUMN id SET DEFAULT nextval('public.finished_goods_id_seq'::regclass);


--
-- Name: finished_goods_change_log id; Type: DEFAULT; Schema: public; Owner: derrek
--

ALTER TABLE ONLY public.finished_goods_change_log ALTER COLUMN id SET DEFAULT nextval('public.finished_goods_change_log_id_seq'::regclass);


--
-- Name: finished_goods_history id; Type: DEFAULT; Schema: public; Owner: derrek
--

ALTER TABLE ONLY public.finished_goods_history ALTER COLUMN id SET DEFAULT nextval('public.finished_goods_history_id_seq'::regclass);


--
-- Name: finished_goods_inventory id; Type: DEFAULT; Schema: public; Owner: derrek
--

ALTER TABLE ONLY public.finished_goods_inventory ALTER COLUMN id SET DEFAULT nextval('public.finished_goods_inventory_id_seq'::regclass);


--
-- Name: finished_goods_inventory_change_log id; Type: DEFAULT; Schema: public; Owner: derrek
--

ALTER TABLE ONLY public.finished_goods_inventory_change_log ALTER COLUMN id SET DEFAULT nextval('public.finished_goods_inventory_change_log_id_seq'::regclass);


--
-- Name: finished_goods_inventory_history id; Type: DEFAULT; Schema: public; Owner: derrek
--

ALTER TABLE ONLY public.finished_goods_inventory_history ALTER COLUMN id SET DEFAULT nextval('public.finished_goods_inventory_history_id_seq'::regclass);


--
-- Name: inventory_fba id; Type: DEFAULT; Schema: public; Owner: derrek
--

ALTER TABLE ONLY public.inventory_fba ALTER COLUMN id SET DEFAULT nextval('public.inventory_fba_id_seq'::regclass);


--
-- Name: sales_and_traffic id; Type: DEFAULT; Schema: public; Owner: derrek
--

ALTER TABLE ONLY public.sales_and_traffic ALTER COLUMN id SET DEFAULT nextval('public.sales_and_traffic_id_seq'::regclass);


--
-- Name: tampa_bom_inventory id; Type: DEFAULT; Schema: public; Owner: derrek
--

ALTER TABLE ONLY public.tampa_bom_inventory ALTER COLUMN id SET DEFAULT nextval('public.tampa_bom_inventory_id_seq'::regclass);


--
-- Name: tampa_bom_inventory_change_log id; Type: DEFAULT; Schema: public; Owner: derrek
--

ALTER TABLE ONLY public.tampa_bom_inventory_change_log ALTER COLUMN id SET DEFAULT nextval('public.tampa_bom_inventory_change_log_id_seq'::regclass);


--
-- Name: tampa_bom_inventory_history id; Type: DEFAULT; Schema: public; Owner: derrek
--

ALTER TABLE ONLY public.tampa_bom_inventory_history ALTER COLUMN id SET DEFAULT nextval('public.tampa_bom_inventory_history_id_seq'::regclass);


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: derrek
--

COPY public.alembic_version (version_num) FROM stdin;
29aff9ea24ef
\.


--
-- Data for Name: bom_change_log; Type: TABLE DATA; Schema: public; Owner: derrek
--

COPY public.bom_change_log (id, bom_id, field_name, old_value, new_value, change_type, "timestamp") FROM stdin;
1	1	\N	\N	\N	create	2024-10-11 17:29:45.896664
2	2	\N	\N	\N	create	2024-10-11 17:29:45.957912
3	3	\N	\N	\N	create	2024-10-11 17:29:45.963207
4	4	\N	\N	\N	create	2024-10-11 17:29:45.969973
5	5	\N	\N	\N	create	2024-10-11 17:29:45.979266
6	6	\N	\N	\N	create	2024-10-11 17:29:45.991986
7	7	\N	\N	\N	create	2024-10-11 17:29:46.024447
8	8	\N	\N	\N	create	2024-10-11 17:29:46.043489
9	9	\N	\N	\N	create	2024-10-11 17:29:46.047349
10	10	\N	\N	\N	create	2024-10-11 17:29:46.052794
11	11	\N	\N	\N	create	2024-10-11 17:29:46.055003
12	12	\N	\N	\N	create	2024-10-11 17:29:46.056715
13	13	\N	\N	\N	create	2024-10-11 17:29:46.058686
14	14	\N	\N	\N	create	2024-10-11 17:29:46.060893
15	15	\N	\N	\N	create	2024-10-11 17:29:46.062849
16	16	\N	\N	\N	create	2024-10-11 17:29:46.065373
17	17	\N	\N	\N	create	2024-10-11 17:29:46.068617
18	18	\N	\N	\N	create	2024-10-11 17:29:46.071345
19	19	\N	\N	\N	create	2024-10-11 17:29:46.07419
20	20	\N	\N	\N	create	2024-10-11 17:29:46.076759
21	21	\N	\N	\N	create	2024-10-11 17:29:46.079376
22	22	\N	\N	\N	create	2024-10-11 17:29:46.081766
23	23	\N	\N	\N	create	2024-10-11 17:29:46.08422
24	24	\N	\N	\N	create	2024-10-11 17:29:46.086679
25	25	\N	\N	\N	create	2024-10-11 17:29:46.08861
26	26	\N	\N	\N	create	2024-10-11 17:29:46.091247
27	27	\N	\N	\N	create	2024-10-11 17:29:46.094396
28	28	\N	\N	\N	create	2024-10-11 17:29:46.098689
29	29	\N	\N	\N	create	2024-10-11 17:29:46.103815
30	30	\N	\N	\N	create	2024-10-11 17:29:46.10923
31	31	\N	\N	\N	create	2024-10-11 17:29:46.112245
32	32	\N	\N	\N	create	2024-10-11 17:29:46.115028
33	33	\N	\N	\N	create	2024-10-11 17:29:46.118567
34	34	\N	\N	\N	create	2024-10-11 17:29:46.122018
35	35	\N	\N	\N	create	2024-10-11 17:29:46.126074
36	36	\N	\N	\N	create	2024-10-11 17:29:46.129816
37	37	\N	\N	\N	create	2024-10-11 17:29:46.132245
38	38	\N	\N	\N	create	2024-10-11 17:29:46.135207
39	39	\N	\N	\N	create	2024-10-11 17:29:46.137851
40	40	\N	\N	\N	create	2024-10-11 17:29:46.139933
41	41	\N	\N	\N	create	2024-10-11 17:29:46.141864
42	42	\N	\N	\N	create	2024-10-11 17:29:46.143943
43	43	\N	\N	\N	create	2024-10-11 17:29:46.145569
44	44	\N	\N	\N	create	2024-10-11 17:29:46.149044
45	45	\N	\N	\N	create	2024-10-11 17:29:46.154056
46	46	\N	\N	\N	create	2024-10-11 17:29:46.156297
47	47	\N	\N	\N	create	2024-10-11 17:29:46.158945
48	48	\N	\N	\N	create	2024-10-11 17:29:46.162179
49	49	\N	\N	\N	create	2024-10-11 17:29:46.165718
50	50	\N	\N	\N	create	2024-10-11 17:29:46.168224
51	51	\N	\N	\N	create	2024-10-11 17:29:46.170363
52	52	\N	\N	\N	create	2024-10-11 17:29:46.174958
53	53	\N	\N	\N	create	2024-10-11 17:29:46.177316
54	54	\N	\N	\N	create	2024-10-11 17:29:46.182154
55	55	\N	\N	\N	create	2024-10-11 17:29:46.184486
56	56	\N	\N	\N	create	2024-10-11 17:29:46.186751
57	57	\N	\N	\N	create	2024-10-11 17:29:46.188974
58	58	\N	\N	\N	create	2024-10-11 17:29:46.191684
59	59	\N	\N	\N	create	2024-10-11 17:29:46.195115
60	60	\N	\N	\N	create	2024-10-11 17:29:46.200597
61	61	\N	\N	\N	create	2024-10-11 17:29:46.204632
62	62	\N	\N	\N	create	2024-10-11 17:29:46.206796
63	63	\N	\N	\N	create	2024-10-11 17:29:46.208642
64	64	\N	\N	\N	create	2024-10-11 17:29:46.211787
65	65	\N	\N	\N	create	2024-10-11 17:29:46.216195
66	66	\N	\N	\N	create	2024-10-11 17:29:46.218709
67	67	\N	\N	\N	create	2024-10-11 17:29:46.22086
68	68	\N	\N	\N	create	2024-10-11 17:29:46.224305
69	69	\N	\N	\N	create	2024-10-11 17:29:46.22739
70	70	\N	\N	\N	create	2024-10-11 17:29:46.230178
71	71	\N	\N	\N	create	2024-10-11 17:29:46.232265
72	72	\N	\N	\N	create	2024-10-11 17:29:46.235276
73	73	\N	\N	\N	create	2024-10-11 17:29:46.239213
74	74	\N	\N	\N	create	2024-10-11 17:29:46.24187
75	75	\N	\N	\N	create	2024-10-11 17:29:46.244303
76	76	\N	\N	\N	create	2024-10-11 17:29:46.246895
77	77	\N	\N	\N	create	2024-10-11 17:29:46.24995
78	78	\N	\N	\N	create	2024-10-11 17:29:46.252416
79	79	\N	\N	\N	create	2024-10-11 17:29:46.254706
80	80	\N	\N	\N	create	2024-10-11 17:29:46.257272
81	81	\N	\N	\N	create	2024-10-11 17:29:46.260183
82	82	\N	\N	\N	create	2024-10-11 17:29:46.262933
83	83	\N	\N	\N	create	2024-10-11 17:29:46.265733
84	84	\N	\N	\N	create	2024-10-11 17:29:46.27313
85	85	\N	\N	\N	create	2024-10-11 17:29:46.275124
86	86	\N	\N	\N	create	2024-10-11 17:29:46.277393
87	87	\N	\N	\N	create	2024-10-11 17:29:46.279725
88	88	\N	\N	\N	create	2024-10-11 17:29:46.283232
89	89	\N	\N	\N	create	2024-10-11 17:29:46.286126
90	90	\N	\N	\N	create	2024-10-11 17:29:46.288905
91	91	\N	\N	\N	create	2024-10-11 17:29:46.291289
92	92	\N	\N	\N	create	2024-10-11 17:29:46.29402
93	93	\N	\N	\N	create	2024-10-11 17:29:46.298614
94	94	\N	\N	\N	create	2024-10-11 17:29:46.300988
95	95	\N	\N	\N	create	2024-10-11 17:29:46.30471
96	96	\N	\N	\N	create	2024-10-11 17:29:46.307608
97	97	\N	\N	\N	create	2024-10-11 17:29:46.310605
98	98	\N	\N	\N	create	2024-10-11 17:29:46.312258
99	99	\N	\N	\N	create	2024-10-11 17:29:46.31401
100	100	\N	\N	\N	create	2024-10-11 17:29:46.315933
101	101	\N	\N	\N	create	2024-10-11 17:29:46.317734
102	102	\N	\N	\N	create	2024-10-11 17:29:46.319588
103	103	\N	\N	\N	create	2024-10-11 17:29:46.324694
104	104	\N	\N	\N	create	2024-10-11 17:29:46.327171
105	105	\N	\N	\N	create	2024-10-11 17:29:46.329485
106	106	\N	\N	\N	create	2024-10-11 17:29:46.332275
107	107	\N	\N	\N	create	2024-10-11 17:29:46.336865
108	108	\N	\N	\N	create	2024-10-11 17:29:46.350101
109	109	\N	\N	\N	create	2024-10-11 17:29:46.354765
110	110	\N	\N	\N	create	2024-10-11 17:29:46.357284
111	111	\N	\N	\N	create	2024-10-11 17:29:46.359471
112	112	\N	\N	\N	create	2024-10-11 17:29:46.361939
113	113	\N	\N	\N	create	2024-10-11 17:29:46.364013
114	114	\N	\N	\N	create	2024-10-11 17:29:46.365801
115	115	\N	\N	\N	create	2024-10-11 17:29:46.367715
116	116	\N	\N	\N	create	2024-10-11 17:29:46.370389
117	117	\N	\N	\N	create	2024-10-11 17:29:46.375133
118	118	\N	\N	\N	create	2024-10-11 17:29:46.379269
119	119	\N	\N	\N	create	2024-10-11 17:29:46.381213
120	120	\N	\N	\N	create	2024-10-11 17:29:46.38279
121	121	\N	\N	\N	create	2024-10-11 17:29:46.387874
122	122	\N	\N	\N	create	2024-10-11 17:29:46.39043
123	123	\N	\N	\N	create	2024-10-11 17:29:46.392923
124	124	\N	\N	\N	create	2024-10-11 17:29:46.396804
125	125	\N	\N	\N	create	2024-10-11 17:29:46.399339
126	126	\N	\N	\N	create	2024-10-11 17:29:46.402751
127	127	\N	\N	\N	create	2024-10-11 17:29:46.40476
128	128	\N	\N	\N	create	2024-10-11 17:29:46.407072
129	129	\N	\N	\N	create	2024-10-11 17:29:46.409365
130	130	\N	\N	\N	create	2024-10-11 17:29:46.412162
131	131	\N	\N	\N	create	2024-10-11 17:29:46.414655
132	132	\N	\N	\N	create	2024-10-11 17:29:46.417213
133	133	\N	\N	\N	create	2024-10-11 17:29:46.41952
134	134	\N	\N	\N	create	2024-10-11 17:29:46.422327
135	135	\N	\N	\N	create	2024-10-11 17:29:46.424589
136	136	\N	\N	\N	create	2024-10-11 17:29:46.430935
137	137	\N	\N	\N	create	2024-10-11 17:29:46.432816
138	138	\N	\N	\N	create	2024-10-11 17:29:46.434713
139	139	\N	\N	\N	create	2024-10-11 17:29:46.438946
140	140	\N	\N	\N	create	2024-10-11 17:29:46.441438
141	141	\N	\N	\N	create	2024-10-11 17:29:46.443695
142	142	\N	\N	\N	create	2024-10-11 17:29:46.446009
143	143	\N	\N	\N	create	2024-10-11 17:29:46.448182
144	144	\N	\N	\N	create	2024-10-11 17:29:46.451016
145	145	\N	\N	\N	create	2024-10-11 17:29:46.454849
146	146	\N	\N	\N	create	2024-10-11 17:29:46.457563
147	147	\N	\N	\N	create	2024-10-11 17:29:46.460446
148	148	\N	\N	\N	create	2024-10-11 17:29:46.462557
149	149	\N	\N	\N	create	2024-10-11 17:29:46.464797
150	150	\N	\N	\N	create	2024-10-11 17:29:46.466513
151	151	\N	\N	\N	create	2024-10-11 17:29:46.470372
152	152	\N	\N	\N	create	2024-10-11 17:29:46.472339
153	153	\N	\N	\N	create	2024-10-11 17:29:46.474027
154	154	\N	\N	\N	create	2024-10-11 17:29:46.476902
155	155	\N	\N	\N	create	2024-10-11 17:29:46.481803
156	156	\N	\N	\N	create	2024-10-11 17:29:46.484079
157	157	\N	\N	\N	create	2024-10-11 17:29:46.486726
158	158	\N	\N	\N	create	2024-10-11 17:29:46.488707
159	159	\N	\N	\N	create	2024-10-11 17:29:46.496405
160	160	\N	\N	\N	create	2024-10-11 17:29:46.498885
161	161	\N	\N	\N	create	2024-10-11 17:29:46.503837
162	162	\N	\N	\N	create	2024-10-11 17:29:46.507533
163	163	\N	\N	\N	create	2024-10-11 17:29:46.509852
164	164	\N	\N	\N	create	2024-10-11 17:29:46.513471
165	165	\N	\N	\N	create	2024-10-11 17:29:46.515308
166	166	\N	\N	\N	create	2024-10-11 17:29:46.517247
167	167	\N	\N	\N	create	2024-10-11 17:29:46.523875
168	168	\N	\N	\N	create	2024-10-11 17:29:46.528745
169	169	\N	\N	\N	create	2024-10-11 17:29:46.531577
170	170	\N	\N	\N	create	2024-10-11 17:29:46.535598
171	171	\N	\N	\N	create	2024-10-11 17:29:46.537633
172	172	\N	\N	\N	create	2024-10-11 17:29:46.539876
173	173	\N	\N	\N	create	2024-10-11 17:29:46.541873
174	174	\N	\N	\N	create	2024-10-11 17:29:46.544081
175	175	\N	\N	\N	create	2024-10-11 17:29:46.547527
176	176	\N	\N	\N	create	2024-10-11 17:29:46.549442
177	177	\N	\N	\N	create	2024-10-11 17:29:46.552242
178	178	\N	\N	\N	create	2024-10-11 17:29:46.556178
179	179	\N	\N	\N	create	2024-10-11 17:29:46.560963
180	180	\N	\N	\N	create	2024-10-11 17:29:46.564346
181	181	\N	\N	\N	create	2024-10-11 17:29:46.566376
182	182	\N	\N	\N	create	2024-10-11 17:29:46.569138
183	183	\N	\N	\N	create	2024-10-11 17:29:46.572435
184	184	\N	\N	\N	create	2024-10-11 17:29:46.574668
185	185	\N	\N	\N	create	2024-10-11 17:29:46.580418
186	186	\N	\N	\N	create	2024-10-11 17:29:46.582528
187	187	\N	\N	\N	create	2024-10-11 17:29:46.586419
188	188	\N	\N	\N	create	2024-10-11 17:29:46.590951
189	189	\N	\N	\N	create	2024-10-11 17:29:46.5931
190	190	\N	\N	\N	create	2024-10-11 17:29:46.595512
191	191	\N	\N	\N	create	2024-10-11 17:29:46.598599
192	192	\N	\N	\N	create	2024-10-11 17:29:46.601881
193	193	\N	\N	\N	create	2024-10-11 17:29:46.604582
194	194	\N	\N	\N	create	2024-10-11 17:29:46.606978
195	195	\N	\N	\N	create	2024-10-11 17:29:46.609046
196	196	\N	\N	\N	create	2024-10-11 17:29:46.610863
197	197	\N	\N	\N	create	2024-10-11 17:29:46.613524
198	198	\N	\N	\N	create	2024-10-11 17:29:46.615681
199	199	\N	\N	\N	create	2024-10-11 17:29:46.617881
200	200	\N	\N	\N	create	2024-10-11 17:29:46.621448
201	201	\N	\N	\N	create	2024-10-11 17:29:46.623706
202	202	\N	\N	\N	create	2024-10-11 17:29:46.628253
203	203	\N	\N	\N	create	2024-10-11 17:29:46.631219
204	204	\N	\N	\N	create	2024-10-11 17:29:46.633192
205	205	\N	\N	\N	create	2024-10-11 17:29:46.635379
206	206	\N	\N	\N	create	2024-10-11 17:29:46.637054
207	207	\N	\N	\N	create	2024-10-11 17:29:46.639632
208	208	\N	\N	\N	create	2024-10-11 17:29:46.64242
209	209	\N	\N	\N	create	2024-10-11 17:29:46.645364
210	210	\N	\N	\N	create	2024-10-11 17:29:46.647352
211	211	\N	\N	\N	create	2024-10-11 17:29:46.649227
212	212	\N	\N	\N	create	2024-10-11 17:29:46.654988
213	213	\N	\N	\N	create	2024-10-11 17:29:46.656943
214	214	\N	\N	\N	create	2024-10-11 17:29:46.658709
215	215	\N	\N	\N	create	2024-10-11 17:29:46.660662
216	216	\N	\N	\N	create	2024-10-11 17:29:46.662893
217	217	\N	\N	\N	create	2024-10-11 17:29:46.665021
218	218	\N	\N	\N	create	2024-10-11 17:29:46.667623
219	219	\N	\N	\N	create	2024-10-11 17:29:46.670879
220	220	\N	\N	\N	create	2024-10-11 17:29:46.67358
221	221	\N	\N	\N	create	2024-10-11 17:29:46.675509
222	222	\N	\N	\N	create	2024-10-11 17:29:46.678507
223	223	\N	\N	\N	create	2024-10-11 17:29:46.681924
224	224	\N	\N	\N	create	2024-10-11 17:29:46.684332
225	225	\N	\N	\N	create	2024-10-11 17:29:46.686673
226	226	\N	\N	\N	create	2024-10-11 17:29:46.688515
227	227	\N	\N	\N	create	2024-10-11 17:29:46.690422
228	228	\N	\N	\N	create	2024-10-11 17:29:46.695191
229	229	\N	\N	\N	create	2024-10-11 17:29:46.697163
230	230	\N	\N	\N	create	2024-10-11 17:29:46.699014
231	231	\N	\N	\N	create	2024-10-11 17:29:46.700674
232	232	\N	\N	\N	create	2024-10-11 17:29:46.703551
233	233	\N	\N	\N	create	2024-10-11 17:29:46.707593
234	234	\N	\N	\N	create	2024-10-11 17:29:46.710331
235	235	\N	\N	\N	create	2024-10-11 17:29:46.712779
236	236	\N	\N	\N	create	2024-10-11 17:29:46.715096
237	237	\N	\N	\N	create	2024-10-11 17:29:46.71688
238	238	\N	\N	\N	create	2024-10-11 17:29:46.72051
239	239	\N	\N	\N	create	2024-10-11 17:29:46.722641
240	240	\N	\N	\N	create	2024-10-11 17:29:46.724628
241	241	\N	\N	\N	create	2024-10-11 17:29:46.728043
242	242	\N	\N	\N	create	2024-10-11 17:29:46.730383
243	243	\N	\N	\N	create	2024-10-11 17:29:46.732831
244	244	\N	\N	\N	create	2024-10-11 17:29:46.739375
245	245	\N	\N	\N	create	2024-10-11 17:29:46.74189
246	246	\N	\N	\N	create	2024-10-11 17:29:46.753025
247	247	\N	\N	\N	create	2024-10-11 17:29:46.756008
248	248	\N	\N	\N	create	2024-10-11 17:29:46.759627
249	249	\N	\N	\N	create	2024-10-11 17:29:46.762104
250	250	\N	\N	\N	create	2024-10-11 17:29:46.763915
251	251	\N	\N	\N	create	2024-10-11 17:29:46.778416
252	252	\N	\N	\N	create	2024-10-11 17:29:46.782453
253	253	\N	\N	\N	create	2024-10-11 17:29:46.787192
254	254	\N	\N	\N	create	2024-10-11 17:29:46.789677
255	255	\N	\N	\N	create	2024-10-11 17:29:46.792176
256	256	\N	\N	\N	create	2024-10-11 17:29:46.794771
257	257	\N	\N	\N	create	2024-10-11 17:29:46.797166
258	258	\N	\N	\N	create	2024-10-11 17:29:46.801544
259	259	\N	\N	\N	create	2024-10-11 17:29:46.805541
260	260	\N	\N	\N	create	2024-10-11 17:29:46.807564
261	261	\N	\N	\N	create	2024-10-11 17:29:46.809454
262	262	\N	\N	\N	create	2024-10-11 17:29:46.813806
263	263	\N	\N	\N	create	2024-10-11 17:29:46.816419
264	264	\N	\N	\N	create	2024-10-11 17:29:46.819758
265	265	\N	\N	\N	create	2024-10-11 17:29:46.822082
266	266	\N	\N	\N	create	2024-10-11 17:29:46.828559
267	267	\N	\N	\N	create	2024-10-11 17:29:46.83111
268	268	\N	\N	\N	create	2024-10-11 17:29:46.832985
269	269	\N	\N	\N	create	2024-10-11 17:29:46.834859
270	270	\N	\N	\N	create	2024-10-11 17:29:46.83746
271	271	\N	\N	\N	create	2024-10-11 17:29:46.839593
272	272	\N	\N	\N	create	2024-10-11 17:29:46.841522
273	273	\N	\N	\N	create	2024-10-11 17:29:46.84538
274	274	\N	\N	\N	create	2024-10-11 17:29:46.847821
275	275	\N	\N	\N	create	2024-10-11 17:29:46.849838
276	276	\N	\N	\N	create	2024-10-11 17:29:46.856319
277	277	\N	\N	\N	create	2024-10-11 17:29:46.858592
278	278	\N	\N	\N	create	2024-10-11 17:29:46.86078
279	279	\N	\N	\N	create	2024-10-11 17:29:46.8649
280	280	\N	\N	\N	create	2024-10-11 17:29:46.867103
281	281	\N	\N	\N	create	2024-10-11 17:29:46.869619
282	282	\N	\N	\N	create	2024-10-11 17:29:46.87183
283	283	\N	\N	\N	create	2024-10-11 17:29:46.87608
284	284	\N	\N	\N	create	2024-10-11 17:29:46.880766
285	285	\N	\N	\N	create	2024-10-11 17:29:46.882948
286	286	\N	\N	\N	create	2024-10-11 17:29:46.887652
287	287	\N	\N	\N	create	2024-10-11 17:29:46.890284
288	288	\N	\N	\N	create	2024-10-11 17:29:46.892259
289	289	\N	\N	\N	create	2024-10-11 17:29:46.895539
290	290	\N	\N	\N	create	2024-10-11 17:29:46.898737
291	291	\N	\N	\N	create	2024-10-11 17:29:46.901026
292	292	\N	\N	\N	create	2024-10-11 17:29:46.908039
293	293	\N	\N	\N	create	2024-10-11 17:29:46.911664
294	294	\N	\N	\N	create	2024-10-11 17:29:46.91368
295	295	\N	\N	\N	create	2024-10-11 17:29:46.91574
296	296	\N	\N	\N	create	2024-10-11 17:29:46.926705
297	297	\N	\N	\N	create	2024-10-11 17:29:46.952314
298	298	\N	\N	\N	create	2024-10-11 17:29:46.956189
299	299	\N	\N	\N	create	2024-10-11 17:29:46.959114
300	300	\N	\N	\N	create	2024-10-11 17:29:46.977608
301	301	\N	\N	\N	create	2024-10-11 17:29:46.980696
302	302	\N	\N	\N	create	2024-10-11 17:29:46.983034
303	303	\N	\N	\N	create	2024-10-11 17:29:46.985784
304	304	\N	\N	\N	create	2024-10-11 17:29:46.987944
305	305	\N	\N	\N	create	2024-10-11 17:29:46.995446
306	306	\N	\N	\N	create	2024-10-11 17:29:46.998484
307	307	\N	\N	\N	create	2024-10-11 17:29:47.00203
308	308	\N	\N	\N	create	2024-10-11 17:29:47.008341
309	309	\N	\N	\N	create	2024-10-11 17:29:47.014919
310	310	\N	\N	\N	create	2024-10-11 17:29:47.01713
311	311	\N	\N	\N	create	2024-10-11 17:29:47.019176
312	312	\N	\N	\N	create	2024-10-11 17:29:47.021373
313	313	\N	\N	\N	create	2024-10-11 17:29:47.029905
314	314	\N	\N	\N	create	2024-10-11 17:29:47.032871
315	315	\N	\N	\N	create	2024-10-11 17:29:47.039959
316	316	\N	\N	\N	create	2024-10-11 17:29:47.047188
317	317	\N	\N	\N	create	2024-10-11 17:29:47.051555
318	318	\N	\N	\N	create	2024-10-11 17:29:47.05412
319	319	\N	\N	\N	create	2024-10-11 17:29:47.057757
320	320	\N	\N	\N	create	2024-10-11 17:29:47.059794
321	321	\N	\N	\N	create	2024-10-11 17:29:47.062136
322	322	\N	\N	\N	create	2024-10-11 17:29:47.064548
323	323	\N	\N	\N	create	2024-10-11 17:29:47.067797
324	324	\N	\N	\N	create	2024-10-11 17:29:47.0704
325	325	\N	\N	\N	create	2024-10-11 17:29:47.072328
326	326	\N	\N	\N	create	2024-10-11 17:29:47.074378
327	327	\N	\N	\N	create	2024-10-11 17:29:47.079542
328	328	\N	\N	\N	create	2024-10-11 17:29:47.082292
329	329	\N	\N	\N	create	2024-10-11 17:29:47.084494
330	330	\N	\N	\N	create	2024-10-11 17:29:47.086407
331	331	\N	\N	\N	create	2024-10-11 17:29:47.090733
332	332	\N	\N	\N	create	2024-10-11 17:29:47.093154
333	333	\N	\N	\N	create	2024-10-11 17:29:47.095805
334	334	\N	\N	\N	create	2024-10-11 17:29:47.098186
335	335	\N	\N	\N	create	2024-10-11 17:29:47.101245
336	336	\N	\N	\N	create	2024-10-11 17:29:47.107026
337	337	\N	\N	\N	create	2024-10-11 17:29:47.110639
338	338	\N	\N	\N	create	2024-10-11 17:29:47.112731
339	339	\N	\N	\N	create	2024-10-11 17:29:47.115
340	340	\N	\N	\N	create	2024-10-11 17:29:47.126173
341	341	\N	\N	\N	create	2024-10-11 17:29:47.128869
342	342	\N	\N	\N	create	2024-10-11 17:29:47.132769
343	343	\N	\N	\N	create	2024-10-11 17:29:47.135718
344	344	\N	\N	\N	create	2024-10-11 17:29:47.137835
345	345	\N	\N	\N	create	2024-10-11 17:29:47.14024
346	346	\N	\N	\N	create	2024-10-11 17:29:47.144995
347	347	\N	\N	\N	create	2024-10-11 17:29:47.148208
348	348	\N	\N	\N	create	2024-10-11 17:29:47.150513
349	349	\N	\N	\N	create	2024-10-11 17:29:47.153789
350	350	\N	\N	\N	create	2024-10-11 17:29:47.157341
351	351	\N	\N	\N	create	2024-10-11 17:29:47.162088
352	352	\N	\N	\N	create	2024-10-11 17:29:47.164465
353	353	\N	\N	\N	create	2024-10-11 17:29:47.166772
354	354	\N	\N	\N	create	2024-10-11 17:29:47.169326
355	355	\N	\N	\N	create	2024-10-11 17:29:47.17802
356	356	\N	\N	\N	create	2024-10-11 17:29:47.179897
357	357	\N	\N	\N	create	2024-10-11 17:29:47.186751
358	358	\N	\N	\N	create	2024-10-11 17:29:47.189064
359	359	\N	\N	\N	create	2024-10-11 17:29:47.19076
360	360	\N	\N	\N	create	2024-10-11 17:29:47.192703
361	361	\N	\N	\N	create	2024-10-11 17:29:47.196019
362	362	\N	\N	\N	create	2024-10-11 17:29:47.198516
363	363	\N	\N	\N	create	2024-10-11 17:29:47.200995
364	364	\N	\N	\N	create	2024-10-11 17:29:47.203379
365	365	\N	\N	\N	create	2024-10-11 17:29:47.210241
366	366	\N	\N	\N	create	2024-10-11 17:29:47.212958
367	367	\N	\N	\N	create	2024-10-11 17:29:47.215561
368	368	\N	\N	\N	create	2024-10-11 17:29:47.22082
369	369	\N	\N	\N	create	2024-10-11 17:29:47.229838
370	370	\N	\N	\N	create	2024-10-11 17:29:47.232486
371	371	\N	\N	\N	create	2024-10-11 17:29:47.236579
372	372	\N	\N	\N	create	2024-10-11 17:29:47.238788
373	373	\N	\N	\N	create	2024-10-11 17:29:47.24085
374	374	\N	\N	\N	create	2024-10-11 17:29:47.242582
375	375	\N	\N	\N	create	2024-10-11 17:29:47.244743
376	376	\N	\N	\N	create	2024-10-11 17:29:47.246867
377	377	\N	\N	\N	create	2024-10-11 17:29:47.249528
378	378	\N	\N	\N	create	2024-10-11 17:29:47.25158
379	379	\N	\N	\N	create	2024-10-11 17:29:47.255517
380	380	\N	\N	\N	create	2024-10-11 17:29:47.259671
381	381	\N	\N	\N	create	2024-10-11 17:29:47.263495
382	382	\N	\N	\N	create	2024-10-11 17:29:47.265739
383	383	\N	\N	\N	create	2024-10-11 17:29:47.268415
384	384	\N	\N	\N	create	2024-10-11 17:29:47.271426
385	385	\N	\N	\N	create	2024-10-11 17:29:47.273738
386	386	\N	\N	\N	create	2024-10-11 17:29:47.281542
387	387	\N	\N	\N	create	2024-10-11 17:29:47.284944
388	388	\N	\N	\N	create	2024-10-11 17:29:47.299034
389	389	\N	\N	\N	create	2024-10-11 17:29:47.304136
390	390	\N	\N	\N	create	2024-10-11 17:29:47.306871
391	391	\N	\N	\N	create	2024-10-11 17:29:47.308618
392	392	\N	\N	\N	create	2024-10-11 17:29:47.312819
393	393	\N	\N	\N	create	2024-10-11 17:29:47.315357
394	394	\N	\N	\N	create	2024-10-11 17:29:47.318245
395	395	\N	\N	\N	create	2024-10-11 17:29:47.320463
396	396	\N	\N	\N	create	2024-10-11 17:29:47.32296
397	397	\N	\N	\N	create	2024-10-11 17:29:47.325284
398	398	\N	\N	\N	create	2024-10-11 17:29:47.327205
399	399	\N	\N	\N	create	2024-10-11 17:29:47.332112
400	400	\N	\N	\N	create	2024-10-11 17:29:47.336286
401	401	\N	\N	\N	create	2024-10-11 17:29:47.338615
402	402	\N	\N	\N	create	2024-10-11 17:29:47.340713
403	403	\N	\N	\N	create	2024-10-11 17:29:47.346298
404	404	\N	\N	\N	create	2024-10-11 17:29:47.348513
405	405	\N	\N	\N	create	2024-10-11 17:29:47.35054
406	406	\N	\N	\N	create	2024-10-11 17:29:47.352754
407	407	\N	\N	\N	create	2024-10-11 17:29:47.363481
408	408	\N	\N	\N	create	2024-10-11 17:29:47.371
409	409	\N	\N	\N	create	2024-10-11 17:29:47.377041
410	410	\N	\N	\N	create	2024-10-11 17:29:47.379641
411	411	\N	\N	\N	create	2024-10-11 17:29:47.382829
412	412	\N	\N	\N	create	2024-10-11 17:29:47.385673
413	413	\N	\N	\N	create	2024-10-11 17:29:47.388182
414	414	\N	\N	\N	create	2024-10-11 17:29:47.392654
415	415	\N	\N	\N	create	2024-10-11 17:29:47.396762
416	416	\N	\N	\N	create	2024-10-11 17:29:47.399144
417	417	\N	\N	\N	create	2024-10-11 17:29:47.401179
418	418	\N	\N	\N	create	2024-10-11 17:29:47.403101
419	419	\N	\N	\N	create	2024-10-11 17:29:47.405
420	420	\N	\N	\N	create	2024-10-11 17:29:47.407025
421	421	\N	\N	\N	create	2024-10-11 17:29:47.412377
422	422	\N	\N	\N	create	2024-10-11 17:29:47.414503
423	423	\N	\N	\N	create	2024-10-11 17:29:47.416359
424	424	\N	\N	\N	create	2024-10-11 17:29:47.420006
425	425	\N	\N	\N	create	2024-10-11 17:29:47.422577
426	426	\N	\N	\N	create	2024-10-11 17:29:47.447128
427	427	\N	\N	\N	create	2024-10-11 17:29:47.449683
428	428	\N	\N	\N	create	2024-10-11 17:29:47.452566
429	429	\N	\N	\N	create	2024-10-11 17:29:47.454767
430	430	\N	\N	\N	create	2024-10-11 17:29:47.457153
431	431	\N	\N	\N	create	2024-10-11 17:29:47.466535
432	432	\N	\N	\N	create	2024-10-11 17:29:47.470244
433	433	\N	\N	\N	create	2024-10-11 17:29:47.472466
434	434	\N	\N	\N	create	2024-10-11 17:29:47.480169
435	435	\N	\N	\N	create	2024-10-11 17:29:47.483888
436	436	\N	\N	\N	create	2024-10-11 17:29:47.487892
437	437	\N	\N	\N	create	2024-10-11 17:29:47.491458
438	438	\N	\N	\N	create	2024-10-11 17:29:47.497305
439	439	\N	\N	\N	create	2024-10-11 17:29:47.503949
440	440	\N	\N	\N	create	2024-10-11 17:29:47.506948
441	441	\N	\N	\N	create	2024-10-11 17:29:47.510405
442	442	\N	\N	\N	create	2024-10-11 17:29:47.516036
443	443	\N	\N	\N	create	2024-10-11 17:29:47.519556
444	444	\N	\N	\N	create	2024-10-11 17:29:47.521932
445	445	\N	\N	\N	create	2024-10-11 17:29:47.524567
446	446	\N	\N	\N	create	2024-10-11 17:29:47.531627
447	447	\N	\N	\N	create	2024-10-11 17:29:47.546098
448	448	\N	\N	\N	create	2024-10-11 17:29:47.552733
449	449	\N	\N	\N	create	2024-10-11 17:29:47.555072
450	450	\N	\N	\N	create	2024-10-11 17:29:47.559477
451	451	\N	\N	\N	create	2024-10-11 17:29:47.571273
452	452	\N	\N	\N	create	2024-10-11 17:29:47.574179
453	453	\N	\N	\N	create	2024-10-11 17:29:47.576675
454	454	\N	\N	\N	create	2024-10-11 17:29:47.579053
455	455	\N	\N	\N	create	2024-10-11 17:29:47.581452
456	456	\N	\N	\N	create	2024-10-11 17:29:47.583575
457	457	\N	\N	\N	create	2024-10-11 17:29:47.585593
458	458	\N	\N	\N	create	2024-10-11 17:29:47.587986
459	459	\N	\N	\N	create	2024-10-11 17:29:47.590995
460	460	\N	\N	\N	create	2024-10-11 17:29:47.593196
461	461	\N	\N	\N	create	2024-10-11 17:29:47.595786
462	462	\N	\N	\N	create	2024-10-11 17:29:47.598886
463	463	\N	\N	\N	create	2024-10-11 17:29:47.60144
464	464	\N	\N	\N	create	2024-10-11 17:29:47.60359
465	465	\N	\N	\N	create	2024-10-11 17:29:47.605512
466	466	\N	\N	\N	create	2024-10-11 17:29:47.607513
467	467	\N	\N	\N	create	2024-10-11 17:29:47.611862
468	468	\N	\N	\N	create	2024-10-11 17:29:47.614743
469	469	\N	\N	\N	create	2024-10-11 17:29:47.616884
470	470	\N	\N	\N	create	2024-10-11 17:29:47.619675
471	471	\N	\N	\N	create	2024-10-11 17:29:47.624242
472	472	\N	\N	\N	create	2024-10-11 17:29:47.626144
473	473	\N	\N	\N	create	2024-10-11 17:29:47.628781
474	474	\N	\N	\N	create	2024-10-11 17:29:47.632808
475	475	\N	\N	\N	create	2024-10-11 17:29:47.636163
476	476	\N	\N	\N	create	2024-10-11 17:29:47.639519
477	477	\N	\N	\N	create	2024-10-11 17:29:47.642055
478	478	\N	\N	\N	create	2024-10-11 17:29:47.646884
479	479	\N	\N	\N	create	2024-10-11 17:29:47.649438
480	480	\N	\N	\N	create	2024-10-11 17:29:47.652122
481	481	\N	\N	\N	create	2024-10-11 17:29:47.653962
482	482	\N	\N	\N	create	2024-10-11 17:29:47.655859
483	483	\N	\N	\N	create	2024-10-11 17:29:47.658109
484	484	\N	\N	\N	create	2024-10-11 17:29:47.666355
485	485	\N	\N	\N	create	2024-10-11 17:29:47.668944
486	486	\N	\N	\N	create	2024-10-11 17:29:47.671406
487	487	\N	\N	\N	create	2024-10-11 17:29:47.67598
488	488	\N	\N	\N	create	2024-10-11 17:29:47.679385
489	489	\N	\N	\N	create	2024-10-11 17:29:47.682391
490	490	\N	\N	\N	create	2024-10-11 17:29:47.688309
491	491	\N	\N	\N	create	2024-10-11 17:29:47.690989
492	492	\N	\N	\N	create	2024-10-11 17:29:47.693027
493	493	\N	\N	\N	create	2024-10-11 17:29:47.695401
494	494	\N	\N	\N	create	2024-10-11 17:29:47.697942
495	495	\N	\N	\N	create	2024-10-11 17:29:47.700094
496	496	\N	\N	\N	create	2024-10-11 17:29:47.702328
497	497	\N	\N	\N	create	2024-10-11 17:29:47.70519
498	498	\N	\N	\N	create	2024-10-11 17:29:47.708894
499	499	\N	\N	\N	create	2024-10-11 17:29:47.712395
500	500	\N	\N	\N	create	2024-10-11 17:29:47.714941
\.


--
-- Data for Name: bom_history; Type: TABLE DATA; Schema: public; Owner: derrek
--

COPY public.bom_history (id, bom_id, component_type, phx_class, supplier_manufacturer, address, email, contact_number, supplier_mfg_lt, transit_lt, amz_safety_days, wh_safety_days, po_issue_days, master_pack, moq, ordering_uom, unit_price, shipping_cost, landed_cost, conversion, converted_unit_price, ims_unit, supplier_payment_terms, product_link, supplier_product_id, description, remarks, alternative_supplier_1, alternative_supplier_2, monthly_usage, monthly_spend, total_lt_bom_master, comments, version, "timestamp") FROM stdin;
1	1	Packaging	\N	EcoEnclose	280 S Taylor Ave, Ste. 200 Louisville, CO 80027	jeremy@ecoenclose.com	888-445-6575 ext. 004	\N	\N	60	30	3	1	2000	\N	\N	0.0214	0.0694	\N	0.0694	\N	NET30	x	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:45.914222
2	2	CM Packaging-Container	C	General Bottle Supply	1845 Daly Street Los Angeles, CA 90031	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	\N	3	1	10000	\N	\N	\N	0.19	\N	0.19	\N	NET45	https://www.containerandpackaging.com/products/double-wall-straight-base-jar/J007	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:45.958429
3	3	CM Packaging-Top	C	General Bottle Supply	1845 Daly Street Los Angeles, CA 90031	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	\N	3	1	10000	\N	\N	\N	0.082	\N	0.082	\N	NET45	https://www.containerandpackaging.com/products/continuous-thread-polypropylene-lid/L208A	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:45.964242
4	4	CM Packaging-Label	C	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	\N	3	1	500	\N	\N	\N	0.04	\N	0.04	\N	CBS	x	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:45.970442
5	5	CM Packaging-Label	B	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	\N	3	1	500	\N	\N	0.0045	0.0695	\N	0.0695	\N	CBS	x	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:45.981129
6	6	CM Packaging-Top	B	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	\N	3	1	3500	\N	\N	0.0406	0.1231	\N	0.1231	\N	NET45	https://www.containerandpackaging.com/products/continuous-thread-polypropylene-lid/L208A	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:45.994425
7	7	CM Packaging-Box	C	XYMO Print	6800 Kingspointe Pkwy, Orlando, FL 32819, US	Karola.Reyes@xymoprint.com	321-276-4984	\N	\N	60	\N	3	1	10000	\N	\N	0.0066	0.2916	\N	0.2916	\N	NET30 after Shipdate	x	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.027369
8	8	CM Packaging-Box	B	XYMO Print	6800 Kingspointe Pkwy, Orlando, FL 32819, US	Karola.Reyes@xymoprint.com	321-276-4984	\N	\N	60	\N	3	1	10000	\N	\N	0.0066	0.2916	\N	0.2916	\N	NET30 after Shipdate	x	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.044179
9	9	White Label	B	PLSF	150 Douglas Ave Dunedin, FL 34698	orders@privatelabel.net	17274661703	\N	\N	60	30	3	1	5000	\N	\N	\N	2.49	\N	2.49	\N	Due Upon Reciept	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.047682
10	10	Raw Material	A	Passiono	606, No. 1818 Huangxing Road, Shanghai, China	info@adallen-nutrition.com	86 731 88988 198/118	\N	\N	60	30	3	1	20	\N	\N	\N	9	\N	9	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.053134
11	11	Label	B	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.0333	\N	0.0333	\N	CBS	x	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.055232
12	12	Label	A	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.125	\N	0.125	\N	CBS	x	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.056946
13	13	White Label	B	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	3500	\N	\N	0.0406	0.2586	\N	0.2586	\N	NET45	https://www.containerandpackaging.com/products/double-wall-straight-base-jar/J007	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.059038
14	14	Raw Material	A	Haigen	No.3 Taoyuan Road,Taiwan Industry Park,QuFu 273100,China	haigen.stevia@foxmail.com	(+86)18253296328	\N	\N	60	30	3	25	200	\N	\N	0.6481	57.6481	\N	57.6481	\N	NET90	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.061165
15	15	Safety Shrink Band	\N	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	1000	\N	\N	\N	0.0142	\N	0.0142	\N	NET45	https://www.containerandpackaging.com/products/shrink-band-or-bag-or-sleeve/M175	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.063118
16	16	Safety Shrink Band	\N	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	10000	\N	\N	\N	0.11	\N	0.11	\N	NET45	x	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.065979
17	17	Scoop	A	National Measure	7920 215th St. W.  Lakeville, MN 55044	CustomerService1@nationalpolymersllc.com	800-328-4577	\N	\N	60	30	3	1	4500	\N	\N	\N	0.079	\N	0.079	\N	CBS	https://www.nationalmeasures.com/products/0-625-cc-scoop/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.068956
18	18	Safety Shrink Band	\N	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	10000	\N	\N	\N	0.11	\N	0.11	\N	NET45	x	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.071768
19	19	Container/Pouch	A	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	100	4100	\N	\N	\N	0.0885	\N	0.0885	\N	NET45	https://www.containerandpackaging.com/products/pe-cylinder-round/B302	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.074441
20	20	Label	A	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1000	500	\N	\N	\N	0.19	\N	0.19	\N	CBS	x	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.077085
21	21	Raw Material	A	Lebermuth	\N	cbader@lebermuth.com	.800.648.1123	\N	\N	60	30	3	10	1	\N	\N	3.35	81.27	\N	178.794	\N	NET30	https://www.bulkapothecary.com/clary-sage-essential-oil/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.079709
22	22	Raw Material	A	Wholesale Supplies Plus	7820 E Pleasant Valley Road Independence, Ohio 44131	contact@wholesalesuppliesplus.com	800-359-0944	\N	\N	60	30	3	16	16	\N	\N	\N	2.42	\N	81.8299	\N	CBS	https://www.wholesalesuppliesplus.com/products/cashmere-and-pear-fragrance-oil.aspx	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.082074
23	23	Raw Material	C	Lotion Crafter	48 Hope Ln Eastsound, Washington 98245	support@lotioncrafter.com	\N	\N	\N	60	30	3	1	9	\N	\N	2.5	18.15	\N	39.93	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.084548
24	24	White Label	\N	PLSF	150 Douglas Ave Dunedin, FL 34698	orders@privatelabel.net	17274661703	\N	\N	60	30	3	1	500	\N	\N	\N	6.75	\N	6.75	\N	Due Upon Reciept	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.086896
25	25	White Label	A	\N	\N	pam@shaylabs.com	(800) 358-6155	\N	\N	60	30	3	1	500	\N	\N	\N	2.98	\N	2.98	\N	50 DP/50 NET60	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.089002
26	26	White Label	\N	PLSF	150 Douglas Ave Dunedin, FL 34698	orders@privatelabel.net	17274661703	\N	\N	60	30	3	1	500	\N	\N	\N	2.11	\N	2.11	\N	Due Upon Reciept	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.091701
27	27	White Label	B	Hebei Houde Hanfang Medical	RM1603 Jinhe Intl Business Building A, NO.42 Huan WestRd,Zhengding County Shijiazhuang City CN-13 Hebei 050899 CN	\N	\N	\N	\N	60	30	3	1	10000	\N	\N	0.0405	0.2905	\N	0.2905	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.094889
28	28	Label	B	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.1531	\N	0.1531	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.099017
29	29	Label	\N	Wizard Labels	29136 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.34	\N	0.34	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.104531
30	30	Label	B	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.1085	\N	0.1085	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.109922
31	31	Container/Pouch	\N	Yason Pack	No. 22 Huacui 1st Lane, Qiaotou Town, Dongguan City, Guangdong Province, China	sam@yasonpack.cn	86 13925595106	\N	\N	60	60	3	1	5000	\N	\N	0.04	0.2	\N	0.2	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.112657
32	32	Container/Pouch	\N	Yason Pack	No. 22 Huacui 1st Lane, Qiaotou Town, Dongguan City, Guangdong Province, China	sam@yasonpack.cn	86 13925595106	\N	\N	60	60	3	1	5000	\N	\N	0.04	0.2	\N	0.2	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.115743
33	33	Label	A	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.18	\N	0.18	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.119028
34	34	Label	A	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.0963	\N	0.0963	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.12392
35	35	CM Packaging-Container	A	TRICORBRAUN	14802 NW 107th Ave., Ste 8 Hialeah, FL 33018 USA	gino@ferragamopackaging.com	530.304.5711	\N	\N	60	\N	3	1	7350	\N	\N	\N	0.45	\N	0.45	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.126607
36	36	CM Packaging-Top	A	Ferragamo Packaging	2925 Spafford Street, Suite D | Davis, CA 95618	gino@ferragamopackaging.com	530.304.5711	\N	\N	60	\N	3	1	10000	\N	\N	\N	0.2	\N	0.2	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.130119
37	37	Raw Material	\N	Haigen	No.3 Taoyuan Road,Taiwan Industry Park,QuFu 273100,China	summer@phyhuir.com	86-731-8468 6909	\N	\N	60	30	3	1	20	\N	\N	\N	44	\N	44	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.132596
38	38	Container/Pouch	\N	Yason Pack	No. 22 Huacui 1st Lane, Qiaotou Town, Dongguan City, Guangdong Province, China	sam@yasonpack.cn	86 13925595106	\N	\N	60	60	3	1	5000	\N	\N	0.04	0.2	\N	0.2	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.135628
39	39	Label	B	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.23	\N	0.23	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.138147
40	40	Label	A	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.26	\N	0.26	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.140199
41	41	Label	C	Wizard Labels	29136 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.37	\N	0.37	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.142194
42	42	CM Packaging-Label	A	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	\N	3	1	500	\N	\N	\N	0.15	\N	0.15	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.144177
43	43	Turnkey FG	\N	Health Specialty	8339 Allport Ave Santa Fe Springs, CA 90670 USA	christina@healthspecialty.com	562-273-0348	\N	\N	60	30	3	1	2120	\N	\N	\N	2.3	\N	2.3	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.145828
44	44	Turnkey FG	C	Covalence	460 S Benson Lane STE 3 Chandler, AZ 85224	ehalula@covalence.com	480 897 0547	\N	\N	60	30	3	1	11200	\N	\N	\N	1.31	\N	1.31	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.151282
45	45	Turnkey FG	B	Covalence	460 S Benson Lane STE 3 Chandler, AZ 85224	ehalula@covalence.com	480 897 0547	\N	\N	60	30	3	1	11200	\N	\N	\N	1.31	\N	1.31	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.154371
46	46	Label	C	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.36	\N	0.36	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.156564
47	47	Label	C	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.52	\N	0.52	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.159453
48	48	CM Packaging-Container	\N	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	\N	3	100	3600	\N	\N	0.0586	0.2986	\N	0.2986	\N	NET45	https://www.containerandpackaging.com/products/pet-imperial-bullet-cosmo/B344WH	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.162742
49	49	Label	C	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.31	\N	0.31	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.166092
50	50	CM Packaging-Label	\N	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	\N	3	1	500	\N	\N	\N	0.15	\N	0.15	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.1685
51	51	White Label	C	PLSF	150 Douglas Ave Dunedin, FL 34698	orders@privatelabel.net	17274661703	\N	\N	60	30	3	1	5500	\N	\N	0.1565	3.1565	\N	3.1565	\N	Due Upon Reciept	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.170659
52	52	White Label	C	Shay Labs	2200 Tech Court, Woodstock, IL 60098	pam@shaylabs.com	(800) 358-6155	\N	\N	60	30	3	1	3000	\N	\N	\N	1.64	\N	1.64	\N	50 DP/50 NET60	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.175432
53	53	White Label	\N	\N	\N	pam@shaylabs.com	(800) 358-6155	\N	\N	60	30	3	1	5627	\N	\N	\N	2.2	\N	2.2	\N	50 DP/50 NET60	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.177622
54	54	Label	B	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.41	\N	0.41	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.182539
55	55	Container/Pouch	\N	Yason Pack	No. 22 Huacui 1st Lane, Qiaotou Town, Dongguan City, Guangdong Province, China	sam@yasonpack.cn	86 13925595106	\N	\N	60	30	3	1	10000	\N	\N	0.066	0.165	\N	0.165	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.184875
56	56	White Label	B	PLSF	150 Douglas Ave Dunedin, FL 34698	orders@privatelabel.net	17274661703	\N	\N	60	30	3	1	2500	\N	\N	\N	4.05	\N	4.05	\N	Due Upon Reciept	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.187013
57	57	Label	C	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.3	\N	0.3	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.189259
58	58	Safety Shrink Band	\N	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	10000	\N	\N	0.0048	0.0932	\N	0.0932	\N	NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.192294
59	59	White Label	\N	PLSF	150 Douglas Ave Dunedin, FL 34698	orders@privatelabel.net	17274661703	\N	\N	60	30	3	1	1500	\N	\N	\N	5	\N	5	\N	Due Upon Reciept	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.195884
60	60	White Label	B	Shay Labs	1065 Lake Avenue, Suite 3 Woodstock, IL 60098	pam@shaylabs.com	(800) 358-6155	\N	\N	60	30	3	1	10000	\N	\N	0.3051	3.2651	\N	3.2651	\N	50 DP/50 NET60	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.201266
61	61	Label	B	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.24	\N	0.24	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.204941
62	62	Turnkey FG	\N	Health Specialty	8339 Allport Ave Santa Fe Springs, CA 90670 USA	christina@healthspecialty.com	562-273-0348	\N	\N	60	30	3	1	3000	\N	\N	\N	1.7	\N	1.7	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.207059
63	63	Label	\N	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.17	\N	0.17	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.208891
64	64	Label	B	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.21	\N	0.21	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.212237
65	65	Container/Pouch	C	Sav on Bags	789 E Cedar St, Ontario, CA 91761	\N	909-923-9588	\N	\N	60	30	3	1	6000	\N	\N	0.0709	0.2326	\N	0.2326	\N	CBS	https://www.sav-onbags.com/8-oz-Matte-Stand-Up-Pouch_p_128.html	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.216696
66	66	Label	B	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.133	\N	0.133	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.219049
67	67	Label	PLC-2024	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.13	\N	0.13	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.221736
68	68	Label	C	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.12	\N	0.12	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.224748
69	69	Container/Pouch	\N	Yason Pack	No. 22 Huacui 1st Lane, Qiaotou Town, Dongguan City, Guangdong Province, China	sam@yasonpack.cn	86 13925595106	\N	\N	60	60	3	1	5000	\N	\N	0.04	0.2	\N	0.2	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.228022
70	70	Label	B	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.2223	\N	0.2223	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.230469
71	71	Container/Pouch	\N	PBFY	2980 Enterprise St., Brea CA 92821	\N	909-923-9588	\N	\N	60	30	3	1	100	\N	\N	\N	0.46	\N	0.46	\N	CBS	https://www.sav-onbags.com/2-lb-Stand-Up-Pouch_p_91.html	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.23268
72	72	Label	\N	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.27	\N	0.27	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.235855
73	73	Container/Pouch	C	Yason Pack	No. 22 Huacui 1st Lane, Qiaotou Town, Dongguan City, Guangdong Province, China	sam@yasonpack.cn	86 13925595106	\N	\N	60	30	3	1	10000	\N	\N	\N	0.24	\N	0.24	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.239632
74	74	Label	C	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.434	\N	0.434	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.242366
75	75	Eco Bags	\N	EcoEnclose	280 S Taylor Ave, Ste. 200 Louisville, CO 80027	jeremy@ecoenclose.com	888-445-6575 ext. 004	\N	\N	60	30	3	1	10000	\N	\N	\N	0.08	\N	0.08	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.24465
76	76	CM Packaging-Label	C	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	\N	3	1	500	\N	\N	\N	0.22	\N	0.22	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.247753
77	77	Turnkey FG	C	Health Specialty	8339 Allport Ave Santa Fe Springs, CA 90670 USA	christina@healthspecialty.com	562-273-0348	\N	\N	60	30	3	1	500	\N	\N	\N	1.7	\N	1.7	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.25041
78	78	Raw Material	\N	Nutravative	601 Century Parkway, Suite 200 Allen, TX 7503	marvin@nutravative.com	469-361-3361	\N	\N	60	30	3	1	300	\N	\N	\N	7.5	\N	7.5	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.252713
79	79	Safety Shrink Band	\N	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	1000	\N	\N	\N	0.05	\N	0.05	\N	NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.25506
80	80	Container/Pouch	C	Guangzhou Sunri Pack Material Co., Ltd	A315, 1489 Fanghua Rd, Renhe Town, Baiyun District, Guangzhou510470	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	10000	\N	\N	0.0127	0.1787	\N	0.1787	\N	NET45	https://www.containerandpackaging.com/products/pet-imperial-bullet-cosmo/B379W	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.25767
81	81	Raw Material	C	Cona Industrial	No. 6-2, Middle Road, Mayan Airport Industrial Estate, Jiangcheng District, Yangjiang, Guangdong, China	\N	\N	\N	\N	60	30	3	1	1000	\N	\N	0.315	1.705	\N	1.705	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.260602
82	82	Label	B	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.1863	\N	0.1863	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.263306
83	83	Label	B	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.33	\N	0.33	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.266101
84	84	Label	B	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.27	\N	0.27	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.273423
85	85	Label	C	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.23	\N	0.23	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.275371
86	86	Label	C	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	0.01	0.13	\N	0.13	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.277793
87	87	Label	C	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.17	\N	0.17	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.28029
88	88	Top Cover	\N	Jiangyin City Qingrun Plastic Co., Ltd.	Alibaba	Alibaba	Alibaba	\N	\N	60	30	3	1	100000	\N	\N	\N	0.06	\N	0.06	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.283605
89	89	Label	\N	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.41	\N	0.41	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.286512
90	90	Label	B	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.3605	\N	0.3605	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.289335
91	91	Label	B	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.0855	\N	0.0855	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.291659
92	92	Label	C	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.43	\N	0.43	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.294734
93	93	Label	\N	Wizard Labels	29136 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.24	\N	0.24	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.299265
94	94	Scoop	C	National Measure	7920 215th St. W.  Lakeville, MN 55044	CustomerService1@nationalpolymersllc.com	800-328-4577	\N	\N	60	30	3	1	4500	\N	\N	0.0224	0.0924	\N	0.0924	\N	CBS	https://www.nationalmeasures.com/products/1-25-cc-scoop/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.301249
95	95	CM Packaging-Label	C	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	\N	3	1	500	\N	\N	\N	0.15	\N	0.15	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.30498
96	96	Turnkey FG	C	Health Specialty	8339 Allport Ave Santa Fe Springs, CA 90670 USA	christina@healthspecialty.com	562-273-0348	\N	\N	60	30	3	1	1000	\N	\N	\N	2.41	\N	2.41	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.308025
97	97	Turnkey FG	\N	PLSF	150 Douglas Ave Dunedin, FL 34698	orders@privatelabel.net	17274661703	\N	\N	60	30	3	1	550	\N	\N	\N	6	\N	6	\N	Due Upon Reciept	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.310857
98	98	White Label	C	PLSF	150 Douglas Ave Dunedin, FL 34698	orders@privatelabel.net	17274661703	\N	\N	60	30	3	1	500	\N	\N	\N	6.59	\N	6.59	\N	Due Upon Reciept	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.31255
99	99	Turnkey FG	C	PLSF	150 Douglas Ave Dunedin, FL 34698	orders@privatelabel.net	17274661703	\N	\N	60	30	3	1	1000	\N	\N	\N	1.43	\N	1.43	\N	Due Upon Reciept	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.314235
100	100	Turnkey FG	C	\N	\N	pam@shaylabs.com	(800) 358-6155	\N	\N	60	30	3	1	1000	\N	\N	0.1389	1.5689	\N	1.5689	\N	50 DP/50 NET60	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.316158
101	101	Turnkey FG	\N	PLSF	150 Douglas Ave Dunedin, FL 34698	orders@privatelabel.net	17274661703	\N	\N	60	30	3	1	700	\N	\N	\N	6	\N	6	\N	Due Upon Reciept	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.318135
102	102	Turnkey FG	C	PLSF	150 Douglas Ave Dunedin, FL 34698	orders@privatelabel.net	17274661703	\N	\N	60	30	3	1	500	\N	\N	\N	2.5	\N	2.5	\N	Due Upon Reciept	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.321896
103	103	Container/Pouch	B	Sav on Bags	789 E Cedar St, Ontario, CA 91761	\N	909-923-9588	\N	\N	60	30	3	1	4000	\N	\N	\N	0.24	\N	0.24	\N	CBS	https://www.sav-onbags.com/4-oz-Matte-Stand-Up-Pouch_p_126.html	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.324947
104	104	Label	C	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.39	\N	0.39	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.327489
105	105	Label	\N	Wizard Labels	29136 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.387	\N	0.387	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.329762
106	106	Label	\N	Wizard Labels	29137 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.387	\N	0.387	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.332507
107	107	Raw Material	C	Jiaherb	1 Chapin Road, Unit 1 Pine Brook NJ 07058	cd@jiaherbinc.com	714.209.7423	\N	\N	60	30	3	1	20	\N	\N	5.85	21.85	\N	21.85	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.337205
108	108	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.31	\N	0.31	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.35046
109	109	Label	C	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.3605	\N	0.3605	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.355179
110	110	Label	C	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.52	\N	0.52	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.357558
111	111	Raw Material	C	Ikeda Tea World	18281 Gothard Street, Suite 109, Huntington Beach, CA 92648	nemo@ikedamatcha.com	714-907-4226	\N	\N	60	30	3	1	20	\N	\N	\N	35	\N	35	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.359793
112	112	Raw Material	C	Haigen	No.3 Taoyuan Road,Taiwan Industry Park,QuFu 273100,China	cheryl.zhang@jhdcorp.com	909-450-1735	\N	\N	60	30	3	25	20	\N	\N	1.175	11.475	\N	11.475	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.362219
113	113	Label	B	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.16	\N	0.16	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.364291
114	114	Label	A	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.125	\N	0.125	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.366078
115	115	Turnkey FG	\N	PLSF	150 Douglas Ave Dunedin, FL 34698	orders@privatelabel.net	17274661703	\N	\N	60	30	3	1	500	\N	\N	\N	4.5	\N	4.5	\N	Due Upon Reciept	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.368071
116	116	Label	\N	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.65	\N	0.65	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.370805
117	117	Raw Material	\N	Passiono	606, No. 1818 Huangxing Road, Shanghai, China	karen@passiono.com	86-21-5505-0973	\N	\N	60	30	3	1	100	\N	\N	\N	9.65	\N	9.65	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.376845
118	118	White Label	\N	Hebei Houde Hanfang Medical	RM1603 Jinhe Intl Business Building A, NO.42 Huan WestRd,Zhengding County Shijiazhuang City CN-13 Hebei 050899 CN	\N	\N	\N	\N	60	30	3	1	10000	\N	\N	\N	0.15	\N	0.15	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.379695
119	119	Turnkey FG	\N	PLSF	150 Douglas Ave Dunedin, FL 34698	orders@privatelabel.net	17274661703	\N	\N	60	30	3	1	300	\N	\N	\N	7.5	\N	7.5	\N	Due Upon Reciept	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.381416
120	120	Raw Material	C	Passiono	606, No. 1818 Huangxing Road, Shanghai, China	karen@passiono.com	86-21-5505-0973	\N	\N	60	30	3	1	40	\N	\N	\N	24	\N	24	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.383002
121	121	Container/Pouch	\N	Container and Packaging	\N	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	500	\N	\N	\N	0.2	\N	0.2	\N	NET45	https://www.containerandpackaging.com/products/hdpe-packer-bottle/B717WH	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.388439
122	122	Sticker	\N	\N	\N	\N	\N	\N	\N	60	30	3	1	500	\N	\N	\N	0.74	\N	0.74	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.390721
123	123	Raw Material	\N	\N	\N	\N	\N	\N	\N	60	30	3	1	500	\N	\N	\N	7.3	\N	7.3	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.393239
124	124	Top Cover	\N	\N	\N	\N	\N	\N	\N	60	30	3	1	500	\N	\N	\N	0.1	\N	0.1	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.397135
125	125	Turnkey FG	C	PLSF	150 Douglas Ave Dunedin, FL 34698	orders@privatelabel.net	17274661703	\N	\N	60	30	3	1	500	\N	\N	\N	3.5	\N	3.5	\N	Due Upon Reciept	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.399641
126	126	Turnkey FG	\N	PLSF	150 Douglas Ave Dunedin, FL 34698	orders@privatelabel.net	17274661703	\N	\N	60	30	3	1	300	\N	\N	\N	5.75	\N	5.75	\N	Due Upon Reciept	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.40303
127	127	Turnkey FG	\N	PLSF	150 Douglas Ave Dunedin, FL 34698	orders@privatelabel.net	17274661703	\N	\N	60	30	3	1	125	\N	\N	\N	6	\N	6	\N	Due Upon Reciept	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.405009
128	128	Label	\N	\N	\N	\N	\N	\N	\N	60	30	3	1	500	\N	\N	\N	0.24	\N	0.24	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.407374
129	129	Turnkey FG	\N	PLSF	150 Douglas Ave Dunedin, FL 34698	orders@privatelabel.net	17274661703	\N	\N	60	30	3	1	500	\N	\N	\N	5	\N	5	\N	Due Upon Reciept	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.410107
130	130	Raw Material	C	Nutravative	601 Century Parkway, Suite 200 Allen, TX 7503	marvin@nutravative.com	469-361-3361	\N	\N	60	30	3	1	25	\N	\N	2.5	7.3	\N	7.3	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.412433
131	131	Raw Material	\N	PLSF	150 Douglas Ave Dunedin, FL 34698	minglunteas@126.com	86-18153301417	\N	\N	60	30	3	1	20	\N	\N	2	8.97	\N	8.97	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.414953
132	132	Container/Pouch	B	Sav on Bags	789 E Cedar St, Ontario, CA 91761	\N	909-923-9588	\N	\N	60	30	3	1	1000	\N	\N	\N	0.23	\N	0.23	\N	CBS	https://www.sav-onbags.com/8-oz-Matte-Stand-Up-Pouch_p_128.html	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.417506
133	133	Raw Material	C	Haigen	No.3 Taoyuan Road,Taiwan Industry Park,QuFu 273100,China	haigen.stevia@foxmail.com	(+86)18253296328	\N	\N	60	30	3	25	20	\N	\N	\N	16	\N	16	\N	NET90	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.419884
134	134	Turnkey FG	\N	PLSF	150 Douglas Ave Dunedin, FL 34698	orders@privatelabel.net	17274661703	\N	\N	60	30	3	1	500	\N	\N	\N	5	\N	5	\N	Due Upon Reciept	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.422648
135	135	Raw Material	A	Xian Yuhui	RM 20202 7th Bldg Xujingchongshengyuan,fengcheng 12th road, Economic and Technical Development Zone, Xi’an, China	cheryl.zhang@jhdcorp.com	909-450-1735	\N	\N	60	30	3	1	25	\N	\N	\N	29.6	\N	29.6	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.425097
136	136	Turnkey FG	\N	PLSF	150 Douglas Ave Dunedin, FL 34698	orders@privatelabel.net	17274661703	\N	\N	60	30	3	1	20	\N	\N	\N	7.5	\N	7.5	\N	Due Upon Reciept	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.431225
137	137	Raw Material	C	Stauber	4120 N Palm Street Fullerton, CA 92835	Stephanie.Aispuro@stauberusa.com	714-441-3631	\N	\N	60	30	3	1	25	\N	\N	\N	13.65	\N	13.65	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.433081
138	138	Raw Material	C	Organic Creations	307 NW Kerron St, Winlock, WA 98596	\N	360-869-7900	\N	\N	60	30	3	1	10	\N	\N	\N	25.25	\N	6.6703	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.43557
139	139	Raw Material	B	Organic Creations	307 NW Kerron St, Winlock, WA 98596	\N	360-869-7900	\N	\N	60	30	3	1	10	\N	\N	3.783	20.583	\N	5.4375	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.439837
140	140	Raw Material	B	Organic Creations	307 NW Kerron St, Winlock, WA 98596	\N	360-869-7900	\N	\N	60	30	3	1	1	\N	\N	18.915	43.415	\N	11.469	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.441852
141	141	Turnkey FG	\N	PLSF	150 Douglas Ave Dunedin, FL 34698	orders@privatelabel.net	17274661703	\N	\N	60	30	3	1	100	\N	\N	\N	5.75	\N	5.75	\N	Due Upon Reciept	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.444196
142	142	Turnkey FG	\N	PLSF	150 Douglas Ave Dunedin, FL 34698	orders@privatelabel.net	17274661703	\N	\N	60	30	3	1	500	\N	\N	\N	5	\N	5	\N	Due Upon Reciept	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.446286
143	143	Turnkey FG	\N	EVORA LABS	\N	\N	888-793-8450	\N	\N	60	30	3	1	2000	\N	\N	\N	4.88	\N	4.88	\N	75 DP / 25 NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.448461
144	144	Raw Material	C	Wholesale Supplies Plus	7820 E Pleasant Valley Road Independence, Ohio 44131	contact@wholesalesuppliesplus.com	800-359-0944	\N	\N	60	30	3	4	10	\N	\N	\N	6.67	\N	14.674	\N	CBS	https://www.wholesalesuppliesplus.com/products/vanilla-fragrance-oil.aspx	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.45128
145	145	Raw Material	C	Organic Creations	307 NW Kerron St, Winlock, WA 98596	\N	360-869-7900	\N	\N	60	30	3	5	1	\N	\N	\N	23.15	\N	50.93	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.455152
146	146	Raw Material	B	Organic Creations	307 NW Kerron St, Winlock, WA 98596	\N	360-869-7900	\N	\N	60	30	3	1	1	\N	\N	7.6	32.1	\N	8.4799	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.457822
147	147	Raw Material	B	Organic Creations	307 NW Kerron St, Winlock, WA 98596	\N	360-869-7900	\N	\N	60	30	3	1	1	\N	\N	8.716	24.516	\N	6.4764	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.460831
148	148	Raw Material	B	Organic Creations	307 NW Kerron St, Winlock, WA 98596	\N	360-869-7900	\N	\N	60	30	3	1	1	\N	\N	8.716	24.516	\N	6.4764	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.463196
149	149	Raw Material	A	Wuxi Cima	\N	jennifer@cimasci.com	86-0510-85188225-8005	\N	\N	60	30	3	1	20	\N	\N	\N	68.5	\N	68.5	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.465051
308	308	white Label	C	Nutrafill	655 Crawford Street N.E.Dawson, GA. 39842	tommy@nutrafill.com	\N	\N	\N	60	30	3	\N	1000	\N	\N	0.145	4.655	\N	4.655	\N	50/50	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.009025
150	150	Turnkey FG	\N	PLSF	150 Douglas Ave Dunedin, FL 34698	orders@privatelabel.net	17274661703	\N	\N	60	30	3	1	72	\N	\N	\N	4.7	\N	4.7	\N	Due Upon Reciept	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.466802
151	151	Raw Material	C	Haigen	No.3 Taoyuan Road,Taiwan Industry Park,QuFu 273100,China	haigen.stevia@foxmail.com	(+86)18253296328	\N	\N	60	30	3	25	25	\N	\N	\N	58	\N	58	\N	NET90	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.470659
152	152	Raw Material	C	PureAssay	14750 E. Nels on Ave. Suite A City of Industry, CA 91744	cheryl.zhang@jhdcorp.com	909-450-1735	\N	\N	60	30	3	1	25	\N	\N	\N	36.5	\N	36.5	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.472577
153	153	Turnkey FG	\N	PLSF	150 Douglas Ave Dunedin, FL 34698	orders@privatelabel.net	17274661703	\N	\N	60	30	3	1	100	\N	\N	\N	7.5	\N	7.5	\N	Due Upon Reciept	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.474238
154	154	Raw Material	C	Balchem	Homosassa Springs, Florida 34447	rharnish@balchem.com	786.877.8692	\N	\N	60	30	3	1	20	\N	\N	1.9443	30.6343	\N	30.6343	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.478367
155	155	Raw Material	B	MYO	7820 E Pleasant Valley Road Independence, Ohio 44131	\N	800-359-0944	\N	\N	60	30	3	1	4	\N	\N	1.9275	5.1075	\N	11.2365	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.482107
156	156	Raw Material	B	Jiaherb	1 Chapin Road, Unit 1 Pine Brook NJ 07058	cd@jiaherbinc.com	714.209.7423	\N	\N	60	30	3	1	50	\N	\N	\N	30	\N	30	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.485118
157	157	Turnkey FG	\N	PLSF	150 Douglas Ave Dunedin, FL 34698	orders@privatelabel.net	17274661703	\N	\N	60	30	3	1	336	\N	\N	\N	6	\N	6	\N	Due Upon Reciept	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.486923
158	158	Raw Material	B	Haigen	No.3 Taoyuan Road,Taiwan Industry Park,QuFu 273100,China	haigen.stevia@foxmail.com	(+86)18253296328	\N	\N	60	30	3	1	10	\N	\N	\N	187	\N	187	\N	NET90	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.489936
159	159	Raw Material	C	Lebermuth	4004 Technology Dr. South Bend, IN 46628	cbader@lebermuth.com	.800.648.1123	\N	\N	60	30	3	5	5	\N	\N	\N	72.6	\N	159.72	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.496754
160	160	Raw Material	C	Bramble Berry	\N	--	877-627-7883	\N	\N	60	30	3	5	1	\N	\N	\N	12.85	\N	28.27	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.499289
161	161	Raw Material	C	Stauber	4120 N Palm Street Fullerton, CA 92835	Stephanie.Aispuro@stauberusa.com	714-441-3631	\N	\N	60	30	3	1	20	\N	\N	\N	53	\N	53	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.504147
162	162	Raw Material	C	Lebermuth	4004 Technology Dr. South Bend, IN 46628	cbader@lebermuth.com	.800.648.1123	\N	\N	60	30	3	5	25	\N	\N	\N	77.25	\N	169.95	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.507833
163	163	Raw Material	\N	Naturalin Bio-Resources Co.,Ltd	\N	jamescao@naturalin.com	8613755074305	\N	\N	60	30	3	1	30	\N	\N	\N	52.5	\N	52.5	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.510148
164	164	Raw Material	\N	Naturalin Bio-Resources Co.,Ltd	\N	jamescao@naturalin.com	8613755074305	\N	\N	60	30	3	1	30	\N	\N	\N	25	\N	25	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.513753
165	165	Raw Material	C	Lebermuth	4004 Technology Dr. South Bend, IN 46628	cbader@lebermuth.com	.800.648.1123	\N	\N	60	30	3	5	5	\N	\N	\N	23.3	\N	51.26	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.515563
166	166	Raw Material	C	Lebermuth	4004 Technology Dr. South Bend, IN 46628	cbader@lebermuth.com	.800.648.1123	\N	\N	60	30	3	4	8	\N	\N	\N	49	\N	1656.886	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.51756
167	167	Raw Material	C	Lebermuth	4004 Technology Dr. South Bend, IN 46628	cbader@lebermuth.com	.800.648.1123	\N	\N	60	30	3	1	5	\N	\N	\N	35.85	\N	78.87	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.524202
168	168	Raw Material	C	Lebermuth	4004 Technology Dr. South Bend, IN 46628	cbader@lebermuth.com	.800.648.1123	\N	\N	60	30	3	1	5	\N	\N	\N	77.25	\N	169.95	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.529037
169	169	Label	\N	Traco Packaging	620 South 1325 West Orem, UT  84058	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.16	\N	0.16	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.531982
170	170	Label	C	Traco Packaging	620 South 1325 West Orem, UT  84058	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.16	\N	0.16	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.535939
171	171	Label	\N	Traco Packaging	620 South 1325 West Orem, UT  84058	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.16	\N	0.16	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.537974
172	172	Label	\N	Traco Packaging	620 South 1325 West Orem, UT  84058	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.16	\N	0.16	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.540151
173	173	Label	\N	Traco Packaging	620 South 1325 West Orem, UT  84058	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.23	\N	0.23	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.542177
174	174	Raw Material	C	\N	\N	Sales@bulkapothecary.com	888-728-7612	\N	\N	60	30	3	1	1	\N	\N	5.3	256.8	\N	67.8394	\N	CBS	https://www.bulkapothecary.com/lorann-oils-caramel-flavor-water-soluble/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.545517
175	175	Raw Material	\N	\N	\N	Sales@bulkapothecary.com	888-728-7612	\N	\N	60	30	3	1	1	\N	\N	5.3	256.8	\N	67.8394	\N	CBS	https://www.bulkapothecary.com/lorann-oils-vanilla-flavor/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.547948
176	176	Raw Material	C	\N	\N	Sales@bulkapothecary.com	888-728-7612	\N	\N	60	30	3	1	1	\N	\N	5.3	256.8	\N	67.8394	\N	CBS	https://www.bulkapothecary.com/lorann-oils-english-toffee-flavor-water-soluble/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.549655
177	177	Top Cover	C	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	500	\N	\N	\N	0.058	\N	0.058	\N	NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.554103
178	178	Container/Pouch	\N	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	500	\N	\N	\N	0.084	\N	0.084	\N	NET45	https://www.containerandpackaging.com/products/pet-imperial-bullet-cosmo/B230WH	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.556482
179	179	Container/Pouch	\N	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	500	\N	\N	\N	0.11	\N	0.11	\N	NET45	https://www.containerandpackaging.com/products/glass-boston-round/G841AM	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.561906
180	180	Container/Pouch	A	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	100	500	\N	\N	0.0652	0.3978	\N	0.3978	\N	NET45	https://www.containerandpackaging.com/products/pet-imperial-bullet-cosmo/B318W	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.564624
181	181	Container/Pouch	\N	TricorBraun	14802 NW 107th Ave., Ste 8 Hialeah, FL 33018 USA	aweston@tricorbraun.com	305-805-6207	\N	\N	60	30	3	1	10000	\N	\N	0.01	0.09	\N	0.09	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.566749
182	182	Container/Pouch	B	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	100	500	\N	\N	\N	0.24	\N	0.24	\N	NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.569837
183	183	Container/Pouch	C	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	100	500	\N	\N	\N	0.3	\N	0.3	\N	NET45	https://www.containerandpackaging.com/products/pet-imperial-bullet-cosmo/B318W	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.572893
184	184	Container/Pouch	\N	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	500	\N	\N	\N	0.25	\N	0.25	\N	NET45	https://www.containerandpackaging.com/products/pet-imperial-bullet-cosmo/B379AM	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.575099
185	185	Container/Pouch	\N	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	500	\N	\N	\N	0.3	\N	0.3	\N	NET45	https://www.containerandpackaging.com/products/pet-imperial-bullet-cosmo/B345A	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.58074
186	186	Container/Pouch	\N	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	500	\N	\N	\N	0.29	\N	0.29	\N	NET45	https://www.containerandpackaging.com/products/pet-imperial-bullet-cosmo/B311AM	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.582793
187	187	Top Cover	\N	Zhejiang Santong Plastic	Shangqiu Industrial Zone,qinggang Town, Taizhou, Zhejiang, China	Alibaba	86-576-87141043	\N	\N	60	60	3	1	10000	\N	\N	\N	0.04	\N	0.04	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.588197
188	188	Top Cover	\N	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	500	\N	\N	0.0165	0.1438	\N	0.1438	\N	NET45	https://www.containerandpackaging.com/products/spouted-cap/L381WH	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.591234
189	189	Top Cover	A	Zhejiang Santong Plastic	Shangqiu Industrial Zone,qinggang Town, Taizhou, Zhejiang, China	Alibaba	86-576-87141043	\N	\N	60	60	3	1	10000	\N	\N	\N	0.0365	\N	0.0365	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.593388
190	190	Top Cover	\N	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	500	\N	\N	\N	0.15	\N	0.15	\N	NET45	https://www.containerandpackaging.com/products/spouted-cap/L381	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.595968
191	191	Top Cover	\N	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	500	\N	\N	\N	0.07	\N	0.07	\N	NET45	https://www.containerandpackaging.com/products/phenolic-style-cap-and-pp-like-phenolic/L071	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.598935
192	192	Eco Bags	\N	EcoEnclose	280 S Taylor Ave, Ste. 200 Louisville, CO 80027	jeremy@ecoenclose.com	888-445-6575 ext. 004	\N	\N	60	30	3	1	500	\N	\N	0.0052	0.0557	\N	0.0557	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.602296
193	193	Eco Bags	\N	EcoEnclose	280 S Taylor Ave, Ste. 200 Louisville, CO 80027	jeremy@ecoenclose.com	888-445-6575 ext. 004	\N	\N	60	30	3	1	500	\N	\N	0.0126	0.0816	\N	0.0816	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.604861
194	194	Top Cover	\N	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	500	\N	\N	\N	0.12	\N	0.12	\N	NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.607224
195	195	Insert	\N	\N	\N	\N	\N	\N	\N	60	30	3	1	500	\N	\N	\N	0.0237	\N	0.0237	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.609285
196	196	Insert	\N	\N	\N	\N	\N	\N	\N	60	30	3	1	500	\N	\N	\N	0.021	\N	0.021	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.611182
197	197	Insert	\N	\N	\N	\N	\N	\N	\N	60	30	3	1	500	\N	\N	\N	0.05	\N	0.05	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.613881
198	198	Insert	\N	\N	\N	\N	\N	\N	\N	60	30	3	1	500	\N	\N	\N	0.02	\N	0.02	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.615913
199	199	Label	C	Wizard Labels	29137 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.082	\N	0.082	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.618185
200	200	Label	\N	Wizard Labels	29138 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.07	\N	0.07	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.621751
201	201	Label	B	Wizard Labels	29139 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.31	\N	0.31	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.623952
202	202	Label	C	Traco Packaging	620 South 1325 West Orem, UT  84058	tbergstrom@tracopackaging.com	800-284-9727 ext. 259	\N	\N	60	30	3	1	500	\N	\N	\N	0.16	\N	0.16	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.629161
203	203	Label	\N	Wizard Labels	29141 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	0.1	0.18	\N	0.18	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.631499
204	204	Label	\N	Wizard Labels	29142 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	0.01	0.09	\N	0.09	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.633478
205	205	Label	C	Wizard Labels	29143 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.4043	\N	0.4043	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.635653
206	206	Label	C	Wizard Labels	29144 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.37	\N	0.37	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.637359
207	207	Label	\N	Wizard Labels	29145 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.24	\N	0.24	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.64071
208	208	Label	\N	Wizard Labels	29146 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.24	\N	0.24	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.642684
209	209	Label	\N	Wizard Labels	29147 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.24	\N	0.24	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.645673
210	210	Label	\N	Wizard Labels	29148 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.24	\N	0.24	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.647583
211	211	Label	\N	Wizard Labels	29149 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.12	\N	0.12	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.649466
212	212	Label	\N	Wizard Labels	29150 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.12	\N	0.12	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.655288
213	213	Top Cover	A	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	500	\N	\N	0.0079	0.0679	\N	0.0679	\N	NET45	https://www.containerandpackaging.com/products/disc-top-cap/L1368WH	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.657178
214	214	Top Cover	\N	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	500	\N	\N	\N	0.1	\N	0.1	\N	NET45	https://www.containerandpackaging.com/products/continuous-thread-polypropylene-lid/L208A	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.659096
215	215	Top Cover	\N	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	500	\N	\N	\N	0.17	\N	0.17	\N	NET45	https://www.containerandpackaging.com/products/continuous-thread-polypropylene-lid/L240B	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.660921
216	216	Top Cover	\N	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	500	\N	\N	\N	0.2455	\N	0.2455	\N	NET45	https://www.containerandpackaging.com/products/continuous-thread-polypropylene-lid/L240B	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.663158
217	217	Top Cover	\N	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	500	\N	\N	\N	0.5549	\N	0.5549	\N	NET45	https://www.containerandpackaging.com/products/continuous-thread-polypropylene-lid/L475BKP1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.665318
218	218	Safety Shrink Band	\N	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	500	\N	\N	\N	0.06	\N	0.06	\N	NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.668208
219	219	Safety Shrink Band	\N	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	500	\N	\N	0.0027	0.0912	\N	0.0912	\N	NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.671168
220	220	Safety Shrink Band	\N	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	500	\N	\N	\N	0.03	\N	0.03	\N	NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.673824
221	221	Safety Shrink Band	A	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	500	\N	\N	0.0023	0.0323	\N	0.0323	\N	NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.675775
222	222	Safety Shrink Band	\N	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	500	\N	\N	\N	0.114	\N	0.114	\N	NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.678779
223	223	Safety Shrink Band	B	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	500	\N	\N	\N	0.01	\N	0.01	\N	NET45	https://www.containerandpackaging.com/products/shrink-band-or-bag-or-sleeve/M172	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.682193
224	224	Safety Shrink Band	\N	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	500	\N	\N	\N	0.01	\N	0.01	\N	NET45	https://www.containerandpackaging.com/products/shrink-band-or-bag-or-sleeve/M175	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.684589
225	225	Safety Shrink Band	B	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	500	\N	\N	\N	0.1	\N	0.1	\N	NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.686927
226	226	Container/Pouch	B	SavOn Bags	789 E Cedar St, Ontario, CA 91761	\N	909-923-9588	\N	\N	60	30	3	1	500	\N	\N	0.053	0.433	\N	0.433	\N	CBS	https://www.sav-onbags.com/16-oz-Matte-Stand-Up-Pouch_p_89.html	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.688738
227	227	Container/Pouch	\N	Yason Pack	No. 22 Huacui 1st Lane, Qiaotou Town, Dongguan City, Guangdong Province, China	sam@yasonpack.cn	86 13925595106	\N	\N	60	60	3	1	1	\N	\N	\N	0.15	\N	0.15	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.690675
228	228	Container/Pouch	B	\N	\N	sam@yasonpack.cn	86 13925595106	\N	\N	60	60	3	1	5000	\N	\N	0.0795	0.1895	\N	0.1895	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.695464
229	229	Label	\N	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	1	\N	\N	\N	0.25	\N	0.25	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.697467
230	230	Raw Material	\N	\N	\N	\N	\N	\N	\N	60	30	3	1	1	\N	\N	0.0372	6.2372	\N	13.7218	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.699255
231	231	Turnkey FG	\N	\N	\N	\N	\N	\N	\N	60	30	3	1	1	\N	\N	\N	5.75	\N	5.75	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.700941
232	232	Top Cover	\N	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	500	\N	\N	0.01	0.29	\N	0.29	\N	NET45	https://www.containerandpackaging.com/products/treatment-pump/DP744WH	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.70582
233	233	Top Cover	\N	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	500	\N	\N	\N	0.4	\N	0.4	\N	NET45	https://www.containerandpackaging.com/products/treatment-pump/DP617BK	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.707823
234	234	Raw Material	C	Walmart	\N	todd@conaloe.com	386-673-7566 ext. 107	\N	\N	60	30	3	1	1	\N	\N	\N	4.34	\N	1.1465	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.710982
235	235	Raw Material	\N	\N	\N	\N	\N	\N	\N	60	30	3	1	1	\N	\N	\N	0.1	\N	0.0264	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.713037
236	236	Raw Material	C	Puritan Springs	1709 N. Kickapoo St. Lincoln, IL 62656	asmith@puritansprings.com	800-292-2992 Ext. 602	\N	\N	60	30	3	1	550	\N	\N	\N	1	\N	0.2642	\N	NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.715344
237	237	Raw Material	\N	\N	\N	\N	\N	\N	\N	60	30	3	1	1	\N	\N	\N	1.18	\N	2.596	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.717332
238	238	Raw Material	B	\N	\N	\N	\N	\N	\N	60	30	3	1	1	\N	\N	\N	0.3321	\N	0.7307	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.720798
239	239	Raw Material	C	MYO	7820 E Pleasant Valley Road Independence, Ohio 44131	\N	800-359-0944	\N	\N	60	30	3	45	5	\N	\N	\N	6	\N	13.2	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.722906
240	240	Raw Material	C	\N	\N	cheryl.zhang@jhdcorp.com	909-450-1735	\N	\N	60	30	3	1	20	\N	\N	4.4778	31.4778	\N	31.4778	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.724954
241	241	Raw Material	\N	\N	\N	\N	\N	\N	\N	60	30	3	1	1	\N	\N	\N	20	\N	20	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.728365
242	242	Raw Material	\N	\N	\N	info@ewlnatural.com	(503) 893-1100	\N	\N	60	30	3	1	1	\N	\N	\N	9.72	\N	21.384	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.730731
243	243	Raw Material	\N	Haigen	No.3 Taoyuan Road,Taiwan Industry Park,QuFu 273100,China	haigen.stevia@foxmail.com	(+86)18253296328	\N	\N	60	30	3	1	20	\N	\N	\N	32.5	\N	32.5	\N	NET90	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.733443
244	244	Raw Material	C	Certified Nutritionals	655 North Central Ave. 17th Floor, Glendale, CA 91203	haigen.stevia@foxmail.com	(+86)18253296328	\N	\N	60	30	3	1	20	\N	\N	\N	23.5	\N	23.5	\N	NET90	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.739681
245	245	Raw Material	\N	Essential Wholesale Labs	2211 NW Nicolai St. Portland, Oregon 97210	info@ewlnatural.com	(503) 893-1100	\N	\N	60	30	3	1	20	\N	\N	0.6029	15.8829	\N	15.8829	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.742149
246	246	Raw Material	B	Essential Wholesale Labs	2211 NW Nicolai St. Portland, Oregon 97210	info@ewlnatural.com	(503) 893-1100	\N	\N	60	30	3	1	20	\N	\N	1.1333	11.1333	\N	11.1333	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.753321
247	247	Raw Material	\N	Stauber	4120 N Palm Street Fullerton, CA 92835	Stephanie.Aispuro@stauberusa.com	714-441-3631	\N	\N	60	30	3	1	20	\N	\N	1.44	13.94	\N	13.94	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.75632
248	248	Raw Material	\N	Haigen	No.3 Taoyuan Road,Taiwan Industry Park,QuFu 273100,China	haigen.stevia@foxmail.com	(+86)18253296328	\N	\N	60	30	3	1	20	\N	\N	\N	25	\N	25	\N	NET90	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.759938
249	249	Raw Material	A	Haigen	No.3 Taoyuan Road,Taiwan Industry Park,QuFu 273100,China	haigen.stevia@foxmail.com	(+86)18253296328	\N	\N	60	30	3	1	20	\N	\N	2.1742	39.1742	\N	39.1742	\N	NET90	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.762383
250	250	Raw Material	C	Minglun Tea	\N	minglunteas@126.com	86-18153301417	\N	\N	60	30	3	1	20	\N	\N	\N	\N	\N	\N	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.764241
251	251	Raw Material	\N	Minglun Tea	\N	minglunteas@126.com	86-18153301417	\N	\N	60	30	3	1	20	\N	\N	\N	14.66	\N	14.66	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.780034
252	252	Raw Material	B	Minglun Tea	\N	minglunteas@126.com	86-18153301417	\N	\N	60	30	3	1	20	\N	\N	\N	17	\N	17	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.782918
253	253	Raw Material	C	NP Nutra	15161 - 15171 S. Figueroa St Gardena, CA 90248 - US	ctong@wheatgrass.com	(785) 841-6016	\N	\N	60	30	3	1	20	\N	\N	\N	17	\N	17	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.787512
254	254	Raw Material	B	\N	\N	cbader@lebermuth.com	.800.648.1123	\N	\N	60	30	3	5	1	\N	\N	\N	17.5	\N	38.5	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.79002
255	255	Raw Material	C	\N	\N	Sales@bulkapothecary.com	888-728-7612	\N	\N	60	30	3	25	1	\N	\N	\N	38	\N	83.6	\N	CBS	https://www.bulkapothecary.com/essential-oils/lavender-oil/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.792504
256	256	Raw Material	B	\N	\N	cbader@lebermuth.com	.800.648.1123	\N	\N	60	30	3	5	1	\N	\N	\N	32.25	\N	70.95	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.79511
257	257	Raw Material	\N	\N	\N	cbader@lebermuth.com	.800.648.1123	\N	\N	60	30	3	5	1	\N	\N	\N	33.4	\N	73.48	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.797567
258	258	Raw Material	B	\N	\N	cbader@lebermuth.com	.800.648.1123	\N	\N	60	30	3	5	1	\N	\N	\N	33.4	\N	73.48	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.801901
259	259	Raw Material	C	MYO	7820 E Pleasant Valley Road Independence, Ohio 44131	\N	800-359-0944	\N	\N	60	30	3	1	5	\N	\N	\N	15.25	\N	4.0286	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.805894
260	260	Safety Shrink Band	B	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	500	\N	\N	\N	0.1144	\N	0.1144	\N	NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.807812
261	261	Top Cover	\N	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	100	1000	\N	\N	\N	0.16	\N	0.16	\N	NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.809717
262	262	Top Cover	\N	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	1000	\N	\N	\N	0.25	\N	0.25	\N	NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.814424
263	263	Top Cover	\N	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	1000	\N	\N	\N	0.29	\N	0.29	\N	NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.816821
264	264	Sticker	\N	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	500	\N	\N	\N	0.11	\N	0.11	\N	NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.820091
265	265	White Label	\N	Health Specialty	8339 Allport Ave Santa Fe Springs, CA 90670 USA	christina@healthspecialty.com	562-273-0348	\N	\N	60	30	3	1	500	\N	\N	\N	2.25	\N	2.25	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.822558
266	266	Turnkey FG	\N	Health Specialty	8339 Allport Ave Santa Fe Springs, CA 90670 USA	christina@healthspecialty.com	562-273-0348	\N	\N	60	30	3	1	500	\N	\N	\N	1.7	\N	1.7	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.828813
267	267	Turnkey FG	\N	Health Specialty	8339 Allport Ave Santa Fe Springs, CA 90670 USA	christina@healthspecialty.com	562-273-0348	\N	\N	60	30	3	1	500	\N	\N	\N	2.3	\N	2.3	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.831408
268	268	Top Cover	C	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	500	\N	\N	\N	0.13	\N	0.13	\N	NET45	https://www.containerandpackaging.com/products/fine-mist-sprayer/S701WH	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.8333
269	269	Top Cover	\N	\N	\N	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	1200	\N	\N	\N	0.72	\N	0.72	\N	NET45	https://www.containerandpackaging.com/products/fine-mist-sprayer/S706BK	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.835136
270	270	Top Cover	B	\N	\N	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	1200	\N	\N	0.0246	0.7238	\N	0.7238	\N	NET45	https://www.containerandpackaging.com/products/fine-mist-sprayer/S706BK	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.837802
271	271	Top Cover	\N	\N	\N	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	1000	\N	\N	\N	0.12	\N	0.12	\N	NET45	https://www.containerandpackaging.com/products/fine-mist-sprayer/S701WH	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.839874
272	272	Top Cover	\N	\N	\N	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	1000	\N	\N	0.0287	0.0887	\N	0.0887	\N	NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.84189
273	273	White Label	A	PLSF	150 Douglas Ave Dunedin, FL 34698	orders@privatelabel.net	17274661703	\N	\N	60	30	3	1	500	\N	\N	\N	2.75	\N	2.75	\N	Due Upon Reciept	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.845926
274	274	Turnkey FG	\N	\N	\N	\N	\N	\N	\N	60	30	3	1	1	\N	\N	\N	3.72	\N	3.72	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.848081
275	275	Turnkey FG	\N	\N	\N	\N	\N	\N	\N	60	30	3	1	1	\N	\N	\N	\N	\N	\N	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.85019
276	276	placeholder	\N	\N	\N	\N	\N	\N	\N	60	30	3	1	1	\N	\N	\N	6.32	\N	6.32	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.856613
277	277	placeholder - Turnkey FG	\N	\N	\N	christina@healthspecialty.com	562-273-0348	\N	\N	60	30	3	1	1	\N	\N	\N	\N	\N	\N	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.858901
278	278	White Label	A	Health Specialty	8339 Allport Ave Santa Fe Springs, CA 90670 USA	christina@healthspecialty.com	562-273-0348	\N	\N	60	30	3	1	500	\N	\N	\N	2.4	\N	2.4	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.861203
279	279	Turnkey FG	\N	\N	\N	\N	\N	\N	\N	60	30	3	1	1	\N	\N	\N	6.82	\N	6.82	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.865235
280	280	Turnkey FG	\N	\N	\N	\N	\N	\N	\N	60	30	3	1	1	\N	\N	\N	5.13	\N	5.13	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.867385
281	281	Turnkey FG	\N	\N	\N	\N	\N	\N	\N	60	30	3	1	1	\N	\N	\N	\N	\N	\N	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.870123
282	282	Turnkey FG	\N	\N	\N	bill@e-nutrisport.com	(973) 209-7200	\N	\N	60	30	3	1	1500	\N	\N	\N	3.5	\N	3.5	\N	NET 30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.872916
283	283	placeholder	\N	\N	\N	\N	\N	\N	\N	60	30	3	1	1	\N	\N	\N	0.1	\N	0.1	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.876436
284	284	Turnkey FG	A	Health Specialty	8339 Allport Ave Santa Fe Springs, CA 90670 USA	christina@healthspecialty.com	562-273-0348	\N	\N	60	30	3	1	5000	\N	\N	\N	2.41	\N	2.41	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.88116
285	285	Container/Pouch	B	\N	\N	sam@yasonpack.cn	86 13925595106	\N	\N	60	60	3	1	5000	\N	\N	0.1013	0.2603	\N	0.2603	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.883342
286	286	Container/Pouch	A	\N	\N	sam@yasonpack.cn	86 13925595106	\N	\N	60	60	3	1	5000	\N	\N	\N	0.125	\N	0.125	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.888047
287	287	Container/Pouch	A	\N	\N	sam@yasonpack.cn	86 13925595106	\N	\N	60	60	3	1	5000	\N	\N	0.1495	0.2695	\N	0.2695	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.890542
288	288	Container/Pouch	A	\N	\N	sam@yasonpack.cn	86 13925595106	\N	\N	60	60	3	1	5000	\N	\N	0.1013	0.2263	\N	0.2263	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.892493
289	289	Container/Pouch	A	\N	\N	sam@yasonpack.cn	86 13925595106	\N	\N	60	60	3	1	5000	\N	\N	\N	0.155	\N	0.155	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.896336
290	290	Container/Pouch	C	\N	\N	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	\N	100	\N	\N	\N	0.415	\N	0.415	\N	NET45	https://www.containerandpackaging.com/products/pe-imperial-bullet-cosmo/B1270WH	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.898994
291	291	Raw Material	C	\N	\N	\N	360-869-7900	\N	\N	60	30	3	\N	1	\N	\N	8.734	25.534	\N	6.7454	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.90136
292	292	Raw Material	C	\N	\N	info@ewlnatural.com	(503) 893-1100	\N	\N	60	30	3	1	1	\N	\N	\N	23.93	\N	52.646	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.908521
293	293	Raw Material	C	\N	\N	info@ewlnatural.com	(503) 893-1100	\N	\N	60	30	3	1	1	\N	\N	4.4	193.35	\N	425.37	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.912048
294	294	Raw Material	C	\N	\N	--	877-627-7883	\N	\N	60	30	3	\N	1	\N	\N	\N	2.49	\N	84.1969	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.914117
295	295	Raw Material	C	\N	\N	info@windypointsoap.com	587-318-6678	\N	\N	60	30	3	\N	1	\N	\N	\N	25.1684	\N	25.1684	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.915961
296	296	Raw Material	C	MYO	7820 E Pleasant Valley Road Independence, Ohio 44131	admin@makingcosmetics.com	425-292-9502	\N	\N	60	30	3	\N	5	\N	\N	2.1055	89.6455	\N	197.22	\N	CBS	https://www.makeyourown.buzz/hydrolyzed-silk-protein/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.927081
297	297	Raw Material	C	MYO	7820 E Pleasant Valley Road Independence, Ohio 44131	\N	800-359-0944	\N	\N	60	30	3	\N	2	\N	\N	\N	4.97	\N	168.0556	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.953218
298	298	Raw Material	C	MYO	7820 E Pleasant Valley Road Independence, Ohio 44131	Sales@bulkapothecary.com	888-728-7612	\N	\N	60	30	3	\N	8	\N	\N	\N	1.8	\N	60.8652	\N	CBS	https://www.makeyourown.buzz/argan-oil/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.956484
299	299	Turnkey FG	\N	\N	\N	\N	\N	\N	\N	60	30	3	\N	1	\N	\N	\N	10.42	\N	10.42	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.959707
300	300	Turnkey FG	\N	\N	\N	\N	\N	\N	\N	60	30	3	\N	1	\N	\N	\N	4.5	\N	4.5	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.978306
301	301	Label	B	Wizard Labels	29150 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.263	\N	0.263	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.981015
302	302	Label	C	Wizard Labels	29150 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.263	\N	0.263	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.983635
303	303	Label	C	Wizard Labels	29150 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.47	\N	0.47	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.986097
304	304	Raw Material	B	\N	\N	\N	\N	\N	\N	60	30	3	\N	8	\N	\N	0.6	13.63	\N	460.8848	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.988277
305	305	Raw Material	B	\N	\N	Sales@bulkapothecary.com	888-728-7612	\N	\N	60	30	3	\N	10	\N	\N	2.4491	14.3891	\N	31.656	\N	CBS	https://www.bulkapothecary.com/raw-ingredients/other-ingredients-and-chemicals/menthol-crystals-usp/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.995909
306	306	Turnkey FG	C	Norax Supplements	37 Calumet Pkwy Bldg P, Ste 100 Newnan, GA 30263	jen@noraxsupplements.com	404-433-8851	\N	\N	60	30	3	\N	1000	\N	\N	\N	5.05	\N	5.05	\N	50/50	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:46.99887
307	307	White Label	C	Norax Supplements	37 Calumet Pkwy Bldg P, Ste 100 Newnan, GA 30263	jen@noraxsupplements.com	404-433-8851	\N	\N	60	30	3	\N	1000	\N	\N	\N	4.76	\N	4.76	\N	50/50	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.002605
309	309	Label	C	Nutrafill	655 Crawford Street N.E.Dawson, GA. 39842	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.28	\N	0.28	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.015229
310	310	Turnkey FG	C	Nutrafill	655 Crawford Street N.E.Dawson, GA. 39842	tommy@nutrafill.com	\N	\N	\N	60	30	3	\N	1000	\N	\N	\N	4.2161	\N	4.2161	\N	50/50	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.017368
311	311	Label	\N	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.28	\N	0.28	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.019498
312	312	turnkey FG	\N	Nutrafill	655 Crawford Street N.E.Dawson, GA. 39842	tommy@nutrafill.com	\N	\N	\N	60	30	3	\N	1000	\N	\N	\N	3.61	\N	3.61	\N	50/50	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.022201
313	313	white Label	\N	Nutrafill	655 Crawford Street N.E.Dawson, GA. 39842	tommy@nutrafill.com	\N	\N	\N	60	30	3	\N	1000	\N	\N	\N	3.61	\N	3.61	\N	50/50	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.030295
314	314	Label	C	Wizard Labels	29150 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.316	\N	0.316	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.033428
315	315	Label	C	Wizard Labels	29150 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.14	\N	0.14	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.040914
316	316	Safety Shrink Band	C	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	500	\N	\N	\N	0.068	\N	0.068	\N	NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.047523
317	317	Label	\N	Wizard Labels	29150 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.356	\N	0.356	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.051862
318	318	Container/Pouch	\N	Sav on Bags	789 E Cedar St, Ontario, CA 91761	\N	909-923-9588	\N	\N	60	30	3	\N	5000	\N	\N	\N	0.38	\N	0.38	\N	CBS	https://www.sav-onbags.com/16-oz-Matte-Stand-Up-Pouch_p_89.html	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.054412
319	319	Label	\N	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.13	\N	0.13	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.058114
320	320	Label	C	\N	\N	kkochanski@grace-imaging.com	419-874-2127	\N	\N	120	60	3	\N	2000	\N	\N	\N	0.47	\N	0.47	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.060213
321	321	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.3	\N	0.3	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.0625
322	322	Label	\N	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.467	\N	0.467	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.065128
323	323	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.2907	\N	0.2907	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.06827
324	324	Label	A	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.0981	\N	0.0981	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.070727
325	325	Label	A	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	\N	\N	\N	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.072584
326	326	Label	A	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.48	\N	0.48	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.074629
327	327	Label	B	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.33	\N	0.33	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.080094
328	328	Label	A	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.48	\N	0.48	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.082689
329	329	Label	A	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.48	\N	0.48	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.084756
330	330	Label	A	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.119	\N	0.119	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.086747
331	331	Label	A	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.22	\N	0.22	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.091116
332	332	Label	\N	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.51	\N	0.51	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.093525
333	333	Label	B	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.119	\N	0.119	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.096075
334	334	Label	B	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.119	\N	0.119	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.098518
335	335	Label	B	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.0909	\N	0.0909	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.105112
336	336	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.48	\N	0.48	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.107418
337	337	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.48	\N	0.48	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.111025
338	338	Label	A	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.1243	\N	0.1243	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.113019
339	339	Label	B	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.333	\N	0.333	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.124048
340	340	Label	A	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.2125	\N	0.2125	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.126442
341	341	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.48	\N	0.48	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.129389
342	342	Label	B	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.265	\N	0.265	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.133096
343	343	Label	B	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.24	\N	0.24	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.136003
344	344	Label	B	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.24	\N	0.24	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.138075
345	345	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.1224	\N	0.1224	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.14058
346	346	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.48	\N	0.48	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.145393
347	347	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.48	\N	0.48	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.148498
348	348	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.48	\N	0.48	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.150765
349	349	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.3294	\N	0.3294	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.154603
350	350	Label	\N	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.48	\N	0.48	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.157643
351	351	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.48	\N	0.48	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.162466
352	352	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.48	\N	0.48	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.164848
353	353	Label	\N	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.47	\N	0.47	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.167034
354	354	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.47	\N	0.47	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.1757
355	355	Label	\N	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.47	\N	0.47	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.178249
356	356	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.333	\N	0.333	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.180205
357	357	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.26	\N	0.26	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.187092
358	358	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.47	\N	0.47	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.189299
359	359	Label	\N	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.47	\N	0.47	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.190961
360	360	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.28	\N	0.28	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.193073
361	361	Label	\N	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.47	\N	0.47	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.196363
362	362	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.47	\N	0.47	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.198937
363	363	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.333	\N	0.333	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.201359
364	364	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.333	\N	0.333	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.203837
365	365	Container/Pouch	\N	\N	\N	\N	909-923-9588	\N	\N	60	30	3	\N	1000	\N	\N	0.01	0.33	\N	0.33	\N	CBS	https://www.sav-onbags.com/8-oz-Matte-Stand-Up-Pouch_p_128.html	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.210844
366	366	Label	B	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.1251	\N	0.1251	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.213394
367	367	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.333	\N	0.333	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.216043
368	368	Label	A	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.1614	\N	0.1614	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.222267
369	369	Raw Material	\N	\N	\N	\N	\N	\N	\N	60	30	3	1	1	\N	\N	5.3	256.8	\N	256.8	\N	\N	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.230172
370	370	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.32	\N	0.32	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.23315
371	371	Turnkey FG	A	\N	\N	christina@healthspecialty.com	562-273-0348	\N	\N	60	30	3	1	5000	\N	\N	\N	2.4	\N	2.4	\N	NET30	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.236892
372	372	White Label	\N	Norax Supplements	37 Calumet Pkwy Bldg P, Ste 100 Newnan, GA 30263	jen@noraxsupplements.com	404-433-8851	\N	\N	60	30	3	\N	1000	\N	\N	0.28	5.33	\N	5.33	\N	50/50	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.239059
373	373	Turnkey FG	C	Norax Supplements	37 Calumet Pkwy Bldg P, Ste 100 Newnan, GA 30263	jen@noraxsupplements.com	404-433-8851	\N	\N	60	30	3	\N	1000	\N	\N	0.28	5.33	\N	5.33	\N	50/50	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.241106
374	374	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.28	\N	0.28	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.242876
375	375	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.1971	\N	0.1971	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.245022
376	376	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.1971	\N	0.1971	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.247115
377	377	Label	B	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.196	\N	0.196	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.249824
378	378	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.1733	\N	0.1733	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.251906
379	379	Label	A	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.1825	\N	0.1825	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.25672
380	380	Label	B	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.27	\N	0.27	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.260013
381	381	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.3194	\N	0.3194	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.263828
382	382	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.2088	\N	0.2088	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.266014
383	383	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.1971	\N	0.1971	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.268888
384	384	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.13	\N	0.13	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.271841
385	385	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.32	\N	0.32	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.274009
386	386	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.34	\N	0.34	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.282442
387	387	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.27	\N	0.27	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.286178
388	388	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.16	\N	0.16	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.299529
389	389	turnkey FG	B	\N	\N	jen@noraxsupplements.com	404-433-8851	\N	\N	60	30	3	\N	1000	\N	\N	\N	5.05	\N	5.05	\N	50/50	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.304441
390	390	Label	\N	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.56	\N	0.56	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.307131
391	391	Safety Shrink Band	A	\N	\N	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	\N	5000	\N	\N	\N	0.107	\N	0.107	\N	NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.308858
392	392	Container/Pouch	A	\N	\N	sam@yasonpack.cn	86 13925595106	\N	\N	60	30	3	1	5000	\N	\N	\N	0.15	\N	0.15	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.313204
393	393	Container/Pouch	C	\N	\N	sam@yasonpack.cn	86 13925595106	\N	\N	60	30	3	1	5000	\N	\N	\N	0.24	\N	0.24	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.316307
394	394	Container/Pouch	C	\N	\N	sam@yasonpack.cn	86 13925595106	\N	\N	60	30	3	1	5000	\N	\N	\N	0.19	\N	0.19	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.318541
395	395	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.24	\N	0.24	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.320855
396	396	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.24	\N	0.24	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.323279
397	397	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.24	\N	0.24	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.325565
398	398	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.3238	\N	0.3238	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.327491
399	399	Label	A	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.27	\N	0.27	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.332429
400	400	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.24	\N	0.24	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.336666
401	401	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.48	\N	0.48	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.338886
402	402	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.48	\N	0.48	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.341392
403	403	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.24	\N	0.24	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.346748
404	404	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.33	\N	0.33	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.348796
405	405	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	0.0273	0.3273	\N	0.3273	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.350784
406	406	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.19	\N	0.19	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.35339
407	407	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.2931	\N	0.2931	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.364298
408	408	Container/Pouch	\N	\N	\N	\N	909-923-9588	\N	\N	60	30	3	\N	500	\N	\N	\N	0.36	\N	0.36	\N	CBS	https://www.sav-onbags.com/2-lb-Stand-Up-Pouch_p_91.html	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.37303
409	409	White Label	C	\N	\N	\N	\N	\N	\N	60	30	3	\N	1000	\N	\N	\N	4.98	\N	4.98	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.377479
410	410	Label	B	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.1426	\N	0.1426	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.379946
411	411	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.34	\N	0.34	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.383715
412	412	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.34	\N	0.34	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.386055
413	413	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.09	\N	0.09	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.388521
414	414	White Label	C	PLSF	150 Douglas Ave Dunedin, FL 34698	orders@privatelabel.net	17274661703	\N	\N	60	30	3	1	500	\N	\N	\N	3.5	\N	3.5	\N	Due Upon Reciept	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.392967
415	415	Label	\N	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.47	\N	0.47	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.397014
416	416	Label	B	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.1575	\N	0.1575	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.399455
417	417	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	1.43	\N	1.43	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.401426
418	418	White Label	C	\N	\N	pam@shaylabs.com	(800) 358-6155	\N	\N	60	30	3	\N	500	\N	\N	\N	0.29	\N	0.29	\N	50 DP/50 NET60	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.403445
419	419	Container/Pouch	A	\N	\N	sam@yasonpack.cn	86 13925595106	\N	\N	60	60	3	1	5000	\N	\N	\N	0.3	\N	0.3	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.405243
420	420	White Label	A	\N	\N	pam@shaylabs.com	(800) 358-6155	\N	\N	60	30	3	\N	500	\N	\N	0.067	1.757	\N	1.757	\N	50 DP/50 NET60	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.407333
421	421	Turnkey FG	A	\N	\N	christina@healthspecialty.com	562-273-0348	\N	\N	60	30	3	1	5000	\N	\N	\N	2.4	\N	2.4	\N	NET30	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.412728
422	422	Eco Bags	C	\N	\N	jeremy@ecoenclose.com	888-445-6575 ext. 004	\N	\N	60	30	3	1	1000	\N	\N	0.0093	0.077	\N	0.077	\N	NET30	https://www.ecoenclose.com/shop/poly-bags/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.41476
423	423	Top Cover	B	\N	\N	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	\N	50000	\N	\N	\N	0.3329	\N	0.3329	\N	NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.416678
424	424	Top Cover	\N	\N	\N	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	\N	50000	\N	\N	\N	2.2	\N	2.2	\N	NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.420329
425	425	White Label	A	\N	\N	christina@healthspecialty.com	562-273-0348	\N	\N	60	30	3	1	5000	\N	\N	4.21	61.21	\N	61.21	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.422979
426	426	turnkey FG	A	\N	\N	qzsd-tripod@gzbeike.com	86-020-87499043	\N	\N	60	30	3	1	500	\N	\N	\N	70	\N	70	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.4475
427	427	Label	B	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.101	\N	0.101	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.450299
428	428	Label	\N	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.2682	\N	0.2682	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.452842
429	429	Label	\N	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.4383	\N	0.4383	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.455183
430	430	Label	A	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.1925	\N	0.1925	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.457685
431	431	Label	A	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.28	\N	0.28	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.467956
432	432	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.4655	\N	0.4655	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.470559
433	433	Label	A	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.119	\N	0.119	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.472776
434	434	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.2406	\N	0.2406	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.480852
435	435	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.1759	\N	0.1759	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.484407
436	436	Safety Shrink Band	\N	\N	\N	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	\N	5000	\N	\N	\N	0.038	\N	0.038	\N	NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.488361
437	437	Label	PLC-2024	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.25	\N	0.25	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.491915
438	438	Label	PLC-2024	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.32	\N	0.32	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.497721
439	439	Raw Material	PLC-2024	\N	\N	\N	\N	\N	\N	60	30	3	\N	24	\N	\N	0.1428	0.6726	\N	22.7426	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.504612
440	440	Raw Material	PLC-2024	\N	\N	--	877-627-7883	\N	\N	60	30	3	\N	7	\N	\N	2.5714	17.4214	\N	38.3271	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.507332
441	441	Raw Material	PLC-2024	\N	\N	--	877-627-7883	\N	\N	60	30	3	\N	1	\N	\N	0.5143	3.5043	\N	7.7094	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.51074
442	442	Raw Material	PLC-2024	\N	\N	--	877-627-7883	\N	\N	60	30	3	\N	1	\N	\N	0.5143	5.2843	\N	11.6254	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.516401
443	443	Raw Material	PLC-2024	\N	\N	angelia@hbmojin.com	86 13288715578	\N	\N	60	30	3	\N	1	\N	\N	41.6667	66.6667	\N	66.6667	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.519971
444	444	CM Packaging-Container	B	\N	\N	Jared.Murray@containers.com	(208) 639-5868	\N	\N	120	60	3	\N	486	\N	\N	\N	0.18	\N	0.18	\N	NET45	https://www.containerandpackaging.com/products/pe-cylinder-round/B359	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.522304
445	445	Label	B	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	120	60	3	\N	1000	\N	\N	\N	0.16	\N	0.16	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.525084
446	446	Label	\N	\N	\N	Karola.Reyes@xymoprint.com	321-276-4984	\N	\N	1000	60	3	\N	1000	\N	\N	\N	0.0186	\N	0.0186	\N	NET30 after Shipdate	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.531995
447	447	Label	\N	\N	\N	Karola.Reyes@xymoprint.com	321-276-4984	\N	\N	1000	60	3	\N	1000	\N	\N	\N	0.0186	\N	0.0186	\N	NET30 after Shipdate	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.549635
448	448	Label	\N	\N	\N	Karola.Reyes@xymoprint.com	321-276-4984	\N	\N	1000	60	3	\N	1000	\N	\N	\N	0.0186	\N	0.0186	\N	NET30 after Shipdate	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.553131
449	449	Label	\N	\N	\N	Karola.Reyes@xymoprint.com	321-276-4984	\N	\N	1000	60	3	\N	1000	\N	\N	\N	0.0186	\N	0.0186	\N	NET30 after Shipdate	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.555346
450	450	Label	\N	\N	\N	Karola.Reyes@xymoprint.com	321-276-4984	\N	\N	1000	60	3	\N	1000	\N	\N	\N	0.0186	\N	0.0186	\N	NET30 after Shipdate	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.566919
451	451	Label	\N	\N	\N	Karola.Reyes@xymoprint.com	321-276-4984	\N	\N	1000	60	3	\N	1000	\N	\N	\N	0.0186	\N	0.0186	\N	NET30 after Shipdate	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.571761
452	452	Label	\N	\N	\N	Karola.Reyes@xymoprint.com	321-276-4984	\N	\N	1000	60	3	\N	500	\N	\N	\N	0.3	\N	0.3	\N	NET30 after Shipdate	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.574563
453	453	Container/Pouch	B	\N	\N	\N	909-923-9588	\N	\N	1000	60	3	\N	500	\N	\N	\N	0.24	\N	0.24	\N	CBS	https://www.sav-onbags.com/4-oz-Matte-Stand-Up-Pouch_p_126.html	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.576986
454	454	Container/Pouch	C	\N	\N	\N	909-923-9588	\N	\N	1000	60	3	\N	500	\N	\N	\N	0.11	\N	0.11	\N	CBS	https://www.sav-onbags.com/1-oz-Stand-Up-Pouch_p_39.html	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.579484
455	455	Label	B	\N	\N	kkochanski@grace-imaging.com	419-874-2127	\N	\N	60	30	3	\N	500	\N	\N	\N	0.76	\N	0.76	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.58184
456	456	Label	C	\N	\N	kkochanski@grace-imaging.com	419-874-2127	\N	\N	60	30	3	\N	500	\N	\N	\N	0.65	\N	0.65	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.583833
457	457	Label	C	\N	\N	kkochanski@grace-imaging.com	419-874-2127	\N	\N	60	30	3	\N	500	\N	\N	\N	0.18	\N	0.18	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.585917
458	458	Label	B	\N	\N	kkochanski@grace-imaging.com	419-874-2127	\N	\N	120	60	3	\N	2000	\N	\N	\N	0.3859	\N	0.3859	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.588428
459	459	Top Cover	\N	\N	\N	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	\N	3000	\N	\N	0.0044	0.1149	\N	0.1149	\N	NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.591393
460	460	Label	\N	\N	\N	Karola.Reyes@xymoprint.com	321-276-4984	\N	\N	60	30	3	\N	1000	\N	\N	\N	0.18	\N	0.18	\N	NET30 after Shipdate	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.593688
461	461	Turnkey FG	PLC-2024	\N	\N	kym.nadeau@divastuff.com	(386) 256-2521	\N	\N	60	30	3	\N	300	\N	\N	\N	2.58	\N	2.58	\N	50 DP / 50 NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.596174
462	462	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.26	\N	0.26	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.599224
463	463	Raw Material	\N	\N	\N	contact@wholesalesuppliesplus.com	800-359-0944	\N	\N	120	60	3	\N	1	\N	\N	\N	5.97	\N	13.134	\N	CBS	https://www.wholesalesuppliesplus.com/products/potassium-sorbate-granules.aspx	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.601817
464	464	Container/Pouch	PLC-2024	\N	\N	customersupport@sks-bottle.com	518-880-6980	\N	\N	120	60	3	\N	144	\N	\N	\N	0.82	\N	0.82	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.603892
465	465	Turnkey FG	B	\N	\N	kym.nadeau@divastuff.com	(386) 256-2521	\N	\N	120	60	3	\N	500	\N	\N	\N	2.55	\N	2.55	\N	50 DP / 50 NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.605773
466	466	Turnkey FG	\N	\N	\N	kym.nadeau@divastuff.com	(386) 256-2521	\N	\N	120	60	3	\N	500	\N	\N	\N	2.55	\N	2.55	\N	50 DP / 50 NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.607754
467	467	Turnkey FG	A	\N	\N	kym.nadeau@divastuff.com	(386) 256-2521	\N	\N	60	30	3	\N	\N	\N	\N	\N	5.7	\N	5.7	\N	50 DP / 50 NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.61237
468	468	Turnkey FG	B	\N	\N	kym.nadeau@divastuff.com	(386) 256-2521	\N	\N	60	30	3	\N	\N	\N	\N	\N	5.7	\N	5.7	\N	50 DP / 50 NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.615124
469	469	Turnkey FG	C	\N	\N	kym.nadeau@divastuff.com	(386) 256-2521	\N	\N	60	30	3	\N	\N	\N	\N	\N	5.5	\N	5.5	\N	50 DP / 50 NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.617133
470	470	Label	C	\N	\N	kkochanski@grace-imaging.com	419-874-2127	\N	\N	60	60	3	\N	500	\N	\N	\N	0.76	\N	0.76	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.620738
471	471	Label	C	\N	\N	kkochanski@grace-imaging.com	419-874-2127	\N	\N	60	60	3	\N	500	\N	\N	\N	0.65	\N	0.65	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.624522
472	472	Container/Pouch	\N	\N	\N	sam@yasonpack.cn	86 13925595106	\N	\N	60	30	3	1	10000	\N	\N	\N	0.24	\N	0.24	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.626482
473	473	Safety Shrink Band	\N	\N	\N	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	\N	50000	\N	\N	\N	0.058	\N	0.058	\N	NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.629141
474	474	Label	PLC-2024	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	60	3	\N	200	\N	\N	\N	0.2765	\N	0.2765	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.633153
475	475	Raw Material	PLC-2024	XIAMEN EQUATION CHEMICAL CO.,LTD	No.268 Haijing Road,Xiamen China	zoe.chen@equationchemical.com	86 592 6515854	\N	\N	60	60	3	\N	1	\N	\N	\N	371	\N	371	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.63662
476	476	Turnkey FG	A	\N	\N	kym.nadeau@divastuff.com	(386) 256-2521	\N	\N	120	60	3	\N	100	\N	\N	\N	4.86	\N	4.86	\N	50 DP / 50 NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.639897
477	477	Turnkey FG	\N	\N	\N	kym.nadeau@divastuff.com	(386) 256-2521	\N	\N	60	30	3	\N	300	\N	\N	\N	\N	\N	\N	\N	50 DP / 50 NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.642295
478	478	Turnkey FG	PLC-2024	\N	\N	kym.nadeau@divastuff.com	(386) 256-2521	\N	\N	60	30	3	\N	300	\N	\N	\N	2.18	\N	2.18	\N	50 DP / 50 NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.647249
479	479	Turnkey FG	\N	\N	\N	kym.nadeau@divastuff.com	(386) 256-2521	\N	\N	60	30	3	\N	300	\N	\N	\N	2.18	\N	2.18	\N	50 DP / 50 NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.649787
480	480	Turnkey FG	\N	\N	\N	kym.nadeau@divastuff.com	(386) 256-2521	\N	\N	120	60	3	\N	100	\N	\N	\N	6.02	\N	6.02	\N	50 DP / 50 NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.652399
481	481	Turnkey FG	\N	\N	\N	kym.nadeau@divastuff.com	(386) 256-2521	\N	\N	120	60	3	\N	100	\N	\N	\N	3.67	\N	3.67	\N	50 DP / 50 NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.654173
482	482	Container/Pouch	B	\N	\N	\N	909-923-9588	\N	\N	60	30	3	1	1000	\N	\N	\N	0.11	\N	0.11	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.656163
483	483	Turnkey FG	PLC-2024	\N	\N	kym.nadeau@divastuff.com	(386) 256-2521	\N	\N	120	60	3	\N	100	\N	\N	\N	3.3	\N	3.3	\N	50 DP / 50 NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.658577
484	484	Raw Material	PLC-2024	Nature's Flavor	833 N. Elm St Orange, CA 92867	andrew.herrera@naturesflavors.com	714-744-3700	\N	\N	60	60	3	\N	1	\N	\N	2.234	47.534	\N	104.5748	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.666803
485	485	Raw Material	PLC-2024	Ultra Pure, LLC	50 Old Kings HWY North Darien, CT 06820	tanya@ultrapure-usa.com	203.662.9761 x 307	\N	\N	60	60	3	\N	5	\N	\N	18	97.99	\N	25.8862	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.669466
486	486	Label	\N	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	60	3	\N	500	\N	\N	\N	0.28	\N	0.28	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.671685
487	487	Label	\N	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	60	3	\N	500	\N	\N	\N	0.28	\N	0.28	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.676424
488	488	Label	PLC-2024	\N	\N	kkochanski@grace-imaging.com	419-874-2127	\N	\N	120	60	3	\N	1000	\N	\N	\N	0.59	\N	0.59	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.679716
489	489	Label	PLC-2024	\N	\N	kkochanski@grace-imaging.com	419-874-2127	\N	\N	120	60	3	\N	1000	\N	\N	\N	0.76	\N	0.76	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.682714
490	490	Label	PLC-2024	\N	\N	kkochanski@grace-imaging.com	419-874-2127	\N	\N	120	60	3	\N	1000	\N	\N	\N	0.89	\N	0.89	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.688683
491	491	Label	PLC-2024	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	120	60	3	\N	1000	\N	\N	\N	0.3302	\N	0.3302	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.691271
492	492	Label	PLC-2024	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	120	60	3	\N	1000	\N	\N	\N	0.19	\N	0.19	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.693288
493	493	Raw Material	PLC-2024	QINGDAO NUTRAORIGEN PHARMACHEM CO.,LTD	NO.18 HELING ROAD, 1502 UNIT 2, QINGDAO, SHANDONG, 266100 CHINA	daniel@nutraorigen.com	\N	\N	\N	90	90	3	\N	1	\N	\N	\N	25	\N	25	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.695761
494	494	Turnkey FG	C	\N	\N	kym.nadeau@divastuff.com	(386) 256-2521	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	50 DP / 50 NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.69824
495	495	Turnkey FG	\N	\N	\N	kym.nadeau@divastuff.com	(386) 256-2521	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	50 DP / 50 NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.700625
496	496	Label	PLC-2024	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	120	60	3	\N	1000	\N	\N	\N	0.1725	\N	0.1725	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.70277
497	497	Label	PLC-2024	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	120	60	3	\N	1000	\N	\N	\N	0.19	\N	0.19	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.705538
498	498	Label	PLC-2024	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	120	60	3	\N	1000	\N	\N	\N	0.19	\N	0.19	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.709162
499	499	Label	PLC-2024	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	120	60	3	\N	1000	\N	\N	\N	0.23	\N	0.23	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.712725
500	500	Label	PLC-2024	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	120	60	3	\N	1000	\N	\N	\N	0.19	\N	0.19	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 17:29:47.715467
\.


--
-- Data for Name: boms; Type: TABLE DATA; Schema: public; Owner: derrek
--

COPY public.boms (id, bom_id, component_type, phx_class, supplier_manufacturer, address, email, contact_number, supplier_mfg_lt, transit_lt, amz_safety_days, wh_safety_days, po_issue_days, master_pack, moq, ordering_uom, unit_price, shipping_cost, landed_cost, conversion, converted_unit_price, ims_unit, supplier_payment_terms, product_link, supplier_product_id, description, remarks, alternative_supplier_1, alternative_supplier_2, monthly_usage, monthly_spend, total_lt_bom_master, comments, version, created_at, updated_at) FROM stdin;
1	CLEARECOBAG-4X5	Packaging	\N	EcoEnclose	280 S Taylor Ave, Ste. 200 Louisville, CO 80027	jeremy@ecoenclose.com	888-445-6575 ext. 004	\N	\N	60	30	3	1	2000	\N	\N	0.0214	0.0694	\N	0.0694	\N	NET30	x	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
2	JAR-48-400-1/2oz-Double-Wall-White-Covalence	CM Packaging-Container	C	General Bottle Supply	1845 Daly Street Los Angeles, CA 90031	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	\N	3	1	10000	\N	\N	\N	0.19	\N	0.19	\N	NET45	https://www.containerandpackaging.com/products/double-wall-straight-base-jar/J007	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
3	LID-48-400-Cap-F217-Liner-White-Covalence	CM Packaging-Top	C	General Bottle Supply	1845 Daly Street Los Angeles, CA 90031	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	\N	3	1	10000	\N	\N	\N	0.082	\N	0.082	\N	NET45	https://www.containerandpackaging.com/products/continuous-thread-polypropylene-lid/L208A	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
4	LABL-TA-5.8x0.625-Cystic-Acne-Spot-0.5oz-Covalence	CM Packaging-Label	C	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	\N	3	1	500	\N	\N	\N	0.04	\N	0.04	\N	CBS	x	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
5	LABL-AY-5.8x0.625-Cystic-Acne-Spot-0.5oz-Covalence	CM Packaging-Label	B	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	\N	3	1	500	\N	\N	0.0045	0.0695	\N	0.0695	\N	CBS	x	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
6	LID-48-400-Cap-F217-Liner-White-0.5oz-PLSF	CM Packaging-Top	B	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	\N	3	1	3500	\N	\N	0.0406	0.1231	\N	0.1231	\N	NET45	https://www.containerandpackaging.com/products/continuous-thread-polypropylene-lid/L208A	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
7	BOX-TA-Cystic-Spot-Covalence	CM Packaging-Box	C	XYMO Print	6800 Kingspointe Pkwy, Orlando, FL 32819, US	Karola.Reyes@xymoprint.com	321-276-4984	\N	\N	60	\N	3	1	10000	\N	\N	0.0066	0.2916	\N	0.2916	\N	NET30 after Shipdate	x	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
8	BOX-AY-Cystic-Spot-Covalence	CM Packaging-Box	B	XYMO Print	6800 Kingspointe Pkwy, Orlando, FL 32819, US	Karola.Reyes@xymoprint.com	321-276-4984	\N	\N	60	\N	3	1	10000	\N	\N	0.0066	0.2916	\N	0.2916	\N	NET30 after Shipdate	x	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
9	WL-Invisible-Spot-Treatment-PLSF	White Label	B	PLSF	150 Douglas Ave Dunedin, FL 34698	orders@privatelabel.net	17274661703	\N	\N	60	30	3	1	5000	\N	\N	\N	2.49	\N	2.49	\N	Due Upon Reciept	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
10	RM-PWD-Black-Tea-Extract	Raw Material	A	Passiono	606, No. 1818 Huangxing Road, Shanghai, China	info@adallen-nutrition.com	86 731 88988 198/118	\N	\N	60	30	3	1	20	\N	\N	\N	9	\N	9	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
11	LABL-TA-6.125X0.5625-Invis-Spot-Side	Label	B	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.0333	\N	0.0333	\N	CBS	x	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
12	LABL-11.3125x1.625-Crepey-Skin-Cream-Side	Label	A	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.125	\N	0.125	\N	CBS	x	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
13	JAR-Inv-Spot-48-400-1/2oz-Double-Wall-White-PLSF	White Label	B	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	3500	\N	\N	0.0406	0.2586	\N	0.2586	\N	NET45	https://www.containerandpackaging.com/products/double-wall-straight-base-jar/J007	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
14	RM-PWD-Organic-Monk-Fruit-Extract-10%	Raw Material	A	Haigen	No.3 Taoyuan Road,Taiwan Industry Park,QuFu 273100,China	haigen.stevia@foxmail.com	(+86)18253296328	\N	\N	60	30	3	25	200	\N	\N	0.6481	57.6481	\N	57.6481	\N	NET90	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
15	Safetry-Shrink-M175-57x36	Safety Shrink Band	\N	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	1000	\N	\N	\N	0.0142	\N	0.0142	\N	NET45	https://www.containerandpackaging.com/products/shrink-band-or-bag-or-sleeve/M175	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
16	Safetry-Shrink-Dome-Trigger Spray/Pump Spray 8oz	Safety Shrink Band	\N	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	10000	\N	\N	\N	0.11	\N	0.11	\N	NET45	x	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
17	Scoop-.625cc	Scoop	A	National Measure	7920 215th St. W.  Lakeville, MN 55044	CustomerService1@nationalpolymersllc.com	800-328-4577	\N	\N	60	30	3	1	4500	\N	\N	\N	0.079	\N	0.079	\N	CBS	https://www.nationalmeasures.com/products/0-625-cc-scoop/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
18	Safetry-Shrink-Dome-8oz-Bottle	Safety Shrink Band	\N	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	10000	\N	\N	\N	0.11	\N	0.11	\N	NET45	x	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
19	BTL-24-410-Cylinder-Round-8oz-White	Container/Pouch	A	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	100	4100	\N	\N	\N	0.0885	\N	0.0885	\N	NET45	https://www.containerandpackaging.com/products/pe-cylinder-round/B302	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
20	LABL-NS-6x5-Liquid-Stevia-US-8oz	Label	A	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1000	500	\N	\N	\N	0.19	\N	0.19	\N	CBS	x	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
21	RM-Clary-Sage-Essential-Oil	Raw Material	A	Lebermuth	\N	cbader@lebermuth.com	.800.648.1123	\N	\N	60	30	3	10	1	\N	\N	3.35	81.27	\N	178.794	\N	NET30	https://www.bulkapothecary.com/clary-sage-essential-oil/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
22	RM-Cashmere-Pear-Fragrance-Oil	Raw Material	A	Wholesale Supplies Plus	7820 E Pleasant Valley Road Independence, Ohio 44131	contact@wholesalesuppliesplus.com	800-359-0944	\N	\N	60	30	3	16	16	\N	\N	\N	2.42	\N	81.8299	\N	CBS	https://www.wholesalesuppliesplus.com/products/cashmere-and-pear-fragrance-oil.aspx	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
23	RM-Euxyl-PE-9010	Raw Material	C	Lotion Crafter	48 Hope Ln Eastsound, Washington 98245	support@lotioncrafter.com	\N	\N	\N	60	30	3	1	9	\N	\N	2.5	18.15	\N	39.93	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
24	WL-Cucumber-Body-Lotion-8oz-PLSF	White Label	\N	PLSF	150 Douglas Ave Dunedin, FL 34698	orders@privatelabel.net	17274661703	\N	\N	60	30	3	1	500	\N	\N	\N	6.75	\N	6.75	\N	Due Upon Reciept	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
25	WL-Cucumber-Body-Lotion-8oz-Shay	White Label	A	\N	\N	pam@shaylabs.com	(800) 358-6155	\N	\N	60	30	3	1	500	\N	\N	\N	2.98	\N	2.98	\N	50 DP/50 NET60	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
26	WL-Cystic-Spot-0.5oz-PLSF	White Label	\N	PLSF	150 Douglas Ave Dunedin, FL 34698	orders@privatelabel.net	17274661703	\N	\N	60	30	3	1	500	\N	\N	\N	2.11	\N	2.11	\N	Due Upon Reciept	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
27	WL-Acne-Patches	White Label	B	Hebei Houde Hanfang Medical	RM1603 Jinhe Intl Business Building A, NO.42 Huan WestRd,Zhengding County Shijiazhuang City CN-13 Hebei 050899 CN	\N	\N	\N	\N	60	30	3	1	10000	\N	\N	0.0405	0.2905	\N	0.2905	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
28	LABL-AY-6.125x0.5625-Warrior-1-Spot-Jar	Label	B	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.1531	\N	0.1531	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
29	LABL-AY-6.125x0.5625-Warrior-1-Spot-Jar-PLSF	Label	\N	Wizard Labels	29136 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.34	\N	0.34	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
195	INSRT-TA-Cystic-Spot	Insert	\N	\N	\N	\N	\N	\N	\N	60	30	3	1	500	\N	\N	\N	0.0237	\N	0.0237	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
30	LABL-AY-6.125x0.5625-Warrior-2-Spot-Jar	Label	B	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.1085	\N	0.1085	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
31	PCH-4oz-NAT-Monkfruit-Preprinted	Container/Pouch	\N	Yason Pack	No. 22 Huacui 1st Lane, Qiaotou Town, Dongguan City, Guangdong Province, China	sam@yasonpack.cn	86 13925595106	\N	\N	60	60	3	1	5000	\N	\N	0.04	0.2	\N	0.2	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
32	PCH-4oz-PS-Monkfruit-Preprinted	Container/Pouch	\N	Yason Pack	No. 22 Huacui 1st Lane, Qiaotou Town, Dongguan City, Guangdong Province, China	sam@yasonpack.cn	86 13925595106	\N	\N	60	60	3	1	5000	\N	\N	0.04	0.2	\N	0.2	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
33	LABL-TA-Pillow-Spray	Label	A	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.18	\N	0.18	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
34	LABL-TA-Face-Cream-Side-2oz	Label	A	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.0963	\N	0.0963	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
35	JAR-89-400-8oz-Straight-Base-White-HS	CM Packaging-Container	A	TRICORBRAUN	14802 NW 107th Ave., Ste 8 Hialeah, FL 33018 USA	gino@ferragamopackaging.com	530.304.5711	\N	\N	60	\N	3	1	7350	\N	\N	\N	0.45	\N	0.45	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
36	LID-89-400-Cap-F217-Liner-White-HS	CM Packaging-Top	A	Ferragamo Packaging	2925 Spafford Street, Suite D | Davis, CA 95618	gino@ferragamopackaging.com	530.304.5711	\N	\N	60	\N	3	1	10000	\N	\N	\N	0.2	\N	0.2	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
37	RM-PWD-Stevia-SG95RA60	Raw Material	\N	Haigen	No.3 Taoyuan Road,Taiwan Industry Park,QuFu 273100,China	summer@phyhuir.com	86-731-8468 6909	\N	\N	60	30	3	1	20	\N	\N	\N	44	\N	44	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
38	PCH-4oz-PS-Stevia-Preprinted	Container/Pouch	\N	Yason Pack	No. 22 Huacui 1st Lane, Qiaotou Town, Dongguan City, Guangdong Province, China	sam@yasonpack.cn	86 13925595106	\N	\N	60	60	3	1	5000	\N	\N	0.04	0.2	\N	0.2	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
39	LABL-TA-5.75X4.75-Acne-Eliminating-Body-Spray-8oz	Label	B	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.23	\N	0.23	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
40	LABL-TA-Cucumber-Lotion-8oz	Label	A	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.26	\N	0.26	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
41	LABL-AY-Celestial-Body-Acne-Body-Lotion-8oz	Label	C	Wizard Labels	29136 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.37	\N	0.37	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
42	LABL-TA-Acne-Eliminating-Face-Cleanser-8oz-HS	CM Packaging-Label	A	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	\N	3	1	500	\N	\N	\N	0.15	\N	0.15	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
43	TA-Acne-Eliminating-Face-Cleanser	Turnkey FG	\N	Health Specialty	8339 Allport Ave Santa Fe Springs, CA 90670 USA	christina@healthspecialty.com	562-273-0348	\N	\N	60	30	3	1	2120	\N	\N	\N	2.3	\N	2.3	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
44	TA-Cystic-Acne-Spot-Treatment-NEW-Covalence	Turnkey FG	C	Covalence	460 S Benson Lane STE 3 Chandler, AZ 85224	ehalula@covalence.com	480 897 0547	\N	\N	60	30	3	1	11200	\N	\N	\N	1.31	\N	1.31	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
45	AY-Cystic-Acne-Spot-Treatment-NEW-Covalence	Turnkey FG	B	Covalence	460 S Benson Lane STE 3 Chandler, AZ 85224	ehalula@covalence.com	480 897 0547	\N	\N	60	30	3	1	11200	\N	\N	\N	1.31	\N	1.31	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
46	LABL-TA-3.75x4.75-Sleep-Spray-4oz	Label	C	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.36	\N	0.36	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
47	LABL-TA-3.75x4.75-Shower-Spray-4oz	Label	C	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.52	\N	0.52	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
48	BTL-4oz-Cosmo-White-24-410-HS	CM Packaging-Container	\N	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	\N	3	100	3600	\N	\N	0.0586	0.2986	\N	0.2986	\N	NET45	https://www.containerandpackaging.com/products/pet-imperial-bullet-cosmo/B344WH	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
49	LABL-TA-3.75x4.75-Room-Spray-4oz	Label	C	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.31	\N	0.31	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
50	LABL-TA-Acne-Eliminating-Face-Cleanser-3.4oz-HS	CM Packaging-Label	\N	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	\N	3	1	500	\N	\N	\N	0.15	\N	0.15	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
51	WL-Scar-Cream-2oz-PLSF	White Label	C	PLSF	150 Douglas Ave Dunedin, FL 34698	orders@privatelabel.net	17274661703	\N	\N	60	30	3	1	5500	\N	\N	0.1565	3.1565	\N	3.1565	\N	Due Upon Reciept	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
52	WL-Scar-Cream-2oz-Shay	White Label	C	Shay Labs	2200 Tech Court, Woodstock, IL 60098	pam@shaylabs.com	(800) 358-6155	\N	\N	60	30	3	1	3000	\N	\N	\N	1.64	\N	1.64	\N	50 DP/50 NET60	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
53	TA-Crepey-Skin-Repair-Treatment-8oz-Shay	White Label	\N	\N	\N	pam@shaylabs.com	(800) 358-6155	\N	\N	60	30	3	1	5627	\N	\N	\N	2.2	\N	2.2	\N	50 DP/50 NET60	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
54	LABL-TA-3.75x4.75-Yoga-Mat-Spray-4oz	Label	B	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.41	\N	0.41	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
55	PCH-4oz-PS-Stndup-Matt	Container/Pouch	\N	Yason Pack	No. 22 Huacui 1st Lane, Qiaotou Town, Dongguan City, Guangdong Province, China	sam@yasonpack.cn	86 13925595106	\N	\N	60	30	3	1	10000	\N	\N	0.066	0.165	\N	0.165	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
56	WL-Four-In-One-4oz-PLSF	White Label	B	PLSF	150 Douglas Ave Dunedin, FL 34698	orders@privatelabel.net	17274661703	\N	\N	60	30	3	1	2500	\N	\N	\N	4.05	\N	4.05	\N	Due Upon Reciept	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
57	Label AY-Here-Comes-The-Sun-Room-Spray 4oz	Label	C	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.3	\N	0.3	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
58	M1005CL-Dome-Shrink-Band 77X185	Safety Shrink Band	\N	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	10000	\N	\N	0.0048	0.0932	\N	0.0932	\N	NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
59	WL-Body-Wash-8oz-PLSF	White Label	\N	PLSF	150 Douglas Ave Dunedin, FL 34698	orders@privatelabel.net	17274661703	\N	\N	60	30	3	1	1500	\N	\N	\N	5	\N	5	\N	Due Upon Reciept	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
60	WL-Body-Wash-8oz-Shay	White Label	B	Shay Labs	1065 Lake Avenue, Suite 3 Woodstock, IL 60098	pam@shaylabs.com	(800) 358-6155	\N	\N	60	30	3	1	10000	\N	\N	0.3051	3.2651	\N	3.2651	\N	50 DP/50 NET60	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
61	LABL-TA-5.75x4.75-Acne-Exfo-Body-Wash-8oz	Label	B	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.24	\N	0.24	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
196	INSRT-TA-Invisible-Spot	Insert	\N	\N	\N	\N	\N	\N	\N	60	30	3	1	500	\N	\N	\N	0.021	\N	0.021	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
62	TA-Acne-Eliminating-Face-Cleanser-3.4oz-HS	Turnkey FG	\N	Health Specialty	8339 Allport Ave Santa Fe Springs, CA 90670 USA	christina@healthspecialty.com	562-273-0348	\N	\N	60	30	3	1	3000	\N	\N	\N	1.7	\N	1.7	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
63	LABL-TA-3.5x4.75-Alc-Free-Pillow-Spray-4oz	Label	\N	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.17	\N	0.17	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
64	LABL-AY-Scars-No-More-Side	Label	B	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.21	\N	0.21	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
65	PCH-8oz-PS-Stndup-Matt	Container/Pouch	C	Sav on Bags	789 E Cedar St, Ontario, CA 91761	\N	909-923-9588	\N	\N	60	30	3	1	6000	\N	\N	0.0709	0.2326	\N	0.2326	\N	CBS	https://www.sav-onbags.com/8-oz-Matte-Stand-Up-Pouch_p_128.html	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
66	LABL-TA-8.79x1.58-Four-In-One-Acne-Treatment-4oz	Label	B	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.133	\N	0.133	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
67	LABL-TA-1.25x7.125-Scar-Cream-Side-Shay	Label	PLC-2024	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.13	\N	0.13	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
68	LABL-TA-1.25x7.125-Scar-Cream-Side-PLSF	Label	C	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.12	\N	0.12	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
69	PCH-4oz-NAT-Stevia-Preprinted	Container/Pouch	\N	Yason Pack	No. 22 Huacui 1st Lane, Qiaotou Town, Dongguan City, Guangdong Province, China	sam@yasonpack.cn	86 13925595106	\N	\N	60	60	3	1	5000	\N	\N	0.04	0.2	\N	0.2	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
70	LABL-TA-5.93x2.37-Acne-Face-Spray-4oz	Label	B	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.2223	\N	0.2223	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
71	PCH-24oz-PS-Stndup-Matt	Container/Pouch	\N	PBFY	2980 Enterprise St., Brea CA 92821	\N	909-923-9588	\N	\N	60	30	3	1	100	\N	\N	\N	0.46	\N	0.46	\N	CBS	https://www.sav-onbags.com/2-lb-Stand-Up-Pouch_p_91.html	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
72	LABL-AY-Clear-Sleep-Pillow-Mist-4oz	Label	\N	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.27	\N	0.27	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
73	PCH-2oz-PS-Stndup-Matt	Container/Pouch	C	Yason Pack	No. 22 Huacui 1st Lane, Qiaotou Town, Dongguan City, Guangdong Province, China	sam@yasonpack.cn	86 13925595106	\N	\N	60	30	3	1	10000	\N	\N	\N	0.24	\N	0.24	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
74	Label-AY-Namaste-In-Bed-Sleep-Spray-8oz	Label	C	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.434	\N	0.434	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
75	CLEARECOBAG-10.5X14	Eco Bags	\N	EcoEnclose	280 S Taylor Ave, Ste. 200 Louisville, CO 80027	jeremy@ecoenclose.com	888-445-6575 ext. 004	\N	\N	60	30	3	1	10000	\N	\N	\N	0.08	\N	0.08	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
76	LABL-AY-Charcoal-To-Sparkle-Acne-Wash-3.4oz-HS	CM Packaging-Label	C	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	\N	3	1	500	\N	\N	\N	0.22	\N	0.22	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
77	AY-Charcoal-To-Sparkle-Acne-Wash-3.4oz-HS	Turnkey FG	C	Health Specialty	8339 Allport Ave Santa Fe Springs, CA 90670 USA	christina@healthspecialty.com	562-273-0348	\N	\N	60	30	3	1	500	\N	\N	\N	1.7	\N	1.7	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
78	RM-PWD-AscorbicAcid	Raw Material	\N	Nutravative	601 Century Parkway, Suite 200 Allen, TX 7503	marvin@nutravative.com	469-361-3361	\N	\N	60	30	3	1	300	\N	\N	\N	7.5	\N	7.5	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
79	M139CL-Safety-Shrink-Band-75x28mm	Safety Shrink Band	\N	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	1000	\N	\N	\N	0.05	\N	0.05	\N	NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
80	BTL-2oz-Cosmo-White-20-410	Container/Pouch	C	Guangzhou Sunri Pack Material Co., Ltd	A315, 1489 Fanghua Rd, Renhe Town, Baiyun District, Guangzhou510470	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	10000	\N	\N	0.0127	0.1787	\N	0.1787	\N	NET45	https://www.containerandpackaging.com/products/pet-imperial-bullet-cosmo/B379W	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
81	TA-Pimple-Tool-Kit	Raw Material	C	Cona Industrial	No. 6-2, Middle Road, Mayan Airport Industrial Estate, Jiangcheng District, Yangjiang, Guangdong, China	\N	\N	\N	\N	60	30	3	1	1000	\N	\N	0.315	1.705	\N	1.705	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
82	LABL-NS-6x5-Monk-Fruit-Liquid-Stevia-US-8oz	Label	B	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.1863	\N	0.1863	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
83	LABL-5.75X5.25-Linen-Spray-Lav-Wrap	Label	B	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.33	\N	0.33	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
84	LABL-AY-7.125x3-Bootylicious-8oz	Label	B	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.27	\N	0.27	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
85	LABL-8.79x1.58-AY-Exfoliate-Bad-Vibes-Acne-Scrub-4oz	Label	C	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.23	\N	0.23	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
86	LABL-TA-3.75x4.75-Air-Freshener-4oz	Label	C	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	0.01	0.13	\N	0.13	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
87	LABL-TA-3.75x4.75-Shower-Spray-Xtra-Stre-4oz	Label	C	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.17	\N	0.17	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
88	SPRAY-MIST-20-410-White	Top Cover	\N	Jiangyin City Qingrun Plastic Co., Ltd.	Alibaba	Alibaba	Alibaba	\N	\N	60	30	3	1	100000	\N	\N	\N	0.06	\N	0.06	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
89	LABL-AY-Acne-Face-Spray-4oz	Label	\N	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.41	\N	0.41	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
90	LABL-TA-3.75x4.75-Toner-4oz	Label	B	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.3605	\N	0.3605	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
91	LABL-1.25x7.125-Breakout-Warrior-Acne-Cream-Side	Label	B	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.0855	\N	0.0855	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
92	LABL-5.3125X5.25-AY-Reverse-Warrior-Body-Spray-8oz	Label	C	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.43	\N	0.43	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
93	LABL-TA-Acne-Body-Spray	Label	\N	Wizard Labels	29136 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.24	\N	0.24	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
197	INSRT-TA-Puryfying	Insert	\N	\N	\N	\N	\N	\N	\N	60	30	3	1	500	\N	\N	\N	0.05	\N	0.05	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
94	Scoop-1.25cc	Scoop	C	National Measure	7920 215th St. W.  Lakeville, MN 55044	CustomerService1@nationalpolymersllc.com	800-328-4577	\N	\N	60	30	3	1	4500	\N	\N	0.0224	0.0924	\N	0.0924	\N	CBS	https://www.nationalmeasures.com/products/1-25-cc-scoop/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
95	LABL-AY-Charcoal-To-Sparkle-Acne-Wash-8oz-HS	CM Packaging-Label	C	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	\N	3	1	500	\N	\N	\N	0.15	\N	0.15	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
96	AY-Charcoal-To-Sparkle-Acne-Wash-8oz-HS	Turnkey FG	C	Health Specialty	8339 Allport Ave Santa Fe Springs, CA 90670 USA	christina@healthspecialty.com	562-273-0348	\N	\N	60	30	3	1	1000	\N	\N	\N	2.41	\N	2.41	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
97	TA-Hair-Growth-Spray-Bamboo-PLSF	Turnkey FG	\N	PLSF	150 Douglas Ave Dunedin, FL 34698	orders@privatelabel.net	17274661703	\N	\N	60	30	3	1	550	\N	\N	\N	6	\N	6	\N	Due Upon Reciept	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
98	WL-Four-In-One-8oz-PLSF	White Label	C	PLSF	150 Douglas Ave Dunedin, FL 34698	orders@privatelabel.net	17274661703	\N	\N	60	30	3	1	500	\N	\N	\N	6.59	\N	6.59	\N	Due Upon Reciept	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
99	TA-Oil-Free-Skin-Repair-Serum-PLSF	Turnkey FG	C	PLSF	150 Douglas Ave Dunedin, FL 34698	orders@privatelabel.net	17274661703	\N	\N	60	30	3	1	1000	\N	\N	\N	1.43	\N	1.43	\N	Due Upon Reciept	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
100	TA-Oil-Free-Skin-Repair-Serum-Shay	Turnkey FG	C	\N	\N	pam@shaylabs.com	(800) 358-6155	\N	\N	60	30	3	1	1000	\N	\N	0.1389	1.5689	\N	1.5689	\N	50 DP/50 NET60	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
101	TA-Hair-Growth-Spray-Lavender-PLSF	Turnkey FG	\N	PLSF	150 Douglas Ave Dunedin, FL 34698	orders@privatelabel.net	17274661703	\N	\N	60	30	3	1	700	\N	\N	\N	6	\N	6	\N	Due Upon Reciept	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
102	TA-Deep-Wrinkle-Serum-PLSF	Turnkey FG	C	PLSF	150 Douglas Ave Dunedin, FL 34698	orders@privatelabel.net	17274661703	\N	\N	60	30	3	1	500	\N	\N	\N	2.5	\N	2.5	\N	Due Upon Reciept	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
103	PCH-4oz-Stndup-WH-Matt	Container/Pouch	B	Sav on Bags	789 E Cedar St, Ontario, CA 91761	\N	909-923-9588	\N	\N	60	30	3	1	4000	\N	\N	\N	0.24	\N	0.24	\N	CBS	https://www.sav-onbags.com/4-oz-Matte-Stand-Up-Pouch_p_126.html	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
104	LABL-TA-Dermatitis-Side	Label	C	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.39	\N	0.39	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
105	LABL-Crepey-Skin-Microdermabrasion-Mask-Side	Label	\N	Wizard Labels	29136 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.387	\N	0.387	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
106	LABL-Crepey-Skin-Microdermabrasion-Mask-Top	Label	\N	Wizard Labels	29137 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.387	\N	0.387	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
107	RM-PWD-MyoInositol	Raw Material	C	Jiaherb	1 Chapin Road, Unit 1 Pine Brook NJ 07058	cd@jiaherbinc.com	714.209.7423	\N	\N	60	30	3	1	20	\N	\N	5.85	21.85	\N	21.85	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
108	LABL-AY-Wild-God-Toner-4oz	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.31	\N	0.31	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
109	LABL-10.5905x1.6418-TA-Four-In-One-Acne-Treatment-8oz	Label	C	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.3605	\N	0.3605	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
110	LABL-10.5905x1.6418-AY-Stardust-Sulfur-Scrub-8oz	Label	C	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.52	\N	0.52	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
111	RM-PWD-Tea-MatchGreen	Raw Material	C	Ikeda Tea World	18281 Gothard Street, Suite 109, Huntington Beach, CA 92648	nemo@ikedamatcha.com	714-907-4226	\N	\N	60	30	3	1	20	\N	\N	\N	35	\N	35	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
112	RM-PWD-L-Citrulline-Malate-2:1	Raw Material	C	Haigen	No.3 Taoyuan Road,Taiwan Industry Park,QuFu 273100,China	cheryl.zhang@jhdcorp.com	909-450-1735	\N	\N	60	30	3	25	20	\N	\N	1.175	11.475	\N	11.475	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
113	LABL-TA-Psoriasis-Side	Label	B	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.16	\N	0.16	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
114	LABL-AY-Crepe-Repair-Side	Label	A	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.125	\N	0.125	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
115	TA-Stem-Cell-Aloe-Vera-Gel-PLSF	Turnkey FG	\N	PLSF	150 Douglas Ave Dunedin, FL 34698	orders@privatelabel.net	17274661703	\N	\N	60	30	3	1	500	\N	\N	\N	4.5	\N	4.5	\N	Due Upon Reciept	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
116	Label AY-Here-Comes-The-Sun-Room-Spray 16oz	Label	\N	Wizard Labels	29135 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.65	\N	0.65	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
117	RM-PWD-Black-Tea-Extract-Iced	Raw Material	\N	Passiono	606, No. 1818 Huangxing Road, Shanghai, China	karen@passiono.com	86-21-5505-0973	\N	\N	60	30	3	1	100	\N	\N	\N	9.65	\N	9.65	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
118	Acne-Patches-UnLabeled	White Label	\N	Hebei Houde Hanfang Medical	RM1603 Jinhe Intl Business Building A, NO.42 Huan WestRd,Zhengding County Shijiazhuang City CN-13 Hebei 050899 CN	\N	\N	\N	\N	60	30	3	1	10000	\N	\N	\N	0.15	\N	0.15	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
119	TA-Stem-Cell-Eye-Serum-PLSF	Turnkey FG	\N	PLSF	150 Douglas Ave Dunedin, FL 34698	orders@privatelabel.net	17274661703	\N	\N	60	30	3	1	300	\N	\N	\N	7.5	\N	7.5	\N	Due Upon Reciept	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
120	RM-PWD-Pu-erh-Tea	Raw Material	C	Passiono	606, No. 1818 Huangxing Road, Shanghai, China	karen@passiono.com	86-21-5505-0973	\N	\N	60	30	3	1	40	\N	\N	\N	24	\N	24	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
121	BTL-250cc-white-B717WH	Container/Pouch	\N	Container and Packaging	\N	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	500	\N	\N	\N	0.2	\N	0.2	\N	NET45	https://www.containerandpackaging.com/products/hdpe-packer-bottle/B717WH	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
122	STCK-OL5400CK	Sticker	\N	\N	\N	\N	\N	\N	\N	60	30	3	1	500	\N	\N	\N	0.74	\N	0.74	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
123	RM-CAPS-IN-BTL-ACTIVESPORT	Raw Material	\N	\N	\N	\N	\N	\N	\N	60	30	3	1	500	\N	\N	\N	7.3	\N	7.3	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
124	CAP-White-L205WHP1	Top Cover	\N	\N	\N	\N	\N	\N	\N	60	30	3	1	500	\N	\N	\N	0.1	\N	0.1	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
125	TA-Retinol-Cream-PLSF	Turnkey FG	C	PLSF	150 Douglas Ave Dunedin, FL 34698	orders@privatelabel.net	17274661703	\N	\N	60	30	3	1	500	\N	\N	\N	3.5	\N	3.5	\N	Due Upon Reciept	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
126	TA-Hair-Growth-Stem-Cell-Conditioner-PLSF	Turnkey FG	\N	PLSF	150 Douglas Ave Dunedin, FL 34698	orders@privatelabel.net	17274661703	\N	\N	60	30	3	1	300	\N	\N	\N	5.75	\N	5.75	\N	Due Upon Reciept	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
127	Ayadara-Rose-Stem-Cell-Clay-Mask-8oz-PLSF	Turnkey FG	\N	PLSF	150 Douglas Ave Dunedin, FL 34698	orders@privatelabel.net	17274661703	\N	\N	60	30	3	1	125	\N	\N	\N	6	\N	6	\N	Due Upon Reciept	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
128	LABL-7.5X3-Golf120-WH-HiGL	Label	\N	\N	\N	\N	\N	\N	\N	60	30	3	1	500	\N	\N	\N	0.24	\N	0.24	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
129	Ayadara-Rose-Stem-Cell-Scrub-8oz-PLSF	Turnkey FG	\N	PLSF	150 Douglas Ave Dunedin, FL 34698	orders@privatelabel.net	17274661703	\N	\N	60	30	3	1	500	\N	\N	\N	5	\N	5	\N	Due Upon Reciept	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
130	RM-PWD-BetaAlanine	Raw Material	C	Nutravative	601 Century Parkway, Suite 200 Allen, TX 7503	marvin@nutravative.com	469-361-3361	\N	\N	60	30	3	1	25	\N	\N	2.5	7.3	\N	7.3	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
131	RM-PWD-GREEN-TEA-YELLOW-TEA	Raw Material	\N	PLSF	150 Douglas Ave Dunedin, FL 34698	minglunteas@126.com	86-18153301417	\N	\N	60	30	3	1	20	\N	\N	2	8.97	\N	8.97	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
132	PCH-8oz-Stndup-WH-Matt	Container/Pouch	B	Sav on Bags	789 E Cedar St, Ontario, CA 91761	\N	909-923-9588	\N	\N	60	30	3	1	1000	\N	\N	\N	0.23	\N	0.23	\N	CBS	https://www.sav-onbags.com/8-oz-Matte-Stand-Up-Pouch_p_128.html	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
133	RM-PWD-Stevia-Monk-Fruit-Stevia-Blend	Raw Material	C	Haigen	No.3 Taoyuan Road,Taiwan Industry Park,QuFu 273100,China	haigen.stevia@foxmail.com	(+86)18253296328	\N	\N	60	30	3	25	20	\N	\N	\N	16	\N	16	\N	NET90	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
134	TA-Exfoliating-Stem-Cell-Facial-Cleanser-PLSF	Turnkey FG	\N	PLSF	150 Douglas Ave Dunedin, FL 34698	orders@privatelabel.net	17274661703	\N	\N	60	30	3	1	500	\N	\N	\N	5	\N	5	\N	Due Upon Reciept	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
135	RM-PWD-Shilajith	Raw Material	A	Xian Yuhui	RM 20202 7th Bldg Xujingchongshengyuan,fengcheng 12th road, Economic and Technical Development Zone, Xi’an, China	cheryl.zhang@jhdcorp.com	909-450-1735	\N	\N	60	30	3	1	25	\N	\N	\N	29.6	\N	29.6	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
136	AY-Rose-Shine-Stem-Cell-Peptide-Cream-PLSF	Turnkey FG	\N	PLSF	150 Douglas Ave Dunedin, FL 34698	orders@privatelabel.net	17274661703	\N	\N	60	30	3	1	20	\N	\N	\N	7.5	\N	7.5	\N	Due Upon Reciept	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
137	RM-PWD-Spirulina-Organic	Raw Material	C	Stauber	4120 N Palm Street Fullerton, CA 92835	Stephanie.Aispuro@stauberusa.com	714-441-3631	\N	\N	60	30	3	1	25	\N	\N	\N	13.65	\N	13.65	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
138	RM-TEA-TREE-WATER	Raw Material	C	Organic Creations	307 NW Kerron St, Winlock, WA 98596	\N	360-869-7900	\N	\N	60	30	3	1	10	\N	\N	\N	25.25	\N	6.6703	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
139	RM-CLARY-SAGE-WATER	Raw Material	B	Organic Creations	307 NW Kerron St, Winlock, WA 98596	\N	360-869-7900	\N	\N	60	30	3	1	10	\N	\N	3.783	20.583	\N	5.4375	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
140	RM-ROSE-WATER	Raw Material	B	Organic Creations	307 NW Kerron St, Winlock, WA 98596	\N	360-869-7900	\N	\N	60	30	3	1	1	\N	\N	18.915	43.415	\N	11.469	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
141	Ayadara-Rose-Stem-Cell-Conditioner-8oz-PLSF	Turnkey FG	\N	PLSF	150 Douglas Ave Dunedin, FL 34698	orders@privatelabel.net	17274661703	\N	\N	60	30	3	1	100	\N	\N	\N	5.75	\N	5.75	\N	Due Upon Reciept	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
142	Ayadara-Rose-Stem-Cell-Exfoliating-Cleanser-PLSF	Turnkey FG	\N	PLSF	150 Douglas Ave Dunedin, FL 34698	orders@privatelabel.net	17274661703	\N	\N	60	30	3	1	500	\N	\N	\N	5	\N	5	\N	Due Upon Reciept	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
143	TA-Aloe-Vera-Gel-16oz-PLSF	Turnkey FG	\N	EVORA LABS	\N	\N	888-793-8450	\N	\N	60	30	3	1	2000	\N	\N	\N	4.88	\N	4.88	\N	75 DP / 25 NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
144	RM-TA-JASMINE-VANILLA-NAT-FRAGRANCE-OIL	Raw Material	C	Wholesale Supplies Plus	7820 E Pleasant Valley Road Independence, Ohio 44131	contact@wholesalesuppliesplus.com	800-359-0944	\N	\N	60	30	3	4	10	\N	\N	\N	6.67	\N	14.674	\N	CBS	https://www.wholesalesuppliesplus.com/products/vanilla-fragrance-oil.aspx	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
145	RM-Lemongrass-Essential-Oil	Raw Material	C	Organic Creations	307 NW Kerron St, Winlock, WA 98596	\N	360-869-7900	\N	\N	60	30	3	5	1	\N	\N	\N	23.15	\N	50.93	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
146	RM-SPEARMINT-WATER	Raw Material	B	Organic Creations	307 NW Kerron St, Winlock, WA 98596	\N	360-869-7900	\N	\N	60	30	3	1	1	\N	\N	7.6	32.1	\N	8.4799	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
147	RM-EUCALYPTUS-WATER	Raw Material	B	Organic Creations	307 NW Kerron St, Winlock, WA 98596	\N	360-869-7900	\N	\N	60	30	3	1	1	\N	\N	8.716	24.516	\N	6.4764	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
148	RM-LEMONGRASS-WATER	Raw Material	B	Organic Creations	307 NW Kerron St, Winlock, WA 98596	\N	360-869-7900	\N	\N	60	30	3	1	1	\N	\N	8.716	24.516	\N	6.4764	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
149	RM-PWD-DHM	Raw Material	A	Wuxi Cima	\N	jennifer@cimasci.com	86-0510-85188225-8005	\N	\N	60	30	3	1	20	\N	\N	\N	68.5	\N	68.5	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
150	Ayadara-Rose-Stem-Cell-Peptide-Toner-PLSF	Turnkey FG	\N	PLSF	150 Douglas Ave Dunedin, FL 34698	orders@privatelabel.net	17274661703	\N	\N	60	30	3	1	72	\N	\N	\N	4.7	\N	4.7	\N	Due Upon Reciept	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
151	RM-PWD-AlphaGPC	Raw Material	C	Haigen	No.3 Taoyuan Road,Taiwan Industry Park,QuFu 273100,China	haigen.stevia@foxmail.com	(+86)18253296328	\N	\N	60	30	3	25	25	\N	\N	\N	58	\N	58	\N	NET90	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
152	RM-PWD-ALCAR	Raw Material	C	PureAssay	14750 E. Nels on Ave. Suite A City of Industry, CA 91744	cheryl.zhang@jhdcorp.com	909-450-1735	\N	\N	60	30	3	1	25	\N	\N	\N	36.5	\N	36.5	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
153	Ayadara-Rose-Stem-Cell-Peptide-Eye-Serum-PLSF	Turnkey FG	\N	PLSF	150 Douglas Ave Dunedin, FL 34698	orders@privatelabel.net	17274661703	\N	\N	60	30	3	1	100	\N	\N	\N	7.5	\N	7.5	\N	Due Upon Reciept	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
154	RM-PWD-Magnesium-Bisglycinate-Chelate	Raw Material	C	Balchem	Homosassa Springs, Florida 34447	rharnish@balchem.com	786.877.8692	\N	\N	60	30	3	1	20	\N	\N	1.9443	30.6343	\N	30.6343	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
155	RM-SODIUM-LACTATE	Raw Material	B	MYO	7820 E Pleasant Valley Road Independence, Ohio 44131	\N	800-359-0944	\N	\N	60	30	3	1	4	\N	\N	1.9275	5.1075	\N	11.2365	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
156	RM-PWD-Green-Coffee-Bean-Extract	Raw Material	B	Jiaherb	1 Chapin Road, Unit 1 Pine Brook NJ 07058	cd@jiaherbinc.com	714.209.7423	\N	\N	60	30	3	1	50	\N	\N	\N	30	\N	30	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
157	TA-Stem-Cell-Peptide-Clay-Face-Mask-PLSF	Turnkey FG	\N	PLSF	150 Douglas Ave Dunedin, FL 34698	orders@privatelabel.net	17274661703	\N	\N	60	30	3	1	336	\N	\N	\N	6	\N	6	\N	Due Upon Reciept	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
158	RM-PWD-Citicoline-Sodium	Raw Material	B	Haigen	No.3 Taoyuan Road,Taiwan Industry Park,QuFu 273100,China	haigen.stevia@foxmail.com	(+86)18253296328	\N	\N	60	30	3	1	10	\N	\N	\N	187	\N	187	\N	NET90	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
159	RM-Geranium-Egyptian-Essential-Oil	Raw Material	C	Lebermuth	4004 Technology Dr. South Bend, IN 46628	cbader@lebermuth.com	.800.648.1123	\N	\N	60	30	3	5	5	\N	\N	\N	72.6	\N	159.72	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
160	RM-Olive-Essential-Oil	Raw Material	C	Bramble Berry	\N	--	877-627-7883	\N	\N	60	30	3	5	1	\N	\N	\N	12.85	\N	28.27	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
161	RM-PWD-Cordyceps-Militaris-Organic	Raw Material	C	Stauber	4120 N Palm Street Fullerton, CA 92835	Stephanie.Aispuro@stauberusa.com	714-441-3631	\N	\N	60	30	3	1	20	\N	\N	\N	53	\N	53	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
162	RM-TA-LEMON-ESSENTIAL-OIL-TMP	Raw Material	C	Lebermuth	4004 Technology Dr. South Bend, IN 46628	cbader@lebermuth.com	.800.648.1123	\N	\N	60	30	3	5	25	\N	\N	\N	77.25	\N	169.95	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
163	RM-PWD-TongkatAli	Raw Material	\N	Naturalin Bio-Resources Co.,Ltd	\N	jamescao@naturalin.com	8613755074305	\N	\N	60	30	3	1	30	\N	\N	\N	52.5	\N	52.5	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
164	RM-PWD-Longjack-200:1	Raw Material	\N	Naturalin Bio-Resources Co.,Ltd	\N	jamescao@naturalin.com	8613755074305	\N	\N	60	30	3	1	30	\N	\N	\N	25	\N	25	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
198	INSRT-TA-RETINOL	Insert	\N	\N	\N	\N	\N	\N	\N	60	30	3	1	500	\N	\N	\N	0.02	\N	0.02	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
165	RM-Organic-Orange-Essential-Oil	Raw Material	C	Lebermuth	4004 Technology Dr. South Bend, IN 46628	cbader@lebermuth.com	.800.648.1123	\N	\N	60	30	3	5	5	\N	\N	\N	23.3	\N	51.26	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
166	RM-Chamomile-Blue-Essential-Oil	Raw Material	C	Lebermuth	4004 Technology Dr. South Bend, IN 46628	cbader@lebermuth.com	.800.648.1123	\N	\N	60	30	3	4	8	\N	\N	\N	49	\N	1656.886	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
167	RM-Grapefruit-Pink-Essential-Oil	Raw Material	C	Lebermuth	4004 Technology Dr. South Bend, IN 46628	cbader@lebermuth.com	.800.648.1123	\N	\N	60	30	3	1	5	\N	\N	\N	35.85	\N	78.87	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
168	RM-Bergamot-Italian-Essential-Oil	Raw Material	C	Lebermuth	4004 Technology Dr. South Bend, IN 46628	cbader@lebermuth.com	.800.648.1123	\N	\N	60	30	3	1	5	\N	\N	\N	77.25	\N	169.95	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
169	LABL-NS-Shrink-Sleeve-Liquid-Stevia-OG-US-2oz	Label	\N	Traco Packaging	620 South 1325 West Orem, UT  84058	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.16	\N	0.16	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
170	LABL-NS-Shrink-Sleeve-Liquid-Stevia-Toffee-US-2oz	Label	C	Traco Packaging	620 South 1325 West Orem, UT  84058	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.16	\N	0.16	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
171	LABL-NS-Shrink-Sleeve-Liquid-Stevia-Chocolate-US-2oz	Label	\N	Traco Packaging	620 South 1325 West Orem, UT  84058	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.16	\N	0.16	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
172	LABL-NS-Shrink-Sleeve-Liquid-Stevia-Vanilla-US-2oz	Label	\N	Traco Packaging	620 South 1325 West Orem, UT  84058	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.16	\N	0.16	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
173	LABL-NS-Shrink-Sleeve-Liquid-Monk-Fruit-US-2oz	Label	\N	Traco Packaging	620 South 1325 West Orem, UT  84058	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.23	\N	0.23	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
174	RM-PWD-Stevia-Flavor-Caramel	Raw Material	C	\N	\N	Sales@bulkapothecary.com	888-728-7612	\N	\N	60	30	3	1	1	\N	\N	5.3	256.8	\N	67.8394	\N	CBS	https://www.bulkapothecary.com/lorann-oils-caramel-flavor-water-soluble/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
175	RM-PWD-Stevia-Flavor-Vanilla	Raw Material	\N	\N	\N	Sales@bulkapothecary.com	888-728-7612	\N	\N	60	30	3	1	1	\N	\N	5.3	256.8	\N	67.8394	\N	CBS	https://www.bulkapothecary.com/lorann-oils-vanilla-flavor/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
176	RM-PWD-Stevia-Flavor-Toffee	Raw Material	C	\N	\N	Sales@bulkapothecary.com	888-728-7612	\N	\N	60	30	3	1	1	\N	\N	5.3	256.8	\N	67.8394	\N	CBS	https://www.bulkapothecary.com/lorann-oils-english-toffee-flavor-water-soluble/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
177	Cap-20-410-Flat	Top Cover	C	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	500	\N	\N	\N	0.058	\N	0.058	\N	NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
178	BTL-16oz-Cosmo-White-20-410	Container/Pouch	\N	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	500	\N	\N	\N	0.084	\N	0.084	\N	NET45	https://www.containerandpackaging.com/products/pet-imperial-bullet-cosmo/B230WH	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
179	BTL-1oz-Amber-G069	Container/Pouch	\N	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	500	\N	\N	\N	0.11	\N	0.11	\N	NET45	https://www.containerandpackaging.com/products/glass-boston-round/G841AM	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
180	BTL-8oz-Cosmo-White-24-410-HS	Container/Pouch	A	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	100	500	\N	\N	0.0652	0.3978	\N	0.3978	\N	NET45	https://www.containerandpackaging.com/products/pet-imperial-bullet-cosmo/B318W	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
181	BTL-2oz-Oval-Teardrop-White-20-410	Container/Pouch	\N	TricorBraun	14802 NW 107th Ave., Ste 8 Hialeah, FL 33018 USA	aweston@tricorbraun.com	305-805-6207	\N	\N	60	30	3	1	10000	\N	\N	0.01	0.09	\N	0.09	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
182	BTL-4oz-Cosmo-White-20-410	Container/Pouch	B	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	100	500	\N	\N	\N	0.24	\N	0.24	\N	NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
183	BTL-8oz-Cosmo-White-24-410	Container/Pouch	C	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	100	500	\N	\N	\N	0.3	\N	0.3	\N	NET45	https://www.containerandpackaging.com/products/pet-imperial-bullet-cosmo/B318W	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
184	BTL-TA-2oz-B379AM	Container/Pouch	\N	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	500	\N	\N	\N	0.25	\N	0.25	\N	NET45	https://www.containerandpackaging.com/products/pet-imperial-bullet-cosmo/B379AM	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
185	BTL-TA-4oz-B345A	Container/Pouch	\N	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	500	\N	\N	\N	0.3	\N	0.3	\N	NET45	https://www.containerandpackaging.com/products/pet-imperial-bullet-cosmo/B345A	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
186	BTL-TA-8oz-B311AM	Container/Pouch	\N	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	500	\N	\N	\N	0.29	\N	0.29	\N	NET45	https://www.containerandpackaging.com/products/pet-imperial-bullet-cosmo/B311AM	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
187	CAP-20-410-Drip-Tip	Top Cover	\N	Zhejiang Santong Plastic	Shangqiu Industrial Zone,qinggang Town, Taizhou, Zhejiang, China	Alibaba	86-576-87141043	\N	\N	60	60	3	1	10000	\N	\N	\N	0.04	\N	0.04	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
188	CAP-24-410-Dispensing-Lid-White-L381WH	Top Cover	\N	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	500	\N	\N	0.0165	0.1438	\N	0.1438	\N	NET45	https://www.containerandpackaging.com/products/spouted-cap/L381WH	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
189	CAP-24-410-Drip-Tip	Top Cover	A	Zhejiang Santong Plastic	Shangqiu Industrial Zone,qinggang Town, Taizhou, Zhejiang, China	Alibaba	86-576-87141043	\N	\N	60	60	3	1	10000	\N	\N	\N	0.0365	\N	0.0365	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
190	CAP-24-410-Turret-Black	Top Cover	\N	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	500	\N	\N	\N	0.15	\N	0.15	\N	NET45	https://www.containerandpackaging.com/products/spouted-cap/L381	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
191	CAP-TA-2oz-Black-L071	Top Cover	\N	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	500	\N	\N	\N	0.07	\N	0.07	\N	NET45	https://www.containerandpackaging.com/products/phenolic-style-cap-and-pp-like-phenolic/L071	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
192	CLEARECOBAG-6X8	Eco Bags	\N	EcoEnclose	280 S Taylor Ave, Ste. 200 Louisville, CO 80027	jeremy@ecoenclose.com	888-445-6575 ext. 004	\N	\N	60	30	3	1	500	\N	\N	0.0052	0.0557	\N	0.0557	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
193	CLEARECOBAG-7.5X10	Eco Bags	\N	EcoEnclose	280 S Taylor Ave, Ste. 200 Louisville, CO 80027	jeremy@ecoenclose.com	888-445-6575 ext. 004	\N	\N	60	30	3	1	500	\N	\N	0.0126	0.0816	\N	0.0816	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
194	DRP-1oz-Black-M031	Top Cover	\N	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	500	\N	\N	\N	0.12	\N	0.12	\N	NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
199	LABL-PS-3.75x3-Standard	Label	C	Wizard Labels	29137 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.082	\N	0.082	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
200	LABL-BLANK-OL172CK	Label	\N	Wizard Labels	29138 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.07	\N	0.07	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
201	LABL-NS-6x5-Monk-Fruit-Liquid-US-8oz	Label	B	Wizard Labels	29139 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.31	\N	0.31	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
202	LABL-NS-Shrink-Sleeve-Liquid-Stevia-Caramel-US-2oz	Label	C	Traco Packaging	620 South 1325 West Orem, UT  84058	tbergstrom@tracopackaging.com	800-284-9727 ext. 259	\N	\N	60	30	3	1	500	\N	\N	\N	0.16	\N	0.16	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
203	LABL-PS-Shrink-Sleeve-Alcohol-Hand-Sanitizer-Spray-2oz	Label	\N	Wizard Labels	29141 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	0.1	0.18	\N	0.18	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
204	LABL-PS-Shrink-Sleeve-Alcohol-Tea-Tree-Purifying-Spray-2oz	Label	\N	Wizard Labels	29142 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	0.01	0.09	\N	0.09	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
205	LABL-TA-5.3125x5.25-Sleep-Spray-16oz	Label	C	Wizard Labels	29143 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.4043	\N	0.4043	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
206	LABL-TA-5.3x5.2-Sleep-Spray-Lavender-8oz	Label	C	Wizard Labels	29144 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.37	\N	0.37	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
207	LABL-TA-5.7x5.25-Face-Cleanser-8oz-Side	Label	\N	Wizard Labels	29145 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.24	\N	0.24	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
208	LABL-TA-8x2-Dermatitis-Cream-8oz	Label	\N	Wizard Labels	29146 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.24	\N	0.24	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
209	LABL-TA-8x2-Psoriasis-Cream-8oz	Label	\N	Wizard Labels	29147 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.24	\N	0.24	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
210	LABL-TA-Sunscreen	Label	\N	Wizard Labels	29148 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.24	\N	0.24	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
211	LABL-TH-PRINTED-BACK	Label	\N	Wizard Labels	29149 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.12	\N	0.12	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
212	LABL-TH-PRINTED-FRONT	Label	\N	Wizard Labels	29150 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.12	\N	0.12	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
213	LID-24-410-Disc-Top-White-HS	Top Cover	A	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	500	\N	\N	0.0079	0.0679	\N	0.0679	\N	NET45	https://www.containerandpackaging.com/products/disc-top-cap/L1368WH	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
214	LID-48-400-Cap-F217-Liner-White	Top Cover	\N	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	500	\N	\N	\N	0.1	\N	0.1	\N	NET45	https://www.containerandpackaging.com/products/continuous-thread-polypropylene-lid/L208A	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
215	LID-TA-4oz-L240B	Top Cover	\N	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	500	\N	\N	\N	0.17	\N	0.17	\N	NET45	https://www.containerandpackaging.com/products/continuous-thread-polypropylene-lid/L240B	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
216	LID-TA-4oz-L240B-TA-Eczema-Cream-Pre-Labeled	Top Cover	\N	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	500	\N	\N	\N	0.2455	\N	0.2455	\N	NET45	https://www.containerandpackaging.com/products/continuous-thread-polypropylene-lid/L240B	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
217	LID-TA-8oz-L475BKP1-sulfurmask-8Oz-Pre-Labeled	Top Cover	\N	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	500	\N	\N	\N	0.5549	\N	0.5549	\N	NET45	https://www.containerandpackaging.com/products/continuous-thread-polypropylene-lid/L475BKP1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
218	M1005CL-Dome-Shrink-Band 77X185-DIVASTUFF	Safety Shrink Band	\N	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	500	\N	\N	\N	0.06	\N	0.06	\N	NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
219	M1006CL-Dome-Shrink-Band 66X175	Safety Shrink Band	\N	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	500	\N	\N	0.0027	0.0912	\N	0.0912	\N	NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
220	M1108CL-Shrink-Band-152x51	Safety Shrink Band	\N	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	500	\N	\N	\N	0.03	\N	0.03	\N	NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
221	M1109CL-Safety-Shrink-Band-100x38mm	Safety Shrink Band	A	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	500	\N	\N	0.0023	0.0323	\N	0.0323	\N	NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
222	M1421CL-Dome-Shrink-Dome-90mmx220mm	Safety Shrink Band	\N	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	500	\N	\N	\N	0.114	\N	0.114	\N	NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
223	M172-Shrink-Band-118x70	Safety Shrink Band	B	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	500	\N	\N	\N	0.01	\N	0.01	\N	NET45	https://www.containerandpackaging.com/products/shrink-band-or-bag-or-sleeve/M172	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
224	M175-Shrink-Band-57x36	Safety Shrink Band	\N	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	500	\N	\N	\N	0.01	\N	0.01	\N	NET45	https://www.containerandpackaging.com/products/shrink-band-or-bag-or-sleeve/M175	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
225	M879CL-Dome-Shrink-Band 77X240	Safety Shrink Band	B	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	500	\N	\N	\N	0.1	\N	0.1	\N	NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
226	PCH-16oz-Stndup-WH-Matt	Container/Pouch	B	SavOn Bags	789 E Cedar St, Ontario, CA 91761	\N	909-923-9588	\N	\N	60	30	3	1	500	\N	\N	0.053	0.433	\N	0.433	\N	CBS	https://www.sav-onbags.com/16-oz-Matte-Stand-Up-Pouch_p_89.html	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
227	PCH-4oz-TH-New-Preprinted	Container/Pouch	\N	Yason Pack	No. 22 Huacui 1st Lane, Qiaotou Town, Dongguan City, Guangdong Province, China	sam@yasonpack.cn	86 13925595106	\N	\N	60	60	3	1	1	\N	\N	\N	0.15	\N	0.15	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
228	PCH-5oz-TH-New-Preprinted	Container/Pouch	B	\N	\N	sam@yasonpack.cn	86 13925595106	\N	\N	60	60	3	1	5000	\N	\N	0.0795	0.1895	\N	0.1895	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
229	placeholder-liquid-stevia Label	Label	\N	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	1	\N	\N	\N	0.25	\N	0.25	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
230	RM-TA-JASMINE-VANILLA-NAT-FRAGRANCE-OIL-TMP	Raw Material	\N	\N	\N	\N	\N	\N	\N	60	30	3	1	1	\N	\N	0.0372	6.2372	\N	13.7218	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
231	PS-Alpha-GPC-Capsules	Turnkey FG	\N	\N	\N	\N	\N	\N	\N	60	30	3	1	1	\N	\N	\N	5.75	\N	5.75	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
232	PUMP-DP744WH	Top Cover	\N	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	500	\N	\N	0.01	0.29	\N	0.29	\N	NET45	https://www.containerandpackaging.com/products/treatment-pump/DP744WH	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
233	PUMP-TA-4oz-DP601	Top Cover	\N	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	500	\N	\N	\N	0.4	\N	0.4	\N	NET45	https://www.containerandpackaging.com/products/treatment-pump/DP617BK	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
234	RM-Aloe-Vera-Juice	Raw Material	C	Walmart	\N	todd@conaloe.com	386-673-7566 ext. 107	\N	\N	60	30	3	1	1	\N	\N	\N	4.34	\N	1.1465	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
235	RM-Adv-Hand-Sanitizer-Gel-70%	Raw Material	\N	\N	\N	\N	\N	\N	\N	60	30	3	1	1	\N	\N	\N	0.1	\N	0.0264	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
236	RM-PURIFIED-WATER	Raw Material	C	Puritan Springs	1709 N. Kickapoo St. Lincoln, IL 62656	asmith@puritansprings.com	800-292-2992 Ext. 602	\N	\N	60	30	3	1	550	\N	\N	\N	1	\N	0.2642	\N	NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
237	RM-ISO-ALCOHOL-70	Raw Material	\N	\N	\N	\N	\N	\N	\N	60	30	3	1	1	\N	\N	\N	1.18	\N	2.596	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
238	RM-ISO-ALCOHOL-99	Raw Material	B	\N	\N	\N	\N	\N	\N	60	30	3	1	1	\N	\N	\N	0.3321	\N	0.7307	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
239	RM-Polysorbate-20	Raw Material	C	MYO	7820 E Pleasant Valley Road Independence, Ohio 44131	\N	800-359-0944	\N	\N	60	30	3	45	5	\N	\N	\N	6	\N	13.2	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
240	RM-PWD-AgmatineSulfate	Raw Material	C	\N	\N	cheryl.zhang@jhdcorp.com	909-450-1735	\N	\N	60	30	3	1	20	\N	\N	4.4778	31.4778	\N	31.4778	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
241	RM-PWD-BCAA	Raw Material	\N	\N	\N	\N	\N	\N	\N	60	30	3	1	1	\N	\N	\N	20	\N	20	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
242	RM-PWD-CitricAcid	Raw Material	\N	\N	\N	info@ewlnatural.com	(503) 893-1100	\N	\N	60	30	3	1	1	\N	\N	\N	9.72	\N	21.384	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
243	RM-PWD-L-Citrulline-Malate	Raw Material	\N	Haigen	No.3 Taoyuan Road,Taiwan Industry Park,QuFu 273100,China	haigen.stevia@foxmail.com	(+86)18253296328	\N	\N	60	30	3	1	20	\N	\N	\N	32.5	\N	32.5	\N	NET90	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
244	RM-PWD-L-Theanine	Raw Material	C	Certified Nutritionals	655 North Central Ave. 17th Floor, Glendale, CA 91203	haigen.stevia@foxmail.com	(+86)18253296328	\N	\N	60	30	3	1	20	\N	\N	\N	23.5	\N	23.5	\N	NET90	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
245	RM-PWD-Potassium-Sorbate	Raw Material	\N	Essential Wholesale Labs	2211 NW Nicolai St. Portland, Oregon 97210	info@ewlnatural.com	(503) 893-1100	\N	\N	60	30	3	1	20	\N	\N	0.6029	15.8829	\N	15.8829	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
246	RM-PWD-SALICYLIC-ACID	Raw Material	B	Essential Wholesale Labs	2211 NW Nicolai St. Portland, Oregon 97210	info@ewlnatural.com	(503) 893-1100	\N	\N	60	30	3	1	20	\N	\N	1.1333	11.1333	\N	11.1333	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
247	RM-PWD-Spirulina	Raw Material	\N	Stauber	4120 N Palm Street Fullerton, CA 92835	Stephanie.Aispuro@stauberusa.com	714-441-3631	\N	\N	60	30	3	1	20	\N	\N	1.44	13.94	\N	13.94	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
248	RM-PWD-Stevia-TSG90	Raw Material	\N	Haigen	No.3 Taoyuan Road,Taiwan Industry Park,QuFu 273100,China	haigen.stevia@foxmail.com	(+86)18253296328	\N	\N	60	30	3	1	20	\N	\N	\N	25	\N	25	\N	NET90	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
249	RM-PWD-Organic-Stevia-TSG90	Raw Material	A	Haigen	No.3 Taoyuan Road,Taiwan Industry Park,QuFu 273100,China	haigen.stevia@foxmail.com	(+86)18253296328	\N	\N	60	30	3	1	20	\N	\N	2.1742	39.1742	\N	39.1742	\N	NET90	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
250	RM-PWD-Tea-Jasmine	Raw Material	C	Minglun Tea	\N	minglunteas@126.com	86-18153301417	\N	\N	60	30	3	1	20	\N	\N	\N	\N	\N	\N	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
251	RM-PWD-Tea-MatchGreen-Sweet	Raw Material	\N	Minglun Tea	\N	minglunteas@126.com	86-18153301417	\N	\N	60	30	3	1	20	\N	\N	\N	14.66	\N	14.66	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
252	RM-PWD-Tea-Sencha-Green-Tea-Extract	Raw Material	B	Minglun Tea	\N	minglunteas@126.com	86-18153301417	\N	\N	60	30	3	1	20	\N	\N	\N	17	\N	17	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
253	RM-PWD-Wheat-Grass-Organic	Raw Material	C	NP Nutra	15161 - 15171 S. Figueroa St Gardena, CA 90248 - US	ctong@wheatgrass.com	(785) 841-6016	\N	\N	60	30	3	1	20	\N	\N	\N	17	\N	17	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
254	RM-TA-EUCALYPTUS-ESSENTIAL-OIL-TMP	Raw Material	B	\N	\N	cbader@lebermuth.com	.800.648.1123	\N	\N	60	30	3	5	1	\N	\N	\N	17.5	\N	38.5	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
255	RM-TA-LAVENDER-ESSENTIAL-OIL-TMP	Raw Material	C	\N	\N	Sales@bulkapothecary.com	888-728-7612	\N	\N	60	30	3	25	1	\N	\N	\N	38	\N	83.6	\N	CBS	https://www.bulkapothecary.com/essential-oils/lavender-oil/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
256	RM-TA-PEPPERMINT-ESSENTIAL-OIL-TMP	Raw Material	B	\N	\N	cbader@lebermuth.com	.800.648.1123	\N	\N	60	30	3	5	1	\N	\N	\N	32.25	\N	70.95	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
257	RM-TA-TEA-TREE-ESSENTIAL-OIL	Raw Material	\N	\N	\N	cbader@lebermuth.com	.800.648.1123	\N	\N	60	30	3	5	1	\N	\N	\N	33.4	\N	73.48	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
258	RM-TA-TEA-TREE-ESSENTIAL-OIL-TMP	Raw Material	B	\N	\N	cbader@lebermuth.com	.800.648.1123	\N	\N	60	30	3	5	1	\N	\N	\N	33.4	\N	73.48	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
259	RM-Witch-Hazel-Distillate	Raw Material	C	MYO	7820 E Pleasant Valley Road Independence, Ohio 44131	\N	800-359-0944	\N	\N	60	30	3	1	5	\N	\N	\N	15.25	\N	4.0286	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
260	Safetry-Shrink-Dome-M1421CL-8oz	Safety Shrink Band	B	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	500	\N	\N	\N	0.1144	\N	0.1144	\N	NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
261	SPRAY-MIST-20-410-White-5.5"	Top Cover	\N	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	100	1000	\N	\N	\N	0.16	\N	0.16	\N	NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
262	SPRAY-TA-5.25"	Top Cover	\N	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	1000	\N	\N	\N	0.25	\N	0.25	\N	NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
263	SPRAY-TA-S005	Top Cover	\N	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	1000	\N	\N	\N	0.29	\N	0.29	\N	NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
264	STCK-OL875WX	Sticker	\N	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	500	\N	\N	\N	0.11	\N	0.11	\N	NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
265	Green-Tea-Honey-Lotion-UnLabeled-8oz	White Label	\N	Health Specialty	8339 Allport Ave Santa Fe Springs, CA 90670 USA	christina@healthspecialty.com	562-273-0348	\N	\N	60	30	3	1	500	\N	\N	\N	2.25	\N	2.25	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
266	TA-Acne-Eliminating-Face-Cleanser-3.4oz	Turnkey FG	\N	Health Specialty	8339 Allport Ave Santa Fe Springs, CA 90670 USA	christina@healthspecialty.com	562-273-0348	\N	\N	60	30	3	1	500	\N	\N	\N	1.7	\N	1.7	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
267	TA-Acne-Eliminating-Face-Cleanser-8oz	Turnkey FG	\N	Health Specialty	8339 Allport Ave Santa Fe Springs, CA 90670 USA	christina@healthspecialty.com	562-273-0348	\N	\N	60	30	3	1	500	\N	\N	\N	2.3	\N	2.3	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
268	SPRAY-MIST-24-410-White-7.5"	Top Cover	C	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	500	\N	\N	\N	0.13	\N	0.13	\N	NET45	https://www.containerandpackaging.com/products/fine-mist-sprayer/S701WH	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
269	TRIGGER-SPRAYER-24-410-7.75	Top Cover	\N	\N	\N	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	1200	\N	\N	\N	0.72	\N	0.72	\N	NET45	https://www.containerandpackaging.com/products/fine-mist-sprayer/S706BK	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
270	TRIGGER-SPRAYER-24-410-7.75-Black	Top Cover	B	\N	\N	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	1200	\N	\N	0.0246	0.7238	\N	0.7238	\N	NET45	https://www.containerandpackaging.com/products/fine-mist-sprayer/S706BK	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
271	SPRAY-MIST-24-410-White-5.5"	Top Cover	\N	\N	\N	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	1000	\N	\N	\N	0.12	\N	0.12	\N	NET45	https://www.containerandpackaging.com/products/fine-mist-sprayer/S701WH	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
272	Cap-24-410-Flat	Top Cover	\N	\N	\N	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	1000	\N	\N	0.0287	0.0887	\N	0.0887	\N	NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
273	WL-Acne-Face-Cream-2oz-PLSF	White Label	A	PLSF	150 Douglas Ave Dunedin, FL 34698	orders@privatelabel.net	17274661703	\N	\N	60	30	3	1	500	\N	\N	\N	2.75	\N	2.75	\N	Due Upon Reciept	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
274	TA-Adv-Hand-Gel-8oz	Turnkey FG	\N	\N	\N	\N	\N	\N	\N	60	30	3	1	1	\N	\N	\N	3.72	\N	3.72	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
275	TA-Adv-Hand-Sanitizer-Gel-8oz	Turnkey FG	\N	\N	\N	\N	\N	\N	\N	60	30	3	1	1	\N	\N	\N	\N	\N	\N	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
276	TA-Balancing-Herbal-Toner	placeholder	\N	\N	\N	\N	\N	\N	\N	60	30	3	1	1	\N	\N	\N	6.32	\N	6.32	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
277	TA-Crepey-Skin-Facial-Cleanser-HS	placeholder - Turnkey FG	\N	\N	\N	christina@healthspecialty.com	562-273-0348	\N	\N	60	30	3	1	1	\N	\N	\N	\N	\N	\N	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
278	WL-Crepey-Lotion-8oz-HS	White Label	A	Health Specialty	8339 Allport Ave Santa Fe Springs, CA 90670 USA	christina@healthspecialty.com	562-273-0348	\N	\N	60	30	3	1	500	\N	\N	\N	2.4	\N	2.4	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
279	TA-Eczema-Cream	Turnkey FG	\N	\N	\N	\N	\N	\N	\N	60	30	3	1	1	\N	\N	\N	6.82	\N	6.82	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
280	TA-Safflower-Oleosomes-Sunscreen	Turnkey FG	\N	\N	\N	\N	\N	\N	\N	60	30	3	1	1	\N	\N	\N	5.13	\N	5.13	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
281	TA-Stem-Cell-Daily-Facial-Cleanser	Turnkey FG	\N	\N	\N	\N	\N	\N	\N	60	30	3	1	1	\N	\N	\N	\N	\N	\N	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
282	PS-DHM-Capsules	Turnkey FG	\N	\N	\N	bill@e-nutrisport.com	(973) 209-7200	\N	\N	60	30	3	1	1500	\N	\N	\N	3.5	\N	3.5	\N	NET 30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
283	SDP8MWHT 230x45mm	placeholder	\N	\N	\N	\N	\N	\N	\N	60	30	3	1	1	\N	\N	\N	0.1	\N	0.1	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
284	TA-Acne-Eliminating-Face-Cleanser-8oz-HS	Turnkey FG	A	Health Specialty	8339 Allport Ave Santa Fe Springs, CA 90670 USA	christina@healthspecialty.com	562-273-0348	\N	\N	60	30	3	1	5000	\N	\N	\N	2.41	\N	2.41	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
285	PCH-5oz-NAT-OrganicStevia-Preprinted	Container/Pouch	B	\N	\N	sam@yasonpack.cn	86 13925595106	\N	\N	60	60	3	1	5000	\N	\N	0.1013	0.2603	\N	0.2603	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
286	PCH-5oz-NAT-OrganicMonkfruit-Preprinted	Container/Pouch	A	\N	\N	sam@yasonpack.cn	86 13925595106	\N	\N	60	60	3	1	5000	\N	\N	\N	0.125	\N	0.125	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
287	PCH-5oz-TH-OrganicMonkFruit-Preprinted	Container/Pouch	A	\N	\N	sam@yasonpack.cn	86 13925595106	\N	\N	60	60	3	1	5000	\N	\N	0.1495	0.2695	\N	0.2695	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
288	PCH-5oz-PS-OrganicMonkfruit-Preprinted	Container/Pouch	A	\N	\N	sam@yasonpack.cn	86 13925595106	\N	\N	60	60	3	1	5000	\N	\N	0.1013	0.2263	\N	0.2263	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
289	PCH-5oz-PS-OrganicStevia-Preprinted	Container/Pouch	A	\N	\N	sam@yasonpack.cn	86 13925595106	\N	\N	60	60	3	1	5000	\N	\N	\N	0.155	\N	0.155	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
290	BTL-16oz-Diamond-White-24-410	Container/Pouch	C	\N	\N	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	\N	100	\N	\N	\N	0.415	\N	0.415	\N	NET45	https://www.containerandpackaging.com/products/pe-imperial-bullet-cosmo/B1270WH	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
291	RM-Peppermint-Water	Raw Material	C	\N	\N	\N	360-869-7900	\N	\N	60	30	3	\N	1	\N	\N	8.734	25.534	\N	6.7454	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
292	RM-Hydrolized-Keratin	Raw Material	C	\N	\N	info@ewlnatural.com	(503) 893-1100	\N	\N	60	30	3	1	1	\N	\N	\N	23.93	\N	52.646	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
293	RM-PWD-Silica	Raw Material	C	\N	\N	info@ewlnatural.com	(503) 893-1100	\N	\N	60	30	3	1	1	\N	\N	4.4	193.35	\N	425.37	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
294	RM-PWD-DL-Panthenol	Raw Material	C	\N	\N	--	877-627-7883	\N	\N	60	30	3	\N	1	\N	\N	\N	2.49	\N	84.1969	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
295	RM-Diheptyl-Succinate+Capryloyl-Glycerin/Sebacic-Acid Copolymer	Raw Material	C	\N	\N	info@windypointsoap.com	587-318-6678	\N	\N	60	30	3	\N	1	\N	\N	\N	25.1684	\N	25.1684	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
296	RM-Licorice-Root-Extract	Raw Material	C	MYO	7820 E Pleasant Valley Road Independence, Ohio 44131	admin@makingcosmetics.com	425-292-9502	\N	\N	60	30	3	\N	5	\N	\N	2.1055	89.6455	\N	197.22	\N	CBS	https://www.makeyourown.buzz/hydrolyzed-silk-protein/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
297	RM-Hydrolyzed-Silk-Protein	Raw Material	C	MYO	7820 E Pleasant Valley Road Independence, Ohio 44131	\N	800-359-0944	\N	\N	60	30	3	\N	2	\N	\N	\N	4.97	\N	168.0556	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
298	RM-Argan-Oil	Raw Material	C	MYO	7820 E Pleasant Valley Road Independence, Ohio 44131	Sales@bulkapothecary.com	888-728-7612	\N	\N	60	30	3	\N	8	\N	\N	\N	1.8	\N	60.8652	\N	CBS	https://www.makeyourown.buzz/argan-oil/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
299	TA-Double-Stem-Cell-Serum	Turnkey FG	\N	\N	\N	\N	\N	\N	\N	60	30	3	\N	1	\N	\N	\N	10.42	\N	10.42	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
300	TA-Rose-Stem-Cell-Aloe-Vera-Gel-8oz	Turnkey FG	\N	\N	\N	\N	\N	\N	\N	60	30	3	\N	1	\N	\N	\N	4.5	\N	4.5	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
301	LABL-5.75X5-Hair-Growth-Bamb-Wrap	Label	B	Wizard Labels	29150 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.263	\N	0.263	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
302	LABL-5.75X5-Hair-Growth-Grape-Wrap	Label	C	Wizard Labels	29150 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.263	\N	0.263	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
303	LABL-5.75X5-Hair-Growth-Lav-Wrap	Label	C	Wizard Labels	29150 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.47	\N	0.47	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
304	RM-Bamboo-Frangrance-Oil	Raw Material	B	\N	\N	\N	\N	\N	\N	60	30	3	\N	8	\N	\N	0.6	13.63	\N	460.8848	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
305	RM-MENTHOL	Raw Material	B	\N	\N	Sales@bulkapothecary.com	888-728-7612	\N	\N	60	30	3	\N	10	\N	\N	2.4491	14.3891	\N	31.656	\N	CBS	https://www.bulkapothecary.com/raw-ingredients/other-ingredients-and-chemicals/menthol-crystals-usp/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
306	TA-Hair-Savior-60-Norax	Turnkey FG	C	Norax Supplements	37 Calumet Pkwy Bldg P, Ste 100 Newnan, GA 30263	jen@noraxsupplements.com	404-433-8851	\N	\N	60	30	3	\N	1000	\N	\N	\N	5.05	\N	5.05	\N	50/50	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
307	WL-Hair-Savior-60-Norax	White Label	C	Norax Supplements	37 Calumet Pkwy Bldg P, Ste 100 Newnan, GA 30263	jen@noraxsupplements.com	404-433-8851	\N	\N	60	30	3	\N	1000	\N	\N	\N	4.76	\N	4.76	\N	50/50	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
347	LABL-PS-3.75x3-Theanine-100g	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.48	\N	0.48	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
308	WL-Caffeine-Theanine-Capsules-120-Nutrafill	white Label	C	Nutrafill	655 Crawford Street N.E.Dawson, GA. 39842	tommy@nutrafill.com	\N	\N	\N	60	30	3	\N	1000	\N	\N	0.145	4.655	\N	4.655	\N	50/50	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
309	LABL-7X2.5-PS-Caffeine-L-Theanine	Label	C	Nutrafill	655 Crawford Street N.E.Dawson, GA. 39842	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.28	\N	0.28	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
310	PS-Caffeine-Theanine-Capsules-120-Nutrafill	Turnkey FG	C	Nutrafill	655 Crawford Street N.E.Dawson, GA. 39842	tommy@nutrafill.com	\N	\N	\N	60	30	3	\N	1000	\N	\N	\N	4.2161	\N	4.2161	\N	50/50	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
311	LABL-5.5x2-Skin-Savior-60	Label	\N	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.28	\N	0.28	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
312	TA-Skin-Vitamins-60-Nutrafill	turnkey FG	\N	Nutrafill	655 Crawford Street N.E.Dawson, GA. 39842	tommy@nutrafill.com	\N	\N	\N	60	30	3	\N	1000	\N	\N	\N	3.61	\N	3.61	\N	50/50	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
313	WL-Skin-Vitamins-60-Nutrafill	white Label	\N	Nutrafill	655 Crawford Street N.E.Dawson, GA. 39842	tommy@nutrafill.com	\N	\N	\N	60	30	3	\N	1000	\N	\N	\N	3.61	\N	3.61	\N	50/50	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
314	LABL-TH-3.75x3-Monk-Stevia-Blend-4oz	Label	C	Wizard Labels	29150 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.316	\N	0.316	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
315	LABL-PS-3.75x2.875-Shrink-Sleeve-Liquid-Monk-Fruit-2oz	Label	C	Wizard Labels	29150 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.14	\N	0.14	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
316	M1151CL-Dome-Shrink-Band-52x143	Safety Shrink Band	C	Container and Packaging	1345 E State St. Eagle, ID 83616 USA	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	1	500	\N	\N	\N	0.068	\N	0.068	\N	NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
317	LABL-TA-3.5X4.75-Acne-Eliminating-Body-Spray-8oz	Label	\N	Wizard Labels	29150 Summit Ranch Dr, Golden, Colorado 80401	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.356	\N	0.356	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
318	PCH-16oz-PS-Stndup-Matt	Container/Pouch	\N	Sav on Bags	789 E Cedar St, Ontario, CA 91761	\N	909-923-9588	\N	\N	60	30	3	\N	5000	\N	\N	\N	0.38	\N	0.38	\N	CBS	https://www.sav-onbags.com/16-oz-Matte-Stand-Up-Pouch_p_89.html	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
319	LABL-NS-6.125x5-Monk-Fruit-Stevia-Liquid-2oz	Label	\N	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.13	\N	0.13	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
320	LABL-NS-2.875x3.750-Monk-Fruit-Stevia-Liquid-2oz	Label	C	\N	\N	kkochanski@grace-imaging.com	419-874-2127	\N	\N	120	60	3	\N	2000	\N	\N	\N	0.47	\N	0.47	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
321	LABL-AY-5.75x4.75-Boho-Body-Wash-Side-8oz	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.3	\N	0.3	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
322	LABL-PS-3.75x3-Black-Tea-2oz	Label	\N	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.467	\N	0.467	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
323	LABL-TA-5.75x4.75-Anti-Aging-Exfo-Body-Wash-8oz	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.2907	\N	0.2907	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
324	LABL-PS-3.75x3-Black-Tea-Iced-4oz	Label	A	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.0981	\N	0.0981	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
325	LABL-TH-3.75x3-Monk-Fruit-Extract-4oz	Label	A	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	\N	\N	\N	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
326	LABL-PS-3.75x3-Monk-Fruit-Extract-125g	Label	A	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.48	\N	0.48	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
327	LABL-AY-3.75x3-Warrior-One-Front	Label	B	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.33	\N	0.33	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
328	LABL-NS-3.75x3-Monk-Fruit-4oz-Front	Label	A	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.48	\N	0.48	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
329	LABL-NS-3.75x3-Monk-Fruit-4oz-Back	Label	A	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.48	\N	0.48	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
330	LABL-PS-3.75x3-Stevia-Powder-125g	Label	A	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.119	\N	0.119	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
331	LABL-TH-3.5x3-Black-Tea-4oz-Back	Label	A	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.22	\N	0.22	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
332	LABL-AY-4x3-Warrior-One-0,5oz-Front	Label	\N	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.51	\N	0.51	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
333	LABL-NS-3.75x3-Stevia-Powder-4oz-Front	Label	B	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.119	\N	0.119	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
334	LABL-NS-3.75x3-Stevia-Powder-4oz-Back	Label	B	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.119	\N	0.119	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
335	LABL-TH-3.75x3-Green-Tea-4oz	Label	B	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.0909	\N	0.0909	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
336	LABL-TH-3.75x3-Puerh-4oz	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.48	\N	0.48	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
337	LABL-PS-3.75x3-Green-Tea-Extract-250g	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.48	\N	0.48	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
338	LABL-PS-3.75x3-Shilajit-100g	Label	A	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.1243	\N	0.1243	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
339	LABL-PS-3.75x3-Green-Coffee-Ext-150g	Label	B	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.333	\N	0.333	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
340	LABL-PS-3.75x3-Black-Tea-125g	Label	A	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.2125	\N	0.2125	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
341	LABL-TH-3.75x3-Matcha-Green-Tea-Org-4oz	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.48	\N	0.48	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
342	LABL-PS-3.75x3-CDP-Choline-50g	Label	B	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.265	\N	0.265	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
343	LABL-AY-3.75x4.75-Day-Night-Acne-Kit-Front	Label	B	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.24	\N	0.24	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
344	LABL-AY-3.75x4.75-Day-Night-Acne-Kit-Back	Label	B	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.24	\N	0.24	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
345	LABL-TA-3.75x3-Milia	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.1224	\N	0.1224	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
346	LABL-PS-3.75x3-Vit-C-250g	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.48	\N	0.48	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
348	LABL-PS-3.75x3-Citrulline-Malate-250g	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.48	\N	0.48	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
349	LABL-PS-3.75x3-Alpha-GPC-25g	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.3294	\N	0.3294	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
350	LABL-PS-3.75x3-Beta-Alanine-1kg	Label	\N	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.48	\N	0.48	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
351	LABL-TH-3.75x4.75-Matcha-Greenn-Tea-Org-2oz	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.48	\N	0.48	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
352	LABL-PS-3.75x3-Monk-Fruit-Stevia-Blend-4X-4oz	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.48	\N	0.48	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
353	LABL-PS-3.75x3-Spirulina-Org-1kg	Label	\N	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.47	\N	0.47	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
354	LABL-PS-3.75x3-Cordyceps-Militaris-Org-6oz	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.47	\N	0.47	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
355	LABL-PS-3.75x3-Spirulina-Org-250g	Label	\N	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.47	\N	0.47	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
356	LABL-PS-3.75x3-Wheatgrass-Powder-Org-8oz	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.333	\N	0.333	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
357	LABL-PS-3.75x3-Myo-Inositol-1kg	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.26	\N	0.26	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
358	LABL-PS-3.75x3-Longjack-200:1-100g	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.47	\N	0.47	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
359	LABL-PS-3.75x3-Longjack-100:1-25g	Label	\N	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.47	\N	0.47	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
360	LABL-PS-3.75x3-Wheat-Grass-Org-150g	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.28	\N	0.28	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
361	LABL-PS-3.75x3-Spirulina-Org-16oz	Label	\N	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.47	\N	0.47	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
362	LABL-PS-3.75x3-Shilajit-25g	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.47	\N	0.47	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
363	LABL-PS-3.75x3-Citrulline-Malate-1kg	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.333	\N	0.333	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
364	LABL-TA-3.75x3-5StepAcneKit	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.333	\N	0.333	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
365	PCH-8oz-Stndup-Matt	Container/Pouch	\N	\N	\N	\N	909-923-9588	\N	\N	60	30	3	\N	1000	\N	\N	0.01	0.33	\N	0.33	\N	CBS	https://www.sav-onbags.com/8-oz-Matte-Stand-Up-Pouch_p_128.html	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
366	LABL-TA-3.75x3-Acne-Patches	Label	B	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.1251	\N	0.1251	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
367	LABL-TA-3.75x3-2Step-Cystic-Face-Wash-Bundle	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.333	\N	0.333	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
368	LABL-TA-3.75x4.75-Body-Spray-4oz	Label	A	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.1614	\N	0.1614	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
369	RM-PWD-Stevia-Flavor-Chocolate	Raw Material	\N	\N	\N	\N	\N	\N	\N	60	30	3	1	1	\N	\N	5.3	256.8	\N	256.8	\N	\N	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
370	LABL-AY-5.25x5.75-Shower-Spray-Euc-8oz	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.32	\N	0.32	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
371	TA-Crepey-Skin-Repair-Treatment-8oz-HS	Turnkey FG	A	\N	\N	christina@healthspecialty.com	562-273-0348	\N	\N	60	30	3	1	5000	\N	\N	\N	2.4	\N	2.4	\N	NET30	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
372	WL-OPTML-Hair-Savior-60-Norax	White Label	\N	Norax Supplements	37 Calumet Pkwy Bldg P, Ste 100 Newnan, GA 30263	jen@noraxsupplements.com	404-433-8851	\N	\N	60	30	3	\N	1000	\N	\N	0.28	5.33	\N	5.33	\N	50/50	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
373	OPTML-Hair-Savior-60-Norax	Turnkey FG	C	Norax Supplements	37 Calumet Pkwy Bldg P, Ste 100 Newnan, GA 30263	jen@noraxsupplements.com	404-433-8851	\N	\N	60	30	3	\N	1000	\N	\N	0.28	5.33	\N	5.33	\N	50/50	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
374	LABL-TA-3.75x3-TA-2StepAcneKit-FCreamFWash3.4oz	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.28	\N	0.28	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
375	LABL-WHYZ-4x6-Beta-Alanine-350g	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.1971	\N	0.1971	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
376	LABL-WHYZ-4x6-Alcar-125g	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.1971	\N	0.1971	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
377	LABL-WHYZ-4x6-Shilajit-50g	Label	B	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.196	\N	0.196	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
378	LABL-WHYZ-4x6-Myo-Inositol-8oz	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.1733	\N	0.1733	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
379	LABL-WHYZ-4x6-Monk-Fruit-Ext-5oz	Label	A	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.1825	\N	0.1825	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
380	LABL-WHYZ-4x6-Organic-Stevia-8oz	Label	B	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.27	\N	0.27	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
381	LABL-TA-1.25x7.125-Retinol-Cream-2oz	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.3194	\N	0.3194	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
382	LABL-WHYZ-4x6-Magnesium-Bisglycinate-10oz	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.2088	\N	0.2088	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
383	LABL-WHYZ-4x6-Green-Coffee-Bean-Powder-125g	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.1971	\N	0.1971	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
384	LABL-WHYZ-4x6-Organic-Matcha-Powder-125g	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.13	\N	0.13	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
385	LABL-WHYZ-4x6-Organic-WheatGrass-Powder-300g	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.32	\N	0.32	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
386	LABL-WHYZ-4x6-Organic-Cordyceps-Powder-200g	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.34	\N	0.34	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
387	LABL-WHYZ-4x6-Organic-Spirulina-Powder-250g	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.27	\N	0.27	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
388	LABL-NS-Shrink-Sleeve-Monk-Fruit-Extract-US-2oz	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.16	\N	0.16	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
389	AY-Hair-Skin-Nails-Vitamins-60-Norax	turnkey FG	B	\N	\N	jen@noraxsupplements.com	404-433-8851	\N	\N	60	30	3	\N	1000	\N	\N	\N	5.05	\N	5.05	\N	50/50	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
390	LABL-OPTML-2.5x7-Hair-Savior-60	Label	\N	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.56	\N	0.56	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
391	M1612CL-Dome-Shrink-Band 100X180mm	Safety Shrink Band	A	\N	\N	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	\N	5000	\N	\N	\N	0.107	\N	0.107	\N	NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
392	PCH-5oz-PS-Stndup-Matt	Container/Pouch	A	\N	\N	sam@yasonpack.cn	86 13925595106	\N	\N	60	30	3	1	5000	\N	\N	\N	0.15	\N	0.15	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
393	PCH-5oz-Stndup-WH-Matt	Container/Pouch	C	\N	\N	sam@yasonpack.cn	86 13925595106	\N	\N	60	30	3	1	5000	\N	\N	\N	0.24	\N	0.24	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
394	PCH-16oz-WHYZ-Stndup-Matt	Container/Pouch	C	\N	\N	sam@yasonpack.cn	86 13925595106	\N	\N	60	30	3	1	5000	\N	\N	\N	0.19	\N	0.19	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
395	LABL-PS-3.75x3-CDP-Choline-10g	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.24	\N	0.24	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
396	LABL-PS-4x6-Vitamin-C-1kg	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.24	\N	0.24	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
397	LABL-PS-3.75x3-Agmatine-100g	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.24	\N	0.24	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
398	LABL-PS-3.75x3-Alpha-GPC-100g	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.3238	\N	0.3238	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
399	LABL-PS-3.75x3-Dihydromyricetin-DHM-100g	Label	A	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.27	\N	0.27	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
400	LABL-PS-3.75x4.75-Beta-Alanine-1kg	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.24	\N	0.24	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
401	LABL-PS-3.75x4.75-Spirulina-Org-250g	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.48	\N	0.48	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
402	LABL-PS-3.75x4.75-Spirulina-Org-1kg	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.48	\N	0.48	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
403	LABL-PS-3.75x4.75-Alcar-250g	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.24	\N	0.24	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
404	LABL-PS-3.75x4.75-Spirulina-Org-16oz	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.33	\N	0.33	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
405	LABL-TH-3.75x3-Matcha-Green-Tea-5oz-Organic-Back	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	0.0273	0.3273	\N	0.3273	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
406	LABL-TH-3.75x3-Jasmine-Green-Tea-4oz-Back	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.19	\N	0.19	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
407	LABL-TA-5.8x0.625-Milia-Spot-Treatment-0.5oz	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.2931	\N	0.2931	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
408	PCH-24oz-Stndup-WH-Matt	Container/Pouch	\N	\N	\N	\N	909-923-9588	\N	\N	60	30	3	\N	500	\N	\N	\N	0.36	\N	0.36	\N	CBS	https://www.sav-onbags.com/2-lb-Stand-Up-Pouch_p_91.html	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
409	WL-Stock-Sleep-Capsules-60-SMP	White Label	C	\N	\N	\N	\N	\N	\N	60	30	3	\N	1000	\N	\N	\N	4.98	\N	4.98	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
410	LABL-AY-3.75x3-Warrior-Two-Front	Label	B	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.1426	\N	0.1426	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
411	LABL-WHYZ-4x6-L-Theanine-Powder-125g	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.34	\N	0.34	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
412	LABL-WHYZ-4x6-Vitamin-C-Powder-500g	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.34	\N	0.34	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
413	LABL-TA-3.75x3-Milia-Patches-5pack	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.09	\N	0.09	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
414	WL-Retinol-Cream-2oz-PLSF	White Label	C	PLSF	150 Douglas Ave Dunedin, FL 34698	orders@privatelabel.net	17274661703	\N	\N	60	30	3	1	500	\N	\N	\N	3.5	\N	3.5	\N	Due Upon Reciept	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
415	LABL-TA-3.75x3-TA-Milia-Remover-Kit	Label	\N	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.47	\N	0.47	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
416	LABL-AY-7.5X3-Hair-Savior-60-caps	Label	B	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	0.1575	\N	0.1575	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
417	LABL-TA-7.5x3-Hair-Savior-60-caps	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	1	500	\N	\N	\N	1.43	\N	1.43	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
418	WL-Oil-Free-Skin-Repair-Serum-2oz-Shay	White Label	C	\N	\N	pam@shaylabs.com	(800) 358-6155	\N	\N	60	30	3	\N	500	\N	\N	\N	0.29	\N	0.29	\N	50 DP/50 NET60	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
419	PCH-5oz-WHYZ-OrganicMonkFruit-Preprinted	Container/Pouch	A	\N	\N	sam@yasonpack.cn	86 13925595106	\N	\N	60	60	3	1	5000	\N	\N	\N	0.3	\N	0.3	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
420	WL-Acne-Face-Cream-2oz-Shay	White Label	A	\N	\N	pam@shaylabs.com	(800) 358-6155	\N	\N	60	30	3	\N	500	\N	\N	0.067	1.757	\N	1.757	\N	50 DP/50 NET60	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
421	AY-Crepey-Skin-Repair-Treatment-8oz-HS	Turnkey FG	A	\N	\N	christina@healthspecialty.com	562-273-0348	\N	\N	60	30	3	1	5000	\N	\N	\N	2.4	\N	2.4	\N	NET30	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
422	CLEARECOBAG-8.25x10.25	Eco Bags	C	\N	\N	jeremy@ecoenclose.com	888-445-6575 ext. 004	\N	\N	60	30	3	1	1000	\N	\N	0.0093	0.077	\N	0.077	\N	NET30	https://www.ecoenclose.com/shop/poly-bags/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
423	SPRAY-MIST-20-410-White-5.5-NEW	Top Cover	B	\N	\N	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	\N	50000	\N	\N	\N	0.3329	\N	0.3329	\N	NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
424	SPRAY-MIST-24-410-White-7.5-NEW	Top Cover	\N	\N	\N	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	\N	50000	\N	\N	\N	2.2	\N	2.2	\N	NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
425	WL-Cucumber-Body-Lotion-8oz-HS	White Label	A	\N	\N	christina@healthspecialty.com	562-273-0348	\N	\N	60	30	3	1	5000	\N	\N	4.21	61.21	\N	61.21	\N	NET30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
426	StandMore-Portable-Standing-Desk	turnkey FG	A	\N	\N	qzsd-tripod@gzbeike.com	86-020-87499043	\N	\N	60	30	3	1	500	\N	\N	\N	70	\N	70	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
427	LABL-AY-3.75x4.75-Body-Spray-4oz	Label	B	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.101	\N	0.101	\N	CBS	https://www.wizardlabels.com/	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
428	LABL-TA-3.94x1.625-Deep-Wrinkle-Serum-1oz	Label	\N	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.2682	\N	0.2682	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
429	LABL-NS-4x4-Stevia-Powder-4oz	Label	\N	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.4383	\N	0.4383	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
430	LABL-TA-4.75x4.75-Milia-Kit-Bundle	Label	A	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.1925	\N	0.1925	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
431	LABL-WHYZ-6.125x5-Liquid-Stevia-Drops-8oz	Label	A	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.28	\N	0.28	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
432	LABL-AY-7.5x5.5-Here-Comes-The-Sun-Room-Spray-16oz	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.4655	\N	0.4655	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
433	LABL-TA-3.75x3-Milia-Patches	Label	A	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.119	\N	0.119	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
434	LABL-WHYZ-4x6-Tongkat-Ali-Powder-4oz	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.2406	\N	0.2406	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
435	LABL-AY-3.75x4.75-Yoga-Mat-Spray-4oz	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.1759	\N	0.1759	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
436	M1108CL-Clear-Perforated-Shrink-Band 152x51	Safety Shrink Band	\N	\N	\N	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	\N	5000	\N	\N	\N	0.038	\N	0.038	\N	NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
437	LABL-TA-11.313x1.625-Rough-and-Bumpy-Skin-Lotion-8oz	Label	PLC-2024	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.25	\N	0.25	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
438	LABL-TA-5.75x4.75-After-Shave-Razor-Bump-8oz	Label	PLC-2024	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.32	\N	0.32	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
439	RM-Butylene-Glycol	Raw Material	PLC-2024	\N	\N	\N	\N	\N	\N	60	30	3	\N	24	\N	\N	0.1428	0.6726	\N	22.7426	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
440	RM-Cycomethicone-6	Raw Material	PLC-2024	\N	\N	--	877-627-7883	\N	\N	60	30	3	\N	7	\N	\N	2.5714	17.4214	\N	38.3271	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
441	RM-Glycerin	Raw Material	PLC-2024	\N	\N	--	877-627-7883	\N	\N	60	30	3	\N	1	\N	\N	0.5143	3.5043	\N	7.7094	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
442	RM-Polysorbate-80	Raw Material	PLC-2024	\N	\N	--	877-627-7883	\N	\N	60	30	3	\N	1	\N	\N	0.5143	5.2843	\N	11.6254	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
443	RM-Acetylsalicylic-Acid	Raw Material	PLC-2024	\N	\N	angelia@hbmojin.com	86 13288715578	\N	\N	60	30	3	\N	1	\N	\N	41.6667	66.6667	\N	66.6667	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
444	BTL-4oz-Cylinder-Round-White-24-410	CM Packaging-Container	B	\N	\N	Jared.Murray@containers.com	(208) 639-5868	\N	\N	120	60	3	\N	486	\N	\N	\N	0.18	\N	0.18	\N	NET45	https://www.containerandpackaging.com/products/pe-cylinder-round/B359	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
445	LABL-NS-3.75x4.75-Liquid-Stevia-US-4oz	Label	B	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	120	60	3	\N	1000	\N	\N	\N	0.16	\N	0.16	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
446	LABL-NS-1.5X1.5-25OFF	Label	\N	\N	\N	Karola.Reyes@xymoprint.com	321-276-4984	\N	\N	1000	60	3	\N	1000	\N	\N	\N	0.0186	\N	0.0186	\N	NET30 after Shipdate	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
447	LABL-WHYZ-1.5X1.5-25OFF	Label	\N	\N	\N	Karola.Reyes@xymoprint.com	321-276-4984	\N	\N	1000	60	3	\N	1000	\N	\N	\N	0.0186	\N	0.0186	\N	NET30 after Shipdate	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
448	LABL-PS-1.5X1.5-25OFF	Label	\N	\N	\N	Karola.Reyes@xymoprint.com	321-276-4984	\N	\N	1000	60	3	\N	1000	\N	\N	\N	0.0186	\N	0.0186	\N	NET30 after Shipdate	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
449	LABL-TH-1.5X1.5-25OFF	Label	\N	\N	\N	Karola.Reyes@xymoprint.com	321-276-4984	\N	\N	1000	60	3	\N	1000	\N	\N	\N	0.0186	\N	0.0186	\N	NET30 after Shipdate	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
450	LABL-TA-1.5X1.5-25OFF	Label	\N	\N	\N	Karola.Reyes@xymoprint.com	321-276-4984	\N	\N	1000	60	3	\N	1000	\N	\N	\N	0.0186	\N	0.0186	\N	NET30 after Shipdate	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
451	LABL-AY-1.5X1.5-25OFF	Label	\N	\N	\N	Karola.Reyes@xymoprint.com	321-276-4984	\N	\N	1000	60	3	\N	1000	\N	\N	\N	0.0186	\N	0.0186	\N	NET30 after Shipdate	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
452	INSRT-CYSTIC-3.5X2-INFOCARD	Label	\N	\N	\N	Karola.Reyes@xymoprint.com	321-276-4984	\N	\N	1000	60	3	\N	500	\N	\N	\N	0.3	\N	0.3	\N	NET30 after Shipdate	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
453	PCH-5oz-Stndup-BLACK-Matt	Container/Pouch	B	\N	\N	\N	909-923-9588	\N	\N	1000	60	3	\N	500	\N	\N	\N	0.24	\N	0.24	\N	CBS	https://www.sav-onbags.com/4-oz-Matte-Stand-Up-Pouch_p_126.html	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
454	PCH-1oz-Stndup-BLACK-Matt	Container/Pouch	C	\N	\N	\N	909-923-9588	\N	\N	1000	60	3	\N	500	\N	\N	\N	0.11	\N	0.11	\N	CBS	https://www.sav-onbags.com/1-oz-Stand-Up-Pouch_p_39.html	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
455	LABL-TN-4x5.5-Organic-Monk-Fruit-4.5oz	Label	B	\N	\N	kkochanski@grace-imaging.com	419-874-2127	\N	\N	60	30	3	\N	500	\N	\N	\N	0.76	\N	0.76	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
456	LABL-TN-2.5x3.125-Organic-Monk-Fruit-1oz	Label	C	\N	\N	kkochanski@grace-imaging.com	419-874-2127	\N	\N	60	30	3	\N	500	\N	\N	\N	0.65	\N	0.65	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
457	LABL-TN-3.75x2.875-Liquid-Stevia-Drops-2oz	Label	C	\N	\N	kkochanski@grace-imaging.com	419-874-2127	\N	\N	60	30	3	\N	500	\N	\N	\N	0.18	\N	0.18	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
458	LABL-TN-6.125x5-Liquid-Stevia-Drops-8oz	Label	B	\N	\N	kkochanski@grace-imaging.com	419-874-2127	\N	\N	120	60	3	\N	2000	\N	\N	\N	0.3859	\N	0.3859	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
459	CAP-24-400-Twist-Cap	Top Cover	\N	\N	\N	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	\N	3000	\N	\N	0.0044	0.1149	\N	0.1149	\N	NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
460	INSRT-DRIPCAP-3.5X2-INFOCARD	Label	\N	\N	\N	Karola.Reyes@xymoprint.com	321-276-4984	\N	\N	60	30	3	\N	1000	\N	\N	\N	0.18	\N	0.18	\N	NET30 after Shipdate	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
461	TA-Salicylic-Acid-Cystic-Acne-Spot-Treatment-DS	Turnkey FG	PLC-2024	\N	\N	kym.nadeau@divastuff.com	(386) 256-2521	\N	\N	60	30	3	\N	300	\N	\N	\N	2.58	\N	2.58	\N	50 DP / 50 NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
462	LABL-AY-Fresh-Reset-Fabric-Spray-8oz	Label	C	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	30	3	\N	500	\N	\N	\N	0.26	\N	0.26	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
463	RM-PWD-Potassium-Sorbate-Granulated	Raw Material	\N	\N	\N	contact@wholesalesuppliesplus.com	800-359-0944	\N	\N	120	60	3	\N	1	\N	\N	\N	5.97	\N	13.134	\N	CBS	https://www.wholesalesuppliesplus.com/products/potassium-sorbate-granules.aspx	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
464	1/2oz-Thick-Wall-Jar+Lid-Black	Container/Pouch	PLC-2024	\N	\N	customersupport@sks-bottle.com	518-880-6980	\N	\N	120	60	3	\N	144	\N	\N	\N	0.82	\N	0.82	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
465	AY-Spot-Treatment-0.5oz-DS	Turnkey FG	B	\N	\N	kym.nadeau@divastuff.com	(386) 256-2521	\N	\N	120	60	3	\N	500	\N	\N	\N	2.55	\N	2.55	\N	50 DP / 50 NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
466	TA-Milia-Treatment-0.5oz-DS	Turnkey FG	\N	\N	\N	kym.nadeau@divastuff.com	(386) 256-2521	\N	\N	120	60	3	\N	500	\N	\N	\N	2.55	\N	2.55	\N	50 DP / 50 NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
467	TA-Acne-Body-Lotion-Cucumber-8oz-DS	Turnkey FG	A	\N	\N	kym.nadeau@divastuff.com	(386) 256-2521	\N	\N	60	30	3	\N	\N	\N	\N	\N	5.7	\N	5.7	\N	50 DP / 50 NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
468	AY-Bootylicious-Butt-Acne-Lotion-8oz-DS	Turnkey FG	B	\N	\N	kym.nadeau@divastuff.com	(386) 256-2521	\N	\N	60	30	3	\N	\N	\N	\N	\N	5.7	\N	5.7	\N	50 DP / 50 NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
469	AY-Celestial-Body-Acne-Body-Lotion-8oz-DS	Turnkey FG	C	\N	\N	kym.nadeau@divastuff.com	(386) 256-2521	\N	\N	60	30	3	\N	\N	\N	\N	\N	5.5	\N	5.5	\N	50 DP / 50 NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
470	LABL-TN-4x5.5-Organic-Stevia-Extract-5oz	Label	C	\N	\N	kkochanski@grace-imaging.com	419-874-2127	\N	\N	60	60	3	\N	500	\N	\N	\N	0.76	\N	0.76	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
471	LABL-TN-2.5x3.125-Organic-Stevia-Extract-1oz	Label	C	\N	\N	kkochanski@grace-imaging.com	419-874-2127	\N	\N	60	60	3	\N	500	\N	\N	\N	0.65	\N	0.65	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
472	PCH-2oz-Stndup-WH-Matt	Container/Pouch	\N	\N	\N	sam@yasonpack.cn	86 13925595106	\N	\N	60	30	3	1	10000	\N	\N	\N	0.24	\N	0.24	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
473	M15208CL-Clear-Perforated-Shrink-Band 152x150	Safety Shrink Band	\N	\N	\N	Jared.Murray@containers.com	(208) 639-5868	\N	\N	60	30	3	\N	50000	\N	\N	\N	0.058	\N	0.058	\N	NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
474	LABL-PS-5.25x0.40-Methylene-Blue-5g	Label	PLC-2024	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	60	3	\N	200	\N	\N	\N	0.2765	\N	0.2765	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
475	RM-PWD-Methylene-Blue	Raw Material	PLC-2024	XIAMEN EQUATION CHEMICAL CO.,LTD	No.268 Haijing Road,Xiamen China	zoe.chen@equationchemical.com	86 592 6515854	\N	\N	60	60	3	\N	1	\N	\N	\N	371	\N	371	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
476	TA-Acne-Eliminating-Face-Cleanser-8oz-DS	Turnkey FG	A	\N	\N	kym.nadeau@divastuff.com	(386) 256-2521	\N	\N	120	60	3	\N	100	\N	\N	\N	4.86	\N	4.86	\N	50 DP / 50 NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
477	TA-Acne-Eliminating-Face-Cleanser-3.4oz-DS	Turnkey FG	\N	\N	\N	kym.nadeau@divastuff.com	(386) 256-2521	\N	\N	60	30	3	\N	300	\N	\N	\N	\N	\N	\N	\N	50 DP / 50 NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
478	TA-Invisible-Acne-Spot-Treatment-0.5oz-DS	Turnkey FG	PLC-2024	\N	\N	kym.nadeau@divastuff.com	(386) 256-2521	\N	\N	60	30	3	\N	300	\N	\N	\N	2.18	\N	2.18	\N	50 DP / 50 NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
479	AY-Warrior-One-Spot-Treatment-0.5oz-DS	Turnkey FG	\N	\N	\N	kym.nadeau@divastuff.com	(386) 256-2521	\N	\N	60	30	3	\N	300	\N	\N	\N	2.18	\N	2.18	\N	50 DP / 50 NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
480	TA-Crepey-Skin-Repair-Treatment-8oz-DS	Turnkey FG	\N	\N	\N	kym.nadeau@divastuff.com	(386) 256-2521	\N	\N	120	60	3	\N	100	\N	\N	\N	6.02	\N	6.02	\N	50 DP / 50 NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
481	TA-Acne-Eliminating-Body-Spray-8oz-DS	Turnkey FG	\N	\N	\N	kym.nadeau@divastuff.com	(386) 256-2521	\N	\N	120	60	3	\N	100	\N	\N	\N	3.67	\N	3.67	\N	50 DP / 50 NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
482	PCH-1oz-Stndup-WHITE-Matt	Container/Pouch	B	\N	\N	\N	909-923-9588	\N	\N	60	30	3	1	1000	\N	\N	\N	0.11	\N	0.11	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
483	TA-Acne-Eliminating-Face-Cream-2oz-DS	Turnkey FG	PLC-2024	\N	\N	kym.nadeau@divastuff.com	(386) 256-2521	\N	\N	120	60	3	\N	100	\N	\N	\N	3.3	\N	3.3	\N	50 DP / 50 NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
484	RM-PWD-Organic-Citric-Acid	Raw Material	PLC-2024	Nature's Flavor	833 N. Elm St Orange, CA 92867	andrew.herrera@naturesflavors.com	714-744-3700	\N	\N	60	60	3	\N	1	\N	\N	2.234	47.534	\N	104.5748	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
485	RM-PWD-Organic-Sugar-Cane-Alcohol-190	Raw Material	PLC-2024	Ultra Pure, LLC	50 Old Kings HWY North Darien, CT 06820	tanya@ultrapure-usa.com	203.662.9761 x 307	\N	\N	60	60	3	\N	5	\N	\N	18	97.99	\N	25.8862	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
486	LABL-NS-6.125x5-Organic-Stevia-8oz	Label	\N	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	60	3	\N	500	\N	\N	\N	0.28	\N	0.28	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
487	LABL-NS-6.125x5-Organic-Monk-Fruit-Liquid-drops-8oz	Label	\N	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	60	60	3	\N	500	\N	\N	\N	0.28	\N	0.28	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
488	LABL-TN-2.5x3.125-Monk-Fruit-Sweetener-1oz	Label	PLC-2024	\N	\N	kkochanski@grace-imaging.com	419-874-2127	\N	\N	120	60	3	\N	1000	\N	\N	\N	0.59	\N	0.59	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
489	LABL-TN-2.5x3.125-Monk-Fruit-Sweetener-5oz	Label	PLC-2024	\N	\N	kkochanski@grace-imaging.com	419-874-2127	\N	\N	120	60	3	\N	1000	\N	\N	\N	0.76	\N	0.76	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
490	LABL-TN-2.5x3.125-Monk-Fruit-Sweetener-1lb	Label	PLC-2024	\N	\N	kkochanski@grace-imaging.com	419-874-2127	\N	\N	120	60	3	\N	1000	\N	\N	\N	0.89	\N	0.89	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
491	LABL-NS-6x5-Organic-Liquid-Stevia-US-8oz	Label	PLC-2024	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	120	60	3	\N	1000	\N	\N	\N	0.3302	\N	0.3302	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
492	LABL-NS-6x5-Organic-Liquid-Monk-Fruit-US-8oz	Label	PLC-2024	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	120	60	3	\N	1000	\N	\N	\N	0.19	\N	0.19	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
493	RM-PWD-Monk-Fruit-Extract-5%	Raw Material	PLC-2024	QINGDAO NUTRAORIGEN PHARMACHEM CO.,LTD	NO.18 HELING ROAD, 1502 UNIT 2, QINGDAO, SHANDONG, 266100 CHINA	daniel@nutraorigen.com	\N	\N	\N	90	90	3	\N	1	\N	\N	\N	25	\N	25	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
494	AY-Charcoal-To-Sparkle-Acne-Wash-8oz-DS	Turnkey FG	C	\N	\N	kym.nadeau@divastuff.com	(386) 256-2521	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	50 DP / 50 NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
495	AY-Charcoal-To-Sparkle-Acne-Wash-3.4oz-DS	Turnkey FG	\N	\N	\N	kym.nadeau@divastuff.com	(386) 256-2521	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	50 DP / 50 NET45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
496	LABL-WHYZ-4x6-Black-Tea-4.5oz	Label	PLC-2024	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	120	60	3	\N	1000	\N	\N	\N	0.1725	\N	0.1725	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
497	LABL-WHYZ-2.5x6.5-Caffeine-Theanine-Capsules-120ct	Label	PLC-2024	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	120	60	3	\N	1000	\N	\N	\N	0.19	\N	0.19	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
498	LABL-AY-0.625x6.188-Salicylic-Acid-Spot-0.5oz-PLSF	Label	PLC-2024	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	120	60	3	\N	1000	\N	\N	\N	0.19	\N	0.19	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
499	LABL-AY-1.25x7.125-Salicylic-Acid-Acne-Face-Cream-2oz-PLSF	Label	PLC-2024	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	120	60	3	\N	1000	\N	\N	\N	0.23	\N	0.23	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
500	LABL-AY-Sulfur-Bentonite-Clay-Face-Scrub-4oz-PLSF	Label	PLC-2024	\N	\N	ashley@wizardlabels.com	888-277-3037	\N	\N	120	60	3	\N	1000	\N	\N	\N	0.19	\N	0.19	\N	CBS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2024-10-11 12:29:45.859862-05	\N
\.


--
-- Data for Name: finished_goods; Type: TABLE DATA; Schema: public; Owner: derrek
--

COPY public.finished_goods (id, isku, asin, common_name, phoenix_class, brand, size, material_cost, labor_cost, total_unit_cost, replenishment_type, manufacturing_class, lead_time, amz_safety_days, wh_safety_days, reorder_qty_days, "similar", in_bom_mapping, duplicate_asin, count_tkfg, status, batch_run) FROM stdin;
1	DS-Face-Scrub-Charcoal-&-Bamboo	B00H4A36JG	Face Scrubbie Charcoal & Bamboo		DivaStuff	12 pads	0	0	0	WPP	?	0	0	0	0	3	f	f	0		
2	DS-Face-Scrub-Indias-Secret	B00ES0Z206	India’s Secret		DivaStuff	12 pads	0	0	0	WPP	?	0	0	0	0	3	f	f	0		
3	DS-Strawberry-Cell-Renewal-Scrubbie	B016E012MY	Strawberry Cell Renewal		DivaStuff	12 pads	0	0	0	WPP	?	0	0	0	0	3	f	f	0		
4	PS-Spray-Tops-24-Pack	B08B789MG6	Spray Bottle Tops		Purisure	24 pcs	0	0	0	MOFO	Bundle - 24	0	0	0	0	\N	f	f	0		
5	TA-Cystic-Acne-Spot-Treatment-0.5oz	B01BPCAWK4	Cystic Spot Treatment	C	TreeActiv	0.5 oz	0.25	0.04	0.29	WPP	0.5 oz FG	0	0	0	0	3	f	f	0		
6	TA-Acne-Prone-Sunscreen-1.7oz	B08F5J12YF	Acne-Prone Skin Facial Sunscreen		TreeActiv	1.7 oz	5.37	0	5.37		2-4 oz WL	0	0	0	0	3	f	f	0		
7	DS-Spot-Treatment-Charcoal-Vodka-0.25oz	B00Z3MHEK4	Charcoal, Honeysuckle & Vodka		DivaStuff	0.25 oz	0	0	0	WPP	0.25 oz jar	0	0	0	0	4	f	f	0		
8	PS-Spray-Tops-100-Pack	B08B78K8S2	Spray Bottle Tops		Purisure	100 pcs	33.29	0	33.29	MOFO	Bundle-100	0	0	0	0	\N	f	f	0		
9	TA-Matcha-Lip-Scrub-0.25oz	B07491MKT8	Matcha Anti-Aging Lip Scrub		TreeActiv	0.25 oz	0.08	0	0.08		0.25 oz WL	0	0	0	0	3	f	f	0		
10	TA-Double-Stem-Cell-Serum-1oz	B081NLTJXQ	Double Stem Cell Anti-Aging Face Serum		TreeActiv	1 oz	10.49	0	10.49	WPP	1 oz FG	0	0	0	0	3	f	f	0		
11	AY-Warrior-One-Spot-Treatment-0.5oz	B08KBLNPGZ	Warrior One	B	Ayadara	0.5 oz	2.97	0.22	3.19	MOFO	0.5 oz WL	0	0	0	0	3	f	f	0		
12	AY-Warrior-Two-Spot-Treatment-0.5oz	B08KDG8XTZ	Warrior Two	B	Ayadara	0.5 oz	2.55	0.22	2.77	MOFO	0.5 oz WL	0	0	0	0	3	f	f	0		
13	TA-Invisible-Acne-Spot-Treatment-0.5oz	B06XRFGLZT	Invisible Spot	B	TreeActiv	0.5 oz	2.97	0.2	3.17	MOFO	0.5 oz WL	0	0	0	0	3	f	f	0		
14	TA-Milia-Spot-Treatment-0.5oz	B0B8ZKS4VP	TA-Milia-Spot-Treatment-0.5oz	C	TreeActiv	0.5 oz	2.55	0.13	2.68	MOFO	0.5 oz WL	0	0	0	0	5	f	f	0		
15	PS-Shilajit-25g	B07DNKN94L	Shilajit	C	Purisure	25 g	1.45	0	1.45	MOFO	10-50g PWDR	0	0	0	0	5	f	f	0		
16	PS-Alpha-GPC-25g	B07B1GDVT1	Alpha GPC 50% Powder	C	Purisure	25 g	2.02	0.41	2.43	MOFO	10-50g PWDR	0	0	0	0	5	f	f	0		
17	TH-Matcha-Green-Tea-2oz-Organic	B010OITYD6	Matcha Green Tea Powder	C	Teaki Hut	2 oz	4.62	0	4.62	MOFO	10-50g PWDR	0	0	0	0	5	f	f	0		
18	TA-Deep-Wrinkle-Serum-1oz	B07GSGLKNH	Deep Wrinkle Serum	C	TreeActiv	1 oz	2.56	0.21	2.77	WPP	1 oz FG	0	0	0	0	3	f	f	0		
19	TA-Stem-Cell-Eye-Serum-1oz	B08BR78S67	Advanced Stem Cell Peptide Eye Serum		TreeActiv	1 oz	7.56	0	7.56	WPP	1 oz FG	0	0	0	0	3	f	f	0		
20	AY-Rose-To-The-Occasion-Eye-Serum-1oz	B08JS3R6KW	Rose Stem Cell Eye Serum		Ayadara	1 oz	0.06	0	0.06	WPP	1 oz FG	0	0	0	0	3	f	f	0		
21	AY-Vitamin-C-Me-Glow-Serum-1oz	B08JS5JJB3	Enhanced Vitamin C Serum		Ayadara	1 oz	0	0	0	WPP	1 oz FG	0	0	0	0	3	f	f	0		
22	TA-Shingles-Relief-Balm-1oz	B07KPD8RXP	Shingles Symptom Relief Balm		TreeActiv	1 oz	0.08	0	0.08	WPP	1 oz FG	0	0	0	0	3	f	f	0		
23	DivaStuffAcneGel-1oz	B07JJRDXLY	Acne Gel Spot Treatment		DivaStuff	1 oz	0	0	0	WPP	1 oz bottle	0	0	0	0	3	f	f	0		
24	TA-Skin-Brightening-Serum-1oz	B07K8WYXN7	Skin Brightening Serum		TreeActiv	1 oz	0.3	0	0.3	WPP	1 oz FG	0	0	0	0	3	f	f	0		
25	TA-Vitamin-C-Hyaluronic-Acid-Serum-1oz	B081NYVSLP	Vitamin C + Hyaluronic Acid Serum		TreeActiv	1 oz	0.07	0	0.07	WPP	1 oz FG	0	0	0	0	3	f	f	0		
26	AY-Garden-of-Youth-Stem-Cell-Serum-1oz	B08JRWW595	Double Stem Cell Serum		Ayadara	1 oz	0.07	0	0.07		1 oz FG	0	0	0	0	3	f	f	0		
27	TA-Advanced-Stem-Cell-Peptide-Eye-Serum	B081NMZ5JZ	Advanced Eye Serum (old ???)		TreeActiv		0	0	0		2-4 oz FG	0	0	0	0	3	f	f	0		
28	PS-Stevia-Powder-30g	B07DP6513C	Stevia Powder		Purisure	30 g	1.42	0	1.42		10-50g PWDR	0	0	0	0	5	f	f	0		
29	PS-Sucralose-50g	B01N2HMSQK	Sucralose Powder		Purisure	50 g	0.15	0	0.15		10-50g PWDR	0	0	0	0	5	f	f	0		
30	WHYZ-ALCAR-Powder-125g	B0BCWSFT2Q	WHYZ-ALCAR-Powder-125g	C	WHYZ	125 g	5	0.41	5.41	MOFO	100-150g PWDR	0	0	0	0	5	f	f	0		
31	NS-Monk-Fruit-Powder-4oz-Organic	B07PRYV8CF	Monk Fruit	A	NatriSweet	100 g	5.97	0.92	6.89	MOFO	100-150g PWDR-MF	0	0	0	0	3	f	f	0		
32	TH-Black-Tea-4oz	B00U31XAF8	Black Tea	A	Teaki Hut	4 oz	1.43	0.65	2.08	MOFO	100-150g PWDR	0	0	0	0	5	f	f	0		
33	PS-Shilajit-100g	B07D426F92	Shilajit Powder 12:1 Extract 100g	A	Purisure	100 g	3.23	0.55	3.78	MOFO	100-150g PWDR	0	0	0	0	5	f	f	0		
34	PS-Agmatine-100g	B06Y5W4DMN	Agmatine Sulfate Powder	C	Purisure	100 g	3.3	0.5	3.8	MOFO	100-150g PWDR	0	0	0	0	5	f	f	0		
35	PS-Longjack-200:1-100g	B01M6CJM8U	Longjack 200:1 Extract Powder	C	Purisure	100 g	3.12	0.36	3.48	MOFO	100-150g PWDR	0	0	0	0	5	f	f	0		
36	PS-Green-Coffee-Bean-Extract-150g	B08C4VYDJN	Green Coffee Bean Extract	B	Purisure	150 g	5.06	0.05	5.11	MOFO	100-150g PWDR	0	0	0	0	5	f	f	0		
37	TH-Matcha-Green-Tea-4oz-Organic	B010OITYIQ	Matcha Tea Powder	C	Teaki Hut	4 oz	4.14	0	4.14	MOFO	100-150g PWDR	0	0	0	0	5	f	f	0		
38	TH-Matcha-Green-Tea-5oz-Organic	B0B6WT8KTQ	Teaki Hut Organic Matcha Green Tea Powder, 5oz, 	C	Teaki Hut	5 oz	5.48	0.06	5.54	MOFO	100-150g PWDR	0	0	0	0	5	f	f	0		
39	TH-Green-Tea-4oz	B00U31UEBQ	Green Tea Powder	B	Teaki Hut	4 oz	2.11	0.49	2.6	MOFO	100-150g PWDR	0	0	0	0	5	f	f	0		
40	PS-Iced-Tea-4oz	B00U324G6Y	Iced Tea Powder	A	Purisure	4 oz	1.27	0.74	2.01	MOFO	100-150g PWDR	0	0	0	0	5	f	f	0		
41	NS-Stevia-Powder-4oz-Organic	B01N7FYVEM	Stevia Powder	B	NatriSweet	4 oz	4.69	0.31	5	MOFO	100-150g PWDR	0	0	0	0	2	f	f	0		
42	TH-Pu-Erh-Tea-4oz	B06XW84324	Pu-erh Tea	C	Teaki Hut	4 oz	3.38	0.48	3.86	MOFO	100-150g PWDR	0	0	0	0	5	f	f	0		
43	NS-Monk-Fruit-Stevia-Blend-4X-4oz	B07RWYTR67	Monk Fruit and Stevia Blend	C	NatriSweet	4 oz	2.14	0	2.14	MOFO	100-150g PWDR	0	0	0	0	5	f	f	0		
44	PS-Monk-Fruit-Stevia-Blend-4X-4oz	B07XG5X6NH	Stevia & Monk Fruit Sweetener Blend	C	Purisure	4 oz	2.59	0	2.59	MOFO	100-150g PWDR	0	0	0	0	2	f	f	0		
45	PS-Monk-Fruit-Extract-125g-Organic	B07PMLB7SP	Monk Fruit	A	Purisure	125 g	7.51	0.43	7.94	MOFO	100-150g PWDR-MF	0	0	0	0	3	f	f	0		
47	PS-CDP-Choline-10g	B01LWQHD96	CDP Choline Powder	C	Purisure	10 g	2.17	0.41	2.58	MOFO	100-150g PWDR	0	0	0	0	5	f	f	0		
48	PS-L-Theanine-100g	B07DNKPXJ7	L-Theanine Powder	C	Purisure	100 g	2.5	0.32	2.82	MOFO	100-150g PWDR	0	0	0	0	5	f	f	0		
49	PS-Alpha-GPC-100g	B07B1PS9PP	GPC 50% Powder	C	Purisure	100 g	5.95	0.34	6.29	MOFO	100-150g PWDR	0	0	0	0	5	f	f	0		
50	PS-Dihydromyricetin-DHM-100g	B07RCVVX4R	Dihydromyricetin (DHM) Powder	A	Purisure	100 g	7.35	0.8	8.15	MOFO	100-150g PWDR	0	0	0	0	5	f	f	0		
51	TH-Monk-Fruit-4oz-Organic	B08KGYJ4TL	Monk Fruit Extract Powder 4oz	A	Teaki Hut	4 oz	6.86	0.51	7.37	MOFO	100-150g PWDR-MF	0	0	0	0	2	f	f	0		
52	PS-CDP-Choline-50g	B01LWQHBXA	CDP Choline Powder	B	Purisure	50 g	9.77	0.31	10.08	MOFO	100-150g PWDR	0	0	0	0	5	f	f	0		
53	PS-Black-Tea-Powder-125g	B0B7RY2SXG	PS-Black-Tea-Powder-125g	A	Purisure	125g	1.49	0.78	2.27		100-150g PWDR	0	0	0	0	5	f	f	0		
54	PS-Organic-Wheat-Grass-150g	B0B5LKN9BT	Organic Wheat Grass 150g	C	Purisure	150g	2.98	0.41	3.39		100-150g PWDR	0	0	0	0	5	f	f	0		
55	TA-Aloe-Vera-Gel-16oz	B08FVSG7KR	Aloe Vera Gel		TreeActiv	16 oz	4.96	0	4.96	WPP	16 oz WL	0	0	0	0	3	f	f	0		
56	PS-Longjack-100:1-25g	B01M2D2YU7	Longjack 100:1 Extract Powder		Purisure	25 g	1.25	0	1.25	MOFO	100-150g PWDR	0	0	0	0	5	f	f	0		
57	AY-Here-Comes-The-Sun-Room-Spray-16oz	B08KWL8VQ2	Room  Spray	C	Ayadara	16 oz	2.12	2.21	4.33	MOFO	16 oz IHM Spray	0	0	0	0	4	f	f	0		
58	TA-Sleep-Spray-Calming-Lavender-16oz	B08P23HP1V	Sleep Spray	C	TreeActiv	16 oz	2.93	1	3.93	MOFO	16 oz IHM Spray	0	0	0	0	4	f	f	0		
59	NS-Toffee-Stevia-Liquid-2oz	B018RXGGTA	Toffee Stevia Liquid Drops		NatriSweet	2 oz	0	0	0	MOFO	2 fl oz Drops	0	0	0	0	1	f	f	0		
60	PS-Eucalyptus-Hand-Purifying-Spray-2oz	B0889RNJ64	Purifying Travel Spray Eucalyptus		Purisure	2 oz	0.5	0	0.5	MOFO	2 oz SANI	0	0	0	0	4	f	f	0		
61	PS-Peppermint-Hand-Purifying-Spray-2oz	B0889XBZ6X	Purifying Travel Spray Peppermint		Purisure	2 oz	0.53	0	0.53	MOFO	2 oz SANI	0	0	0	0	4	f	f	0		
62	NS-Stevia-Liquid-Original-TD-2oz	B074D4G6YZ	Original Stevia Liquid Drops		NatriSweet	2 oz	0.01	0	0.01	MOFO	2 fl oz Drops	0	0	0	0	1	f	f	0		
63	TA-Dark-Circles-Eye-Gel-2oz	B07K8X9MJF	Dark Circles Eye Gel		TreeActiv	2 oz	0	0	0	WPP	2-4 oz WL	0	0	0	0	3	f	f	0		
64	TA-Euc-Trvl-Spry-2oz	B08G1VHSLJ	Eucalyptus Travel Spray		TreeActiv	2 oz	0.34	0	0.34	MOFO	2 oz SANI	0	0	0	0	4	f	f	0		
65	TA-Hand-Sanitizer-Spray-2oz	B08F2VLB1B	Hand Sanitizer Spray		TreeActiv	2 oz	0	0	0	MOFO	2 oz SANI	0	0	0	0	4	f	f	0		
66	TA-Lemon-Trvl-Spry-2oz	B08G1WX8YH	Lemon Travel Spray		TreeActiv	2 oz	0.47	0	0.47	MOFO	2 oz SANI	0	0	0	0	4	f	f	0		
67	TA-Lvndr-Trvl-Spry-2oz	B08G1YK3VN	Lavender Travel Spray		TreeActiv	2 oz	0.39	0	0.39	MOFO	2 oz SANI	0	0	0	0	4	f	f	0		
68	TA-Pprmnt-Trvl-Spry-2oz	B08G1WGQR4	Peppermint Travel Spray		TreeActiv	2 oz	0.37	0	0.37	MOFO	2 oz SANI	0	0	0	0	4	f	f	0		
69	TA-Ttree-Trvl-Spry-2oz	B08G1WL2HN	Tea Tree Travel Spray		TreeActiv	2 oz	0.38	0	0.38	MOFO	2 oz SANI	0	0	0	0	4	f	f	0		
70	TA-Adv-Hand-Sanitizer-2oz	B08DHKZWRC	Advanced Hand Sanitizer Gel		TreeActiv	2 oz x 5	0	0	0	MOFO	2 oz SANI	0	0	0	0	4	f	f	0		
71	NS-Chocolate-Stevia-Liquid-2oz	B018RVKQ16	Chocolate Stevia Liquid Drops		NatriSweet	2 oz	0.93	0	0.93		2 fl oz Drops	0	0	0	0	1	f	f	0		
72	NS-Stevia-Liquid-Vanilla-2oz	B018RVKWAG	Vanilla Stevia Liquid Drops		NatriSweet	2 oz	0.7	0	0.7		2 fl oz Drops	0	0	0	0	1	f	f	0		
73	PS-Adv-Hand-Sanitizer-2oz	B08FKQZJ9J	Travel Size Advanced Hand Sanitizer		Purisure	2 oz	0.39	0	0.39		2 oz SANI	0	0	0	0	4	f	f	0		
74	TA-Acne-Tea-Tree-Oil-2oz	B01GKHN17K	Tea Tree Essential Oil		TreeActiv	2 oz	4.48	0	4.48		2 oz SANI	0	0	0	0	3	f	f	0		
75	TA-Acne-Eliminating-Face-Cream-2oz	B01BPDN5L6	Face Cream	A	TreeActiv	2 oz	1.94	0.22	2.16	MOFO	2-4 oz WL	0	0	0	0	3	f	f	0		
76	AY-Breakout-Warrior-Acne-Cream-2oz	B07WWXR1DB	Breakout Warrior	B	Ayadara	2 oz	1.93	0.6	2.53	MOFO	2-4 oz WL	0	0	0	0	3	f	f	0		
77	TA-Acne-Scar-Cream-2oz	B07HHFNXVW	Acne Scar Cream	C	TreeActiv	2 oz	3.36	0.24	3.6	MOFO	2-4 oz WL	0	0	0	0	3	f	f	0		
78	TA-Retinol-Cream-2oz	B09BCSL46R	Retinol Cream	C	TreeActiv	2 oz	3.85	0.13	3.98	WPP	2-4 oz WL	0	0	0	0	3	f	f	0		
79	TA-Oil-Free-Skin-Repair-Serum-2oz	B01ETIITYM	Oil-Free Advanced Skin Repair Serum	C	TreeActiv	2 oz	1.49	0.26	1.75	WPP	2-4 oz FG	0	0	0	0	3	f	f	0		
80	AY-Scars-No-More-2oz	B0965WMQFM	Acne Scar Cream	B	Ayadara	2 oz	1.94	0.49	2.43	MOFO	2-4 oz WL	0	0	0	0	3	f	f	0		
81	AY-Rose-Shine-Stem-Cell-Peptide-Cream-2oz	B08JS1KZHP	Rose Stem Cell Peptide Cream		Ayadara	2 oz	7.56	0	7.56	WPP	2-4 oz WL	0	0	0	0	3	f	f	0		
82	TA-Acne-Mask-Charcoal-2oz	B076QLXKF7	Charcoal Mask		TreeActiv	2 oz	0.03	0	0.03	WPP	2-4 oz WL	0	0	0	0	3	f	f	0		
83	TA-Stem-Cell-Peptide-Firming-Cream-2oz	B081NLN9VW	Peptide Firming Cream		TreeActiv	2 oz	0	0	0		2-4 oz WL	0	0	0	0	3	f	f	0		
84	PS-Longjack-200:1-3.5oz	B08CL3YNKH	Longjack-200:1 Powder		Purisure	3.5 oz	2.63	0	2.63	WPP	100-150g PWDR	0	0	0	0	5	f	f	0		
85	PS-Panax-Ginseng-Powder-4oz	B08CK3FLGL	Organic Panax Ginseng Extract Powder		Purisure	4 oz	0	0	0	MOFO	100-150g PWDR	0	0	0	0	5	f	f	0		
86	TH-Jasmine-Green-Tea-4oz	B06XW9VFZF	Jasmine Green Tea Powder	C	Teaki Hut	4 oz	0.19	0	0.19	MOFO	100-150g PWDR	0	0	0	0	5	f	f	0		
46	PS-Stevia-Powder-125g-Organic	B00LFSOSRM	Stevia Powder	A	Purisure	125 g	5.05	0.48	5.53	MOFO	100-150g PWDR	0	0	0	0	2	f	f	0	Active	
87	TH-Matcha-With-Stevia-4oz	B07Q395X52	Matcha Green Tea Powder Sweetened With Stevia		TreeActiv	4 oz	1.86	0	1.86		100-150g PWDR	0	0	0	0	3	f	f	0		
88	PS-Sucralose-100g	B01N64M32B	Sucralose Powder		Purisure	100 g	0.15	0	0.15		100-150g PWDR	0	0	0	0	5	f	f	0		
89	TH-Monk-Fruit-Stevia-Blend-4X-4oz	B0B21J8WRZ	Monk Fruit Stevia Blend	C	Teaki Hut	4 oz	2.41	0	2.41		100-150g PWDR	0	0	0	0	2	f	f	0		
90	OPTML-Golf	B07GD551KC	Golf		OPTML	120 caps	7.89	0	7.89	MOFO	Caps WL	0	0	0	0	3	f	f	0		
91	PS-Myo-Inositol-Capsules	B07SZ9KQP6	Myo-Inositol Capsules		Purisure	120 caps	0	0	0	MOFO	Caps WL	0	0	0	0	3	f	f	0		
92	OPTML-NootropX	B00NMKXPEI	NootropX 		OPTML	120 caps	0.35	0	0.35	MOFO	Caps WL	0	0	0	0	3	f	f	0		
93	OPTML-Boost	B06WVDW1PR	OPTML-Boost	C	OPTML	120 caps	4.66	0.55	5.21	MOFO	Caps WL	0	0	0	0	3	f	f	0		
94	PS-Caffeine-Theanine-Capsules-120	B07DNJ69FR	Caffeine + L-Theanine	C	Purisure	120 caps	4.94	0.08	5.02	MOFO	Caps WL	0	0	0	0	3	f	f	0		
95	OPTML-Sleep	B07XP8QJF4	OPTML-Sleep	C	OPTML	60 caps	4.98	1.41	6.39	WPP	Caps WL	0	0	0	0	3	f	f	0		
96	PS-Alpha-GPC-Capsules	B07RMX2PV1	Alpha GPC Capsules		Purisure	60 caps	5.75	0	5.75	MOFO	Caps WL	0	0	0	0	3	f	f	0		
97	PS-DHM-Capsules	B08B3KBJCC	Dihydromyricetin (DHM) Capsules		Purisure	60 caps	3.5	0	3.5	MOFO	Caps WL	0	0	0	0	3	f	f	0		
98	TA-Hair-Savior-60	B0165YIFM4	Hair Savior	C	TreeActiv	60 caps	6.54	0	6.54	WPP	Caps WL	0	0	0	0	3	f	f	0		
99	TA-Skin-Savior	B0161V558I	Skin Savior		TreeActiv	60 caps	3.95	0	3.95	WPP	Caps WL	0	0	0	0	3	f	f	0		
100	OPTML-Hair-Nails	B07VBLLFM7	Hair and Nails	C	OPTML	60 caps	5.32	0.45	5.77		Caps WL	0	0	0	0	3	f	f	0		
101	OPTML-Mshrm-Cmplx-90Caps	B08GPMB1SL	Mushroom 		OPTML	90 caps	0	0	0		Caps WL	0	0	0	0	3	f	f	0		
102	OPTML-Running	B07GD5DBH6	OPTML-Running		OPTML	120 caps	7.35	0	7.35		Caps WL	0	0	0	0	3	f	f	0		
103	OPTML-Tennis	B07GD3C2T4	OPTML Tennis		OPTML	120 caps	7.65	0	7.65		Caps WL	0	0	0	0	3	f	f	0		
104	TA-Skin-Vitamin	B0B94B1FCV	TA-Skin-Vitamin	C	TreeActiv	60 caps	3.67	0.32	3.99		Caps WL	0	0	0	0	5	f	f	0		
105	AY-Hair-Skin-Nails-Vitamins	B0B8J4DJGK	AY-Hair-Skin-Nails-Vitamins	B	Ayadara	60 caps	4.97	0.29	5.26		Caps WL	0	0	0	0	5	f	f	0		
106	WHYZ-Shilajit-Powder-50g	B0BCWNFB7G	WHYZ-Shilajit-Powder-50g	B	WHYZ	50 g	1.92	0.32	2.24	MOFO	100-150g PWDR	0	0	0	0	5	f	f	0		
107	WHYZ-Organic-MonkFruit-Powder-5oz	B0BD8LPJKQ	WHYZ-Organic-MonkFruit-Powder-5oz	A	WHYZ	5 oz	8.99	0.73	9.72		100-150g PWDR-MF	0	0	0	0	5	f	f	0		
108	PS-Organic-Spirulina-16oz	B0B68FBPQG	PS-Organic-Spirulina-16oz	C	Purisure	16 oz	6.9	1.24	8.14		16oz/500g PWDR	0	0	0	0	5	f	f	0		
109	PS-Stevia-Powder-500g	B07DP6KPLD	Stevia Powder		Purisure	500 g	20.05	0	20.05	MOFO	16oz/500g PWDR	0	0	0	0	5	f	f	0		
110	PS-Citric-Acid-16oz	B07D42TH9P	Citric Acid Powder		Purisure	16 oz	10.08	0	10.08		16oz/500g PWDR	0	0	0	0	5	f	f	0		
111	PS-Spirulina-Organic-1kg	B01MFFVRX9	Spirulina Powder	C	Purisure	1000 g	14.59	0	14.59		1kg PWDR	0	0	0	0	5	f	f	0		
112	PS-Myo-Inositol-1kg	B07D41F8GD	Myo Inositol Powder	C	Purisure	1000 g	22.57	1.34	23.91	MOFO	1kg PWDR	0	0	0	0	5	f	f	0		
113	PS-Vitamin-C-1kg	B01NA6978W	Vitamin C Powder	C	Purisure	1000 g	7.96	1.23	9.19	MOFO	1kg PWDR	0	0	0	0	5	f	f	0		
114	PS-Beta-Alanine-1kg	B01L7KT048	Beta Alanine Powder	C	Purisure	1000 g	8	1.04	9.04	MOFO	1kg PWDR	0	0	0	0	5	f	f	0		
115	TA-Toilet-Spray-Summer-Breeze-2oz	B08QD34975	Toilet Spray	C	TreeActiv	2 oz	0.6	0	0.6	MOFO	2 oz IHM Spray	0	0	0	0	4	f	f	0		
116	OPTML-Pain-Relief-Gel-3oz	B07VGGHRWN	Pain Relief Gel Roll On		OPTML	3 oz	0	0	0	WPP	2-4 oz WL	0	0	0	0	3	f	f	0		
117	TC-Thermachill-Roll-On-3oz	B00LFTBDLU	Thermachill Roll-On Pain Relief		Thermachill	3 oz	0.09	0	0.09	WPP	2-4 oz WL	0	0	0	0	3	f	f	0		
118	TA-Acne-Eliminating-Face-Cleanser-3.4oz	B08MH9WPKV	Face Cleanser/Wash 3.4 oz	C	TreeActiv	3.4 oz	0.06	0.12	0.18	MOFO	2-4 oz FG	0	0	0	0	3	f	f	0		
119	AY-Charcoal-To-Sparkle-Acne-Wash-3.4oz	B08KD89N97	Charcoal Face Wash	C	Ayadara	3.4 oz	1.7	0.07	1.77	WPP	2-4 oz FG	0	0	0	0	3	f	f	0		
120	DS-Slimming-Gel-4oz	B01M8L2OO3	Slimming Gel		DivaStuff	4 oz	0	0	0	WPP	4 oz bottle	0	0	0	0	3	f	f	0		
121	TA-Room-Spray-Citrus-4oz	B08HM5NB9C	Room Spray	C	TreeActiv	4 oz	1.24	0.17	1.41	MOFO	4 oz IHM Spray	0	0	0	0	4	f	f	0		
122	TA-Balancing-Herbal-Toner-4oz	B01BPBXJIM	Balancing Herbal Toner	B	TreeActiv	4 oz	1.75	0.28	2.03	MOFO	4 oz IHM Spray	0	0	0	0	4	f	f	0		
123	AY-Smell-the-Roses-Stem-Cell-Toner-4oz	B08JQRDGPT	Rose Stem Cell Toner		Ayadara	4 oz	4.7	0	4.7	WPP	4 oz IHM Spray	0	0	0	0	3	f	f	0		
124	TA-Anti-Aging-Stem-Cell-Toner-4oz	B081NLH2FK	Anti-Aging Stem Cell Toner		TreeActiv	4 oz	0	0	0	WPP	4 oz IHM Spray	0	0	0	0	3	f	f	0		
125	EVORA-Hand-Sanitizer-4oz	B086WRDNSK	Hand Sanitizer		Evora	4 oz	0	0	0	WPP	4 oz bottle	0	0	0	0	3	f	f	0		
126	TA-DHT-Blocking-Hair-Spray-4oz	B07NBR2319	DHT Blocking Hair Growth Spray		TreeActiv	4 oz	0.45	0	0.45	WPP	4 oz IHM Spray	0	0	0	0	3	f	f	0		
127	AY-Here-Comes-The-Sun-Spray-4oz-16oz	B08M2Q3D49	Room Spray 2 pack		Ayadara	4 oz / 16 oz	3.76	0	3.76	MOFO	Bundle-2	0	0	0	0	4	f	f	0		
128	AY-Sun-Salutation-Goddess-1.7oz	B08JXPZSHD	Facial Sunscreen		Ayadara	1.7 oz	1.91	0	1.91		2-4 oz WL	0	0	0	0	3	f	f	0		
129	TC-Thermachill-Spray-4oz	B01BMHEFM8	Thermachill Pain Relief Spray		Thermachill	4 oz	0.09	0	0.09		2-4 oz WL	0	0	0	0	4	f	f	0		
130	AY-Exfoliate-Bad-Vibes-Acne-Scrub-4oz	B08KD5W3DQ	Exfoliating  Face Scrub	C	Ayadara	4 oz	4.28	0.3	4.58	MOFO	2-4 oz WL	0	0	0	0	3	f	f	0		
131	AY-Rose-Above-Stem-Cell-Cleanser-4oz	B08JRS5C34	Rose  Stem Cell Cleanser		Ayadara	4 oz	5.06	0	5.06	WPP	2-4 oz WL	0	0	0	0	3	f	f	0		
132	TA-Four-In-One-Acne-Treatment-4oz	B00U1J83SQ	Four-in-One	B	TreeActiv	4 oz	4.19	0.25	4.44	MOFO	2-4 oz WL	0	0	0	0	3	f	f	0		
133	TA-Eczema-Cream-4oz	B07HHF7Q3M	Eczema Cream		TreeActiv	4 oz	7.07	0	7.07	WPP	2-4 oz WL	0	0	0	0	3	f	f	0		
134	TA-Weekly-Hair-Repair-Treatment-4oz	B01M3PCVIH	Weekly Hair Repair Treatment		TreeActiv	4 oz	0.01	0	0.01	WPP	2-4 oz WL	0	0	0	0	3	f	f	0		
135	TA-Crepey-Skin-Microdermbrasion-Mask-4oz	B07DDF9FFJ	Crepey Skin Microdermabrasion Mask		TreeActiv	4 oz	0.06	0	0.06		2-4 oz WL	0	0	0	0	3	f	f	0		
136	TA-Face-Exfoliating-Acne-Scrub-Pads-4oz	B01BPACNX0	Face Exfoliating Acne Scrub Pads		TreeActiv	4 oz	0.01	0	0.01		2-4 oz WL	0	0	0	0	3	f	f	0		
137	PS-Citrulline-Malate-1kg	B07B1M5SD3	Purisure Citrulline Malate 2:1	C	Purisure	1000 g	12.27	2.03	14.3		1kg PWDR	0	0	0	0	5	f	f	0		
138	PS-Activated-Charcoal-1lb	B08CK8XV4N	Organic Activated Charcoal		Purisure	1 lb	0	0	0	MOFO	1lb PWDR	0	0	0	0	5	f	f	0		
139	PS-Slippery-Elm-Bark-Powder-1lb	B08D6YP8L6	Organic Slippery Elm Bark Powder		Purisure	1 lb	0	0	0	MOFO	1lb PWDR	0	0	0	0	5	f	f	0		
140	PS-Sunflower-Lecithin-1lb	B08BWL22BY	Sunflower Lecithin Powder		Purisure	1 lb	0	0	0	MOFO	1lb PWDR	0	0	0	0	5	f	f	0		
141	PS-Stevia-Powder-225g	B012A3Y8LG	Stevia Powder		Purisure	225 g	9.27	0	9.27	MOFO	170-225g PWDR	0	0	0	0	5	f	f	0		
142	PS-Barley-Grass-Powder-10oz	B08CRVFX99	Organic Barley Grass Powder		Purisure	10 oz	0	0	0	MOFO	250-350g PWDR	0	0	0	0	5	f	f	0		
143	PS-Citrulline-Malate-250g	B00NOZG7CS	Citrulline Malate	C	Purisure	250 g	3.1	0.38	3.48	MOFO	250-350g PWDR	0	0	0	0	5	f	f	0		
144	PS-Vitamin-C-250g	B01N1G55Q8	Vitamin-C Powder	C	Purisure	250 g	2.11	0	2.11	MOFO	250-350g PWDR	0	0	0	0	5	f	f	0		
145	PS-Spirulina-Organic-250g	B01M2CNN05	Spirulina Powder	C	Purisure	250 g	4.43	0	4.43	MOFO	250-350g PWDR	0	0	0	0	5	f	f	0		
146	TA-Anti-Acne-Pillow-Spray-4oz	B01M9DP25F	Pillow Spray	A	TreeActiv	4 oz	0.98	0.26	1.24	MOFO	4 oz IHM Spray	0	0	0	0	4	f	f	0		
147	AY-Mystical-Mist-4oz	B08KSL8YHJ	Acne Prone Skin Facial Toner / Face Spray	C	Ayadara	4 oz	1.62	0	1.62	MOFO	4 oz IHM Spray	0	0	0	0	4	f	f	0		
148	TA-Anti-Acne-Pillow-Spray-Lavender-4oz	B08C3XXQDQ	Anti-Acne Pillow Spray, Lavender	B	TreeActiv	4 oz	1	0.45	1.45	MOFO	4 oz IHM Spray	0	0	0	0	4	f	f	0		
149	TA-Yoga-Mat-Spray-4oz	B08KFGYSD7	Yoga Mat Spray	B	TreeActiv	4 oz	1.31	0.38	1.69	MOFO	4 oz IHM Spray	0	0	0	0	4	f	f	0		
150	AY-Clear-Sleep-Pillow-Mist-4oz	B08JZFFBRM	Anti-Acne Pillow & Linen Mist	C	Ayadara	4 oz	1	0.38	1.38	MOFO	4 oz IHM Spray	0	0	0	0	4	f	f	0		
151	TA-Shower-Spray-Eucalyptus-Xtra-Stre-4oz	B08S3LQHPH	Extra Strength Eucalyptus Shower	C	TreeActiv	4 oz	5.5	0	5.5	MOFO	4 oz IHM Spray	0	0	0	0	4	f	f	0		
152	TA-Shower-Spray-Eucalyptus-4oz	B08KDS18R5	Eucalyptus Shower Spray	C	TreeActiv	4 oz	1.77	0	1.77	MOFO	4 oz IHM Spray	0	0	0	0	4	f	f	0		
153	AY-Wildflower-Goddess-Toner-4oz	B08JY3JJ2Q	Anti-Aging Herbal Toner	C	Ayadara	4 oz	1.83	1.61	3.44	MOFO	4 oz IHM Spray	0	0	0	0	4	f	f	0		
154	TA-Sleep-Spray-Calming-Lavender-4oz	B08J2HQZ4K	Sleep Spray Lavender	C	TreeActiv	4 oz	1.44	0.31	1.75	MOFO	4 oz IHM Spray	0	0	0	0	4	f	f	0		
155	TA-Acne-Face-Spray-4oz	B079ZCGJZF	Face Spray	B	TreeActiv	4 oz	1.43	0.49	1.92	MOFO	4 oz IHM Spray	0	0	0	0	4	f	f	0		
156	TA-Air-Freshener-Spray-Peppermint-4oz	B08J2YWQ9F	Air Freshener Spray, Peppermint	C	TreeActiv	4 oz	1.02	0	1.02	MOFO	4 oz IHM Spray	0	0	0	0	4	f	f	0		
157	AY-Here-Comes-The-Sun-Room-Spray-4oz	B08K3P65HM	Room Spray	C	Ayadara	4 oz	1.12	0.33	1.45	MOFO	4 oz IHM Spray	0	0	0	0	4	f	f	0		
158	AY-Shower-Spray-Eucalyptus-8oz	B08KF94MCT	Eucalyptus Shower Spray	C	Ayadara	8 oz	2.99	0	2.99	MOFO	8 oz IHM Spray	0	0	0	0	4	f	f	0		
159	TA-Natural-Linen-Spray-Lavender-8oz	B08BWN33SX	Linen Spray | Lavender	B	TreeActiv	8 oz	1.8	0.67	2.47	MOFO	8 oz IHM Spray	0	0	0	0	4	f	f	0		
160	TA-Acne-Eliminating-Face-Cleanser-8oz	B01BHYAPJS	Face Cleanser/Wash 8 oz	A	TreeActiv	8 oz	2.41	0.01	2.42	WPP	8 oz FG	0	0	0	0	3	f	f	0		
161	TA-Acne-Body-Lotion-Cucumber-8oz	B01ETEJNPK	Cucumber Lotion	A	TreeActiv	8 oz	5.81	0.08	5.89	MOFO	8 oz WL	0	0	0	0	3	f	f	0		
162	AY-Charcoal-To-Sparkle-Acne-Wash-8oz	B08KDB2KQF	Charcoal Face Wash	C	Ayadara	8 oz	2.41	0.14	2.55	WPP	8 oz FG	0	0	0	0	3	f	f	0		
163	TA-Hair-Growth-Spray-Bamboo-8oz	B018KBBNMO	Hair Growth Bamboo Sugarcane	B	TreeActiv	8 oz	2.46	0.98	3.44	WPP	8 oz IHM Spray	0	0	0	0	4	f	f	0		
164	AY-Bootylicious-Butt-Acne-Lotion-8oz	B08JY88C32	Butt Acne Clearing Lotion	B	Ayadara	8 oz	5.81	0.19	6	MOFO	8 oz WL	0	0	0	0	3	f	f	0		
165	Ayadara-Rose-Stem-Cell-Scrub-8oz	B08JQR82MX	Rose Stem Cell Body Scrub /  Merci Bouquet		Ayadara	8 oz	5	0	5	WPP	8 oz WL	0	0	0	0	3	f	f	0		
166	TA-Acne-Exfoliating-Body-Wash-8oz	B01BMEUM0U	Exfoliating Body Wash	B	TreeActiv	8 oz	3.62	0.31	3.93	MOFO	8 oz WL	0	0	0	0	3	f	f	0		
167	TA-Hair-Growth-Spray-Lavender-8oz	B018KAH8M4	Hair Growth  Spray	C	TreeActiv	8 oz	1.66	0.7	2.36	MOFO	8 oz IHM Spray	0	0	0	0	4	f	f	0		
168	AY-Reverse-Warrior-Body-Spray-8oz	B08KFGBHJX	Body Spray	C	Ayadara	8 oz	1.9	0.36	2.26		8 oz IHM Spray	0	0	0	0	4	f	f	0		
169	AY-Bloom-Booster-Hair-Conditioner-8oz	B08JQQNP8B	Rose Stem Cell Hair Growth		Ayadara	8 oz	5.75	0	5.75		8 oz WL	0	0	0	0	3	f	f	0		
170	TA-Stem-Cell-AloeVera-Gel-8oz	B081NWG5TF	Stem Cell Enhanced Aloe Vera Gel		TreeActiv	8 oz	4.5	0	4.5		8 oz WL	0	0	0	0	3	f	f	0		
291	TA-Milia-Remover-Kit	B0C1TH3LP2	TA-Milia-Remover-Kit	C	TreeActiv		4.78	0	4.78	MOFO	Bundle-2 WL	0	0	0	0	\N	f	f	0		
171	TA-Hair-Growth-Stem-Cell-Conditioner-8oz	B081NJQQS2	Hair Growth Stem Cell Conditioner		TreeActiv	8 oz	0	0	0		8 oz WL	0	0	0	0	3	f	f	0		
172	AY-Bloom-All-Over-Clay-Mask-8oz	B08JRVPDNX	Rose Stem Cell Clay Mask		Ayadara	8 oz	6.08	0	6.08		8 oz WL	0	0	0	0	3	f	f	0		
173	TA-Exfoliating-Stem-Cell-Facial-Cleanser-8oz	B081NX7CW4	Exfoliating Stem Cell Facial Cleanser		TreeActiv	8 oz	5	0	5		8 oz WL	0	0	0	0	3	f	f	0		
174	TA-Natural-Defense-Hand-Purifying-Gel-8oz	B07ZS8LCV6	Natural Defense  Aloe Vera Gel	C	TreeActiv	8 oz	0	0	0		8 oz WL	0	0	0	0	3	f	f	0		
175	AY-Celestial-Body-Acne-Body-Lotion-8oz	B08JZF26L7	Acne Treatment Body Lotion	C	Ayadara	8 oz	5.61	0.33	5.94		8 oz WL	0	0	0	0	3	f	f	0	Hibernated	
176	DS-Crepey-Skin-Raspberry-8oz	B0747VL51Y	Crepey Skin Cream Raspberry Lime		DivaStuff	8 oz	0	0	0		8 oz bottle	0	0	0	0	3	f	f	0		
177	DS-Crepey-Skin-Strawberry-8oz	B071H948QW	Crepey Skin Cream Strawberry		DivaStuff	8 oz	0	0	0		8 oz bottle	0	0	0	0	3	f	f	0		
178	TA-Anti-Frizz-Nourishing-Styling-Cream-8oz	B08BSR8ZGN	Anti-Frizz  Cream		TreeActiv	8 oz	0.47	0	0.47		8 oz WL	0	0	0	0	3	f	f	0		
179	TA-Crepey-Skin-Facial-Cleanser-8oz	B07D4DN6BM	Crepey Skin Facial Cleanser		TreeActiv	8 oz	0.29	0	0.29		8 oz WL	0	0	0	0	3	f	f	0		
180	TA-Matcha-Face-Wash-8oz	B07499RYRP	Anti-Aging Matcha Face Wash		TreeActiv	8 oz	0.39	0	0.39		8 oz WL	0	0	0	0	3	f	f	0		
181	TA-Stem-Cell-Daily-Facial-Cleanser-8oz	B081NLXJ78	Stem Cell Daily Facial Cleanser		TreeActiv	8 oz	0	0	0		8 oz WL	0	0	0	0	3	f	f	0		
182	TA-Matcha-Face-Mask-8oz	B076QL5T64	Anti-Aging Matcha Mask		TreeActiv	8 oz	0.37	0	0.37		8 oz WL	0	0	0	0	3	f	f	0		
183	Ayadara-Rose-Stem-Cell-Aloe-Vera-Gel-8oz	B08JQQNMF4	Stem Cell Aloe Gel		Ayadara	8 oz	0	0	0		8 oz WL	0	0	0	0	3	f	f	0		
184	Ayadara-Rose-Stem-Cell-Shampoo-8oz	B08JRPQN2K	Stem Cell Hair Growth Shampoo		Ayadara	8 oz	0	0	0		8 oz WL	0	0	0	0	3	f	f	0		
185	AY-La-Vie-Sage-Rose-Face-Wash-8oz	B08JQP3JRR	Rose Stem Cell Face Wash		Ayadara	8 oz	0	0	0		8 oz WL	0	0	0	0	3	f	f	0		
186	TA-Acne-Body-Lotion-Green-Tea-8oz	B01ETFGW6M	Green Tea Honey Body Lotion		TreeActiv	8 oz	2.35	0	2.35		8 oz WL	0	0	0	0	3	f	f	0		
187	TA-Crepey-Exfoliating-Body-Polish-8oz	B07NBQYCRV	Crepey Skin Exfoliating Body Polish		TreeActiv	8 oz	0.1	0	0.1		8 oz WL	0	0	0	0	3	f	f	0		
188	TA-Four-In-One-Acne-Treatment-8oz	B012BKQ5YG	Four-in-One Acne Treatment	C	TreeActiv	8 oz	6.95	0.21	7.16		8 oz WL	0	0	0	0	3	f	f	0		
189	TA-Exfoliating-Stem-Cell-Body-Scrub-8oz	B081NMN191	Exfoliating Stem Cell Body Scrub		TreeActiv	8 oz	0	0	0		8 oz WL	0	0	0	0	3	f	f	0		
190	TA-Ultra-Hydrating-Body-Lotion-8oz	B07HHBQFQK	Ultra Hydrating Body Lotion		TreeActiv	8 oz	0.39	0	0.39		8 oz WL	0	0	0	0	3	f	f	0		
191	TA-Anti-Aging-Body-Wash-8oz	B0B71CGM7H	TA-Anti-Aging-Body-Wash-8oz	C	TreeActiv	8 oz	3.67	0.38	4.05		8 oz WL	0	0	0	0	5	f	f	0		
192	AY-Boho-Acne-Body-Wash-8oz	B0B6FY55W3	AY-Boho-Acne-Body-Wash-8oz	C	Ayadara	8 oz	3.68	0.2	3.88		8 oz WL	0	0	0	0	5	f	f	0		
193	TA-Crepey-Skin-Repair-Treatment-8oz	B074F45K6P	Crepey Lotion	A	TreeActiv	8 oz	2.53	0.12	2.65	MOFO	8 oz FG	0	0	0	0	3	f	f	0		
194	TA-Dermatitis-Cream-8oz	B08J3TKTX9	Dermatitis Cream	C	TreeActiv	8 oz	3.47	0.26	3.73	MOFO	8 oz WL	0	0	0	0	3	f	f	0		
195	TA-Psoriasis-Cream-8oz	B08J3Y9SZ8	Psoriasis Treatment Cream	B	TreeActiv	8 oz	3.02	0.19	3.21	MOFO	8 oz WL	0	0	0	0	3	f	f	0		
196	AY-Stardust-Sulfur-Scrub-8oz	B08KDGWSC8	exfoliating  face scrub	C	Ayadara	8 oz	7.2	0.59	7.79	MOFO	8 oz WL	0	0	0	0	3	f	f	0		
197	AY-Crepe-Skin-Repair-Treatment-8oz	B08JRTPCSN	Crepe Skin Repair Treatment	A	Ayadara	8 oz	2.4	0.01	2.41	MOFO	8 oz WL	0	0	0	0	3	f	f	0		
198	TA-Stem-Cell-Peptide-Clay-Face-Mask-8oz	B081NHDXJ3	Stem Cell Peptide Clay Face Mask		TreeActiv	8 oz	6.08	0	6.08		8 oz WL	0	0	0	0	3	f	f	0		
199	TA-Cellulite-Scrub-8oz	B01LYNNX7U	Ashwagandha Coffee Cellulite Scrub		TreeActiv	8 oz	0.03	0	0.03		8 oz WL	0	0	0	0	3	f	f	0		
200	WHYZ-Beta-Alanine-Powder-350g	B0BCW35QNF	WHYZ-Beta-Alanine-Powder-350g	C	WHYZ	350g	2.98	0.52	3.5	MOFO	250-350g PWDR	0	0	0	0	5	f	f	0		
201	PS-Bentonite-Clay-5lbs	B088XFKXDW	Bentonite Clay		Purisure	5 lbs	0.46	0	0.46		5lb PWDR	0	0	0	0	5	f	f	0		
202	PS-Citric-Acid-5lbs	B07DLNXG9F	PS-Citric-Acid-5lbs		Purisure	5 lbs	48.73	0	48.73		5lb PWDR	0	0	0	0	5	f	f	0		
203	PS-Organic-Cordyceps-Militaris-6oz	B08C5BYRX3	Cordyceps  Powder	C	Purisure	6 oz	9.79	0	9.79	MOFO	170-225g PWDR	0	0	0	0	5	f	f	0		
204	PS-Wheatgrass-Powder-8oz-Organic	B08C515LPG	Wheat Grass Powder	C	Purisure	8 oz	4.42	0.67	5.09		170-225g PWDR	0	0	0	0	5	f	f	0		
205	WHYZ-Myo-Inositol-Powder-8oz	B0BCWQZ7G9	WHYZ-Myo-Inositol-Powder-8oz	C	WHYZ	8 oz	5.36	0.57	5.93	MOFO	170-225g PWDR	0	0	0	0	5	f	f	0		
206	WHYZ-Organic-Stevia-Powder-8oz	B0BDRSB3V9	WHYZ-Organic-Stevia-Powder-8oz	B	WHYZ	8 oz	9.39	0.86	10.25	MOFO	170-225g PWDR	0	0	0	0	5	f	f	0		
207	PS-ALCAR-250g	B07B1QL1RY	Acetyl L-Carnitine (ALCAR) Powder	C	Purisure	250 g	9.6	0.97	10.57	MOFO	250-350g PWDR	0	0	0	0	5	f	f	0		
208	PS-Green-Tea-Extract-250g	B07YKNHS98	Green Tea Extract Powder	C	Purisure	250 g	4.48	0.94	5.42	MOFO	250-350g PWDR	0	0	0	0	5	f	f	0		
209	NS-Original-Stevia-Liquid-8oz	B018SWE5DY	OG Stevia	A	NatriSweet	8 oz	1.87	0.26	2.13	MOFO	8 fl oz Drops-OG	0	0	0	0	1	f	f	0		
210	NS-Monk-Fruit-Liquid-Drops-8oz	B097TNVJHB	Monk Fruit Liquid/Drop	B	NatriSweet	8 oz	1.29	0.41	1.7	MOFO	8 fl oz Drops	0	0	0	0	2	f	f	0		
211	TA-Acne-Eliminating-Body-Spray-8oz	B01ETGXJVC	Body Spray	B	TreeActiv	8 oz	2.71	0.44	3.15	MOFO	8 oz IHM Spray	0	0	0	0	4	f	f	0		
212	TA-Sleep-Spray-Calming-Lavender-8oz	B08P225MRM	Sleep Spray, Calming Lavender	C	TreeActiv	8 oz	1.72	0.66	2.38	MOFO	8 oz IHM Spray	0	0	0	0	4	f	f	0		
213	AY-Namaste-In-Bed-Sleep-Spray-8oz	B08KDZ8T8Z	Lavender Sleep Spray / Namaste	C	Ayadara	8 oz	1.42	1.04	2.46	MOFO	8 oz IHM Spray	0	0	0	0	4	f	f	0		
214	NS-Monk-Fruit-Stevia-Liquid-Drops-8oz	B097YXS1Z5	Monk Fruit & Stevia Liquid Blend	B	NatriSweet	8 oz	1.34	0.37	1.71	MOFO	8 fl oz Drops	0	0	0	0	2	f	f	0		
215	AY-Fresh-Reset-Fabric-Spray-8oz	B08K19R2CB	Fabric Spray | Lavender	C	Ayadara	8 oz	1.68	0.73	2.41		8 oz IHM Spray	0	0	0	0	4	f	f	0		
216	TA-Hair-Growth-Spray-Grapefruit-8oz	B018KBV96E	Hair Growth  Spray Bamboo	C	TreeActiv	8 oz	1.73	0.41	2.14		8 oz IHM Spray	0	0	0	0	4	f	f	0		
217	TA-Adv-Hand-Sanitizer-Gel-8oz-2-Pack	B08KYLLL47	Advanced Hand Sanitizer Gel		TreeActiv	8oz x 2	0.08	0	0.08		Bundle-2	0	0	0	0	6	f	f	0		
218	BUNDLE-TA-2Step-Cystic-Face-Wash-8oz	B08TJ3F23Q	2-Step Cystic Acne Treatment Kit ( old ??? )		TreeActiv		5.06	0	5.06	MOFO	Bundle-2	0	0	0	0	6	f	f	0		
219	BUNDLE-TA-4Step-Max-Strength-Kit	B08J29JDKK	4-Step Acne Treatment Kit Maximum Strength		TreeActiv	0.25 oz  / 2 oz / 4 oz / 8 oz	8.04	0	8.04	MOFO	Bundle-2	0	0	0	0	6	f	f	0		
220	BUNDLE-TA-Day-Night-Spot-Treatment	B08KWPLJKT	TreeActiv Day and Night Acne Spot Treatment Kit	C	TreeActiv	0.5 oz / 0.5 oz	4.75	0.5	5.25	MOFO	Bundle-2 WL	0	0	0	0	6	f	f	0		
221	TA-Acne-Face-Cleanser-Travel-3.4oz-2Pack	B08W5FLRXG	Charcoal Acne Exfoliating Face Wash	C	TreeActiv	3.4 oz x 2	3.97	0.24	4.21	MOFO	Bundle-2 WL	0	0	0	0	3	f	f	0		
222	AY-Yoga-Mat-Spray-4oz-2-Pack	B08KFFF75L	2-Pack Yoga Mat	C	Ayadara	4 oz x 2	2.46	0.35	2.81	MOFO	Bundle-2 Spray	0	0	0	0	4	f	f	0		
223	BUNDLE-TA-Body-Acne-Treatment-Kit	B09B2NK4W7	Body Acne Treatment Kit	C	TreeActiv	8 oz * 2	6.72	0	6.72		Bundle-2 Spray	0	0	0	0	6	f	f	0		
224	BUNDLE-TA-Crepe-Corrector-Kit	B09B2NGJVN	TreeActiv Crepe Corrector Kit	C	TreeActiv	8 oz /16 oz	7.71	0	7.71		Bundle-2	0	0	0	0	6	f	f	0		
225	AY-Day-Night-Acne-Treatment-Kit	B0B2NZBF92	AY-Day-Night-Acne-Treatment-Kit	B	Ayadara	0.5 x 2	6.28	0.57	6.85		Bundle-2 WL	0	0	0	0	3	f	f	0		
226	TA-Acne-Body-Spray-4oz-2pack	B0B4JQJ5B2	TA-Acne-Body-Spray-4oz-2pack	A	TreeActiv	4 oz x 2	2.22	0.29	2.51	MOFO	Bundle-2 Spray	0	0	0	0	6	f	f	0		
227	TA-Back-Body-Acne-Kit	B0B971H9J6	TA-Back-Body-Acne-Kit	B	TreeActiv	4 oz / 8 oz	5.11	0.23	5.34		Bundle-2 Spray	0	0	0	0	6	f	f	0		
228	TA-Crepe-Skin-Repair-Kit	B0B9BXCC3C	TA-Crepe-Skin-Repair-Kit	C	TreeActiv	8 oz * 2	6.5	0.26	6.76		Bundle-2 WL	0	0	0	0	6	f	f	0		
229	BUNDLE-TA-Milia	B09CDRNWHR	Milia Treatment Kit	C	TreeActiv	4 oz	6.69	0.73	7.42	MOFO	Bundle-2 WL	0	0	0	0	6	f	f	0		
230	BUNDLE-TA-4-Step-Exfo-Max	B08JMC7VH7	4 Step Maximum Strength  Kit ( old ??? )		TreeActiv		4.18	0	4.18	MOFO	Bundle-2	0	0	0	0	6	f	f	0		
231	BUNDLE-TA-4Step-Exfo-Cystic	B08JVJ8KFK	4-Step Cystic Acne Exfoliating Treatment Kit ( old ??? )		TreeActiv		0	0	0		Bundle-2	0	0	0	0	6	f	f	0		
232	BUNDLE-TA-4StepKit-CysticA	B08DFS9FKS	4 Step Kit Cystic Acne ( old ??? )		TreeActiv		0	0	0		Bundle-2	0	0	0	0	6	f	f	0		
233	TA-Cystic-Acne-Spot-Treatment-0.5oz-2Pack	B08NRP3BJD	Cystic Spot Treatment 2pack	C	TreeActiv	0.5 oz x 2	4.3	0.15	4.45	MOFO	Bundle-2 WL	0	0	0	0	3	f	f	0		
234	BUNDLE-TA-3StepKit	B08DDBJ2K6	3 Step		TreeActiv	0.5 oz/ 2 oz/ 3.4 oz	6.25	0	6.25	MOFO	Bundle-4 WL	0	0	0	0	6	f	f	0		
235	BDL-TA-3StepAcneKit-FCreamCysticFW3.4oz	B09B813K19	3 Step	C	TreeActiv	0.5 oz / 2oz / 3.4 oz	6.88	1.38	8.26	MOFO	Bundle-4 WL	0	0	0	0	6	f	f	0		
236	BUNDLE-TA-2Step-Cystic-Face-Wash-3.4oz	B08TJ2GH36	2-Step Acne Treatment Kit	C	TreeActiv	0.5 oz / 3.4 oz	5.13	1.09	6.22	MOFO	Bundle-3 WL	0	0	0	0	6	f	f	0		
237	BUNDLE-TA-2-Step-Exfo-Cystic	B08JWVMD8F	TreeActiv 2-Step Cystic Acne Exfoliating Treatment Kit	C	TreeActiv	0.5 oz /4 oz	6.76	1.13	7.89	MOFO	Bundle-3 WL	0	0	0	0	6	f	f	0		
238	PS-Alpha-GPC-Capsules-2-Pack	B09B32QLS5	2-Pack Alpha GPC Capsules	C	Purisure	2 btls	11.68	0.52	12.2	MOFO	Bundle-3	0	0	0	0	3	f	f	0		
239	PS-Adv-Hand-Sanitizer-Gel-2oz-3-Pack	B08FLPDVWY	Advanced Hand Sanitizer Gel		Purisure	2 oz x 3	0	0	0	MOFO	Bundle-3	0	0	0	0	6	f	f	0		
240	PS-Eucalyptus-Purifying-Spray-2oz-3Pack	B0889M7MDG	Hand Purifying Travel Spray Eucalyptus		Purisure	2 oz x 3	0	0	0	MOFO	Bundle-3	0	0	0	0	6	f	f	0		
241	PS-Hand-Sanitizer-Spray-2oz-3Pack	B08F95F662	Hand Sanitizer Spray		Purisure	2 oz x 3	0	0	0	MOFO	Bundle-3	0	0	0	0	6	f	f	0		
242	TA-Adv-Hand-Sanitizer-Gel-2oz-3Pack	B08DQW48V9	Hand Sanitizer Gel		TreeActiv	2 oz x 3	0	0	0	MOFO	Bundle-3	0	0	0	0	6	f	f	0		
243	TA-Hand-Sanitizer-Spray-2oz-3Pack	B08F8Y3WD5	Hand Sanitizer Spray		TreeActiv	2 oz x 3	0	0	0	MOFO	Bundle-3	0	0	0	0	6	f	f	0		
244	NS-Stevia-Liquid-Tof-2oz-3Pack	B08FRMCFV4	Toffee Stevia Liquid Drops		NatriSweet	2 oz x 3	0	0	0	MOFO	Bundle-3	0	0	0	0	6	f	f	0		
245	BUNDLE-NS-Liq-Stev-Monkfruit-Var	B09KLYGQ3F	Liquid Stevia and Monk Fruit Variety Pack	C	NatriSweet	2 oz/ 2 oz / 8 oz	4.05	0.78	4.83	MOFO	Bundle-3 Drops	0	0	0	0	2	f	f	0		
246	BUNDLE-TA-Blackhead	B09CNS2L98	Blackhead Remover Kit	C	TreeActiv	4 oz	6.54	0.68	7.22	MOFO	Bundle-3 WL	0	0	0	0	6	f	f	0		
247	BUNDLE-TA-3-Step-Exfo-Cystic	B08JWVJYDK	3 Step Cystic Acne Exfoliating Treatment Kit ( old ??? )		TreeActiv	4 oz / 0.25	0	0	0	MOFO	Bundle-3	0	0	0	0	6	f	f	0		
248	BUNDLE-TH-matc-puer-blk-var-4oz	B09LXBB9KH	Instant Tea Powder Bundle	C	Teaki Hut	4 oz x 3	8.13	0.33	8.46	MOFO	Bundle-3 PWDR	0	0	0	0	6	f	f	0		
249	NS-Stevia-Liquid-Orgnl-2oz-3Pack	B08FRM9Y34	Stevia Liquid Drops Original Flavor - 3 Pack	C	NatriSweet	2 oz	2.34	0.38	2.72		Bundle-3 Drops	0	0	0	0	6	f	f	0		
250	PS-Monk-Fruit-Liquid-2oz-3pack	B0B34RTZND	Monk Fruit Liquid 2oz 3 pack	C	Purisure	2 oz	2.54	0.64	3.18		Bundle-3	0	0	0	0	6	f	f	0		
251	NS-Monkfruit-Stevia-Liquid-2oz-3pack	B0B7K7MRXL	NS-Monkfruit-Stevia-Liquid-2oz-3pack	C	NatriSweet	2oz * 3	3.21	0.2	3.41		Bundle-3 Drops	0	0	0	0	6	f	f	0		
252	BDL-TA-2StepAcneKit-FCreamFWash3.4oz	B09B7YSBWM	BDL-TA-2StepAcneKit-FCreamFWash3.4oz	C	TreeActiv	2 oz / 3.5 oz	5.04	0.68	5.72		Bundle-3	0	0	0	0	6	f	f	0		
253	BDL-TA-4StepAcneKit-CysticFSpryFCrmFW3.4	B09B8442YJ	4-Step Acne Treatment Kit	C	TreeActiv	0.5 oz / 2 oz / 3.4 oz / 4 oz	8.37	0.57	8.94	MOFO	Bundle-4	0	0	0	0	6	f	f	0		
254	BUNDLE-TA-Pimple-Tool-Kit	B09B2L9XTT	Pimple Popper Zit Kit	C	TreeActiv	3.4 oz	4.94	0.68	5.62	MOFO	Bundle-3 WL	0	0	0	0	6	f	f	0		
255	BUNDLE-TA-5StepKit	B08DDFHS7L	5 step kit ( old ??? )		TreeActiv	0.25 oz / 0.25 oz / 2 oz / 8 oz / 8 oz	0	0	0	MOFO	Bundle-5	0	0	0	0	6	f	f	0		
256	BUNDLE-TA-5-Step-Acne-Kit	B08J33352W	5 Step Cystic Acne Treatment Kit ( old ??? )		TreeActiv		9.24	0	9.24		Bundle-5	0	0	0	0	6	f	f	0		
257	BUNDLE-TA-5-Step-Max-Strength-Acne-Kit	B08J2LTBV4	5 Step Maximum Strength  Kit ( old ??? )		TreeActiv		7.13	0	7.13		Bundle-5	0	0	0	0	6	f	f	0		
258	BUNDLE-TA-5StepKit-CysticA	B08DFMRPZQ	5 Step Kit Cystic Acne ( old ??? )		TreeActiv		0	0	0		Bundle-5	0	0	0	0	6	f	f	0		
259	NS-Stevia-Liquid-2oz-8oz-5PackSizes	B08FTD1B73	Stevia Liquid Drops Variety Pack		NatriSweet	2 oz x 4 / 8 oz	0	0	0	MOFO	Bundle-5	0	0	0	0	6	f	f	0		
260	BUNDLE-NS-Flav-Liq-Stev-Var-2oz	B09KLZGNYZ	Stevia Liquid Drops Variety Pack	C	NatriSweet	2 oz x 5	3.4	0.13	3.53	MOFO	Bundle-5 Drops	0	0	0	0	6	f	f	0		
261	TA-Adv-Hand-Sanitizer-Gel-2oz-5-Pack	B08DQR26DB	Hand Sanitizer Gel		TreeActiv	2 oz x 5	0	0	0	MOFO	Bundle-5	0	0	0	0	6	f	f	0		
262	NS-Stevia-Liquid-2oz-5Flvrs	B08FSXWRK8	Stevia Liquid Drops Variety Pack		NatriSweet	2 oz x 5	0	0	0	MOFO	Bundle-5	0	0	0	0	6	f	f	0		
263	NS-Stevia-Liquid-Caramel-2oz-5pack	B08FRKKYW3	Caramel Stevia Liquid Drops		NatriSweet	2 oz x 5	0	0	0	MOFO	Bundle-5	0	0	0	0	6	f	f	0		
264	NS-Stevia-Liquid-Chco-2oz-5Pack	B08FRL9BWM	Chocolate Stevia Liquid Drops		NatriSweet	2 oz x 5	0	0	0	MOFO	Bundle-5	0	0	0	0	6	f	f	0		
265	NS-Stevia-Liquid-Orgnl-2oz-5Pack	B08FRJP1LN	Stevia Liquid Drops Original Flavor		NatriSweet	2 oz x 5	3.49	0	3.49	MOFO	Bundle-5	0	0	0	0	6	f	f	0		
266	NS-Stevia-Liquid-Toffee-2oz-5Pack	B08FRJPCWT	Toffee Stevia Liquid Drops		NatriSweet	2 oz x 5	0	0	0	MOFO	Bundle-5	0	0	0	0	6	f	f	0		
267	NS-Stevia-Liquid-Vanilla-2oz-5Pack	B08FRJS4X2	Vanilla Stevia Liquid Drops		NatriSweet	2 oz x 5	0	0	0	MOFO	Bundle-5	0	0	0	0	6	f	f	0		
268	PS-Adv-Hand-Sanitizer-Gel-2oz-5-Pack	B08FLNLK7C	Advanced Hand Sanitizer Gel		Purisure	2 oz x 5	0	0	0	MOFO	Bundle-5	0	0	0	0	6	f	f	0		
269	PS-Hand-Sanitizer-Spray-2oz-5-Pack	B08F8TZ7MT	Hand Sanitizer Spray		Purisure	2 oz x 5	0	0	0	MOFO	Bundle-5	0	0	0	0	6	f	f	0		
270	BDL-TA-5StepAcneKit	B09B8PHJ5V	5-Step Acne Treatment Kit	C	TreeActiv	0.5 oz /  2 oz /  3.4 oz / 4 oz / 4 oz	17.34	0.06	17.4	MOFO	Bundle-6	0	0	0	0	6	f	f	0		
271	BUNDLE-TA-5-Step-Exfo-Cystic	B08JMCBY1R	5 Step Cystic Acne Exfoliating Treatment Kit		TreeActiv	0.5 oz /  2 oz /  3.4 oz / 4 oz / 4 oz	4.18	0	4.18	MOFO	Bundle-6	0	0	0	0	6	f	f	0		
272	PS-Myo-Inositol-250g	B01N0T5CV6	Myo Inositol Powder	C	Purisure	250 g	5.77	0.68	6.45	MOFO	250-350g PWDR	0	0	0	0	5	f	f	0		
273	PS-Beta-Alanine-250g	B00NOZWP88	Beta Alanine	C	Purisure	250 g	2.13	0	2.13	MOFO	250-350g PWDR	0	0	0	0	5	f	f	0		
274	PS-HMB-250g	B01N12LCU0	HMB Powder		Purisure	250 g	0.23	0	0.23	MOFO	250-350g PWDR	0	0	0	0	5	f	f	0		
275	PS-Acerola-Cherry-Powder-8oz	B08C4YYZ2M	Acerola Cherry Powder		Purisure	8 oz	0	0	0	MOFO	170-225g PWDR	0	0	0	0	5	f	f	0		
276	PS-Magnsm-Bisglycinate-Pwdr-250g	B08CK8RFH6	Magnesium Bisglycinate Powder	C	Purisure	250 g	7.89	0.75	8.64	MOFO	250-350g PWDR	0	0	0	0	5	f	f	0		
277	PS-NALT-250g	B01N9JK03Y	N-Acetyl L-Tyrosine (NALT) Powder		Purisure	250 g	0.23	0	0.23	MOFO	250-350g PWDR	0	0	0	0	5	f	f	0		
278	WHYZ-Magnesium-Bisglycinate-10oz	B0BDRYDT9W	WHYZ-Magnesium-Bisglycinate-10oz	C	WHYZ	10 oz	9.14	0	9.14	MOFO	170-225g PWDR	0	0	0	0	5	f	f	0		
279	WHYZ-Tongkat-Ali-Powder-4oz	B0CL9SZQPV	WHYZ-Tongkat-Ali-Powder-4oz	C	WHYZ	4 oz	3.31	0	3.31	MOFO	100-150g PWDR	0	0	0	0	5	f	f	0		
280	WHYZ-Green-Coffee-Bean-Powder-125g	B0BFRK1ZDS	WHYZ-Green-Coffee-Bean-Powder-125g	C	WHYZ	125 g	4.19	0	4.19	MOFO	100-150g PWDR	0	0	0	0	5	f	f	0		
281	WHYZ-Organic-Matcha-Powder-125g	B0BFXL2HFP	WHYZ-Organic-Matcha-Powder-125g	C	WHYZ	125 g	4.75	0	4.75	MOFO	100-150g PWDR	0	0	0	0	5	f	f	0		
282	WHYZ-Organic-WheatGrass-Powder-300g	B0BFYMSYF4	WHYZ-Organic-WheatGrass-Powder-300g	C	WHYZ	300 g	5.61	0	5.61	MOFO	250-350g PWDR	0	0	0	0	5	f	f	0		
284	WHYZ-Organic-Spirulina-Powder-250g	B0BFYRRCS4	WHYZ-Organic-Spirulina-Powder-250g	C	WHYZ	250 g	3.87	0	3.87	MOFO	250-350g PWDR	0	0	0	0	5	f	f	0		
285	TA-Milia-Face-Scrub-4oz	B0BG9461C8	TA-Milia-Face-Scrub-4oz		TreeActiv	4 oz	0	0	0	MOFO	2-4 oz WL	0	0	0	0	3	f	f	0		
286	PS-Beta-Alanine-500g	B01L7KT070	PS-Beta-Alanine-500g	C	Purisure	500 g	4.11	0	4.11	MOFO	16oz/500g PWDR	0	0	0	0	5	f	f	0		
287	WHYZ-L-Theanine-Powder-125g	B0BJ119CWH	WHYZ-L-Theanine-Powder-125g	C	WHYZ	125 g	3.52	0	3.52	MOFO	100-150g PWDR	0	0	0	0	5	f	f	0		
288	WHYZ-VitaminC-Powder-500g	B0BJ11Z3R4	WHYZ-VitaminC-Powder-500g	C	WHYZ	500g	4.32	0	4.32	MOFO	16oz/500g PWDR	0	0	0	0	5	f	f	0		
289	TA-Milia-Patches-5pack	B0BVRKQ12T	TA-Milia-Patches-5pack	C	TreeActiv		1.78	0.48	2.26	MOFO	Bundle-5 WL	0	0	0	0	5	f	f	0		
290	TA-Milia-Spot-Treatment-2pck	B0C1WDMDX6	TA-Milia-Spot-Treatment-2pck		TreeActiv	0.5 oz x 2	5.77	0	5.77	MOFO	Bundle-3	0	0	0	0	\N	f	f	0		
293	TA-acne-milia-spot-treatment-pk2	B0C875HCLJ	TA-acne-milia-spot-treatment-pk2	B	TreeActiv	0.5 oz x 2	5.81	0.18	5.99	MOFO	Bundle-2 WL	0	0	0	0	\N	f	f	0		
294	TA-acne-milia-spot-treatment-0.5oz-FBM	B0CDGQWBSL	TA-acne-milia-spot-treatment-0.5oz-FBM	C	TreeActiv	0.5 oz /  2 oz /  3.4 oz / 4 oz / 4 oz	2.8	0	2.8	WPP	0.5 oz FG	0	0	0	0	\N	f	f	0		
295	StandMore-Portable-Standing-Desk	B0C8T9RG6B	StandMore Portable Standing Desk	A	StandMore		70	0	70	WPP	Standmore	0	0	0	0	\N	f	f	0		
296	AY-Acne-Body-Spray-4oz-3pack	B0CFF17X29	Ayadara Acne Body Spray 4oz 3 pack	B	Ayadara	4 oz x 3	3.15	0	3.15	MOFO	Bundle-3 Spray	0	0	0	0	\N	f	f	0		
297	NS-Premium-Stevia-Powder-4oz	B0CFV11R7N	NS Premium Stevia Powder 4oz	C	NatriSweet	4 oz	5.45	0	5.45	MOFO	100-150g PWDR	0	0	0	0	\N	f	f	0		
298	WHYZ-MyoInositol-Powder-8oz	B0CFTXNZJZ	WHYZ Myo-Inositol Powder 8oz	B	WHYZ	8 oz	5.36	0	5.36	MOFO	170-225g PWDR	0	0	0	0	\N	f	f	0		
299	WHYZ-Stevia-Liquid-Drops-8oz	B0CGLMBNDZ	WHYZ Stevia Liquid 8oz	A	WHYZ	8 oz	1.47	0	1.47	MOFO	8 fl oz Drops-OG	0	0	0	0	\N	f	f	0		
300	TA-MiliaSpot-ToolKit-Patches-BDL	B0CHK4JF89	TreeActiv Milia Remover Kit - Spot, Patches, Toolkit	A	TreeActiv		5.29	0	5.29	WPP	Bundle-3 WL	0	0	0	0	\N	f	f	0		
292	TA-Acne-Body-Spray-4oz	B0CP838DW7	TA-Acne-Body-Spray-4oz - SINGLE BOTTLE		TreeActiv	4 oz	0.99	0	0.99	MOFO	4 oz IHM Spray	0	0	0	0	\N	f	f	0	Active	
301	TA-Acne-Scar-Cream-RE-Launch	B0CS6SCC13	TreeActiv Acne Scar Cream (RE-Launch)	PLC-2024	TreeActiv	2 oz	1.86	0	1.86	MOFO	2-4 oz WL	0	0	0	0	\N	f	f	0		
302	TA-Acne-Body-Wash-8oz-NEW	B0CSPC847D	TreeActiv Acne Body Wash (RE-Launch)	PLC-2024	TreeActiv	8 oz	3.62	0	3.62	MOFO	8 oz WL	0	0	0	0	\N	f	f	0		
303	TA-Crepey-Skin-Treatment-2pack	B0CSNN469G	TreeActiv Crepey Skin Treatment 2-pack	A	TreeActiv		4.8	0	4.8	MOFO	Bundle-2 WL	0	0	0	0	\N	f	f	0		
304	TA-After-Shave-Treatment	B0CSPJKV9M	TreeActiv Aftershave Razor Bump & Ingrown Hair Treatment (Spray) 8oz	PLC-2024	TreeActiv		3.26	0	3.26	MOFO	8 oz IHM Spray	0	0	0	0	\N	f	f	0		
305	TA-milia-acne-spot-treatment-0.5oz	B0CLVS67FY	TreeActiv Milia Spot Treatment 0.5oz	A	TreeActiv	5 oz	2.58	0	2.58	MOFO	0.5 oz FG	0	0	0	0	\N	f	f	0		
306	TA-Rough-Bumpy-Skin-Lotion	B0CSSZFCB8	TreeActiv Rough and Bumpy Skin Lotion	PLC-2024	TreeActiv		2.68	0	2.68	MOFO	8 oz WL	0	0	0	0	\N	f	f	0		
307	NS-Stevia-Liquid-Drops-8oz-2pck	B0CVH18ZD5	NatriSweet Stevia Liquid Drops 8oz - 2pack	A	NatriSweet		3.75	0	3.75	MOFO	Bundle-2 Drops	0	0	0	0	\N	f	f	0		
308	NS-Stevia-Liquid-Drops-4oz	B0CVGJMWGJ	NatriSweet Stevia Liquid Drops 4oz	C	NatriSweet		1.15	0	1.15	MOFO	4 fl oz Drops-OG	0	0	0	0	\N	f	f	0		
309	NS-Stevia-Liquid-Drops-4oz-2pck	B0CVGHBWT8	NatriSweet Stevia Liquid Drops 4oz - 2pack	B	NatriSweet		2.31	0	2.31	MOFO	Bundle-2 Drops	0	0	0	0	\N	f	f	0		
310	TA-Salicylic-Acid-Cystic-Acne-Spot-Treatment	B0CWGJN9GP	TreeActiv Salicylic Acid Cystic Acne Spot Treatment 0.5	PLC-2024	TreeActiv		2.58	0	2.58	MOFO	0.5 oz FG	0	0	0	0	\N	f	f	0		
311	TN-Organic-Monk-Fruit-4.5oz	B0CZ25H5LD	Tejonova Organic Monk Fruit 4.5oz	B	Tejonova	4.5oz	8.76	0	8.76	MOFO	100-150g PWDR-MF	0	0	0	0	\N	f	f	0		
312	TN-Liquid-Stevia-Drops-8oz	B0CZDJ4K8N	Tejonova Stevia Liquid Drops 8oz	B	Tejonova	8oz	2.07	0	2.07	MOFO	8 fl oz Drops-OG	0	0	0	0	\N	f	f	0		
313	TN-Liquid-Stevia-Drops-2oz	B0CZDRCVFQ	Tejonova Stevia Liquid Drops 2oz	C	Tejonova	2oz	0.7	0	0.7	MOFO	2 fl oz Drops-OG	0	0	0	0	\N	f	f	0		
314	TN-Organic-Stevia-Extract-1oz	B0CZDRK3WC	Tejonova Organic Stevia Extract 1oz	C	Tejonova	1oz	1.87	0	1.87	MOFO	10-50g PWDR	0	0	0	0	\N	f	f	0		
315	TN-Organic-Stevia-Extract-5oz	B0CZDRQHBZ	Tejonova Organic Stevia Extract 5oz	C	Tejonova	5oz	6.95	0	6.95	MOFO	100-150g PWDR	0	0	0	0	\N	f	f	0		
316	SAMPLE-Stevia-Powder-2oz	SMPSTPW2OZ	Sample Stevia Powder 5oz			2oz	2.73	0	2.73	MOFO		0	0	0	0	\N	f	f	0		
317	TN-Organic-Monk-Fruit-1oz	B0CZ9DD9GG	Tejonova Organic Monk Fruit 1oz	C	Tejonova	1oz	3.04	0	3.04	MOFO	10-50g PWDR	0	0	0	0	\N	f	f	0		
318	RM-PWD-ALCAR-1KG	PWALCAR1KG	RM-PWD-ALCAR-1KG		PMP	1kg	36.5	0	36.5	MOFO	1kg PWDR	0	0	0	0	\N	f	f	0		
319	RM-PWD-MONK-FRUIT-1KG	PWMNKFR1KG	RM-PWD-MONK-FRUIT-1KG		PMP	1kg	57.65	0	57.65	MOFO	1kg PWDR	0	0	0	0	\N	f	f	0		
322	RM-PWD-L-Citrulline-Malate-1KG	PWCITMA1KG	RM-PWD-L-Citrulline-Malate-1KG		PMP	1kg	11.48	0	11.48	MOFO	1kg PWDR	0	0	0	0	\N	f	f	0		
323	RM-PWD-Black-Tea-Extract-25kg	PWBLKTE25KG	RM-PWD-Black-Tea-Extract 25kg		PMP	25kg	225	0	225	MOFO	25kg PWDR	0	0	0	0	\N	f	f	0		
324	RM-PWD-Black-Tea-Extract-10kg	PWBLKTE10KG	RM-PWD-Black-Tea-Extract 10kg		PMP	10kg	90	0	90	MOFO	10kg PWDR	0	0	0	0	\N	f	f	0		
325	PS-Methylene-Blue-Powder-5g	B0D3QF1FV7	Methylene Blue Powder 5g	PLC-2024	Purisure	5g	2.95	0	2.95	MOFO	1-10g PWDR	0	0	0	0	\N	f	f	0		
321	RM-PWD-L-Citrulline-Malate-20KG	PWCITMA20K	RM-PWD-L-Citrulline-Malate-20KG		PMP	20kg	229.5	0	229.5	MOFO	20kg PWDR	0	0	0	0	\N	f	f	0	Hibernated	
326	TA-Acne-Eliminating-Face-Cleanser-DS	B0DFWMZJ4K	Acne Eliminating Face Cleanser (DS) 8oz		TreeActiv	8oz	4.86	0	4.86	WPP	8 oz FG	0	0	0	0	\N	f	f	0		
327	TA-Invisible-Spot-Treatment-DS	B0D7W1TT8G	Invisible Acne Spot Treatment (DS)	PLC-2024	TreeActiv	0.5oz	2.18	0	2.18	WPP	0.5 oz FG	0	0	0	0	\N	f	f	0		
328	TA-Acne-Face-Cream-2oz-DS	B0D87KN31Q	Acne Eliminating Face Cream 2oz (DS)	PLC-2024	TreeActiv	2oz	3.3	0	3.3	WPP	2-4 oz FG	0	0	0	0	\N	f	f	0		
329	TA-Crepey-Skin-Treatment-8oz-DS	B0D83TP4R3	Crepey Skin Repair Treatment OG (DS) 8oz	C	TreeActiv	8oz	6.02	0	6.02	WPP	8 oz FG	0	0	0	0	\N	f	f	0		
330	SAMPLE-Stevia-Powder-1oz	SMPSTPW1OZ	Sample Stevia Powder 1oz		PMP	1oz	1.36	0	1.36	MOFO		0	0	0	0	\N	f	f	0		
331	SAMPLE-Monk-Fruit-Powder-1oz	SMPMFPW1OZ	Sample Monk Fruit Powder 1oz		PMP	1oz	1.74	0	1.74	MOFO		0	0	0	0	\N	f	f	0		
332	RM-PWD-Beta-Alanine-Powder-1kg	PWBETALA1KG	RM-PWD-Beta-Alanine-Powder-1kg		PMP	1kg	7.3	0	7.3	MOFO	1kg PWDR	0	0	0	0	\N	f	f	0		
333	RM-PWD-Black-Tea-Powder-1kg	PWBLKTEA1KG	RM-PWD-Black-Tea-Powder-1kg		PMP	1kg	9	0	9	MOFO	1kg PWDR	0	0	0	0	\N	f	f	0		
334	RM-PWD-Organic-Stevia-TSG90-1kg	PWSTV95TS1KG	RM-PWD-Organic-Stevia-TSG90-1kg		PMP	1kg	0	0	0	MOFO	1kg PWDR	0	0	0	0	\N	f	f	0		
335	RM-PWD-Potassium-Sorbate-Powder-5kg	PWPOTAS5KG	RM-PWD-Potassium-Sorbate-Powder-5kg		PMP	5kg	79.41	0	79.41	MOFO	5kg PWDR	0	0	0	0	\N	f	f	0		
336	RM-PWD-Salicylic-Acid-Powder-1kg	PWSALACD1KG	RM-PWD-Salicylic-Acid-Powder-1kg		PMP	1kg	11.13	0	11.13	MOFO	1kg PWDR	0	0	0	0	\N	f	f	0		
337	RM-PWD-Salicylic-Acid-Powder-20kg	PWSALACD20KG	RM-PWD-Salicylic-Acid-Powder-20kg		PMP	20kg	222.67	0	222.67	MOFO	20kg PWDR	0	0	0	0	\N	f	f	0		
320	RM-PWD-STEVIA-SG95-1KG	PWSTV95SG1KG	RM-PWD-STEVIA-SG95-1KG		PMP	1kg	44	0	44	MOFO	1kg PWDR	0	0	0	0	\N	f	f	0	PMP	
338	NS-Organic-Monkfruit-Liquid-Drops-8oz	B0DBTXGT93	Organic Stevia Liquid Drops 8oz	PLC-2024	NatriSweet	8oz	4.54	0	4.54	MOFO	8 fl oz Drops	0	0	0	0	\N	f	f	0		
339	NS-Organic-Stevia-Liquid-Drops-8oz	B0DBVGV5S2	Organic Monk Fruit Drops 8oz	PLC-2024	NatriSweet	8oz	3.56	0	3.56	MOFO	8 fl oz Drops	0	0	0	0	\N	f	f	0		
340	TN-Monk-Fruit-Sweetener-Powder-1oz	B0DBVJY2ZC	Monk Fruit Sweetener Powder 1oz	PLC-2024	Tejonova	1oz	1.48	0	1.48	MOFO	10-50g PWDR	0	0	0	0	\N	f	f	0		
341	TN-Monk-Fruit-Sweetener-Powder-5oz	B0DBV9BBP2	Monk Fruit Sweetener Powder 5oz	PLC-2024	Tejonova	5oz	4.63	0	4.63	MOFO	100-150g PWDR	0	0	0	0	\N	f	f	0		
342	TN-Monk-Fruit-Sweetener-Powder-1lb	B0DBVBFQHD	Monk Fruit Sweetener Powder 1 lb	PLC-2024	Tejonova	1lb	12.29	0	12.29	MOFO	16oz/500g PWDR	0	0	0	0	\N	f	f	0		
343	RM-PWD-MyoInositol-1kg	PWMYOINO1KG	RM-PWD-MyoInositol-1kg		PMP	1kg	21.85	0	21.85	MOFO	1kg PWDR	0	0	0	0	\N	f	f	0		
344	RM-PWD-Tea-MatchGreen-1kg	PWMCHAGRN1KG	RM-PWD-Tea-MatchGreen-1kg		PMP	1kg	35	0	35	MOFO	1kg PWDR	0	0	0	0	\N	f	f	0		
345	RM-PWD-Citicoline-Sodium-1kg	PWCITSOD1KG	RM-PWD-Citicoline-Sodium-1kg		PMP	1kg	187	0	187	MOFO	1kg PWDR	0	0	0	0	\N	f	f	0		
346	RM-PWD-Black-Tea-Powder-5kg	PWBLKTEA5KG	RM-PWD-Black-Tea-Powder-5kg		PMP	5kg	45	0	45	MOFO	5kg PWDR	0	0	0	0	\N	f	f	0		
347	RM-PWD-Potassium-Sorbate-Powder-1kg	PWPOTAS1KG	RM-PWD-Potassium-Sorbate-Powder-1kg		PMP	1kg	15.88	0	15.88	MOFO	1kg PWDR	0	0	0	0	\N	f	f	0		
348	RM-PWD-Organic-Stevia-TSG90-3kg	PWSTV90TS3KG	RM-PWD-Organic-Stevia-TSG90-3kg		PMP	3kg	117.52	0	117.52	MOFO	3kg PWDR	0	0	0	0	\N	f	f	0		
349	RM-PWD-Organic-Stevia-TSG90-5kg	PWSTV90TS5KG	RM-PWD-Organic-Stevia-TSG90-5kg		PMP	5kg	195.87	0	195.87	MOFO	5kg PWDR	0	0	0	0	\N	f	f	0		
350	RM-PWD-Salicylic-Acid-Powder-5kg	PWSALACD5KG	RM-PWD-Salicylic-Acid-Powder-5kg		PMP	5kg	55.67	0	55.67	MOFO	5kg PWDR	0	0	0	0	\N	f	f	0		
351	RM-PWD-MONK-FRUIT-20KG	PWMNKFR20KG	RM-PWD-MONK-FRUIT-20KG		PMP	20	1152.96	0	1152.96	MOFO	20kg PWDR	0	0	0	0	\N	f	f	0		
352	RM-PWD-MONK-FRUIT-5KG	PWMNKFR5KG	RM-PWD-MONK-FRUIT-5KG		PMP	5kg	288.24	0	288.24	MOFO	5kg PWDR	0	0	0	0	\N	f	f	0		
353	RM-PWD-Magnesium-Bisglycinate-Chelate-1kg	PWMAGBIS1KG	RM-PWD-Magnesium-Bisglycinate-Chelate-1kg		PMP	1kg	30.63	0	30.63	MOFO	1kg PWDR	0	0	0	0	\N	f	f	0		
354	RM-PWD-L-Theanine-1kg	PWLTHEA1KG	RM-PWD-L-Theanine-1kg		PMP	1kg	23.5	0	23.5	MOFO	1kg PWDR	0	0	0	0	\N	f	f	0		
355	RM-PWD-Spirulina-Organic-10kg	PWSPIRU10KG	RM-PWD-Spirulina-Organic-10kg		PMP	1kg	136.5	0	136.5	MOFO	10kg PWDR	0	0	0	0	\N	f	f	0		
356	WHYZ-Organic-Spirulina-250g	B0DF7VD6PZ	WHYZ Organic Spirulina Powder 250g	PLC-2024	WHYZ	200g	3.91	0	3.91	MOFO	250-350g PWDR	0	0	0	0	\N	f	f	0		
357	WHYZ-Organic-Matcha-125g	B0DF7TTBVK	WHYZ Organic Matcha Powder 125g	PLC-2024	WHYZ	125g	4.75	0	4.75	MOFO	100-150g PWDR	0	0	0	0	\N	f	f	0		
358	WHYZ-Black-Tea-Powder-4.5oz	B0DFCJCQXS	WHYZ Black Tea Powder 4.5oz	PLC-2024	WHYZ	4.5oz	1.56	0	1.56	MOFO	100-150g PWDR	0	0	0	0	\N	f	f	0		
359	TA-Acne-Body-Spray-8oz-DS-New	B0DBRH4D1G	TA-Acne-Body-Spray-8oz-DS-New	PLC-2024	TreeActiv	8oz	3.67	0	3.67	WPP	8 oz FG	0	0	0	0	\N	f	f	0		
360	TA-Crepey-Skin-Treatment-8oz-DS-New	B0DBRL8TRW	TA-Crepey-Skin-Treatment-8oz-DS-New	PLC-2024	TreeActiv	8oz	6.02	0	6.02	WPP	8 oz FG	0	0	0	0	\N	f	f	0		
283	WHYZ-Organic-Cordyceps-Powder-200g	B0DFYD8L6N	WHYZ-Organic-Cordyceps-Powder-200g	C	WHYZ	200g	11.13	0	11.13	MOFO	250-350g PWDR	0	0	0	0	\N	f	f	0	Active	
361	WHYZ-Caffeine-Theanine-Capsules	B0DG5LFWTT	WHYZ-Caffeine-Theanine-Capsules	PLC-2024	WHYZ	120 caps	4.85	0	4.85	MOFO	Caps WL	0	0	0	0	\N	f	f	0		
362	WHYZ-Organic-Wheat-Grass-Powder-300g	B0DG5PHF23	WHYZ-Organic-Wheat-Grass-Powder-300g	PLC-2024	WHYZ	300g	5.61	0	5.61	MOFO	250-350g PWDR	0	0	0	0	\N	f	f	0		
363	AY-Savior-Scrub-4oz	B0DGQ4QVGB	Sulfur & Bentonite Clay Acne Face Scrub 4oz	PLC-2024	Ayadara	4oz	4.24	0	4.24	MOFO	2-4 oz WL	0	0	0	0	\N	f	f	0		
364	AY-Spot-Savior-Treatment-0.5oz	B0DGQ2L5VM	Acne Spot Treatment 0.5oz	PLC-2024	Ayadara	0.5oz	2.68	0	2.68	MOFO	0.5 oz WL	0	0	0	0	\N	f	f	0		
365	AY-Face-Savior-Acne-Moisturizer-2oz	B0DGPZNL29	Salicylic Acid Acne Face Cream 2oz	PLC-2024	Ayadara	2oz	2.98	0	2.98	MOFO	2-4 oz WL	0	0	0	0	\N	f	f	0		
366	TA-Acne-Patches-2PC	TAPATCH2PC	TA-Acne-Patches-2PC		PMP		0.58	0	0.58	MOFO		0	0	0	0	\N	f	f	0		
\.


--
-- Data for Name: finished_goods_change_log; Type: TABLE DATA; Schema: public; Owner: derrek
--

COPY public.finished_goods_change_log (id, finished_goods_id, field_name, old_value, new_value, changed_at, changed_by) FROM stdin;
\.


--
-- Data for Name: finished_goods_history; Type: TABLE DATA; Schema: public; Owner: derrek
--

COPY public.finished_goods_history (id, finished_goods_id, isku, common_name, total_unit_cost, status, recorded_at) FROM stdin;
\.


--
-- Data for Name: finished_goods_inventory; Type: TABLE DATA; Schema: public; Owner: derrek
--

COPY public.finished_goods_inventory (id, isku, brand, phx_class, theoretical_qty, location, actual_count, date_counted, uom, mfg_after_date_counted, received_qty_after_actual_count, fo_after_date_counted, fo_after_date_counted_from_bundles, ihf_after_date_counted, duplicate, asin, fba_veloz_ranking, past_30_mo, past_30_fo, manufactured_fulfilled, theo_count_static, actual_count_2, date_counted_2, warehouse_remarks, variance, not_in_wir_fg, category) FROM stdin;
1	NS-Stevia-Powder-4oz-Organic	NatriSweet	B	166	3-1	167	2024-10-04 00:00:00	Units	0	0	0	0	1	f	B01N7FYVEM	166	0	0	0	0	167	2024-10-04 00:00:00		0	RM-PWD-Black-Tea-Powder-5kg	Natrisweet Powders
2	NS-Premium-Stevia-Powder-4oz	NatriSweet	C	0		34	2024-10-04 00:00:00	Units	0	0	150	0	0	f	B0CFV11R7N	0	150	150	0	0	34	2024-10-04 00:00:00		0	RM-PWD-Salicylic-Acid-Powder-5kg	Natrisweet Powders
3	NS-Original-Stevia-Liquid-8oz	NatriSweet	A	134	1-2	150	2024-10-04 00:00:00	Units	0	0	0	0	16	f	B018SWE5DY	0	10915	5920	4995	0	150	2024-10-04 00:00:00		0	RM-PWD-MONK-FRUIT-5KG	Natrisweet Liquid Sweeteners
4	NS-Monk-Fruit-Liquid-Drops-8oz	NatriSweet	B	101	1-2	103	2024-10-04 00:00:00	Units	0	0	0	0	2	f	B097TNVJHB	0	0	0	0	0	103	2024-10-04 00:00:00		0	RM-PWD-Magnesium-Bisglycinate-Chelate-1kg	Natrisweet Liquid Sweeteners
5	NS-Monk-Fruit-Stevia-Liquid-Drops-8oz	NatriSweet	B	128	2-1	128	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B097YXS1Z5	128	0	0	0	0	128	2024-10-04 00:00:00		0	RM-PWD-L-Theanine-1kg	Natrisweet Liquid Sweeteners
6	NS-Organic-Stevia-Liquid-Drops-8oz	NatriSweet	PLC-2024	0		0	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B0DBVGV5S2	0	0	0	0	0	0	2024-10-04 00:00:00		0	RM-PWD-Spirulina-Organic-10kg	Natrisweet Liquid Sweeteners
7	NS-Organic-Monkfruit-Liquid-Drops-8oz	NatriSweet	PLC-2024	40		41	2024-10-04 00:00:00	Units	0	0	0	0	1	f	B0DBTXGT93	40	0	0	0	0	41	2024-10-04 00:00:00		0	RM-PWD-Organic-Stevia-TSG90-5kg	Natrisweet Liquid Sweeteners
8	NS-Stevia-Liquid-Vanilla-2oz	NatriSweet		566	1-1	568	2024-10-04 00:00:00	Units	0	0	0	0	2	f	B018RVKWAG	566	0	0	0	0	568	2024-10-04 00:00:00		0	TA-Acne-Patches-2PC	Natrisweet Liquid Sweeteners
9	NS-Toffee-Stevia-Liquid-2oz	NatriSweet		431		431	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B018RXGGTA	431	0	0	0	0	431	2024-10-04 00:00:00		0	RM-PWD-Spirulina-Powder-5kg	Natrisweet Liquid Sweeteners
10	NS-Monk-Fruit-Stevia-Blend-4X-4oz	NatriSweet	C	4		4	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B07RWYTR67	4	0	0	0	0	4	2024-10-04 00:00:00		0		Natrisweet Liquid Sweeteners
11	NS-Stevia-Liquid-Drops-4oz	NatriSweet	C	55		56	2024-10-04 00:00:00	Units	0	0	0	0	1	f	B0CVGJMWGJ	55	0	0	0	0	56	2024-10-04 00:00:00		0		Stevia/Monk Fruit Liquid Bundles
12	NS-Stevia-Liquid-Drops-4oz-2pck	NatriSweet	B	81		85	2024-10-04 00:00:00	Units	0	0	0	0	4	f	B0CVGHBWT8	81	400	400	0	0	85	2024-10-04 00:00:00		0		Stevia/Monk Fruit Liquid Bundles
13	NS-Stevia-Liquid-Drops-8oz-2pck	NatriSweet	A	6		8	2024-10-04 00:00:00	Units	0	0	0	0	2	f	B0CVH18ZD5	6	500	496	4	0	8	2024-10-04 00:00:00		0		Stevia/Monk Fruit Liquid Bundles
14	BUNDLE-NS-Flav-Liq-Stev-Var-2oz	NatriSweet	C	3	3-1	3	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B09KLZGNYZ	0	0	0	0	0	3	2024-10-04 00:00:00		0		Stevia/Monk Fruit Liquid Bundles
15	NS-Monkfruit-Stevia-Liquid-2oz-3pack	NatriSweet	C	0		0	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B0B7K7MRXL	0	0	0	0	0	0	2024-10-04 00:00:00		0		Stevia/Monk Fruit Liquid Bundles
16	NS-Stevia-Liquid-Orgnl-2oz-3Pack	NatriSweet	C	10		10	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B08FRM9Y34	10	0	0	0	0	10	2024-10-04 00:00:00		0		Stevia/Monk Fruit Liquid Bundles
17	PS-Monk-Fruit-Extract-125g-Organic	Purisure	A	114	7-3	117	2024-10-04 00:00:00	Units	0	0	0	0	3	f	B07PMLB7SP	0	0	0	0	0	117	2024-10-04 00:00:00		0		Purisure Powders
18	PS-Stevia-Powder-125g-Organic	Purisure	A	67		69	2024-10-04 00:00:00	Units	0	0	0	0	2	f	B00LFSOSRM	67	0	0	0	0	69	2024-10-04 00:00:00		0		Purisure Powders
19	PS-Black-Tea-Powder-125g	Purisure	A	22		22	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B0B7RY2SXG	22	690	690	0	0	22	2024-10-04 00:00:00		0		Purisure Powders
20	PS-Iced-Tea-4oz	Purisure	A	114		117	2024-10-04 00:00:00	Units	0	0	0	0	3	f	B00U324G6Y	0	3040	2940	100	0	117	2024-10-04 00:00:00		0		Purisure Powders
21	PS-Green-Tea-Extract-250g	Purisure	C	6		6	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B07YKNHS98	0	0	0	0	0	6	2024-10-04 00:00:00		0		Purisure Powders
22	PS-Green-Coffee-Bean-Extract-150g	Purisure	B	84		84	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B08C4VYDJN	0	0	0	0	0	84	2024-10-04 00:00:00		0		Purisure Powders
23	PS-Dihydromyricetin-DHM-100g	Purisure	A	3	1-7	3	2024-10-04 00:00:00	Units	400	0	400	0	0	f	B07RCVVX4R	0	400	400	0	0	3	2024-10-04 00:00:00		0		Purisure Powders
24	PS-Myo-Inositol-250g	Purisure	C	26		26	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B01N0T5CV6	26	0	0	0	0	26	2024-10-04 00:00:00		0		Purisure Powders
25	PS-Myo-Inositol-1kg	Purisure	C	9	1-7	9	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B07D41F8GD	0	0	0	0	0	9	2024-10-04 00:00:00		0		Purisure Powders
26	PS-Citrulline-Malate-250g	Purisure	C	25	3-7	25	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B00NOZG7CS	0	0	0	0	0	25	2024-10-04 00:00:00		0		Purisure Powders
27	PS-Citrulline-Malate-1kg	Purisure	C	1		1	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B07B1M5SD3	0	0	0	0	0	1	2024-10-04 00:00:00		0		Purisure Powders
28	PS-CDP-Choline-10g	Purisure	C	9		9	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B01LWQHD96	9	0	0	0	0	9	2024-10-04 00:00:00		0		Purisure Powders
29	PS-CDP-Choline-50g	Purisure	B	22		22	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B01LWQHBXA	0	0	0	0	0	22	2024-10-04 00:00:00		0		Purisure Powders
30	PS-Shilajit-25g	Purisure	C	99		99	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B07DNKN94L	99	0	0	0	0	99	2024-10-04 00:00:00		0		Purisure Powders
31	PS-Shilajit-100g	Purisure	A	18		18	2024-10-04 00:00:00	Units	200	0	200	0	0	f	B07D426F92	0	200	200	0	0	18	2024-10-04 00:00:00		0		Purisure Powders
32	PS-L-Theanine-100g	Purisure	C	8		9	2024-10-04 00:00:00	Units	0	0	0	0	1	f	B07DNKPXJ7	0	0	0	0	0	9	2024-10-04 00:00:00		0		Purisure Powders
33	PS-Organic-Spirulina-16oz	Purisure	C	66		66	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B0B68FBPQG	66	0	0	0	0	66	2024-10-04 00:00:00		0		Purisure Powders
34	PS-Vitamin-C-250g	Purisure	C	22		22	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B01N1G55Q8	22	0	0	0	0	22	2024-10-04 00:00:00		0		Purisure Powders
35	PS-Vitamin-C-1kg	Purisure	C	0		0	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B01NA6978W	0	0	0	0	0	0	2024-10-04 00:00:00		0		Purisure Powders
36	PS-Alpha-GPC-25g	Purisure	C	27		27	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B07B1GDVT1	0	0	0	0	0	27	2024-10-04 00:00:00		0		Purisure Powders
37	PS-Alpha-GPC-100g	Purisure	C	3		3	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B07B1PS9PP	3	0	0	0	0	3	2024-10-04 00:00:00		0		Purisure Powders
38	PS-Agmatine-100g	Purisure	C	0		0	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B06Y5W4DMN	0	0	0	0	0	0	2024-10-04 00:00:00		0		Purisure Powders
39	PS-ALCAR-250g	Purisure	C	10		10	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B07B1QL1RY	10	0	0	0	0	10	2024-10-04 00:00:00		0		Purisure Powders
40	PS-Beta-Alanine-1kg	Purisure	C	0		0	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B01L7KT048	0	0	0	0	0	0	2024-10-04 00:00:00		0		Purisure Powders
41	PS-Organic-Cordyceps-Militaris-6oz	Purisure	C	0		0	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B08C5BYRX3	0	0	0	0	0	0	2024-10-04 00:00:00		0		Purisure Powders
42	PS-Longjack-200:1-100g	Purisure	C	83		83	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B01M6CJM8U	0	0	0	0	0	83	2024-10-04 00:00:00		0		Purisure Powders
43	PS-Organic-Wheat-Grass-150g	purisure	C	0		0	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B0B5LKN9BT	0	0	0	0	0	0	2024-10-04 00:00:00		0		Purisure Powders
44	PS-Wheatgrass-Powder-8oz-Organic	Purisure	C	0		0	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B08C515LPG	0	0	0	0	0	0	2024-10-04 00:00:00		0		Purisure Powders
45	PS-Magnsm-Bisglycinate-Pwdr-250g	Purisure	C	50		50	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B08CK8RFH6	50	0	0	0	0	50	2024-10-04 00:00:00		0		Purisure Powders
46	PS-Methylene-Blue-Powder-5g	Purisure	PLC-2024	9		9	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B0D3QF1FV7	9	0	0	0	0	9	2024-10-04 00:00:00		0		Purisure Powders
47	PS-Monk-Fruit-Stevia-Blend-4X-4oz	Purisure	C	6		6	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B07XG5X6NH	6	0	0	0	0	6	2024-10-04 00:00:00		0		Purisure Powders
48	PS-Caffeine-Theanine-Capsules-120	purisure	C	912		917	2024-10-04 00:00:00	Units	0	0	0	0	5	f	B07DNJ69FR	912	0	0	0	0	917	2024-10-04 00:00:00		0		Misc Purisure FG
49	PS-Monk-Fruit-Liquid-2oz-3pack	Purisure	C	22		22	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B0B34RTZND	22	0	0	0	0	22	2024-10-04 00:00:00		0		Misc Purisure FG
50	TH-Monk-Fruit-4oz-Organic	Teaki Hut	A	93		100	2024-10-04 00:00:00	Units	0	0	0	0	7	f	B08KGYJ4TL	0	4400	4400	0	0	100	2024-10-04 00:00:00		0		Teakihut Powders
51	TH-Black-Tea-4oz	Teaki Hut	A	17	4-1	25	2024-10-04 00:00:00	Units	0	0	0	0	8	f	B00U31XAF8	17	3753	3750	3	0	25	2024-10-04 00:00:00		0		Teakihut Powders
52	TH-Green-Tea-4oz	Teaki Hut	B	2	4-1	5	2024-10-04 00:00:00	Units	0	0	0	0	3	f	B00U31UEBQ	0	500	500	0	0	5	2024-10-04 00:00:00		0		Teakihut Powders
53	TH-Pu-Erh-Tea-4oz	Teaki Hut	C	20		21	2024-10-04 00:00:00	Units	0	0	0	0	1	f	B06XW84324	0	0	0	0	0	21	2024-10-04 00:00:00		0		Teakihut Powders
54	TH-Matcha-Green-Tea-5oz-Organic	Teaki Hut	C	0		0	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B0B6WT8KTQ	0	0	0	0	0	0	2024-10-04 00:00:00		0		Teakihut Powders
55	TH-Matcha-Green-Tea-2oz-Organic	Teaki Hut	C	0		0	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B010OITYD6	0	0	0	0	0	0	2024-10-04 00:00:00		0		Teakihut Powders
56	BUNDLE-TH-matc-puer-blk-var-4oz	Teaki Hut	C	0		0	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B09LXBB9KH	0	0	0	0	0	0	2024-10-04 00:00:00		0		Teakihut Powders
57	TH-Monk-Fruit-Stevia-Blend-4X-4oz	Teaki Hut	C	4		4	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B0B21J8WRZ	4	0	0	0	0	4	2024-10-04 00:00:00		0		Teakihut Powders
58	WHYZ-Beta-Alanine-Powder-350g	WHYZ	C	21		21	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B0BCW35QNF	21	0	0	0	0	21	2024-10-04 00:00:00		0		WHYZ FG
59	WHYZ-ALCAR-Powder-125g	WHYZ	C	176		176	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B0BCWSFT2Q	176	0	0	0	0	176	2024-10-04 00:00:00		0		WHYZ FG
60	WHYZ-Shilajit-Powder-50g	WHYZ	B	67		67	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B0BCWNFB7G	67	0	0	0	0	67	2024-10-04 00:00:00		0		WHYZ FG
61	WHYZ-Myo-Inositol-Powder-8oz	WHYZ	C	6		8	2024-10-04 00:00:00	Units	0	0	0	0	2	f	B0BCWQZ7G9	6	0	0	0	0	8	2024-10-04 00:00:00		0		WHYZ FG
62	WHYZ-Organic-MonkFruit-Powder-5oz	WHYZ	A	126		130	2024-10-04 00:00:00	Units	0	0	0	0	4	f	B0BD8LPJKQ	126	0	0	0	0	130	2024-10-04 00:00:00		0		WHYZ FG
63	WHYZ-Organic-Stevia-Powder-8oz	WHYZ	B	47		47	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B0BDRSB3V9	47	0	0	0	0	47	2024-10-04 00:00:00		0		WHYZ FG
64	WHYZ-Magnesium-Bisglycinate-10oz	WHYZ	C	0		0	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B0BDRYDT9W	0	0	0	0	0	0	2024-10-04 00:00:00		0		WHYZ FG
65	WHYZ-Tongkat-Ali-Powder-4oz	WHYZ	C	26		27	2024-10-04 00:00:00	Units	0	0	0	0	1	f	B0CL9SZQPV	26	0	0	0	0	27	2024-10-04 00:00:00		0		WHYZ FG
66	WHYZ-Black-Tea-Powder-4.5oz	WHYZ	PLC-2024	83		88	2024-10-04 00:00:00	Units	0	0	0	0	5	f	B0DFCJCQXS	83	700	600	100	0	88	2024-10-04 00:00:00		0		WHYZ FG
67	WHYZ-Organic-Matcha-Powder-125g	WHYZ	C	0		0	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B0BFXL2HFP	0	0	0	0	0	0	2024-10-04 00:00:00		0		WHYZ FG
68	WHYZ-Organic-WheatGrass-Powder-300g	WHYZ	C	0		0	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B0BFYMSYF4	0	0	0	0	0	0	2024-10-04 00:00:00		0		WHYZ FG
69	WHYZ-Organic-Cordyceps-Powder-200g	WHYZ	C	0		0	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B0BG2WHGPF	0	0	0	0	0	0	2024-10-04 00:00:00		0		WHYZ FG
70	WHYZ-Organic-Spirulina-Powder-250g	WHYZ	C	0		0	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B0BFYRRCS4	0	0	0	0	0	0	2024-10-04 00:00:00		0		WHYZ FG
71	WHYZ-L-Theanine-Powder-125g	WHYZ	C	0		0	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B0BJ119CWH	0	0	0	0	0	0	2024-10-04 00:00:00		0		WHYZ FG
72	WHYZ-VitaminC-Powder-500g	WHYZ	C	0		0	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B0BJ11Z3R4	0	0	0	0	0	0	2024-10-04 00:00:00		0		WHYZ FG
73	WHYZ-MyoInositol-Powder-8oz	WHYZ	B	0		0	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B0CFTXNZJZ	0	0	0	0	0	0	2024-10-04 00:00:00		0		WHYZ FG
74	WHYZ-Green-Coffee-Bean-Powder-125g	WHYZ	C	0		0	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B0BFRK1ZDS	0	0	0	0	0	0	2024-10-04 00:00:00		0		WHYZ FG
75	WHYZ-Stevia-Liquid-Drops-8oz	WHYZ	A	112		115	2024-10-04 00:00:00	Units	0	0	0	0	3	f	B0CGLMBNDZ	112	1060	1060	0	0	115	2024-10-04 00:00:00		0		WHYZ FG
76	WHYZ-Organic-Spirulina-250g	WHYZ	PLC-2024	0		0	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B0DF7VD6PZ	0	0	0	0	0	0	2024-10-04 00:00:00		0		WHYZ FG
77	WHYZ-Organic-Matcha-125g	WHYZ	PLC-2024	0		0	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B0DF7TTBVK	0	0	0	0	0	0	2024-10-04 00:00:00		0		WHYZ FG
78	WHYZ-Organic-Wheat-Grass-Powder-300g	WHYZ	PLC-2024	0		0	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B0DG5PHF23	0	0	0	0	0	0	2024-10-04 00:00:00		0		WHYZ FG
79	WHYZ-Caffeine-Theanine-Capsules	WHYZ	PLC-2024	0		0	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B0DG5LFWTT	0	0	0	0	0	0	2024-10-04 00:00:00		0		WHYZ FG
80	TN-Liquid-Stevia-Drops-2oz	Tejonova	C	27		27	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B0CZDRCVFQ	27	0	0	0	0	27	2024-10-04 00:00:00		0		Tejonova
81	TN-Liquid-Stevia-Drops-8oz	Tejonova	B	45		46	2024-10-04 00:00:00	Units	0	0	0	0	1	f	B0CZDJ4K8N	45	0	0	0	0	46	2024-10-04 00:00:00		0		Tejonova
82	TN-Organic-Monk-Fruit-1oz	Tejonova	C	10		10	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B0CZ9DD9GG	10	0	0	0	0	10	2024-10-04 00:00:00		0		Tejonova
83	TN-Organic-Monk-Fruit-4.5oz	Tejonova	B	4		4	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B0CZ25H5LD	4	0	0	0	0	4	2024-10-04 00:00:00		0		Tejonova
84	TN-Organic-Stevia-Extract-1oz	Tejonova	C	0		0	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B0CZDRK3WC	0	0	0	0	0	0	2024-10-04 00:00:00		0		Tejonova
85	TN-Organic-Stevia-Extract-5oz	Tejonova	C	10		11	2024-10-04 00:00:00	Units	0	0	0	0	1	f	B0CZDRQHBZ	10	0	0	0	0	11	2024-10-04 00:00:00		0		Tejonova
86	TN-Monk-Fruit-Sweetener-Powder-1oz	Tejonova	PLC-2024	0		0	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B0DBVJY2ZC	0	0	0	0	0	0	2024-10-04 00:00:00		0		Tejonova
87	TN-Monk-Fruit-Sweetener-Powder-5oz	Tejonova	PLC-2024	0		0	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B0DBV9BBP2	0	0	0	0	0	0	2024-10-04 00:00:00		0		Tejonova
88	TN-Monk-Fruit-Sweetener-Powder-1lb	Tejonova	PLC-2024	0		0	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B0DBVBFQHD	0	0	0	0	0	0	2024-10-04 00:00:00		0		Tejonova
89	TA-Cystic-Acne-Spot-Treatment-0.5oz	TreeActiv	C	0	2-2	0	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B01BPCAWK4	0	0	0	0	0	0	2024-10-04 00:00:00		0		TreeActiv Acne Spot Treatments
90	TA-Cystic-Acne-Spot-Treatment-0.5oz-2Pack	TreeActiv	C	0	4-3	0	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B08NRP3BJD	0	0	0	0	0	0	2024-10-04 00:00:00		0		TreeActiv Acne Spot Treatments
91	TA-milia-acne-spot-treatment-0.5oz	TreeActiv	A	229		230	2024-10-04 00:00:00	Units	0	0	0	0	1	f	B0CLVS67FY	0	0	0	0	0	230	2024-10-04 00:00:00		0		TreeActiv Acne Spot Treatments
92	TA-Invisible-Acne-Spot-Treatment-0.5oz	TreeActiv	B	21	2-2	23	2024-10-04 00:00:00	Units	0	0	0	0	2	f	B06XRFGLZT	0	0	0	0	0	23	2024-10-04 00:00:00		0		TreeActiv Acne Spot Treatments
93	TA-Invisible-Spot-Treatment-DS	TreeActiv	PLC-2024	0		0	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B0D7W1TT8G	0	0	0	0	0	0	2024-10-04 00:00:00		0		TreeActiv Acne Spot Treatments
94	TA-Acne-Face-Cream-2oz-DS	TreeActiv	PLC-2024	0		0	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B0D87KN31Q	0	0	0	0	0	0	2024-10-04 00:00:00		0		TreeActiv Acne Spot Treatments
95	TA-Acne-Body-Spray-4oz	TreeActiv	PLC-2024	126	3-3	126	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B0CP838DW7	126	800	800	0	0	126	2024-10-04 00:00:00		0		TreeActiv Skincare Sprays
96	TA-Acne-Body-Spray-4oz-2pack	TreeActiv	A	54		54	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B0B4JQJ5B2	0	1300	1300	0	0	54	2024-10-04 00:00:00		0		TreeActiv Skincare Sprays
97	TA-Acne-Body-Spray-8oz-DS-New	TreeActiv	A	0		0	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B0DBRH4D1G	0	0	0	0	0	0	2024-10-04 00:00:00		0		TreeActiv Skincare Sprays
98	TA-Acne-Eliminating-Body-Spray-8oz	TreeActiv	B	5	3-2	5	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B01ETGXJVC	0	0	0	0	0	5	2024-10-04 00:00:00		0		TreeActiv Skincare Sprays
99	TA-Anti-Acne-Pillow-Spray-Lavender-4oz	TreeActiv	B	84		85	2024-10-04 00:00:00	Units	0	0	0	0	1	f	B08C3XXQDQ	84	0	0	0	0	85	2024-10-04 00:00:00		0		TreeActiv Skincare Sprays
100	TA-Anti-Acne-Pillow-Spray-4oz	TreeActiv	A	32	1-3	32	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B01M9DP25F	32	0	0	0	0	32	2024-10-04 00:00:00		0		TreeActiv Skincare Sprays
101	TA-Acne-Face-Spray-4oz	TreeActiv	B	108	3-2	108	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B079ZCGJZF	0	0	0	0	0	108	2024-10-04 00:00:00		0		TreeActiv Skincare Sprays
102	TA-Balancing-Herbal-Toner-4oz	TreeActiv	B	96	4-3	96	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B01BPBXJIM	96	0	0	0	0	96	2024-10-04 00:00:00		0		TreeActiv Skincare Sprays
103	TA-Acne-Exfoliating-Body-Wash-8oz	TreeActiv	B	70	1-2	70	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B01BMEUM0U	70	0	0	0	0	70	2024-10-04 00:00:00		0		TreeActiv Skincare Cleansers
104	TA-Anti-Aging-Body-Wash-8oz	TreeActiv	C	116		116	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B0B71CGM7H	116	0	0	0	0	116	2024-10-04 00:00:00		0		TreeActiv Skincare Cleansers
105	TA-Acne-Body-Wash-8oz-NEW	TreeActiv	PLC-2024	0		0	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B0CSPC847D	0	0	0	0	0	0	2024-10-04 00:00:00		0		TreeActiv Skincare Cleansers
106	TA-Acne-Eliminating-Face-Cleanser-3.4oz	TreeActiv	C	882	2-2	882	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B08MH9WPKV	682	0	0	0	0	882	2024-10-04 00:00:00		0		TreeActiv Skincare Cleansers
107	TA-Acne-Eliminating-Face-Cleanser-8oz	TreeActiv	A	618	2-2	618	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B01BHYAPJS	618	0	0	0	0	618	2024-10-04 00:00:00		0		TreeActiv Skincare Cleansers
108	TA-Acne-Eliminating-Face-Cleanser-DS	TreeActiv		0		0	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B0DFWMZJ4K	0	0	0	0	0	0	2024-10-04 00:00:00		0		TreeActiv Skincare Cleansers
109	TA-Crepey-Skin-Repair-Treatment-8oz	TreeActiv	A	54	2-1	59	2024-10-04 00:00:00	Units	0	0	0	0	5	f	B074F45K6P	54	0	0	0	0	59	2024-10-04 00:00:00		0		TreeActiv Skincare Creams/Lotions
110	TA-Crepey-Skin-Treatment-2pack	TreeActiv	A	4546		0	2024-10-04 00:00:00	Units	0	0	0	0	1	f	B0CSNN469G	4546	100	100	0	0	0	2024-10-04 00:00:00		0		TreeActiv Skincare Creams/Lotions
111	TA-After-Shave-Treatment	TreeActiv	PLC-2024	7		10	2024-10-04 00:00:00	Units	0	0	0	0	3	f	B0CSPJKV9M	7	0	0	0	0	10	2024-10-04 00:00:00		0		TreeActiv Skincare Creams/Lotions
112	TA-Rough-Bumpy-Skin-Lotion	TreeActiv	PLC-2024	22		23	2024-10-04 00:00:00	Units	0	0	0	0	1	f	B0CSSZFCB8	22	0	0	0	0	23	2024-10-04 00:00:00		0		TreeActiv Skincare Creams/Lotions
113	TA-Dermatitis-Cream-8oz	TreeActiv	C	0		0	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B08J3TKTX9	0	0	0	0	0	0	2024-10-04 00:00:00		0		TreeActiv Skincare Creams/Lotions
114	TA-Psoriasis-Cream-8oz	TreeActiv	B	0		0	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B08J3Y9SZ8	0	0	0	0	0	0	2024-10-04 00:00:00		0		TreeActiv Skincare Creams/Lotions
115	TA-Acne-Body-Lotion-Cucumber-8oz	TreeActiv	A	2	1-2	2	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B01ETEJNPK	0	0	0	0	0	2	2024-10-04 00:00:00		0		TreeActiv Skincare Creams/Lotions
116	TA-Acne-Eliminating-Face-Cream-2oz	TreeActiv	A	99		102	2024-10-04 00:00:00	Units	0	0	0	0	3	f	B01BPDN5L6	0	0	0	0	0	102	2024-10-04 00:00:00		0		TreeActiv Skincare Creams/Lotions
117	TA-Acne-Scar-Cream-2oz	TreeActiv	C	164	1-3	164	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B07HHFNXVW	164	0	0	0	0	164	2024-10-04 00:00:00		0		TreeActiv Skincare Creams/Lotions
118	TA-Acne-Scar-Cream-RE-Launch	TreeActiv	PLC-2024	42		42	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B0CS6SCC13	42	0	0	0	0	42	2024-10-04 00:00:00		0		TreeActiv Skincare Creams/Lotions
119	TA-Retinol-Cream-2oz	TreeActiv	C	6		10	2024-10-04 00:00:00	Units	0	0	0	0	4	f	B09BCSL46R	6	0	0	0	0	10	2024-10-04 00:00:00		0		TreeActiv Skincare Creams/Lotions
120	TA-Crepey-Skin-Treatment-8oz-DS-New	TreeActiv	PLC-2024	2940		0	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B0DBRL8TRW	2940	0	0	0	0	0	2024-10-04 00:00:00		0		TreeActiv Skincare Creams/Lotions
121	TA-Four-In-One-Acne-Treatment-4oz	TreeActiv	B	280	2-1	280	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B00U1J83SQ	0	0	0	0	0	280	2024-10-04 00:00:00		0		TreeActiv Skincare Scrubs
122	TA-Four-In-One-Acne-Treatment-8oz	TreeActiv	C	0		0	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B012BKQ5YG	0	0	0	0	0	0	2024-10-04 00:00:00		0		TreeActiv Skincare Scrubs
123	TA-Yoga-Mat-Spray-4oz	TreeActiv	B	74		75	2024-10-04 00:00:00	Units	0	0	0	0	1	f	B08KFGYSD7	74	171	160	11	0	75	2024-10-04 00:00:00		0		TreeActiv Aromatherapy Sprays 
124	TA-Room-Spray-Citrus-4oz	TreeActiv	C	62	3-3	63	2024-10-04 00:00:00	Units	0	0	0	0	1	f	B08HM5NB9C	62	0	0	0	0	63	2024-10-04 00:00:00		0		TreeActiv Aromatherapy Sprays 
125	TA-Sleep-Spray-Calming-Lavender-4oz	TreeActiv	C	10	3-2	10	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B08J2HQZ4K	10	0	0	0	0	10	2024-10-04 00:00:00		0		TreeActiv Aromatherapy Sprays 
126	TA-Sleep-Spray-Calming-Lavender-8oz	TreeActiv	C	201		202	2024-10-04 00:00:00	Units	0	0	0	0	1	f	B08P225MRM	0	0	0	0	0	202	2024-10-04 00:00:00		0		TreeActiv Aromatherapy Sprays 
127	TA-Sleep-Spray-Calming-Lavender-16oz	TreeActiv	C	59		59	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B08P23HP1V	0	129	100	29	0	59	2024-10-04 00:00:00		0		TreeActiv Aromatherapy Sprays 
128	TA-Natural-Linen-Spray-Lavender-8oz	TreeActiv	B	3		4	2024-10-04 00:00:00	Units	0	0	0	0	1	f	B08BWN33SX	203	0	0	0	0	4	2024-10-04 00:00:00		0		TreeActiv Aromatherapy Sprays 
129	TA-Shower-Spray-Eucalyptus-Xtra-Stre-4oz	TreeActiv	C	75		75	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B08S3LQHPH	75	0	0	0	0	75	2024-10-04 00:00:00		0		TreeActiv Aromatherapy Sprays 
130	TA-Shower-Spray-Eucalyptus-4oz	TreeActiv	C	60	2-3	60	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B08KDS18R5	60	0	0	0	0	60	2024-10-04 00:00:00		0		TreeActiv Aromatherapy Sprays 
131	TA-Toilet-Spray-Summer-Breeze-2oz	TreeActiv	C	189		189	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B08QD34975	89	0	0	0	0	189	2024-10-04 00:00:00		0		TreeActiv Aromatherapy Sprays 
132	TA-Air-Freshener-Spray-Peppermint-4oz	TreeActiv	C	77		77	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B08J2YWQ9F	77	0	0	0	0	77	2024-10-04 00:00:00		0		TreeActiv Aromatherapy Sprays 
133	TA-Hair-Growth-Spray-Grapefruit-8oz	TreeActiv	C	0		0	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B018KBV96E	0	0	0	0	0	0	2024-10-04 00:00:00		0		TreeActiv Hair/Skin Supplements
134	TA-Hair-Growth-Spray-Bamboo-8oz	TreeActiv	B	14	3-3	15	2024-10-04 00:00:00	Units	80	0	80	0	1	f	B018KBBNMO	14	80	80	0	0	15	2024-10-04 00:00:00		0		TreeActiv Hair/Skin Supplements
135	TA-Hair-Growth-Spray-Lavender-8oz	TreeActiv	C	0		0	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B018KAH8M4	0	0	0	0	0	0	2024-10-04 00:00:00		0		TreeActiv Hair/Skin Supplements
136	TA-Hair-Savior-60	TreeActiv	C	463		468	2024-10-04 00:00:00	Units	0	0	0	0	5	f	B0165YIFM4	463	0	0	0	0	468	2024-10-04 00:00:00		0		TreeActiv Hair/Skin Supplements
137	TA-Skin-Vitamin	TreeActiv	C	0		0	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B0B94B1FCV	0	0	0	0	0	0	2024-10-04 00:00:00		0		TreeActiv Hair/Skin Supplements
138	TA-Deep-Wrinkle-Serum-1oz	TreeActiv	C	256		256	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B07GSGLKNH	256	0	0	0	0	256	2024-10-04 00:00:00		0		TreeActiv Misc Skincare FG
139	TA-Oil-Free-Skin-Repair-Serum-2oz	TreeActiv	C	1930		0	2024-10-04 00:00:00	Units	50	0	50	0	0	f	B01ETIITYM	1930	50	50	0	0	0	2024-10-04 00:00:00		0		TreeActiv Misc Skincare FG
140	BUNDLE-TA-2Step-Cystic-Face-Wash-3.4oz	TreeActiv	C	0	4-2	0	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B08TJ2GH36	0	0	0	0	0	0	2024-10-04 00:00:00		0		TreeActiv Bundles and Kits
141	BDL-TA-3StepAcneKit-FCreamCysticFW3.4oz	TreeActiv	C	0	4-2	0	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B09B813K19	0	0	0	0	0	0	2024-10-04 00:00:00		0		TreeActiv Bundles and Kits
142	BDL-TA-4StepAcneKit-CysticFSpryFCrmFW3.4	TreeActiv	C	0	4-2	0	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B09B8442YJ	0	0	0	0	0	0	2024-10-04 00:00:00		0		TreeActiv Bundles and Kits
143	BDL-TA-5StepAcneKit	TreeActiv	C	0		0	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B09B8PHJ5V	0	0	0	0	0	0	2024-10-04 00:00:00		0		TreeActiv Bundles and Kits
144	BUNDLE-TA-5-Step-Exfo-Cystic	TreeActiv		0		0	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B08JMCBY1R	0	0	0	0	0	0	2024-10-04 00:00:00		0		TreeActiv Bundles and Kits
145	BUNDLE-TA-2-Step-Exfo-Cystic	TreeActiv	C	0		0	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B08JWVMD8F	0	0	0	0	0	0	2024-10-04 00:00:00		0		TreeActiv Bundles and Kits
146	TA-Acne-Face-Cleanser-Travel-3.4oz-2Pack	TreeActiv	C	61	4-2	61	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B08W5FLRXG	61	0	0	0	0	61	2024-10-04 00:00:00		0		TreeActiv Bundles and Kits
147	TA-Milia-Remover-Kit	TreeActiv	C	47		47	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B0C1TH3LP2	47	0	0	0	0	47	2024-10-04 00:00:00		0		TreeActiv Bundles and Kits
148	TA-Crepe-Skin-Repair-Kit	TreeActiv	C	0		0	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B0B9BXCC3C	0	0	0	0	0	0	2024-10-04 00:00:00		0		TreeActiv Bundles and Kits
149	TA-Back-Body-Acne-Kit	TreeActiv	B	0		0	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B0B971H9J6	0	0	0	0	0	0	2024-10-04 00:00:00		0		TreeActiv Bundles and Kits
150	TA-MiliaSpot-ToolKit-Patches-BDL	TreeActiv	A	41		42	2024-10-04 00:00:00	Units	0	0	0	0	1	f	B0CHK4JF89	41	500	500	0	0	42	2024-10-04 00:00:00		0		TreeActiv Bundles and Kits
151	BUNDLE-TA-Body-Acne-Treatment-Kit	TreeActiv	C	0		0	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B09B2NK4W7	0	0	0	0	0	0	2024-10-04 00:00:00		0		TreeActiv Bundles and Kits
152	BUNDLE-TA-Blackhead	TreeActiv	C	206		206	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B09CNS2L98	206	0	0	0	0	206	2024-10-04 00:00:00		0		TreeActiv Bundles and Kits
153	BUNDLE-TA-Milia	TreeActiv	C	0		0	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B09CDRNWHR	0	0	0	0	0	0	2024-10-04 00:00:00		0		TreeActiv Bundles and Kits
154	BUNDLE-TA-Day-Night-Spot-Treatment	TreeActiv	C	0		0	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B08KWPLJKT	0	0	0	0	0	0	2024-10-04 00:00:00		0		TreeActiv Bundles and Kits
155	BUNDLE-TA-Pimple-Tool-Kit	TreeActiv	C	0		0	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B09B2L9XTT	0	0	0	0	0	0	2024-10-04 00:00:00		0		TreeActiv Bundles and Kits
156	TA-Milia-Patches-5pack	TreeActiv	C	0		0	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B0BVRKQ12T	0	0	0	0	0	0	2024-10-04 00:00:00		0		TreeActiv Bundles and Kits
157	BDL-TA-2StepAcneKit-FCreamFWash3.4oz	TreeActiv	C	0		0	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B09B7YSBWM	0	0	0	0	0	0	2024-10-04 00:00:00		0		TreeActiv Bundles and Kits
158	TA-acne-milia-spot-treatment-pk2	TreeActiv	B	50		50	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B0C875HCLJ	50	0	0	0	0	50	2024-10-04 00:00:00		0		TreeActiv Bundles and Kits
159	AY-Warrior-One-Spot-Treatment-0.5oz	Ayadara	B	10		12	2024-10-04 00:00:00	Units	0	0	0	0	2	f	B08KBLNPGZ	0	0	0	0	0	12	2024-10-04 00:00:00		0		Ayadara Acne Spot Treatments
160	AY-Warrior-Two-Spot-Treatment-0.5oz	Ayadara	B	144		145	2024-10-04 00:00:00	Units	0	0	0	0	1	f	B08KDG8XTZ	0	0	0	0	0	145	2024-10-04 00:00:00		0		Ayadara Acne Spot Treatments
161	AY-Day-Night-Acne-Treatment-Kit	Ayadara	B	11		11	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B0B2NZBF92	11	0	0	0	0	11	2024-10-04 00:00:00		0		Ayadara Acne Spot Treatments
162	AY-Spot-Savior-Treatment-0.5oz			0		0	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B0DGQ2L5VM	0	0	0	0	0	0	2024-10-04 00:00:00		0		Ayadara Acne Spot Treatments
163	AY-Crepe-Skin-Repair-Treatment-8oz	Ayadara	A	342		343	2024-10-04 00:00:00	Units	0	0	0	0	1	f	B08JRTPCSN	342	800	800	0	0	343	2024-10-04 00:00:00		0		Ayadara Skincare Creams/Lotions
164	AY-Scars-No-More-2oz	Ayadara	B	23	2-5	26	2024-10-04 00:00:00	Units	0	0	0	0	3	f	B0965WMQFM	23	0	0	0	0	26	2024-10-04 00:00:00		0		Ayadara Skincare Creams/Lotions
165	AY-Breakout-Warrior-Acne-Cream-2oz	Ayadara	B	90	3-5	95	2024-10-04 00:00:00	Units	0	0	0	0	5	f	B07WWXR1DB	90	0	0	0	0	95	2024-10-04 00:00:00		0		Ayadara Skincare Creams/Lotions
166	AY-Bootylicious-Butt-Acne-Lotion-8oz	Ayadara	B	1		2	2024-10-04 00:00:00	Units	0	0	0	0	1	f	B08JY88C32	0	0	0	0	0	2	2024-10-04 00:00:00		0		Ayadara Skincare Creams/Lotions
167	AY-Face-Savior-Acne-Moisturizer-2oz	Ayadara	PLC-2024	0		0	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B0DGPZNL29	0	0	0	0	0	0	2024-10-04 00:00:00		0		Ayadara Skincare Creams/Lotions
168	AY-Reverse-Warrior-Body-Spray-8oz	Ayadara	C	189		189	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B08KFGBHJX	169	0	0	0	0	189	2024-10-04 00:00:00		0		Ayadara Skincare Sprays
169	AY-Acne-Body-Spray-4oz-3pack	Ayadara	B	74		74	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B0CFF17X29	74	0	0	0	0	74	2024-10-04 00:00:00		0		Ayadara Skincare Sprays
170	AY-Wildflower-Goddess-Toner-4oz	Ayadara	C	20		20	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B08JY3JJ2Q	20	0	0	0	0	20	2024-10-04 00:00:00		0		Ayadara Skincare Sprays
171	AY-Mystical-Mist-4oz	Ayadara	C	119	2-4	119	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B08KSL8YHJ	0	0	0	0	0	119	2024-10-04 00:00:00		0		Ayadara Skincare Sprays
172	AY-Charcoal-To-Sparkle-Acne-Wash-3.4oz	Ayadara		3457	x	0	2024-10-04 00:00:00	Units	0	0	0	0	1	f	B08KD89N97	3457	0	0	0	0	0	2024-10-04 00:00:00		0		Ayadara Skincare Cleansers
173	AY-Charcoal-To-Sparkle-Acne-Wash-8oz	Ayadara	C	1252	2-4	0	2024-10-04 00:00:00	Units	0	0	0	0	5	f	B08KDB2KQF	1252	0	0	0	0	0	2024-10-04 00:00:00		0		Ayadara Skincare Cleansers
174	AY-Boho-Acne-Body-Wash-8oz	Ayadara	C	0		0	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B0B6FY55W3	0	0	0	0	0	0	2024-10-04 00:00:00		0		Ayadara Skincare Cleansers
175	AY-Stardust-Sulfur-Scrub-8oz	Ayadara	C	8		10	2024-10-04 00:00:00	Units	0	0	0	0	2	f	B08KDGWSC8	8	0	0	0	0	10	2024-10-04 00:00:00		0		Ayadara Skincare Scrubs
176	AY-Exfoliate-Bad-Vibes-Acne-Scrub-4oz	Ayadara	C	5		5	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B08KD5W3DQ	5	0	0	0	0	5	2024-10-04 00:00:00		0		Ayadara Skincare Scrubs
177	AY-Savior-Scrub-4oz			0		0	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B0DGQ4QVGB	0	0	0	0	0	0	2024-10-04 00:00:00		0		Ayadara Skincare Scrubs
178	AY-Yoga-Mat-Spray-4oz-2-Pack	Ayadara	C	21		21	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B08KFFF75L	0	0	0	0	0	21	2024-10-04 00:00:00		0		Ayadara Aromatherapy Sprays
179	AY-Namaste-In-Bed-Sleep-Spray-8oz	Ayadara	C	49		49	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B08KDZ8T8Z	49	0	0	0	0	49	2024-10-04 00:00:00		0		Ayadara Aromatherapy Sprays
180	AY-Clear-Sleep-Pillow-Mist-4oz	Ayadara	C	5	3-4	5	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B08JZFFBRM	5	0	0	0	0	5	2024-10-04 00:00:00		0		Ayadara Aromatherapy Sprays
181	AY-Fresh-Reset-Fabric-Spray-8oz	Ayadara	C	16		16	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B08K19R2CB	16	0	0	0	0	16	2024-10-04 00:00:00		0		Ayadara Aromatherapy Sprays
182	AY-Here-Comes-The-Sun-Room-Spray-4oz	Ayadara	C	164	3-4	167	2024-10-04 00:00:00	Units	0	0	0	0	3	f	B08K3P65HM	164	0	0	0	0	167	2024-10-04 00:00:00		0		Ayadara Aromatherapy Sprays
183	AY-Here-Comes-The-Sun-Room-Spray-16oz	Ayadara	C	3		3	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B08KWL8VQ2	0	0	0	0	0	3	2024-10-04 00:00:00		0		Ayadara Aromatherapy Sprays
184	AY-Shower-Spray-Eucalyptus-8oz	Ayadara	C	46		46	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B08KF94MCT	46	0	0	0	0	46	2024-10-04 00:00:00		0		Ayadara Aromatherapy Sprays
185	AY-Hair-Skin-Nails-Vitamins	Ayadara	B	58		58	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B0B8J4DJGK	58	0	0	0	0	58	2024-10-04 00:00:00		0		Ayadara Misc FG
186	OPTML-Hair-Nails	OPTML	C	106		106	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B07VBLLFM7	106	0	0	0	0	106	2024-10-04 00:00:00		0		OPTML
187	OPTML-Sleep	OPTML	C	0		0	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B07XP8QJF4	0	0	0	0	0	0	2024-10-04 00:00:00		0		OPTML
188	OPTML-Boost	OPTML	C	166		166	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B06WVDW1PR	166	0	0	0	0	166	2024-10-04 00:00:00		0		OPTML
189	StandMore-Portable-Standing-Desk	StandMore	A	24		24	2024-10-04 00:00:00	Units	0	0	0	0	0	f	B0C8T9RG6B	24	0	0	0	0	24	2024-10-04 00:00:00		0		StandMore Desk
190	SAMPLE-Stevia-Powder-2oz	Sample		0		0	2024-10-04 00:00:00	Units	0	0	0	0	0	f	SMPSTPW2OZ	\N	0	0	0	0	0	2024-10-04 00:00:00		0		Samples/B2B
191	RM-PWD-ALCAR-1KG	B2B		0		0	2024-10-04 00:00:00	Units	0	0	0	0	0	f	PWALCAR1KG	\N	0	0	0	0	0	2024-10-04 00:00:00		0		Samples/B2B
192	RM-PWD-MONK-FRUIT-1KG	B2B		0		0	2024-10-04 00:00:00	Units	0	0	0	0	1	f	PWMNKFR1KG	\N	0	0	0	0	0	2024-10-04 00:00:00		0		Samples/B2B
193	RM-PWD-L-Citrulline-Malate-20KG	B2B		0		0	2024-10-04 00:00:00	Units	0	0	0	0	0	f	PWCITMA20KG	\N	0	0	0	0	0	2024-10-04 00:00:00		0		Samples/B2B
194	RM-PWD-L-Citrulline-Malate-1KG	B2B		0		0	2024-10-04 00:00:00	Units	0	0	0	0	1	f	PWCITMA1KG	\N	0	0	0	0	0	2024-10-04 00:00:00		0		Samples/B2B
195	RM-PWD-Black-Tea-Extract-25kg	B2B		0		0	2024-10-04 00:00:00	Units	0	0	0	0	0	f	PWBLKTE25KG	\N	0	0	0	0	0	2024-10-04 00:00:00		0		Samples/B2B
196	RM-PWD-Black-Tea-Extract-10kg	B2B		0		0	2024-10-04 00:00:00	Units	0	0	0	0	0	f	PWBLKTE10KG	\N	0	0	0	0	0	2024-10-04 00:00:00		0		Samples/B2B
197	RM-PWD-Beta-Alanine-Powder-1kg	B2B		0		0	2024-10-04 00:00:00	Units	0	0	0	0	0	f	PWBETALA1KG	0	0	0	0	0	0	2024-10-04 00:00:00		0		Samples/B2B
198	RM-PWD-Black-Tea-Powder-1kg	B2B		0		0	2024-10-04 00:00:00	Units	0	0	0	0	8	f	PWBLKTEA1KG	0	0	0	0	0	0	2024-10-04 00:00:00		0		Samples/B2B
199	RM-PWD-Organic-Stevia-TSG90-1kg	B2B		0		0	2024-10-04 00:00:00	Units	0	0	0	0	0	f	PWSTV90TS1KG	0	0	0	0	0	0	2024-10-04 00:00:00		0		Samples/B2B
200	RM-PWD-Potassium-Sorbate-Powder-5kg	B2B		0		0	2024-10-04 00:00:00	Units	0	0	0	0	0	f	PWPOTAS5KG	0	0	0	0	0	0	2024-10-04 00:00:00		0		Samples/B2B
201	RM-PWD-Salicylic-Acid-Powder-1kg	B2B		0		0	2024-10-04 00:00:00	Units	0	0	0	0	1	f	PWSALACD1KG	0	0	0	0	0	0	2024-10-04 00:00:00		0		Samples/B2B
202	RM-PWD-Salicylic-Acid-Powder-20kg	B2B		0		0	2024-10-04 00:00:00	Units	0	0	0	0	0	f	PWSALACD20KG	0	0	0	0	0	0	2024-10-04 00:00:00		0		Samples/B2B
203	RM-PWD-STEVIA-SG95-1KG	B2B		0		0	2024-10-04 00:00:00	Units	0	0	0	0	0	f	PWSTV951KG	\N	0	0	0	0	0	2024-10-04 00:00:00		0		Samples/B2B
204	RM-PWD-MyoInositol-1kg	B2B		0		0	2024-10-04 00:00:00	Units	0	0	0	0	0	f	PWMYOINO1KG	0	0	0	0	0	0	2024-10-04 00:00:00		0		Samples/B2B
205	RM-PWD-Tea-MatchGreen-1kg	B2B		0		0	2024-10-04 00:00:00	Units	0	0	0	0	0	f	PWMCHAGRN1KG	0	0	0	0	0	0	2024-10-04 00:00:00		0		Samples/B2B
\.


--
-- Data for Name: finished_goods_inventory_change_log; Type: TABLE DATA; Schema: public; Owner: derrek
--

COPY public.finished_goods_inventory_change_log (id, inventory_id, field_name, old_value, new_value, changed_at, changed_by) FROM stdin;
1	1	created		new entry	2024-10-12 08:07:57.824111-05	system
2	2	created		new entry	2024-10-12 08:07:57.824111-05	system
3	3	created		new entry	2024-10-12 08:07:57.824111-05	system
4	4	created		new entry	2024-10-12 08:07:57.824111-05	system
5	5	created		new entry	2024-10-12 08:07:57.824111-05	system
6	6	created		new entry	2024-10-12 08:07:57.824111-05	system
7	7	created		new entry	2024-10-12 08:07:57.824111-05	system
8	8	created		new entry	2024-10-12 08:07:57.824111-05	system
9	9	created		new entry	2024-10-12 08:07:57.824111-05	system
10	10	created		new entry	2024-10-12 08:07:57.824111-05	system
11	11	created		new entry	2024-10-12 08:07:57.824111-05	system
12	12	created		new entry	2024-10-12 08:07:57.824111-05	system
13	13	created		new entry	2024-10-12 08:07:57.824111-05	system
14	14	created		new entry	2024-10-12 08:07:57.824111-05	system
15	15	created		new entry	2024-10-12 08:07:57.824111-05	system
16	16	created		new entry	2024-10-12 08:07:57.824111-05	system
17	17	created		new entry	2024-10-12 08:07:57.824111-05	system
18	18	created		new entry	2024-10-12 08:07:57.824111-05	system
19	19	created		new entry	2024-10-12 08:07:57.824111-05	system
20	20	created		new entry	2024-10-12 08:07:57.824111-05	system
21	21	created		new entry	2024-10-12 08:07:57.824111-05	system
22	22	created		new entry	2024-10-12 08:07:57.824111-05	system
23	23	created		new entry	2024-10-12 08:07:57.824111-05	system
24	24	created		new entry	2024-10-12 08:07:57.824111-05	system
25	25	created		new entry	2024-10-12 08:07:57.824111-05	system
26	26	created		new entry	2024-10-12 08:07:57.824111-05	system
27	27	created		new entry	2024-10-12 08:07:57.824111-05	system
28	28	created		new entry	2024-10-12 08:07:57.824111-05	system
29	29	created		new entry	2024-10-12 08:07:57.824111-05	system
30	30	created		new entry	2024-10-12 08:07:57.824111-05	system
31	31	created		new entry	2024-10-12 08:07:57.824111-05	system
32	32	created		new entry	2024-10-12 08:07:57.824111-05	system
33	33	created		new entry	2024-10-12 08:07:57.824111-05	system
34	34	created		new entry	2024-10-12 08:07:57.824111-05	system
35	35	created		new entry	2024-10-12 08:07:57.824111-05	system
36	36	created		new entry	2024-10-12 08:07:57.824111-05	system
37	37	created		new entry	2024-10-12 08:07:57.824111-05	system
38	38	created		new entry	2024-10-12 08:07:57.824111-05	system
39	39	created		new entry	2024-10-12 08:07:57.824111-05	system
40	40	created		new entry	2024-10-12 08:07:57.824111-05	system
41	41	created		new entry	2024-10-12 08:07:57.824111-05	system
42	42	created		new entry	2024-10-12 08:07:57.824111-05	system
43	43	created		new entry	2024-10-12 08:07:57.824111-05	system
44	44	created		new entry	2024-10-12 08:07:57.824111-05	system
45	45	created		new entry	2024-10-12 08:07:57.824111-05	system
46	46	created		new entry	2024-10-12 08:07:57.824111-05	system
47	47	created		new entry	2024-10-12 08:07:57.824111-05	system
48	48	created		new entry	2024-10-12 08:07:57.824111-05	system
49	49	created		new entry	2024-10-12 08:07:57.824111-05	system
50	50	created		new entry	2024-10-12 08:07:57.824111-05	system
51	51	created		new entry	2024-10-12 08:07:57.824111-05	system
52	52	created		new entry	2024-10-12 08:07:57.824111-05	system
53	53	created		new entry	2024-10-12 08:07:57.824111-05	system
54	54	created		new entry	2024-10-12 08:07:57.824111-05	system
55	55	created		new entry	2024-10-12 08:07:57.824111-05	system
56	56	created		new entry	2024-10-12 08:07:57.824111-05	system
57	57	created		new entry	2024-10-12 08:07:57.824111-05	system
58	58	created		new entry	2024-10-12 08:07:57.824111-05	system
59	59	created		new entry	2024-10-12 08:07:57.824111-05	system
60	60	created		new entry	2024-10-12 08:07:57.824111-05	system
61	61	created		new entry	2024-10-12 08:07:57.824111-05	system
62	62	created		new entry	2024-10-12 08:07:57.824111-05	system
63	63	created		new entry	2024-10-12 08:07:57.824111-05	system
64	64	created		new entry	2024-10-12 08:07:57.824111-05	system
65	65	created		new entry	2024-10-12 08:07:57.824111-05	system
66	66	created		new entry	2024-10-12 08:07:57.824111-05	system
67	67	created		new entry	2024-10-12 08:07:57.824111-05	system
68	68	created		new entry	2024-10-12 08:07:57.824111-05	system
69	69	created		new entry	2024-10-12 08:07:57.824111-05	system
70	70	created		new entry	2024-10-12 08:07:57.824111-05	system
71	71	created		new entry	2024-10-12 08:07:57.824111-05	system
72	72	created		new entry	2024-10-12 08:07:57.824111-05	system
73	73	created		new entry	2024-10-12 08:07:57.824111-05	system
74	74	created		new entry	2024-10-12 08:07:57.824111-05	system
75	75	created		new entry	2024-10-12 08:07:57.824111-05	system
76	76	created		new entry	2024-10-12 08:07:57.824111-05	system
77	77	created		new entry	2024-10-12 08:07:57.824111-05	system
78	78	created		new entry	2024-10-12 08:07:57.824111-05	system
79	79	created		new entry	2024-10-12 08:07:57.824111-05	system
80	80	created		new entry	2024-10-12 08:07:57.824111-05	system
81	81	created		new entry	2024-10-12 08:07:57.824111-05	system
82	82	created		new entry	2024-10-12 08:07:57.824111-05	system
83	83	created		new entry	2024-10-12 08:07:57.824111-05	system
84	84	created		new entry	2024-10-12 08:07:57.824111-05	system
85	85	created		new entry	2024-10-12 08:07:57.824111-05	system
86	86	created		new entry	2024-10-12 08:07:57.824111-05	system
87	87	created		new entry	2024-10-12 08:07:57.824111-05	system
88	88	created		new entry	2024-10-12 08:07:57.824111-05	system
89	89	created		new entry	2024-10-12 08:07:57.824111-05	system
90	90	created		new entry	2024-10-12 08:07:57.824111-05	system
91	91	created		new entry	2024-10-12 08:07:57.824111-05	system
92	92	created		new entry	2024-10-12 08:07:57.824111-05	system
93	93	created		new entry	2024-10-12 08:07:57.824111-05	system
94	94	created		new entry	2024-10-12 08:07:57.824111-05	system
95	95	created		new entry	2024-10-12 08:07:57.824111-05	system
96	96	created		new entry	2024-10-12 08:07:57.824111-05	system
97	97	created		new entry	2024-10-12 08:07:57.824111-05	system
98	98	created		new entry	2024-10-12 08:07:57.824111-05	system
99	99	created		new entry	2024-10-12 08:07:57.824111-05	system
100	100	created		new entry	2024-10-12 08:07:57.824111-05	system
101	101	created		new entry	2024-10-12 08:07:57.824111-05	system
102	102	created		new entry	2024-10-12 08:07:57.824111-05	system
103	103	created		new entry	2024-10-12 08:07:57.824111-05	system
104	104	created		new entry	2024-10-12 08:07:57.824111-05	system
105	105	created		new entry	2024-10-12 08:07:57.824111-05	system
106	106	created		new entry	2024-10-12 08:07:57.824111-05	system
107	107	created		new entry	2024-10-12 08:07:57.824111-05	system
108	108	created		new entry	2024-10-12 08:07:57.824111-05	system
109	109	created		new entry	2024-10-12 08:07:57.824111-05	system
110	110	created		new entry	2024-10-12 08:07:57.824111-05	system
111	111	created		new entry	2024-10-12 08:07:57.824111-05	system
112	112	created		new entry	2024-10-12 08:07:57.824111-05	system
113	113	created		new entry	2024-10-12 08:07:57.824111-05	system
114	114	created		new entry	2024-10-12 08:07:57.824111-05	system
115	115	created		new entry	2024-10-12 08:07:57.824111-05	system
116	116	created		new entry	2024-10-12 08:07:57.824111-05	system
117	117	created		new entry	2024-10-12 08:07:57.824111-05	system
118	118	created		new entry	2024-10-12 08:07:57.824111-05	system
119	119	created		new entry	2024-10-12 08:07:57.824111-05	system
120	120	created		new entry	2024-10-12 08:07:57.824111-05	system
121	121	created		new entry	2024-10-12 08:07:57.824111-05	system
122	122	created		new entry	2024-10-12 08:07:57.824111-05	system
123	123	created		new entry	2024-10-12 08:07:57.824111-05	system
124	124	created		new entry	2024-10-12 08:07:57.824111-05	system
125	125	created		new entry	2024-10-12 08:07:57.824111-05	system
126	126	created		new entry	2024-10-12 08:07:57.824111-05	system
127	127	created		new entry	2024-10-12 08:07:57.824111-05	system
128	128	created		new entry	2024-10-12 08:07:57.824111-05	system
129	129	created		new entry	2024-10-12 08:07:57.824111-05	system
130	130	created		new entry	2024-10-12 08:07:57.824111-05	system
131	131	created		new entry	2024-10-12 08:07:57.824111-05	system
132	132	created		new entry	2024-10-12 08:07:57.824111-05	system
133	133	created		new entry	2024-10-12 08:07:57.824111-05	system
134	134	created		new entry	2024-10-12 08:07:57.824111-05	system
135	135	created		new entry	2024-10-12 08:07:57.824111-05	system
136	136	created		new entry	2024-10-12 08:07:57.824111-05	system
137	137	created		new entry	2024-10-12 08:07:57.824111-05	system
138	138	created		new entry	2024-10-12 08:07:57.824111-05	system
139	139	created		new entry	2024-10-12 08:07:57.824111-05	system
140	140	created		new entry	2024-10-12 08:07:57.824111-05	system
141	141	created		new entry	2024-10-12 08:07:57.824111-05	system
142	142	created		new entry	2024-10-12 08:07:57.824111-05	system
143	143	created		new entry	2024-10-12 08:07:57.824111-05	system
144	144	created		new entry	2024-10-12 08:07:57.824111-05	system
145	145	created		new entry	2024-10-12 08:07:57.824111-05	system
146	146	created		new entry	2024-10-12 08:07:57.824111-05	system
147	147	created		new entry	2024-10-12 08:07:57.824111-05	system
148	148	created		new entry	2024-10-12 08:07:57.824111-05	system
149	149	created		new entry	2024-10-12 08:07:57.824111-05	system
150	150	created		new entry	2024-10-12 08:07:57.824111-05	system
151	151	created		new entry	2024-10-12 08:07:57.824111-05	system
152	152	created		new entry	2024-10-12 08:07:57.824111-05	system
153	153	created		new entry	2024-10-12 08:07:57.824111-05	system
154	154	created		new entry	2024-10-12 08:07:57.824111-05	system
155	155	created		new entry	2024-10-12 08:07:57.824111-05	system
156	156	created		new entry	2024-10-12 08:07:57.824111-05	system
157	157	created		new entry	2024-10-12 08:07:57.824111-05	system
158	158	created		new entry	2024-10-12 08:07:57.824111-05	system
159	159	created		new entry	2024-10-12 08:07:57.824111-05	system
160	160	created		new entry	2024-10-12 08:07:57.824111-05	system
161	161	created		new entry	2024-10-12 08:07:57.824111-05	system
162	162	created		new entry	2024-10-12 08:07:57.824111-05	system
163	163	created		new entry	2024-10-12 08:07:57.824111-05	system
164	164	created		new entry	2024-10-12 08:07:57.824111-05	system
165	165	created		new entry	2024-10-12 08:07:57.824111-05	system
166	166	created		new entry	2024-10-12 08:07:57.824111-05	system
167	167	created		new entry	2024-10-12 08:07:57.824111-05	system
168	168	created		new entry	2024-10-12 08:07:57.824111-05	system
169	169	created		new entry	2024-10-12 08:07:57.824111-05	system
170	170	created		new entry	2024-10-12 08:07:57.824111-05	system
171	171	created		new entry	2024-10-12 08:07:57.824111-05	system
172	172	created		new entry	2024-10-12 08:07:57.824111-05	system
173	173	created		new entry	2024-10-12 08:07:57.824111-05	system
174	174	created		new entry	2024-10-12 08:07:57.824111-05	system
175	175	created		new entry	2024-10-12 08:07:57.824111-05	system
176	176	created		new entry	2024-10-12 08:07:57.824111-05	system
177	177	created		new entry	2024-10-12 08:07:57.824111-05	system
178	178	created		new entry	2024-10-12 08:07:57.824111-05	system
179	179	created		new entry	2024-10-12 08:07:57.824111-05	system
180	180	created		new entry	2024-10-12 08:07:57.824111-05	system
181	181	created		new entry	2024-10-12 08:07:57.824111-05	system
182	182	created		new entry	2024-10-12 08:07:57.824111-05	system
183	183	created		new entry	2024-10-12 08:07:57.824111-05	system
184	184	created		new entry	2024-10-12 08:07:57.824111-05	system
185	185	created		new entry	2024-10-12 08:07:57.824111-05	system
186	186	created		new entry	2024-10-12 08:07:57.824111-05	system
187	187	created		new entry	2024-10-12 08:07:57.824111-05	system
188	188	created		new entry	2024-10-12 08:07:57.824111-05	system
189	189	created		new entry	2024-10-12 08:07:57.824111-05	system
190	190	created		new entry	2024-10-12 08:07:57.824111-05	system
191	191	created		new entry	2024-10-12 08:07:57.824111-05	system
192	192	created		new entry	2024-10-12 08:07:57.824111-05	system
193	193	created		new entry	2024-10-12 08:07:57.824111-05	system
194	194	created		new entry	2024-10-12 08:07:57.824111-05	system
195	195	created		new entry	2024-10-12 08:07:57.824111-05	system
196	196	created		new entry	2024-10-12 08:07:57.824111-05	system
197	197	created		new entry	2024-10-12 08:07:57.824111-05	system
198	198	created		new entry	2024-10-12 08:07:57.824111-05	system
199	199	created		new entry	2024-10-12 08:07:57.824111-05	system
200	200	created		new entry	2024-10-12 08:07:57.824111-05	system
201	201	created		new entry	2024-10-12 08:07:57.824111-05	system
202	202	created		new entry	2024-10-12 08:07:57.824111-05	system
203	203	created		new entry	2024-10-12 08:07:57.824111-05	system
204	204	created		new entry	2024-10-12 08:07:57.824111-05	system
205	205	created		new entry	2024-10-12 08:07:57.824111-05	system
\.


--
-- Data for Name: finished_goods_inventory_history; Type: TABLE DATA; Schema: public; Owner: derrek
--

COPY public.finished_goods_inventory_history (id, inventory_id, isku, theoretical_qty, actual_count, date_counted, recorded_at) FROM stdin;
1	\N	NS-Stevia-Powder-4oz-Organic	166	167	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
2	\N	NS-Premium-Stevia-Powder-4oz	0	34	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
3	\N	NS-Original-Stevia-Liquid-8oz	134	150	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
4	\N	NS-Monk-Fruit-Liquid-Drops-8oz	101	103	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
5	\N	NS-Monk-Fruit-Stevia-Liquid-Drops-8oz	128	128	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
6	\N	NS-Organic-Stevia-Liquid-Drops-8oz	0	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
7	\N	NS-Organic-Monkfruit-Liquid-Drops-8oz	40	41	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
8	\N	NS-Stevia-Liquid-Vanilla-2oz	566	568	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
9	\N	NS-Toffee-Stevia-Liquid-2oz	431	431	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
10	\N	NS-Monk-Fruit-Stevia-Blend-4X-4oz	4	4	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
11	\N	NS-Stevia-Liquid-Drops-4oz	55	56	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
12	\N	NS-Stevia-Liquid-Drops-4oz-2pck	81	85	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
13	\N	NS-Stevia-Liquid-Drops-8oz-2pck	6	8	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
14	\N	BUNDLE-NS-Flav-Liq-Stev-Var-2oz	3	3	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
15	\N	NS-Monkfruit-Stevia-Liquid-2oz-3pack	0	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
16	\N	NS-Stevia-Liquid-Orgnl-2oz-3Pack	10	10	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
17	\N	PS-Monk-Fruit-Extract-125g-Organic	114	117	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
18	\N	PS-Stevia-Powder-125g-Organic	67	69	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
19	\N	PS-Black-Tea-Powder-125g	22	22	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
20	\N	PS-Iced-Tea-4oz	114	117	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
21	\N	PS-Green-Tea-Extract-250g	6	6	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
22	\N	PS-Green-Coffee-Bean-Extract-150g	84	84	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
23	\N	PS-Dihydromyricetin-DHM-100g	3	3	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
24	\N	PS-Myo-Inositol-250g	26	26	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
25	\N	PS-Myo-Inositol-1kg	9	9	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
26	\N	PS-Citrulline-Malate-250g	25	25	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
27	\N	PS-Citrulline-Malate-1kg	1	1	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
28	\N	PS-CDP-Choline-10g	9	9	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
29	\N	PS-CDP-Choline-50g	22	22	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
30	\N	PS-Shilajit-25g	99	99	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
31	\N	PS-Shilajit-100g	18	18	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
32	\N	PS-L-Theanine-100g	8	9	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
33	\N	PS-Organic-Spirulina-16oz	66	66	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
34	\N	PS-Vitamin-C-250g	22	22	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
35	\N	PS-Vitamin-C-1kg	0	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
36	\N	PS-Alpha-GPC-25g	27	27	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
37	\N	PS-Alpha-GPC-100g	3	3	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
38	\N	PS-Agmatine-100g	0	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
39	\N	PS-ALCAR-250g	10	10	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
40	\N	PS-Beta-Alanine-1kg	0	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
41	\N	PS-Organic-Cordyceps-Militaris-6oz	0	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
42	\N	PS-Longjack-200:1-100g	83	83	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
43	\N	PS-Organic-Wheat-Grass-150g	0	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
44	\N	PS-Wheatgrass-Powder-8oz-Organic	0	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
45	\N	PS-Magnsm-Bisglycinate-Pwdr-250g	50	50	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
46	\N	PS-Methylene-Blue-Powder-5g	9	9	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
47	\N	PS-Monk-Fruit-Stevia-Blend-4X-4oz	6	6	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
48	\N	PS-Caffeine-Theanine-Capsules-120	912	917	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
49	\N	PS-Monk-Fruit-Liquid-2oz-3pack	22	22	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
50	\N	TH-Monk-Fruit-4oz-Organic	93	100	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
51	\N	TH-Black-Tea-4oz	17	25	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
52	\N	TH-Green-Tea-4oz	2	5	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
53	\N	TH-Pu-Erh-Tea-4oz	20	21	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
54	\N	TH-Matcha-Green-Tea-5oz-Organic	0	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
55	\N	TH-Matcha-Green-Tea-2oz-Organic	0	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
56	\N	BUNDLE-TH-matc-puer-blk-var-4oz	0	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
57	\N	TH-Monk-Fruit-Stevia-Blend-4X-4oz	4	4	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
58	\N	WHYZ-Beta-Alanine-Powder-350g	21	21	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
59	\N	WHYZ-ALCAR-Powder-125g	176	176	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
60	\N	WHYZ-Shilajit-Powder-50g	67	67	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
61	\N	WHYZ-Myo-Inositol-Powder-8oz	6	8	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
62	\N	WHYZ-Organic-MonkFruit-Powder-5oz	126	130	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
63	\N	WHYZ-Organic-Stevia-Powder-8oz	47	47	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
64	\N	WHYZ-Magnesium-Bisglycinate-10oz	0	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
65	\N	WHYZ-Tongkat-Ali-Powder-4oz	26	27	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
66	\N	WHYZ-Black-Tea-Powder-4.5oz	83	88	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
67	\N	WHYZ-Organic-Matcha-Powder-125g	0	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
68	\N	WHYZ-Organic-WheatGrass-Powder-300g	0	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
69	\N	WHYZ-Organic-Cordyceps-Powder-200g	0	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
70	\N	WHYZ-Organic-Spirulina-Powder-250g	0	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
71	\N	WHYZ-L-Theanine-Powder-125g	0	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
72	\N	WHYZ-VitaminC-Powder-500g	0	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
73	\N	WHYZ-MyoInositol-Powder-8oz	0	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
74	\N	WHYZ-Green-Coffee-Bean-Powder-125g	0	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
75	\N	WHYZ-Stevia-Liquid-Drops-8oz	112	115	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
76	\N	WHYZ-Organic-Spirulina-250g	0	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
77	\N	WHYZ-Organic-Matcha-125g	0	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
78	\N	WHYZ-Organic-Wheat-Grass-Powder-300g	0	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
79	\N	WHYZ-Caffeine-Theanine-Capsules	0	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
80	\N	TN-Liquid-Stevia-Drops-2oz	27	27	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
81	\N	TN-Liquid-Stevia-Drops-8oz	45	46	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
82	\N	TN-Organic-Monk-Fruit-1oz	10	10	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
83	\N	TN-Organic-Monk-Fruit-4.5oz	4	4	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
84	\N	TN-Organic-Stevia-Extract-1oz	0	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
85	\N	TN-Organic-Stevia-Extract-5oz	10	11	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
86	\N	TN-Monk-Fruit-Sweetener-Powder-1oz	0	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
87	\N	TN-Monk-Fruit-Sweetener-Powder-5oz	0	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
88	\N	TN-Monk-Fruit-Sweetener-Powder-1lb	0	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
89	\N	TA-Cystic-Acne-Spot-Treatment-0.5oz	0	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
90	\N	TA-Cystic-Acne-Spot-Treatment-0.5oz-2Pack	0	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
91	\N	TA-milia-acne-spot-treatment-0.5oz	229	230	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
92	\N	TA-Invisible-Acne-Spot-Treatment-0.5oz	21	23	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
93	\N	TA-Invisible-Spot-Treatment-DS	0	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
94	\N	TA-Acne-Face-Cream-2oz-DS	0	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
95	\N	TA-Acne-Body-Spray-4oz	126	126	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
96	\N	TA-Acne-Body-Spray-4oz-2pack	54	54	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
97	\N	TA-Acne-Body-Spray-8oz-DS-New	0	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
98	\N	TA-Acne-Eliminating-Body-Spray-8oz	5	5	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
99	\N	TA-Anti-Acne-Pillow-Spray-Lavender-4oz	84	85	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
100	\N	TA-Anti-Acne-Pillow-Spray-4oz	32	32	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
101	\N	TA-Acne-Face-Spray-4oz	108	108	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
102	\N	TA-Balancing-Herbal-Toner-4oz	96	96	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
103	\N	TA-Acne-Exfoliating-Body-Wash-8oz	70	70	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
104	\N	TA-Anti-Aging-Body-Wash-8oz	116	116	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
105	\N	TA-Acne-Body-Wash-8oz-NEW	0	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
106	\N	TA-Acne-Eliminating-Face-Cleanser-3.4oz	882	882	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
107	\N	TA-Acne-Eliminating-Face-Cleanser-8oz	618	618	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
108	\N	TA-Acne-Eliminating-Face-Cleanser-DS	0	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
109	\N	TA-Crepey-Skin-Repair-Treatment-8oz	54	59	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
110	\N	TA-Crepey-Skin-Treatment-2pack	4546	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
111	\N	TA-After-Shave-Treatment	7	10	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
112	\N	TA-Rough-Bumpy-Skin-Lotion	22	23	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
113	\N	TA-Dermatitis-Cream-8oz	0	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
114	\N	TA-Psoriasis-Cream-8oz	0	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
115	\N	TA-Acne-Body-Lotion-Cucumber-8oz	2	2	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
116	\N	TA-Acne-Eliminating-Face-Cream-2oz	99	102	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
117	\N	TA-Acne-Scar-Cream-2oz	164	164	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
118	\N	TA-Acne-Scar-Cream-RE-Launch	42	42	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
119	\N	TA-Retinol-Cream-2oz	6	10	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
120	\N	TA-Crepey-Skin-Treatment-8oz-DS-New	2940	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
121	\N	TA-Four-In-One-Acne-Treatment-4oz	280	280	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
122	\N	TA-Four-In-One-Acne-Treatment-8oz	0	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
123	\N	TA-Yoga-Mat-Spray-4oz	74	75	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
124	\N	TA-Room-Spray-Citrus-4oz	62	63	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
125	\N	TA-Sleep-Spray-Calming-Lavender-4oz	10	10	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
126	\N	TA-Sleep-Spray-Calming-Lavender-8oz	201	202	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
127	\N	TA-Sleep-Spray-Calming-Lavender-16oz	59	59	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
128	\N	TA-Natural-Linen-Spray-Lavender-8oz	3	4	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
129	\N	TA-Shower-Spray-Eucalyptus-Xtra-Stre-4oz	75	75	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
130	\N	TA-Shower-Spray-Eucalyptus-4oz	60	60	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
131	\N	TA-Toilet-Spray-Summer-Breeze-2oz	189	189	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
132	\N	TA-Air-Freshener-Spray-Peppermint-4oz	77	77	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
133	\N	TA-Hair-Growth-Spray-Grapefruit-8oz	0	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
134	\N	TA-Hair-Growth-Spray-Bamboo-8oz	14	15	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
135	\N	TA-Hair-Growth-Spray-Lavender-8oz	0	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
136	\N	TA-Hair-Savior-60	463	468	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
137	\N	TA-Skin-Vitamin	0	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
138	\N	TA-Deep-Wrinkle-Serum-1oz	256	256	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
139	\N	TA-Oil-Free-Skin-Repair-Serum-2oz	1930	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
140	\N	BUNDLE-TA-2Step-Cystic-Face-Wash-3.4oz	0	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
141	\N	BDL-TA-3StepAcneKit-FCreamCysticFW3.4oz	0	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
142	\N	BDL-TA-4StepAcneKit-CysticFSpryFCrmFW3.4	0	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
143	\N	BDL-TA-5StepAcneKit	0	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
144	\N	BUNDLE-TA-5-Step-Exfo-Cystic	0	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
145	\N	BUNDLE-TA-2-Step-Exfo-Cystic	0	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
146	\N	TA-Acne-Face-Cleanser-Travel-3.4oz-2Pack	61	61	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
147	\N	TA-Milia-Remover-Kit	47	47	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
148	\N	TA-Crepe-Skin-Repair-Kit	0	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
149	\N	TA-Back-Body-Acne-Kit	0	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
150	\N	TA-MiliaSpot-ToolKit-Patches-BDL	41	42	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
151	\N	BUNDLE-TA-Body-Acne-Treatment-Kit	0	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
152	\N	BUNDLE-TA-Blackhead	206	206	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
153	\N	BUNDLE-TA-Milia	0	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
154	\N	BUNDLE-TA-Day-Night-Spot-Treatment	0	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
155	\N	BUNDLE-TA-Pimple-Tool-Kit	0	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
156	\N	TA-Milia-Patches-5pack	0	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
157	\N	BDL-TA-2StepAcneKit-FCreamFWash3.4oz	0	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
158	\N	TA-acne-milia-spot-treatment-pk2	50	50	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
159	\N	AY-Warrior-One-Spot-Treatment-0.5oz	10	12	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
160	\N	AY-Warrior-Two-Spot-Treatment-0.5oz	144	145	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
161	\N	AY-Day-Night-Acne-Treatment-Kit	11	11	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
162	\N	AY-Spot-Savior-Treatment-0.5oz	0	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
163	\N	AY-Crepe-Skin-Repair-Treatment-8oz	342	343	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
164	\N	AY-Scars-No-More-2oz	23	26	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
165	\N	AY-Breakout-Warrior-Acne-Cream-2oz	90	95	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
166	\N	AY-Bootylicious-Butt-Acne-Lotion-8oz	1	2	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
167	\N	AY-Face-Savior-Acne-Moisturizer-2oz	0	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
168	\N	AY-Reverse-Warrior-Body-Spray-8oz	189	189	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
169	\N	AY-Acne-Body-Spray-4oz-3pack	74	74	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
170	\N	AY-Wildflower-Goddess-Toner-4oz	20	20	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
171	\N	AY-Mystical-Mist-4oz	119	119	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
172	\N	AY-Charcoal-To-Sparkle-Acne-Wash-3.4oz	3457	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
173	\N	AY-Charcoal-To-Sparkle-Acne-Wash-8oz	1252	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
174	\N	AY-Boho-Acne-Body-Wash-8oz	0	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
175	\N	AY-Stardust-Sulfur-Scrub-8oz	8	10	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
176	\N	AY-Exfoliate-Bad-Vibes-Acne-Scrub-4oz	5	5	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
177	\N	AY-Savior-Scrub-4oz	0	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
178	\N	AY-Yoga-Mat-Spray-4oz-2-Pack	21	21	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
179	\N	AY-Namaste-In-Bed-Sleep-Spray-8oz	49	49	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
180	\N	AY-Clear-Sleep-Pillow-Mist-4oz	5	5	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
181	\N	AY-Fresh-Reset-Fabric-Spray-8oz	16	16	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
182	\N	AY-Here-Comes-The-Sun-Room-Spray-4oz	164	167	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
183	\N	AY-Here-Comes-The-Sun-Room-Spray-16oz	3	3	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
184	\N	AY-Shower-Spray-Eucalyptus-8oz	46	46	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
185	\N	AY-Hair-Skin-Nails-Vitamins	58	58	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
186	\N	OPTML-Hair-Nails	106	106	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
187	\N	OPTML-Sleep	0	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
188	\N	OPTML-Boost	166	166	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
189	\N	StandMore-Portable-Standing-Desk	24	24	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
190	\N	SAMPLE-Stevia-Powder-2oz	0	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
191	\N	RM-PWD-ALCAR-1KG	0	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
192	\N	RM-PWD-MONK-FRUIT-1KG	0	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
193	\N	RM-PWD-L-Citrulline-Malate-20KG	0	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
194	\N	RM-PWD-L-Citrulline-Malate-1KG	0	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
195	\N	RM-PWD-Black-Tea-Extract-25kg	0	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
196	\N	RM-PWD-Black-Tea-Extract-10kg	0	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
197	\N	RM-PWD-Beta-Alanine-Powder-1kg	0	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
198	\N	RM-PWD-Black-Tea-Powder-1kg	0	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
199	\N	RM-PWD-Organic-Stevia-TSG90-1kg	0	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
200	\N	RM-PWD-Potassium-Sorbate-Powder-5kg	0	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
201	\N	RM-PWD-Salicylic-Acid-Powder-1kg	0	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
202	\N	RM-PWD-Salicylic-Acid-Powder-20kg	0	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
203	\N	RM-PWD-STEVIA-SG95-1KG	0	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
204	\N	RM-PWD-MyoInositol-1kg	0	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
205	\N	RM-PWD-Tea-MatchGreen-1kg	0	0	2024-10-04 00:00:00	2024-10-12 08:07:57.824111-05
\.


--
-- Data for Name: inventory_fba; Type: TABLE DATA; Schema: public; Owner: derrek
--

COPY public.inventory_fba (id, date, fnsku, asin, product_name, total_supply_quantity) FROM stdin;
\.


--
-- Data for Name: sales_and_traffic; Type: TABLE DATA; Schema: public; Owner: derrek
--

COPY public.sales_and_traffic (id, date, total_order_items, ordered_product_sales, units_ordered) FROM stdin;
\.


--
-- Data for Name: tampa_bom_inventory; Type: TABLE DATA; Schema: public; Owner: derrek
--

COPY public.tampa_bom_inventory (id, bom_id, type, phx_class, theoretical_qty, location, cycle_count, date_counted, uom, theo_x_actual_variance, past_30_mo, past_30_fo, manufactured_fulfilled, used_for_mfg_after_actual, conversion, received_qty_after_actual_count, ranking, current_internal_lot_number, used_in_ihf_shipstation_after_count, theo_count_static, actual_count, wh_remarks, variance, random_count, subtype) FROM stdin;
1	RM-PWD-Organic-Monk-Fruit-Extract-10%	Powder	A	0		0	2024-10-04 00:00:00	Kg	0.08	497.2	497.2	0	0	1	0	74777	3	1	0	0		0	0	Powders
2	RM-PWD-Monk-Fruit-Extract-5%	Powder	PLC-2024	200		200	2024-10-04 00:00:00	Kg	0	0	0	0	0	1	0	5000		0	0	200		0	200	Powders
3	RM-PWD-Organic-Stevia-TSG90	Powder	A	114.76		114.76	2024-10-04 00:00:00	Kg	0	0	0	0	0	1	0	4496	LIQ-001	0	0	114.76		0	114.76	Powders
4	RM-PWD-Spirulina-Organic	Powder	C	47.8		48.8	2024-10-04 00:00:00	Kg	2.05	0	0	0	0	1	0	652	Spi-001	1	0	48.8		0	48.8	Powders
5	RM-PWD-Black-Tea-Extract	Powder	A	-7.04		0.96	2024-10-04 00:00:00	Kg	100	943.16	918.76	24.4	0	1	0	0	0	8	0	0.96		0	0.96	Powders
6	RM-PWD-Black-Tea-Extract-Iced	Powder		0		0	2024-10-04 00:00:00	Kg	0	0	0	0	0	1	0	0	BkT-001	0	0	0		0	0	Powders
7	RM-PWD-Stevia-SG95RA60	Powder		385.37		85.37	2024-08-19 00:00:00	Kg	351.41	460.87	458.12	2.75	0	1	300	16956	1	0	0	85.37		0	584.14	Powders
8	RM-PWD-Stevia-Monk-Fruit-Stevia-Blend	Powder	C	47.49		47.49	2024-10-04 00:00:00	Kg	0	0	0	0	0	1	0	760	Bld-001	0	0	47.49		0	47.49	Powders
9	RM-PWD-Magnesium-Bisglycinate-Chelate	Powder	C	157.95		157.95	2024-10-04 00:00:00	Kg	0	0	0	0	0	1	0	4839	LON-001	0	0	157.95		0	157.95	Powders
10	RM-PWD-Shilajith	Powder	A	-11.91		8.09	2024-10-04 00:00:00	Kg	100	20	20	0	20	1	0	0	Shi-001	0	0	8.09		0	8.09	Powders
11	RM-PWD-Pu-erh-Tea	Powder	C	48.24		48.24	2024-10-04 00:00:00	Kg	0	0	0	0	0	1	0	1158	Pur-001	0	0	48.24		0	48.24	Powders
12	RM-PWD-MyoInositol	Powder	C	56.71		56.71	2024-10-04 00:00:00	Kg	0	0	0	0	0	1	0	1239	Myo-001	0	0	56.71		0	56.71	Powders
13	RM-PWD-AlphaGPC	Powder	C	1.88		1.88	2024-10-04 00:00:00	Kg	0	0	0	0	0	1	0	109	GPC-001	0	0	1.88		0	1.88	Powders
14	RM-PWD-Citicoline-Sodium	Powder	B	10		10	2024-10-04 00:00:00	Kg	0	0	0	0	0	1	0	1870	CDP-001	0	0	10		0	10	Powders
15	RM-PWD-Cordyceps-Militaris-Organic	Powder	C	73.8		73.8	2024-10-04 00:00:00	Kg	0	0	0	0	0	1	0	3911	Cor-001	0	0	73.8		0	73.8	Powders
16	RM-PWD-Tea-MatchGreen	Powder	C	85.34		85.34	2024-10-04 00:00:00	Kg	0	0	0	0	0	1	0	2987	Mat-001	0	0	85.34		0	85.34	Powders
17	RM-PWD-Tea-Sencha-Green-Tea-Extract	Powder	B	140.54		140.54	2024-10-04 00:00:00	Kg	0	56.5	56.5	0	0	1	0	2389	GrT-001	0	0	140.54		0	140.54	Powders
18	RM-PWD-BetaAlanine	Powder	C	111.47		111.47	2024-10-04 00:00:00	Kg	0	0	0	0	0	1	0	814	BeA-001	0	0	111.47		0	111.47	Powders
19	RM-PWD-ALCAR	Powder	C	25		25	2024-10-04 00:00:00	kg	0	0	0	0	0	1	0	913	ALC-001	0	0	25		0	25	Powders
20	RM-PWD-Green-Coffee-Bean-Extract	Powder	B	62.19		62.19	2024-10-04 00:00:00	Kg	0	0	0	0	0	1	0	1866	GCB-001	0	0	62.19		0	62.19	Powders
21	RM-PWD-DHM	Powder	A	-0.49		39.51	2024-10-04 00:00:00	Kg	100	40	40	0	40	1	0	0	DHM-001	0	0	39.51		0	39.51	Powders
22	RM-PWD-Longjack-200:1	Powder		50		50	2024-10-04 00:00:00	Kg	0	0	0	0	0	1	0	1250	ALC-001	0	0	50		0	50	Powders
23	RM-PWD-L-Citrulline-Malate-2:1	Powder	C	202.83		203.83	2024-10-04 00:00:00	Kg	0.49	0	0	0	0	1	0	2327	Cit-001	1	0	203.83		0	203.83	Powders
24	RM-PWD-L-Theanine	Powder	C	25		25	2024-10-04 00:00:00	Kg	0	0	0	0	0	1	0	588	Lth-001	0	0	25		0	25	Powders
25	RM-PWD-AgmatineSulfate	Powder	C	0		0	2024-10-04 00:00:00	Kg	0	0	0	0	0	1	0	0	AgS-001	0	0	0		0	0	Powders
26	RM-PWD-AscorbicAcid	Powder		0		0	2024-10-04 00:00:00	Kg	0	0	0	0	0	1	0	0	1	0	0	0		0	0	Powders
27	RM-PWD-Methylene-Blue	Powder	PLC-2024	1.5		1.5	2024-08-19 00:00:00	Kg	0	0	0	0	0	1	0	557		0	0	1.5		0	0.4	Powders
28	RM-PWD-Wheat-Grass-Organic	Powder	C	497.14		497.14	2024-10-04 00:00:00	Kg	0	0	0	0	0	1	0	8451	Whe-001	0	0	497.14		0	497.14	Powders
29	RM-PURIFIED-WATER	Ingredient	C	402.461		405	2024-10-04 00:00:00	Gal	0.63	3109.71	3016.15	93.56	9.61	0.26417	0	1523		0	0	405		0	405	Ingredients
30	RM-PWD-Potassium-Sorbate	Powder		7.82		7.82	2024-08-19 00:00:00	Lbs	0	2.38	2.37	0.01	0	2.20462	0	56	0	0	0	7.82		0	70	Ingredients
31	RM-PWD-Potassium-Sorbate-Granulated	Powder		30.81		30.81	2024-10-04 00:00:00	lbs	0	0	0	0	0	2.20462	0	0		0	0	30.81		0	30.81	Ingredients
32	RM-PWD-SALICYLIC-ACID	Powder	B	73.91		74.91	2024-08-19 00:00:00	Lbs	1.33	4.06	4.06	0	0	2.20462	0	373	0	1	0	74.91		0	27.1	Ingredients
33	RM-PWD-CitricAcid	Powder		108.38		108.38	2024-10-04 00:00:00	lbs	0	2.28	2.27	0.01	0	2.20462	0	478	0	0	0	108.38		0	108.38	Ingredients
34	RM-MENTHOL	Ingredient	B	10.68		10.68	2024-10-04 00:00:00	Lbs	0	1.6	1.6	0	0	2.20462	0	70		0	0	10.68		0	10.68	Ingredients
35	RM-PWD-DL-Panthenol	Powder	C	25.0974	F	26.45	2024-10-04 00:00:00	oz	5.11	0.04	0.04	0	0.04	33.814	0	2	0	0	0	26.45		0	26.45	Ingredients
36	RM-PWD-Silica	Powder	C	0.8559		0.9	2024-10-04 00:00:00	Lbs	4.9	0.02	0.02	0	0.02	2.20462	0	75	0	0	0	0.9		0	0.9	Ingredients
37	RM-Hydrolized-Keratin	Ingredient	C	13.4216		13.62	2024-10-04 00:00:00	Lbs	1.46	0.09	0.09	0	0.09	2.20462	0	146		0	0	13.62		0	13.62	Ingredients
38	RM-Hydrolyzed-Silk-Protein	Ingredient	C	26.9008		27	2024-10-04 00:00:00	Lbs	0.37	0.05	0.05	0	0.05	2.20462	0	61		0	0	27		0	27	Ingredients
39	RM-Aloe-Vera-Juice	Ingredient	C	42.934		43	2024-08-19 00:00:00	Gal	0.15	39.11	39.11	0	0.25	0.26417	0	705		0	0	43		0	30	Ingredients
40	RM-Witch-Hazel-Distillate	Ingredient	C	19.2603		20	2024-08-19 00:00:00	Gal	3.7	48.03	43.48	4.54	2.8	0.26417	0	1112		0	0	20		0	35	Ingredients
41	RM-Polysorbate-20	Ingredient	C	307.0893		307.42	2024-08-19 00:00:00	lbs	0.11	7.75	6.93	0.83	0.15	2.20462	0	836		0	0	307.42		0	150	Ingredients
42	RM-Polysorbate-80	Ingredient	PLC-2024	68.99		68.99	2024-08-19 00:00:00	lbs	0	0	0	0	0	2.20462	0	165		0	0	68.99		0	50	Ingredients
43	RM-PWD-Organic-Citric-Acid	Ingredient	PLC-2024	5		5	2024-10-04 00:00:00	lbs	0	0	0	0	0	2.20462	0	108		0	0	5		0	5	Ingredients
44	RM-PWD-Organic-Sugar-Cane-Alcohol-190	Ingredient	PLC-2024	0		0	2024-10-04 00:00:00	Gal	0	0	0	0	0	0.26417	0	0		0	0	0		0	0	Ingredients
45	RM-PWD-Stevia-Flavor-Toffee	Ingredient	C	160.54		160.54	2024-10-04 00:00:00	oz	0	0	0	0	0	33.814	0	1219		0	0	160.54		0	160.54	Stevia Flavors
46	RM-PWD-Stevia-Flavor-Caramel	Ingredient	C	252.43		252.43	2024-10-04 00:00:00	oz	0	0	0	0	0	33.814	0	1917		0	0	252.43		0	252.43	Stevia Flavors
47	RM-PWD-Stevia-Flavor-Vanilla	Ingredient		190.54		190.54	2024-10-04 00:00:00	oz	0	0	0	0	0	33.814	0	1447		0	0	190.54		0	190.54	Stevia Flavors
48	RM-PWD-Stevia-Flavor-Chocolate	Ingredient		126.54		126.54	2024-10-04 00:00:00	oz	0	0	0	0	0	33.814	0	961		0	0	126.54		0	126.54	Stevia Flavors
49	RM-TA-EUCALYPTUS-ESSENTIAL-OIL-TMP	Ingredient	B	39.59		39.59	2024-08-19 00:00:00	Lbs	0	2.26	2.26	0.01	0	2.20462	0	314		0	0	39.59		0	6	Essential Oils
50	RM-TA-TEA-TREE-ESSENTIAL-OIL-TMP	Ingredient	B	30.46		30.46	2024-08-19 00:00:00	Lbs	0	2.26	2.26	0.01	0	2.20462	0	461		0	0	30.46		0	5	Essential Oils
51	RM-TA-PEPPERMINT-ESSENTIAL-OIL-TMP	Ingredient	B	25.63		25.63	2024-08-19 00:00:00	Lbs	0	2.17	2.17	0	0	2.20462	0	375		0	0	25.63		0	15	Essential Oils
52	RM-TA-LEMON-ESSENTIAL-OIL-TMP	Ingredient	C	47.168		47.19	2024-10-04 00:00:00	Lbs	0.05	0.01	0.01	0	0.01	2.20462	0	1653		0	0	47.19		0	47.19	Essential Oils
53	RM-TA-LAVENDER-ESSENTIAL-OIL-TMP	Ingredient	C	7.16		7.16	2024-08-19 00:00:00	Lbs	0	0.55	0	0.55	0	2.20462	0	123		0	0	7.16		0	5	Essential Oils
54	RM-Clary-Sage-Essential-Oil	Ingredient	A	39		39	2024-10-04 00:00:00	Lbs	0	0	0	0	0	2.20462	0	1438		0	0	39		0	39	Essential Oils
55	RM-Bamboo-Frangrance-Oil	Ingredient	B	17.6236		17.8	2024-10-04 00:00:00	Lbs	0.99	0.08	0.08	0	0.08	2.20462	0	109		0	0	17.8		0	17.8	Essential Oils
56	RM-Bergamot-Italian-Essential-Oil	Ingredient	C	15.48		15.48	2024-10-04 00:00:00	Lbs	0	0	0	0	0	2.20462	0	542		0	0	15.48		0	15.48	Essential Oils
57	RM-Chamomile-Blue-Essential-Oil	Ingredient	C	4.56		4.56	2024-10-04 00:00:00	Lbs	0	0.02	0	0.02	0	2.20462	0	101		0	0	4.56		0	4.56	Essential Oils
58	RM-Grapefruit-Pink-Essential-Oil	Ingredient	C	5.618		5.64	2024-10-04 00:00:00	Lbs	0.39	0.01	0.01	0	0.01	2.20462	0	91		0	0	5.64		0	5.64	Essential Oils
59	RM-Lemongrass-Essential-Oil	Ingredient	C	38.76		38.76	2024-10-04 00:00:00	Lbs	0	0	0	0	0	2.20462	0	407		0	0	38.76		0	38.76	Essential Oils
60	RM-Organic-Orange-Essential-Oil	Ingredient	C	33.4		33.4	2024-10-04 00:00:00	Lbs	0	0	0	0	0	2.20462	0	353		0	0	33.4		0	33.4	Essential Oils
61	RM-Geranium-Egyptian-Essential-Oil	Ingredient	C	4.52		4.52	2024-10-04 00:00:00	Lbs	0	0.22	0	0.22	0	2.20462	0	149		0	0	4.52		0	4.52	Essential Oils
62	RM-Argan-Oil	Ingredient	C	0.878		0.9	2024-10-04 00:00:00	Lbs	2.45	0.01	0.01	0	0.01	2.20462	0	1		0	0	0.9		0	0.9	Essential Oils
63	RM-Olive-Essential-Oil	Ingredient	C	2.86		2.86	2024-10-04 00:00:00	Lbs	0	0.1	0.09	0.01	0	2.20462	0	17		0	0	2.86		0	2.86	Essential Oils
64	RM-TA-JASMINE-VANILLA-NAT-FRAGRANCE-OIL	Ingredient	C	442		442	2024-10-04 00:00:00	oz	0	0	0	0	0	33.814	0	87		0	0	442		0	442	Essential Oils
65	RM-Cashmere-Pear-Fragrance-Oil	Ingredient	A	14		14	2024-08-19 00:00:00	oz	0	0	0	0	0	33.814	0	1		0	0	14		0	20	Essential Oils
66	RM-ROSE-WATER	Ingredient	B	5.25		5.25	2024-10-04 00:00:00	Gal	0	0	0	0	0	0.26417	0	863		0	0	5.25		0	5.25	Essential Oil Water
67	RM-TEA-TREE-WATER	Ingredient	C	19.5103		20.25	2024-08-19 00:00:00	Gal	3.65	2.8	2.8	0	2.8	0.26417	0	1865		0	0	20.25		0	150	Essential Oil Water
68	RM-CLARY-SAGE-WATER	Ingredient	B	7		7	2024-08-19 00:00:00	Gal	0	0	0	0	0	0.26417	0	545		0	0	7		0	10	Essential Oil Water
69	RM-Peppermint-Water	Ingredient	C	-0.7397		0	2024-10-04 00:00:00	Gal	0	2.8	2.8	0	2.8	0.26417	0	0		0	0	0		0	0	Essential Oil Water
70	RM-EUCALYPTUS-WATER	Ingredient	B	5		5	2024-08-19 00:00:00	Gal	0	0	0	0	0	0.26417	0	464		0	0	5		0	5	Essential Oil Water
71	RM-SPEARMINT-WATER	Ingredient	B	4.5		4.5	2024-08-19 00:00:00	Gal	0	0	0	0	0	0.26417	0	547		0	0	4.5		0	3	Essential Oil Water
72	RM-LEMONGRASS-WATER	Ingredient	B	4.5		4.5	2024-08-19 00:00:00	Gal	0	0	0	0	0	0.26417	0	418		0	0	4.5		0	5	Essential Oil Water
73	RM-ISO-ALCOHOL-99	Ingredient	B	885		885	2024-10-04 00:00:00	Gal	0	31.62	27.21	4.42	0	0.26417	0	1113		0	0	885		0	885	Miscellaneous Ingredients
74	RM-ISO-ALCOHOL-70	Ingredient		0		0	2024-10-04 00:00:00	Gal	0	0	0	0	0	0.26417	0	0		0	0	0		0	0	Miscellaneous Ingredients
75	RM-Licorice-Root-Extract	Ingredient	C	6.2995		6.52	2024-10-04 00:00:00	Lbs	3.38	0.1	0.1	0	0.1	2.20462	0	256		0	0	6.52		0	6.52	Miscellaneous Ingredients
76	RM-Diheptyl-Succinate+Capryloyl-Glycerin/Sebacic-Acid Copolymer	Ingredient	C	-0.0441		0	2024-10-04 00:00:00	Lbs	0	0.02	0.02	0	0.02	2.20462	0	0		0	0	0		0	0	Miscellaneous Ingredients
77	RM-Euxyl-PE-9010	Ingredient	C	7.8016		8	2024-08-19 00:00:00	Lbs	2.48	0.09	0.09	0	0.09	2.20462	0	64		0	0	8		0	9	Miscellaneous Ingredients
78	RM-SODIUM-LACTATE	Ingredient	B	115.17		115.17	2024-08-19 00:00:00	Lbs	0	0	0	0	0	2.20462	0	267		0	0	115.17		0	58	Miscellaneous Ingredients
79	RM-Butylene-Glycol	Ingredient	PLC-2024	520.65		520.65	2024-08-19 00:00:00	oz	0	0	0	0	0	33.814	0	10		0	0	520.65		0	33	Miscellaneous Ingredients
80	RM-Cycomethicone-6	Ingredient	PLC-2024	0		0	2024-08-19 00:00:00	lbs	0	0	0	0	0	2.20462	0	0		0	0	0		0	35	Miscellaneous Ingredients
81	RM-Glycerin	Ingredient	PLC-2024	89.32		89.32	2024-10-04 00:00:00	lbs	0	0	0	0	0	2.20462	0	142		0	0	89.32		0	89.32	Miscellaneous Ingredients
82	RM-Acetylsalicylic-Acid	Ingredient	PLC-2024	3.7		3.7	2024-08-19 00:00:00	kg	0	0	0	0	0	1	0	247		0	0	3.7		0	6.75	Miscellaneous Ingredients
83	WL-Crepey-Lotion-8oz-HS	White Label	A	75		75	2024-08-19 00:00:00	units	0	0	0	0	0	1	0	180		0	0	75		0	120	White Label Cosmetics
84	WL-Acne-Face-Cream-2oz-PLSF	White Label	A	0		0	2024-10-04 00:00:00	units	0	0	0	0	0	1	0	14493		0	0	0		0	0	White Label Cosmetics
85	WL-Acne-Face-Cream-2oz-Shay	White Label	A	123		123	2024-10-04 00:00:00	units	0	0	0	0	0	1	0	216		0	0	123		0	123	White Label Cosmetics
86	WL-Scar-Cream-2oz-Shay	White Label	C	752		752	2024-08-19 00:00:00	units	0	0	0	0	0	1	0	1233		0	0	752		0	120	White Label Cosmetics
87	WL-Scar-Cream-2oz-PLSF	White Label	C	0		0	2024-10-04 00:00:00	units	0	0	0	0	0	1	0	0		0	0	0		0	0	White Label Cosmetics
88	WL-Cucumber-Body-Lotion-8oz-Shay	White Label	A	75		75	2024-08-19 00:00:00	units	0	0	0	0	0	1	0	224		0	0	75		0	150	White Label Cosmetics
89	WL-Body-Wash-8oz-Shay	White Label	B	0		0	2024-08-19 00:00:00	units	0	0	50	-50	0	1	0	6498		0	0	0		0	0	White Label Cosmetics
90	WL-Body-Wash-8oz-PLSF	White Label		0		0	2024-10-04 00:00:00	units	0	0	0	0	0	1	0	0		0	0	0		0	0	White Label Cosmetics
91	WL-Cystic-Spot-0.5oz-PLSF	White Label		0		0	2024-10-04 00:00:00	units	0	0	0	0	0	1	0	0		0	0	0		0	0	White Label Cosmetics
92	WL-Invisible-Spot-Treatment-PLSF	White Label	B	0		0	2024-10-04 00:00:00	units	0	0	0	0	0	1	0	4726		0	0	0		0	0	White Label Cosmetics
93	WL-Four-In-One-8oz-PLSF	White Label	C	333		333	2024-10-04 00:00:00	units	0	0	0	0	0	1	0	2194		0	0	333		0	333	White Label Cosmetics
94	WL-Four-In-One-4oz-PLSF	White Label	B	0		0	2024-10-04 00:00:00	units	0	0	0	0	0	1	0	6103		0	0	0		0	0	White Label Cosmetics
95	WL-Retinol-Cream-2oz-PLSF	White Label	C	25		25	2024-10-04 00:00:00	units	0	0	0	0	0	1	0	88		0	0	25		0	25	White Label Cosmetics
96	WL-Oil-Free-Skin-Repair-Serum-2oz-Shay	White Label	C	0		0	2024-10-04 00:00:00	units	2.66	50	50	0	50	1	0	531		0	0	0		0	0	White Label Cosmetics
97	WL-Acne-Patches	White Label	B	0		0	2024-08-19 00:00:00	units	0	500	500	0	0	1	0	2745		0	0	0		0	0	White Label Cosmetics
98	WL-Skin-Vitamins-60-Nutrafill	White Label		0		0	2024-10-04 00:00:00	units	0	0	0	0	0	1	0	0		0	0	0		0	0	White Label Cosmetics
99	WL-Hair-Savior-60-Norax	White Label	C	33		33	2024-10-04 00:00:00	units	0	0	0	0	0	1	0	157		0	0	33		0	33	White Label Cosmetics
100	TA-Pimple-Tool-Kit	Ingredient	C	206		206	2024-10-04 00:00:00	units	0	500	500	0	0	1	0	351		0	0	206		0	206	White Label Cosmetics
101	Scoop-.625cc	Scoop	A	7200		0	2024-10-07 00:00:00	units	180	0	0	0	0	0	9000	0		0	0	0		0	0	Organic Room Packaging
102	Scoop-1.25cc	Scoop	C	3600		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Organic Room Packaging
103	PCH-5oz-TH-OrganicMonkFruit-Preprinted	container/Pouch	A	-1200		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Organic Room Packaging
104	PCH-5oz-NAT-OrganicMonkfruit-Preprinted	container/Pouch	A	10556		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Organic Room Packaging
105	PCH-5oz-NAT-OrganicStevia-Preprinted	container/Pouch	B	9700		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Organic Room Packaging
106	PCH-5oz-PS-OrganicMonkfruit-Preprinted	Label	A	9700		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Organic Room Packaging
107	PCH-5oz-PS-OrganicStevia-Preprinted	Label	A	6700		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Organic Room Packaging
108	PCH-5oz-WHYZ-OrganicMonkFruit-Preprinted	container/Pouch	A	0		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Organic Room Packaging
109	PCH-1oz-Stndup-WHITE-Matt	Container/Pouch	B	8000		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Pouches
110	PCH-2oz-Stndup-WH-Matt	Container/Pouch		2100		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Pouches
111	PCH-4oz-Stndup-WH-Matt	container/Pouch	B	7250		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Pouches
112	PCH-5oz-Stndup-WH-Matt	Container/Pouch	C	8000		0	2024-10-07 00:00:00	units	0	0	0	100	0	0	0	0		0	0	0		0	0	Pouches
113	PCH-8oz-Stndup-WH-Matt	container/Pouch	B	8200		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Pouches
114	PCH-16oz-Stndup-WH-Matt	Eco Bags	B	3000		0	2024-10-07 00:00:00	units	0	0	0	-50	0	0	0	0		0	0	0		0	0	Pouches
115	PCH-24oz-Stndup-WH-Matt	container/Pouch		500		500	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Pouches
116	PCH-5oz-Stndup-BLACK-Matt	Container/Pouch	B	2000		0	2024-10-07 00:00:00	units	100	0	0	0	0	0	1000	0		0	0	0		0	0	Pouches
117	PCH-1oz-Stndup-BLACK-Matt	Container/Pouch	C	4000		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Pouches
118	PCH-4oz-TH-New-Preprinted	container/Pouch		3500		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	723		0	723	Brand Name Pouches
119	PCH-5oz-TH-New-Preprinted	container/Pouch	B	-1853		0	2024-10-07 00:00:00	units	0	0	0	3	0	0	0	0		0	0	0		0	0	Brand Name Pouches
120	PCH-2oz-PS-Stndup-Matt	container/Pouch	C	16490		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Brand Name Pouches
121	PCH-5oz-PS-Stndup-Matt	Container/Pouch	A	22442		0	2024-10-07 00:00:00	units	0	0	0	100	0	0	0	0		0	0	0		0	0	Brand Name Pouches
122	PCH-8oz-PS-Stndup-Matt	container/Pouch	C	1800		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	809		0	809	Brand Name Pouches
123	PCH-16oz-PS-Stndup-Matt	container/Pouch		0		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Brand Name Pouches
124	PCH-24oz-PS-Stndup-Matt	container/Pouch		1900		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	300		0	300	Brand Name Pouches
125	BTL-2oz-Cosmo-White-20-410	Safety Shrink Band	C	7500		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Bottles
126	BTL-4oz-Cosmo-White-24-410-HS	CM Packaging-Container		0		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Bottles
127	BTL-4oz-Cosmo-White-20-410	Container/Pouch	B	17623		0	2024-10-07 00:00:00	units	0	0	0	11	0	0	0	0		0	0	0		0	0	Bottles
128	BTL-8oz-Cosmo-White-24-410	container/Pouch	C	8920		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Bottles
129	BTL-8oz-Cosmo-White-24-410-HS	CM Packaging-Container	A	0		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Bottles
130	BTL-4oz-Cylinder-Round-White-24-410	Container/Pouch	B	-1012		900	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Cylinder Bottles
131	BTL-24-410-Cylinder-Round-8oz-White	Container/Pouch	A	4301		0	2024-10-07 00:00:00	units	0	0	0	103	0	0	0	0		0	0	0		0	0	Cylinder Bottles
132	BTL-2oz-Oval-Teardrop-White-20-410	Container/Pouch		24515		0	2024-10-07 00:00:00	units	0	0	0	-90	0	0	0	0		0	0	0		0	0	Misc Bottles/Containers
133	BTL-16oz-Diamond-White-24-410	Container/Pouch	C	2781		0	2024-10-07 00:00:00	units	0	0	0	129	0	0	0	0		0	0	0		0	0	Misc Bottles/Containers
134	1/2oz-Thick-Wall-Jar+Lid-Black	Container/Pouch	PLC-2024	432		432	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Misc Bottles/Containers
135	BOX-TA-Cystic-Spot-Covalence	CM-Box	C	0		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Misc Bottles/Containers
136	CAP-24-410-Drip-Tip	Top Cover	A	2513		0	2024-10-07 00:00:00	units	0	0	0	13	0	0	0	0		0	0	0		0	0	Caps
137	CAP-20-410-Drip-Tip	Top Cover		9500		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Caps
138	SPRAY-MIST-20-410-White-5.5-NEW	Top Cover	B	19716		0	2024-10-07 00:00:00	units	0	0	0	11	0	0	0	0		0	0	0		0	0	Caps
139	SPRAY-MIST-24-410-White-7.5"	Top Cover	C	21920		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Caps
140	TRIGGER-SPRAYER-24-410-7.75-Black	Top Cover	B	971		0	2024-08-19 00:00:00	units	0	0	0	129	0	0	0	0		0	0	750		0	0	Caps
141	LID-89-400-Cap-F217-Liner-White-HS	CM Packaging-Top	A	420		420	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Caps
142	Safetry-Shrink-Dome-M1421CL-8oz	Safety Shrink Band	B	19951		0	2024-10-07 00:00:00	units	0	0	0	-50	0	0	0	0		0	0	0		0	0	Shrink Bands
143	M1006CL-Dome-Shrink-Band 66X175	Safety Shrink Band		10866		0	2024-10-07 00:00:00	units	0	0	0	11	0	0	0	0		0	0	0	Located more of this BOM	0	0	Shrink Bands
144	M172-Shrink-Band-118x70	Safety Shrink Band	B	20000		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0	Located more of this BOM	0	0	Shrink Bands
145	M879CL-Dome-Shrink-Band 77X240	Safety Shrink Band	B	12451		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Shrink Bands
146	M1109CL-Safety-Shrink-Band-100x38mm	Safety Shrink Band	A	7871		0	2024-10-07 00:00:00	units	0	0	0	129	0	0	0	0		0	0	0		0	0	Shrink Bands
147	M1005CL-Dome-Shrink-Band 77X185	Safety Shrink Band		0		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Shrink Bands
148	M1612CL-Dome-Shrink-Band 100X180mm	Safety Shrink Band	A	0		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Shrink Bands
149	M15208CL-Clear-Perforated-Shrink-Band 152x150	Safety Shrink Band		10000		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Shrink Bands
150	M1151CL-Dome-Shrink-Band-52x143	safety Shrink Band	C	18600		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Shrink Bands
151	M139CL-Safety-Shrink-Band-75x28mm	Safety Shrink Band		14000		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Shrink Bands
152	Safetry-Shrink-M175-57x36	Safety Shrink Band		15000		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Shrink Bands
153	LABL-NS-Shrink-Sleeve-Liquid-Stevia-OG-US-2oz	Label		5736		0	2024-10-07 00:00:00	units	0	0	0	-90	0	0	0	0		0	0	0		0	0	Shrink Bands
154	LABL-NS-Shrink-Sleeve-Liquid-Stevia-Vanilla-US-2oz	Label		3940		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Shrink Bands
155	LABL-NS-Shrink-Sleeve-Liquid-Stevia-Caramel-US-2oz	Label	C	4140		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Shrink Bands
156	LABL-NS-Shrink-Sleeve-Liquid-Stevia-Chocolate-US-2oz	Label		3736		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Shrink Bands
157	LABL-NS-Shrink-Sleeve-Liquid-Stevia-Toffee-US-2oz	Label	C	3940		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Shrink Bands
158	LABL-NS-Shrink-Sleeve-Monk-Fruit-Extract-US-2oz	Label	C	4200		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Shrink Bands
159	CLEARECOBAG-4X5	Eco Bags		1500		0	2024-10-07 00:00:00	units	0	0	0	-90	0	0	0	0		0	0	0		0	0	Shrink Bands
160	CLEARECOBAG-6X8	Eco Bags		6150		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Shrink Bands
161	CLEARECOBAG-7.5X10	Eco Bags		0		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Shrink Bands
162	CLEARECOBAG-10.5X14	Eco Bags		0		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Shrink Bands
163	CLEARECOBAG-8.25x10.25	Eco Bags	C	2030		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Shrink Bands
164	LABL-NS-3.75x4.75-Liquid-Stevia-US-4oz	Label	B	-332		0	2024-08-19 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Labels (Liquids)
165	LABL-NS-6x5-Liquid-Stevia-US-8oz	Eco Bags	A	7585		0	2024-10-07 00:00:00	units	5.41	0	0	103	0	0	1000	0		0	0	0		0	0	Labels (Liquids)
166	LABL-NS-6x5-Monk-Fruit-Liquid-US-8oz	Label	B	1000		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Labels (Liquids)
167	LABL-NS-6x5-Monk-Fruit-Liquid-Stevia-US-8oz	Label	B	2420		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Labels (Liquids)
168	LABL-NS-6x5-Organic-Liquid-Stevia-US-8oz	Label	PLC-2024	0		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Labels (Liquids)
169	LABL-NS-2.875x3.750-Monk-Fruit-Stevia-Liquid-2oz	Label	C	3600		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Labels (Liquids)
170	LABL-NS-6.125x5-Monk-Fruit-Stevia-Liquid-2oz	Label		6500		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Labels (Liquids)
171	LABL-NS-6x5-Organic-Liquid-Monk-Fruit-US-8oz	Label	PLC-2024	500		500	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	500		0	500	Labels (Liquids)
172	LABL-WHYZ-6.125x5-Liquid-Stevia-Drops-8oz	Label	A	640		0	2024-08-19 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Labels (Liquids)
173	LABL-TN-3.75x2.875-Liquid-Stevia-Drops-2oz	Label	C	1000		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Labels (Liquids)
174	LABL-TN-6.125x5-Liquid-Stevia-Drops-8oz	Label	B	679		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Labels (Liquids)
175	LABL-TN-2.5x3.125-Monk-Fruit-Sweetener-1oz	Label	PLC-2024	1000		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Labels (Liquids)
176	LABL-TN-2.5x3.125-Monk-Fruit-Sweetener-5oz	Label	PLC-2024	1000		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Labels (Liquids)
177	LABL-TN-2.5x3.125-Monk-Fruit-Sweetener-1lb	Label	PLC-2024	1000		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Labels (Liquids)
178	LABL-PS-3.75x3-Black-Tea-Iced-4oz	Label	A	1940		0	2024-10-07 00:00:00	units	200	0	0	100	0	0	4000	0		0	0	0		0	0	Purisure Labels
179	LABL-PS-3.75x3-Black-Tea-125g	Label	A	310		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	1000	0		0	0	0		0	0	Purisure Labels
180	LABL-PS-3.75x3-Green-Tea-Extract-250g	Label	C	0		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Purisure Labels
181	LABL-PS-3.75x3-Shilajit-25g	Label	C	0		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Purisure Labels
182	LABL-PS-3.75x3-Shilajit-100g	Label	A	1730		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Purisure Labels
183	LABL-PS-3.75x3-Green-Coffee-Ext-150g	Label	B	1500		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Purisure Labels
184	LABL-PS-3.75x3-CDP-Choline-10g	Label	C	0		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Purisure Labels
185	LABL-PS-3.75x3-CDP-Choline-50g	Label	B	700		700	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	700		0	700	Purisure Labels
186	LABL-PS-3.75x3-Vit-C-250g	Label	C	0		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Purisure Labels
187	LABL-PS-4x6-Vitamin-C-1kg	Label	C	0		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Purisure Labels
188	LABL-PS-3.75x3-Citrulline-Malate-250g	Label	C	0		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Purisure Labels
189	LABL-PS-3.75x3-Citrulline-Malate-1kg	Label	C	2620		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Purisure Labels
190	LABL-PS-3.75x3-Alpha-GPC-25g	Label	C	0		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	800		0	800	Purisure Labels
191	LABL-PS-3.75x3-Alpha-GPC-100g	Label	C	1015		515	2024-10-07 00:00:00	units	97.09	0	0	0	0	0	500	0		0	0	800		0	800	Purisure Labels
192	LABL-PS-3.75x3-Theanine-100g	Label	C	0		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Purisure Labels
193	LABL-7X2.5-PS-Caffeine-L-Theanine	Label	C	1000		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Purisure Labels
194	LABL-PS-3.75x3-Monk-Fruit-Stevia-Blend-4X-4oz	Label	C	0		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Purisure Labels
195	LABL-PS-3.75x3-Myo-Inositol-1kg	Label	C	1020		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Purisure Labels
196	LABL-PS-3.75x3-Longjack-200:1-100g	Label	C	500		500	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	500		0	500	Purisure Labels
197	LABL-PS-3.75x3-Longjack-100:1-25g	Label		0		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Purisure Labels
198	LABL-PS-3.75x3-Wheat-Grass-Org-150g	Label	C	1020		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Purisure Labels
199	LABL-PS-3.75x3-Wheatgrass-Powder-Org-8oz	Label	C	1030		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Purisure Labels
200	LABL-PS-3.75x3-Agmatine-100g	Label	C	0		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Purisure Labels
201	LABL-PS-3.75x3-Dihydromyricetin-DHM-100g	Label	A	980		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Purisure Labels
202	LABL-PS-3.75x4.75-Beta-Alanine-1kg	Label	C	1940		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Purisure Labels
203	LABL-PS-3.75x3-Beta-Alanine-1kg	Label		1940		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Purisure Labels
204	LABL-PS-3.75x4.75-Alcar-250g	Label	C	1490		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Purisure Labels
205	LABL-PS-3.75x4.75-Spirulina-Org-16oz	Label	C	828		828	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	828		0	828	Purisure Labels
206	LABL-PS-3.75x3-Spirulina-Org-16oz	Label		1020		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Purisure Labels
207	LABL-PS-5.25x0.40-Methylene-Blue-5g	Label	PLC-2024	200		200	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	200		0	200	Purisure Labels
208	LABL-PS-3.75x2.875-Shrink-Sleeve-Liquid-Monk-Fruit-2oz	Label	C	1600		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Purisure Labels
209	LABL-TH-3.5x3-Black-Tea-4oz-Back	Label	A	-983		500	2024-08-19 00:00:00	units	600	0	0	3	0	0	3000	0		0	0	0		0	500	Teakihut Labels
210	LABL-TH-3.75x3-Green-Tea-4oz	Label	B	1500		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Teakihut Labels
211	LABL-TH-3.75x3-Matcha-Green-Tea-5oz-Organic-Back	Label	C	1030		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Teakihut Labels
212	LABL-TH-3.75x3-Puerh-4oz	Label	C	1283		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Teakihut Labels
213	LABL-TH-3.75x3-Monk-Stevia-Blend-4oz	Label	C	1020		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Teakihut Labels
214	LABL-TH-3.75x3-Matcha-Green-Tea-Org-4oz	Label	C	550		550	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Teakihut Labels
215	LABL-WHYZ-4x6-Beta-Alanine-350g	Label	C	1400		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	WHYZ Labels 
216	LABL-WHYZ-4x6-Alcar-125g	Label	C	1450		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	WHYZ Labels 
217	LABL-WHYZ-4x6-Shilajit-50g	Label	B	3660		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	WHYZ Labels 
218	LABL-WHYZ-4x6-Myo-Inositol-8oz	Label	C	350		350	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	480		0	480	WHYZ Labels 
219	LABL-WHYZ-4x6-Magnesium-Bisglycinate-10oz	Label	C	2040		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	WHYZ Labels 
220	LABL-WHYZ-4x6-Green-Coffee-Bean-Powder-125g	Label	C	515		515	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	500		0	500	WHYZ Labels 
221	LABL-WHYZ-4x6-Tongkat-Ali-Powder-4oz	Label	C	895		895	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	250		0	250	WHYZ Labels 
222	LABL-WHYZ-4x6-Organic-WheatGrass-Powder-300g	Label	C	1020		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	WHYZ Labels 
223	LABL-WHYZ-4x6-Organic-Cordyceps-Powder-200g	Label	C	1020		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	800		0	800	WHYZ Labels 
224	LABL-WHYZ-4x6-Organic-Spirulina-Powder-250g	Label	C	3040		0	2024-08-19 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	WHYZ Labels 
225	LABL-WHYZ-4x6-Monk-Fruit-Ext-5oz	Label	A	2800		300	2024-10-07 00:00:00	units	833.33	0	0	0	0	0	2500	0		0	0	0		0	0	WHYZ Labels 
226	LABL-WHYZ-4x6-Organic-Stevia-8oz	Label	B	820		820	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	100		0	100	WHYZ Labels 
227	LABL-WHYZ-4x6-Black-Tea-4.5oz	Label	PLC-2024	0		0	2024-10-07 00:00:00	units	0	0	0	100	0	0	0	0		0	0	0		0	0	WHYZ Labels 
228	LABL-WHYZ-4x6-Organic-Matcha-Powder-125g	Label	C	0		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	WHYZ Labels 
229	LABL-TN-2.5x3.125-Organic-Stevia-Extract-1oz	Label	C	800		800	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Tejonova Labels
230	LABL-TN-4x5.5-Organic-Stevia-Extract-5oz	Label	C	1000		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Tejonova Labels
231	LABL-TN-2.5x3.125-Organic-Monk-Fruit-1oz	Label	C	2000		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Tejonova Labels
232	LABL-TN-4x5.5-Organic-Monk-Fruit-4.5oz	Label	B	2750		550	2024-10-07 00:00:00	units	400	0	0	0	0	0	2200	0		0	0	0		0	0	Tejonova Labels
233	LABL-NS-3.75x3-Monk-Fruit-4oz-Front	Label	A	1095		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Alternative Labels for Preprinted Pouches
234	LABL-NS-3.75x3-Monk-Fruit-4oz-Back	Label	A	1095		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Alternative Labels for Preprinted Pouches
235	LABL-NS-3.75x3-Stevia-Powder-4oz-Front	Label	B	923		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Alternative Labels for Preprinted Pouches
236	LABL-NS-3.75x3-Stevia-Powder-4oz-Back	Label	B	923		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Alternative Labels for Preprinted Pouches
237	LABL-TH-3.75x3-Monk-Fruit-Extract-4oz	Label	A	1950		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Alternative Labels for Preprinted Pouches
238	LABL-PS-3.75x3-Monk-Fruit-Extract-125g	Label	A	2100		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Alternative Labels for Preprinted Pouches
239	LABL-PS-3.75x3-Stevia-Powder-125g	Label	A	0		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Alternative Labels for Preprinted Pouches
240	LABL-TA-3.75x3-Milia-Patches-5pack	Label	C	8005		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	TA Milia Labels
241	LABL-TA-3.75x3-Milia-Patches	Label	A	6730		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0	We dont use this but mapping system thinks we do 	0	0	TA Milia Labels
242	LABL-TA-4.75x4.75-Milia-Kit-Bundle	Label	A	4735		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	TA Milia Labels
244	LABL-TA-3.75x3-Milia	Label	C	2500		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	TA Milia Labels
245	LABL-TA-6.125X0.5625-Invis-Spot-Side	Label	B	5400		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	TA Skincare Cream Labels
246	LABL-TA-Face-Cream-Side-2oz	Label	A	2500		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	TA Skincare Cream Labels
247	LABL-TA-1.25x7.125-Retinol-Cream-2oz	Label	C	200		200	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	270		0	270	TA Skincare Cream Labels
248	LABL-TA-1.25x7.125-Scar-Cream-Side-PLSF	Label	C	2503		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	TA Skincare Cream Labels
249	LABL-TA-1.25x7.125-Scar-Cream-Side-Shay	Label	PLC-2024	1999		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	TA Skincare Cream Labels
250	LABL-11.3125x1.625-Crepey-Skin-Cream-Side	Label	A	1600		0	2024-10-07 00:00:00	units	0	0	0	-90	0	0	0	0		0	0	0		0	0	TA Skincare Cream Labels
251	LABL-TA-Psoriasis-Side	Label	B	1050		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	TA Skincare Cream Labels
252	LABL-TA-Dermatitis-Side	Label	C	1500		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	TA Skincare Cream Labels
253	LABL-TA-Cucumber-Lotion-8oz	Label	A	1700		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	350		0	350	TA Skincare Lotion Labels
254	LABL-TA-11.313x1.625-Rough-and-Bumpy-Skin-Lotion-8oz	Label	PLC-2024	1020		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	650		0	650	TA Skincare Lotion Labels
255	LABL-TA-3.75x4.75-Body-Spray-4oz	Label	A	4430		0	2024-08-19 00:00:00	units	46.9	0	0	0	0	0	2500	0		0	0	0		0	0	TA Skincare Spray Labels
256	LABL-TA-3.5x4.75-Alc-Free-Pillow-Spray-4oz	Label		2014		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	520		0	520	TA Skincare Spray Labels
257	LABL-TA-5.93x2.37-Acne-Face-Spray-4oz	Label	B	1750		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	TA Skincare Spray Labels
258	LABL-TA-3.75x4.75-Toner-4oz	Label	B	615		615	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	350		0	350	TA Skincare Spray Labels
259	LABL-TA-3.75x4.75-Yoga-Mat-Spray-4oz	Label	B	405		576	2024-10-07 00:00:00	units	0	0	0	11	0	0	0	0		0	0	250		0	250	TA Skincare Spray Labels
260	LABL-TA-3.75x4.75-Room-Spray-4oz	Label	C	1400		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	TA Skincare Spray Labels
261	LABL-TA-3.75x4.75-Sleep-Spray-4oz	Label	C	100		100	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	280		0	280	TA Skincare Spray Labels
262	LABL-TA-5.3x5.2-Sleep-Spray-Lavender-8oz	Label	C	1200		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	TA Skincare Spray Labels
263	LABL-TA-5.3125x5.25-Sleep-Spray-16oz	Label	C	619		748	2024-10-07 00:00:00	units	0	0	0	129	0	0	0	0		0	0	500		0	500	TA Skincare Spray Labels
264	LABL-5.75X5.25-Linen-Spray-Lav-Wrap	Label	B	760		760	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	650		0	650	TA Skincare Spray Labels
265	LABL-TA-3.75x4.75-Air-Freshener-4oz	Label	C	300		300	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	350		0	350	TA Skincare Spray Labels
266	LABL-TA-3.75x4.75-Shower-Spray-4oz	Label	C	250		250	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	290		0	290	TA Skincare Spray Labels
267	LABL-TA-3.75x4.75-Shower-Spray-Xtra-Stre-4oz	Label	C	8170		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	50		0	50	TA Skincare Spray Labels
268	LABL-TA-Pillow-Spray	Label	A	-20		500	2024-08-19 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	500	TA Skincare Spray Labels
269	LABL-5.75X5-Hair-Growth-Bamb-Wrap	Label	B	53		133	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	TA Skincare Spray Labels
270	LABL-5.75X5-Hair-Growth-Grape-Wrap	Label	C	800		800	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	500		0	500	TA Skincare Spray Labels
271	LABL-5.75X5-Hair-Growth-Lav-Wrap	Label	C	893		893	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	600		0	600	TA Skincare Spray Labels
272	LABL-TA-5.75x4.75-Acne-Exfo-Body-Wash-8oz	Label	B	2178		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	TA Skincare Cleanser Labels
273	LABL-TA-5.75x4.75-Anti-Aging-Exfo-Body-Wash-8oz	Label	C	1000		0	2024-10-07 00:00:00	units	0	0	0	-50	0	0	0	0		0	0	0		0	0	TA Skincare Cleanser Labels
276	LABL-TA-8.79x1.58-Four-In-One-Acne-Treatment-4oz	Label	B	1500		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	TA Misc Cosmetic Labels
277	LABL-TA-3.94x1.625-Deep-Wrinkle-Serum-1oz	Label		0		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	TA Misc Cosmetic Labels
278	LABL-TA-5.75x4.75-After-Shave-Razor-Bump-8oz	Label	PLC-2024	1020		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	TA Misc Cosmetic Labels
279	LABL-TA-3.75x3-Acne-Patches	Label	B	8919		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	TA Misc Cosmetic Labels
280	LABL-TA-3.75x3-2Step-Cystic-Face-Wash-Bundle	Label	C	0		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	TA Misc Cosmetic Labels
281	LABL-TA-3.75x3-TA-2StepAcneKit-FCreamFWash3.4oz	Label	C	1053		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	TA Misc Cosmetic Labels
282	LABL-TA-3.75x3-5StepAcneKit	Label	C	900		900	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	900		0	900	TA Misc Cosmetic Labels
283	LABL-5.5x2-Skin-Savior-60	Label		515		515	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	515		0	515	TA Misc Cosmetic Labels
284	LABL-10.5905x1.6418-TA-Four-In-One-Acne-Treatment-8oz	Label	C	4930		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	TA Misc Cosmetic Labels
243	LABL-TA-5.8x0.625-Milia-Spot-Treatment-0.5oz			0		0	2024-10-07 00:00:00		0	0	0	0	0	0	0	\N		0	0	0		0	0	TA Alternative Labels for CM Cosmetics
274	LABL-TA-Acne-Eliminating-Face-Cleanser-8oz-HS			0		0	2024-10-07 00:00:00		0	0	0	0	0	0	0	\N		0	0	0		0	0	TA Alternative Labels for CM Cosmetics
275	LABL-TA-Acne-Eliminating-Face-Cleanser-3.4oz-HS			0		0	2024-10-07 00:00:00		0	0	0	0	0	0	0	\N		0	0	0		0	0	TA Alternative Labels for CM Cosmetics
285	LABL-TA-5.8x0.625-Cystic-Acne-Spot-0.5oz-Covalence	CM Packaging-Label	C	1880		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	800		0	800	TA Alternative Labels for CM Cosmetics
286	LABL-AY-Charcoal-To-Sparkle-Acne-Wash-3.4oz-HS	CM Packaging-Label	C	400		400	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	400		0	400	Ayadara Labels
287	LABL-AY-Charcoal-To-Sparkle-Acne-Wash-8oz-HS	CM Packaging-Label	C	2540		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Ayadara Labels
288	LABL-AY-6.125x0.5625-Warrior-2-Spot-Jar	Label	B	3000		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Ayadara Labels
289	LABL-AY-6.125x0.5625-Warrior-1-Spot-Jar	Label	B	649		649	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Ayadara Labels
290	LABL-AY-3.75x3-Warrior-One-Front	Label	B	250		250	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	100		0	100	Ayadara Labels
291	LABL-AY-3.75x3-Warrior-Two-Front	Label	B	700		700	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	750		0	750	Ayadara Labels
292	LABL-AY-3.75x4.75-Day-Night-Acne-Kit-Front	Label	B	500		500	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	500		0	500	Ayadara Labels
293	LABL-AY-3.75x4.75-Day-Night-Acne-Kit-Back	Label	B	500		500	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	500		0	500	Ayadara Labels
294	LABL-AY-Crepe-Repair-Side	Label	A	12597		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Ayadara Labels
295	LABL-AY-Scars-No-More-Side	Label	B	1500		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Ayadara Labels
296	LABL-1.25x7.125-Breakout-Warrior-Acne-Cream-Side	Label	B	2054		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Ayadara Labels
297	LABL-AY-7.125x3-Bootylicious-8oz	Label	B	2789		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Ayadara Labels
298	LABL-AY-Celestial-Body-Acne-Body-Lotion-8oz	Label	C	1030		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	220		0	220	Ayadara Labels
299	LABL-8.79x1.58-AY-Exfoliate-Bad-Vibes-Acne-Scrub-4oz	Label	C	280		400	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	80		0	80	Ayadara Labels
300	LABL-10.5905x1.6418-AY-Stardust-Sulfur-Scrub-8oz	Label	C	515		515	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	292		0	292	Ayadara Labels
301	LABL-AY-Acne-Face-Spray-4oz	Label		400		400	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	400		0	400	Ayadara Labels
302	LABL-AY-Wild-God-Toner-4oz	Label	C	2400		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Ayadara Labels
303	LABL-AY-Clear-Sleep-Pillow-Mist-4oz	Label		1537		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Ayadara Labels
304	LABL-AY-3.75x4.75-Yoga-Mat-Spray-4oz	Label	C	984		984	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Ayadara Labels
305	LABL-AY-5.75x4.75-Boho-Body-Wash-Side-8oz	Label	C	1320		0	2024-08-19 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Ayadara Labels
306	LABL-AY-5.25x5.75-Shower-Spray-Euc-8oz	Label	C	400		400	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	400		0	400	Ayadara Labels
307	LABL-AY-3.75x4.75-Body-Spray-4oz	Label	B	3900		0	2024-08-19 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Ayadara Labels
308	LABL-5.3125X5.25-AY-Reverse-Warrior-Body-Spray-8oz	Label	C	3173		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Ayadara Labels
309	LABL-AY-7.5x5.5-Here-Comes-The-Sun-Room-Spray-16oz	Label	C	2857		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Ayadara Labels
310	LABL-AY-0.625x6.188-Salicylic-Acid-Spot-0.5oz-PLSF	Label	PLC-2024	0		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Ayadara Labels
311	LABL-AY-1.25x7.125-Salicylic-Acid-Acne-Face-Cream-2oz-PLSF	Label	PLC-2024	0		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Ayadara Labels
312	LABL-AY-Sulfur-Bentonite-Clay-Face-Scrub-4oz-PLSF	Label	PLC-2024	0		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Ayadara Labels
313	LABL-NS-1.5X1.5-25OFF	Label		0		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Promo Stickers 
314	LABL-WHYZ-1.5X1.5-25OFF	Label		0		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Promo Stickers 
315	LABL-PS-1.5X1.5-25OFF	Label		0		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Promo Stickers 
316	LABL-TH-1.5X1.5-25OFF	Label		0		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Promo Stickers 
317	LABL-TA-1.5X1.5-25OFF	Label		2000		0	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Promo Stickers 
318	LABL-AY-1.5X1.5-25OFF	Label		400		400	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	300		0	300	Promo Stickers 
319	INSRT-CYSTIC-3.5X2-INFOCARD	Label		800		800	2024-10-07 00:00:00	units	0	0	0	0	0	0	0	0		0	0	0		0	0	Promo Stickers 
\.


--
-- Data for Name: tampa_bom_inventory_change_log; Type: TABLE DATA; Schema: public; Owner: derrek
--

COPY public.tampa_bom_inventory_change_log (id, inventory_id, field_name, old_value, new_value, changed_at, changed_by) FROM stdin;
1	1	created		new entry	2024-10-12 08:07:53.538469-05	system
2	2	created		new entry	2024-10-12 08:07:53.538469-05	system
3	3	created		new entry	2024-10-12 08:07:53.538469-05	system
4	4	created		new entry	2024-10-12 08:07:53.538469-05	system
5	5	created		new entry	2024-10-12 08:07:53.538469-05	system
6	6	created		new entry	2024-10-12 08:07:53.538469-05	system
7	7	created		new entry	2024-10-12 08:07:53.538469-05	system
8	8	created		new entry	2024-10-12 08:07:53.538469-05	system
9	9	created		new entry	2024-10-12 08:07:53.538469-05	system
10	10	created		new entry	2024-10-12 08:07:53.538469-05	system
11	11	created		new entry	2024-10-12 08:07:53.538469-05	system
12	12	created		new entry	2024-10-12 08:07:53.538469-05	system
13	13	created		new entry	2024-10-12 08:07:53.538469-05	system
14	14	created		new entry	2024-10-12 08:07:53.538469-05	system
15	15	created		new entry	2024-10-12 08:07:53.538469-05	system
16	16	created		new entry	2024-10-12 08:07:53.538469-05	system
17	17	created		new entry	2024-10-12 08:07:53.538469-05	system
18	18	created		new entry	2024-10-12 08:07:53.538469-05	system
19	19	created		new entry	2024-10-12 08:07:53.538469-05	system
20	20	created		new entry	2024-10-12 08:07:53.538469-05	system
21	21	created		new entry	2024-10-12 08:07:53.538469-05	system
22	22	created		new entry	2024-10-12 08:07:53.538469-05	system
23	23	created		new entry	2024-10-12 08:07:53.538469-05	system
24	24	created		new entry	2024-10-12 08:07:53.538469-05	system
25	25	created		new entry	2024-10-12 08:07:53.538469-05	system
26	26	created		new entry	2024-10-12 08:07:53.538469-05	system
27	27	created		new entry	2024-10-12 08:07:53.538469-05	system
28	28	created		new entry	2024-10-12 08:07:53.538469-05	system
29	29	created		new entry	2024-10-12 08:07:53.538469-05	system
30	30	created		new entry	2024-10-12 08:07:53.538469-05	system
31	31	created		new entry	2024-10-12 08:07:53.538469-05	system
32	32	created		new entry	2024-10-12 08:07:53.538469-05	system
33	33	created		new entry	2024-10-12 08:07:53.538469-05	system
34	34	created		new entry	2024-10-12 08:07:53.538469-05	system
35	35	created		new entry	2024-10-12 08:07:53.538469-05	system
36	36	created		new entry	2024-10-12 08:07:53.538469-05	system
37	37	created		new entry	2024-10-12 08:07:53.538469-05	system
38	38	created		new entry	2024-10-12 08:07:53.538469-05	system
39	39	created		new entry	2024-10-12 08:07:53.538469-05	system
40	40	created		new entry	2024-10-12 08:07:53.538469-05	system
41	41	created		new entry	2024-10-12 08:07:53.538469-05	system
42	42	created		new entry	2024-10-12 08:07:53.538469-05	system
43	43	created		new entry	2024-10-12 08:07:53.538469-05	system
44	44	created		new entry	2024-10-12 08:07:53.538469-05	system
45	45	created		new entry	2024-10-12 08:07:53.538469-05	system
46	46	created		new entry	2024-10-12 08:07:53.538469-05	system
47	47	created		new entry	2024-10-12 08:07:53.538469-05	system
48	48	created		new entry	2024-10-12 08:07:53.538469-05	system
49	49	created		new entry	2024-10-12 08:07:53.538469-05	system
50	50	created		new entry	2024-10-12 08:07:53.538469-05	system
51	51	created		new entry	2024-10-12 08:07:53.538469-05	system
52	52	created		new entry	2024-10-12 08:07:53.538469-05	system
53	53	created		new entry	2024-10-12 08:07:53.538469-05	system
54	54	created		new entry	2024-10-12 08:07:53.538469-05	system
55	55	created		new entry	2024-10-12 08:07:53.538469-05	system
56	56	created		new entry	2024-10-12 08:07:53.538469-05	system
57	57	created		new entry	2024-10-12 08:07:53.538469-05	system
58	58	created		new entry	2024-10-12 08:07:53.538469-05	system
59	59	created		new entry	2024-10-12 08:07:53.538469-05	system
60	60	created		new entry	2024-10-12 08:07:53.538469-05	system
61	61	created		new entry	2024-10-12 08:07:53.538469-05	system
62	62	created		new entry	2024-10-12 08:07:53.538469-05	system
63	63	created		new entry	2024-10-12 08:07:53.538469-05	system
64	64	created		new entry	2024-10-12 08:07:53.538469-05	system
65	65	created		new entry	2024-10-12 08:07:53.538469-05	system
66	66	created		new entry	2024-10-12 08:07:53.538469-05	system
67	67	created		new entry	2024-10-12 08:07:53.538469-05	system
68	68	created		new entry	2024-10-12 08:07:53.538469-05	system
69	69	created		new entry	2024-10-12 08:07:53.538469-05	system
70	70	created		new entry	2024-10-12 08:07:53.538469-05	system
71	71	created		new entry	2024-10-12 08:07:53.538469-05	system
72	72	created		new entry	2024-10-12 08:07:53.538469-05	system
73	73	created		new entry	2024-10-12 08:07:53.538469-05	system
74	74	created		new entry	2024-10-12 08:07:53.538469-05	system
75	75	created		new entry	2024-10-12 08:07:53.538469-05	system
76	76	created		new entry	2024-10-12 08:07:53.538469-05	system
77	77	created		new entry	2024-10-12 08:07:53.538469-05	system
78	78	created		new entry	2024-10-12 08:07:53.538469-05	system
79	79	created		new entry	2024-10-12 08:07:53.538469-05	system
80	80	created		new entry	2024-10-12 08:07:53.538469-05	system
81	81	created		new entry	2024-10-12 08:07:53.538469-05	system
82	82	created		new entry	2024-10-12 08:07:53.538469-05	system
83	83	created		new entry	2024-10-12 08:07:53.538469-05	system
84	84	created		new entry	2024-10-12 08:07:53.538469-05	system
85	85	created		new entry	2024-10-12 08:07:53.538469-05	system
86	86	created		new entry	2024-10-12 08:07:53.538469-05	system
87	87	created		new entry	2024-10-12 08:07:53.538469-05	system
88	88	created		new entry	2024-10-12 08:07:53.538469-05	system
89	89	created		new entry	2024-10-12 08:07:53.538469-05	system
90	90	created		new entry	2024-10-12 08:07:53.538469-05	system
91	91	created		new entry	2024-10-12 08:07:53.538469-05	system
92	92	created		new entry	2024-10-12 08:07:53.538469-05	system
93	93	created		new entry	2024-10-12 08:07:53.538469-05	system
94	94	created		new entry	2024-10-12 08:07:53.538469-05	system
95	95	created		new entry	2024-10-12 08:07:53.538469-05	system
96	96	created		new entry	2024-10-12 08:07:53.538469-05	system
97	97	created		new entry	2024-10-12 08:07:53.538469-05	system
98	98	created		new entry	2024-10-12 08:07:53.538469-05	system
99	99	created		new entry	2024-10-12 08:07:53.538469-05	system
100	100	created		new entry	2024-10-12 08:07:53.538469-05	system
101	101	created		new entry	2024-10-12 08:07:53.538469-05	system
102	102	created		new entry	2024-10-12 08:07:53.538469-05	system
103	103	created		new entry	2024-10-12 08:07:53.538469-05	system
104	104	created		new entry	2024-10-12 08:07:53.538469-05	system
105	105	created		new entry	2024-10-12 08:07:53.538469-05	system
106	106	created		new entry	2024-10-12 08:07:53.538469-05	system
107	107	created		new entry	2024-10-12 08:07:53.538469-05	system
108	108	created		new entry	2024-10-12 08:07:53.538469-05	system
109	109	created		new entry	2024-10-12 08:07:53.538469-05	system
110	110	created		new entry	2024-10-12 08:07:53.538469-05	system
111	111	created		new entry	2024-10-12 08:07:53.538469-05	system
112	112	created		new entry	2024-10-12 08:07:53.538469-05	system
113	113	created		new entry	2024-10-12 08:07:53.538469-05	system
114	114	created		new entry	2024-10-12 08:07:53.538469-05	system
115	115	created		new entry	2024-10-12 08:07:53.538469-05	system
116	116	created		new entry	2024-10-12 08:07:53.538469-05	system
117	117	created		new entry	2024-10-12 08:07:53.538469-05	system
118	118	created		new entry	2024-10-12 08:07:53.538469-05	system
119	119	created		new entry	2024-10-12 08:07:53.538469-05	system
120	120	created		new entry	2024-10-12 08:07:53.538469-05	system
121	121	created		new entry	2024-10-12 08:07:53.538469-05	system
122	122	created		new entry	2024-10-12 08:07:53.538469-05	system
123	123	created		new entry	2024-10-12 08:07:53.538469-05	system
124	124	created		new entry	2024-10-12 08:07:53.538469-05	system
125	125	created		new entry	2024-10-12 08:07:53.538469-05	system
126	126	created		new entry	2024-10-12 08:07:53.538469-05	system
127	127	created		new entry	2024-10-12 08:07:53.538469-05	system
128	128	created		new entry	2024-10-12 08:07:53.538469-05	system
129	129	created		new entry	2024-10-12 08:07:53.538469-05	system
130	130	created		new entry	2024-10-12 08:07:53.538469-05	system
131	131	created		new entry	2024-10-12 08:07:53.538469-05	system
132	132	created		new entry	2024-10-12 08:07:53.538469-05	system
133	133	created		new entry	2024-10-12 08:07:53.538469-05	system
134	134	created		new entry	2024-10-12 08:07:53.538469-05	system
135	135	created		new entry	2024-10-12 08:07:53.538469-05	system
136	136	created		new entry	2024-10-12 08:07:53.538469-05	system
137	137	created		new entry	2024-10-12 08:07:53.538469-05	system
138	138	created		new entry	2024-10-12 08:07:53.538469-05	system
139	139	created		new entry	2024-10-12 08:07:53.538469-05	system
140	140	created		new entry	2024-10-12 08:07:53.538469-05	system
141	141	created		new entry	2024-10-12 08:07:53.538469-05	system
142	142	created		new entry	2024-10-12 08:07:53.538469-05	system
143	143	created		new entry	2024-10-12 08:07:53.538469-05	system
144	144	created		new entry	2024-10-12 08:07:53.538469-05	system
145	145	created		new entry	2024-10-12 08:07:53.538469-05	system
146	146	created		new entry	2024-10-12 08:07:53.538469-05	system
147	147	created		new entry	2024-10-12 08:07:53.538469-05	system
148	148	created		new entry	2024-10-12 08:07:53.538469-05	system
149	149	created		new entry	2024-10-12 08:07:53.538469-05	system
150	150	created		new entry	2024-10-12 08:07:53.538469-05	system
151	151	created		new entry	2024-10-12 08:07:53.538469-05	system
152	152	created		new entry	2024-10-12 08:07:53.538469-05	system
153	153	created		new entry	2024-10-12 08:07:53.538469-05	system
154	154	created		new entry	2024-10-12 08:07:53.538469-05	system
155	155	created		new entry	2024-10-12 08:07:53.538469-05	system
156	156	created		new entry	2024-10-12 08:07:53.538469-05	system
157	157	created		new entry	2024-10-12 08:07:53.538469-05	system
158	158	created		new entry	2024-10-12 08:07:53.538469-05	system
159	159	created		new entry	2024-10-12 08:07:53.538469-05	system
160	160	created		new entry	2024-10-12 08:07:53.538469-05	system
161	161	created		new entry	2024-10-12 08:07:53.538469-05	system
162	162	created		new entry	2024-10-12 08:07:53.538469-05	system
163	163	created		new entry	2024-10-12 08:07:53.538469-05	system
164	164	created		new entry	2024-10-12 08:07:53.538469-05	system
165	165	created		new entry	2024-10-12 08:07:53.538469-05	system
166	166	created		new entry	2024-10-12 08:07:53.538469-05	system
167	167	created		new entry	2024-10-12 08:07:53.538469-05	system
168	168	created		new entry	2024-10-12 08:07:53.538469-05	system
169	169	created		new entry	2024-10-12 08:07:53.538469-05	system
170	170	created		new entry	2024-10-12 08:07:53.538469-05	system
171	171	created		new entry	2024-10-12 08:07:53.538469-05	system
172	172	created		new entry	2024-10-12 08:07:53.538469-05	system
173	173	created		new entry	2024-10-12 08:07:53.538469-05	system
174	174	created		new entry	2024-10-12 08:07:53.538469-05	system
175	175	created		new entry	2024-10-12 08:07:53.538469-05	system
176	176	created		new entry	2024-10-12 08:07:53.538469-05	system
177	177	created		new entry	2024-10-12 08:07:53.538469-05	system
178	178	created		new entry	2024-10-12 08:07:53.538469-05	system
179	179	created		new entry	2024-10-12 08:07:53.538469-05	system
180	180	created		new entry	2024-10-12 08:07:53.538469-05	system
181	181	created		new entry	2024-10-12 08:07:53.538469-05	system
182	182	created		new entry	2024-10-12 08:07:53.538469-05	system
183	183	created		new entry	2024-10-12 08:07:53.538469-05	system
184	184	created		new entry	2024-10-12 08:07:53.538469-05	system
185	185	created		new entry	2024-10-12 08:07:53.538469-05	system
186	186	created		new entry	2024-10-12 08:07:53.538469-05	system
187	187	created		new entry	2024-10-12 08:07:53.538469-05	system
188	188	created		new entry	2024-10-12 08:07:53.538469-05	system
189	189	created		new entry	2024-10-12 08:07:53.538469-05	system
190	190	created		new entry	2024-10-12 08:07:53.538469-05	system
191	191	created		new entry	2024-10-12 08:07:53.538469-05	system
192	192	created		new entry	2024-10-12 08:07:53.538469-05	system
193	193	created		new entry	2024-10-12 08:07:53.538469-05	system
194	194	created		new entry	2024-10-12 08:07:53.538469-05	system
195	195	created		new entry	2024-10-12 08:07:53.538469-05	system
196	196	created		new entry	2024-10-12 08:07:53.538469-05	system
197	197	created		new entry	2024-10-12 08:07:53.538469-05	system
198	198	created		new entry	2024-10-12 08:07:53.538469-05	system
199	199	created		new entry	2024-10-12 08:07:53.538469-05	system
200	200	created		new entry	2024-10-12 08:07:53.538469-05	system
201	201	created		new entry	2024-10-12 08:07:53.538469-05	system
202	202	created		new entry	2024-10-12 08:07:53.538469-05	system
203	203	created		new entry	2024-10-12 08:07:53.538469-05	system
204	204	created		new entry	2024-10-12 08:07:53.538469-05	system
205	205	created		new entry	2024-10-12 08:07:53.538469-05	system
206	206	created		new entry	2024-10-12 08:07:53.538469-05	system
207	207	created		new entry	2024-10-12 08:07:53.538469-05	system
208	208	created		new entry	2024-10-12 08:07:53.538469-05	system
209	209	created		new entry	2024-10-12 08:07:53.538469-05	system
210	210	created		new entry	2024-10-12 08:07:53.538469-05	system
211	211	created		new entry	2024-10-12 08:07:53.538469-05	system
212	212	created		new entry	2024-10-12 08:07:53.538469-05	system
213	213	created		new entry	2024-10-12 08:07:53.538469-05	system
214	214	created		new entry	2024-10-12 08:07:53.538469-05	system
215	215	created		new entry	2024-10-12 08:07:53.538469-05	system
216	216	created		new entry	2024-10-12 08:07:53.538469-05	system
217	217	created		new entry	2024-10-12 08:07:53.538469-05	system
218	218	created		new entry	2024-10-12 08:07:53.538469-05	system
219	219	created		new entry	2024-10-12 08:07:53.538469-05	system
220	220	created		new entry	2024-10-12 08:07:53.538469-05	system
221	221	created		new entry	2024-10-12 08:07:53.538469-05	system
222	222	created		new entry	2024-10-12 08:07:53.538469-05	system
223	223	created		new entry	2024-10-12 08:07:53.538469-05	system
224	224	created		new entry	2024-10-12 08:07:53.538469-05	system
225	225	created		new entry	2024-10-12 08:07:53.538469-05	system
226	226	created		new entry	2024-10-12 08:07:53.538469-05	system
227	227	created		new entry	2024-10-12 08:07:53.538469-05	system
228	228	created		new entry	2024-10-12 08:07:53.538469-05	system
229	229	created		new entry	2024-10-12 08:07:53.538469-05	system
230	230	created		new entry	2024-10-12 08:07:53.538469-05	system
231	231	created		new entry	2024-10-12 08:07:53.538469-05	system
232	232	created		new entry	2024-10-12 08:07:53.538469-05	system
233	233	created		new entry	2024-10-12 08:07:53.538469-05	system
234	234	created		new entry	2024-10-12 08:07:53.538469-05	system
235	235	created		new entry	2024-10-12 08:07:53.538469-05	system
236	236	created		new entry	2024-10-12 08:07:53.538469-05	system
237	237	created		new entry	2024-10-12 08:07:53.538469-05	system
238	238	created		new entry	2024-10-12 08:07:53.538469-05	system
239	239	created		new entry	2024-10-12 08:07:53.538469-05	system
240	240	created		new entry	2024-10-12 08:07:53.538469-05	system
241	241	created		new entry	2024-10-12 08:07:53.538469-05	system
242	242	created		new entry	2024-10-12 08:07:53.538469-05	system
243	243	created		new entry	2024-10-12 08:07:53.538469-05	system
244	244	created		new entry	2024-10-12 08:07:53.538469-05	system
245	245	created		new entry	2024-10-12 08:07:53.538469-05	system
246	246	created		new entry	2024-10-12 08:07:53.538469-05	system
247	247	created		new entry	2024-10-12 08:07:53.538469-05	system
248	248	created		new entry	2024-10-12 08:07:53.538469-05	system
249	249	created		new entry	2024-10-12 08:07:53.538469-05	system
250	250	created		new entry	2024-10-12 08:07:53.538469-05	system
251	251	created		new entry	2024-10-12 08:07:53.538469-05	system
252	252	created		new entry	2024-10-12 08:07:53.538469-05	system
253	253	created		new entry	2024-10-12 08:07:53.538469-05	system
254	254	created		new entry	2024-10-12 08:07:53.538469-05	system
255	255	created		new entry	2024-10-12 08:07:53.538469-05	system
256	256	created		new entry	2024-10-12 08:07:53.538469-05	system
257	257	created		new entry	2024-10-12 08:07:53.538469-05	system
258	258	created		new entry	2024-10-12 08:07:53.538469-05	system
259	259	created		new entry	2024-10-12 08:07:53.538469-05	system
260	260	created		new entry	2024-10-12 08:07:53.538469-05	system
261	261	created		new entry	2024-10-12 08:07:53.538469-05	system
262	262	created		new entry	2024-10-12 08:07:53.538469-05	system
263	263	created		new entry	2024-10-12 08:07:53.538469-05	system
264	264	created		new entry	2024-10-12 08:07:53.538469-05	system
265	265	created		new entry	2024-10-12 08:07:53.538469-05	system
266	266	created		new entry	2024-10-12 08:07:53.538469-05	system
267	267	created		new entry	2024-10-12 08:07:53.538469-05	system
268	268	created		new entry	2024-10-12 08:07:53.538469-05	system
269	269	created		new entry	2024-10-12 08:07:53.538469-05	system
270	270	created		new entry	2024-10-12 08:07:53.538469-05	system
271	271	created		new entry	2024-10-12 08:07:53.538469-05	system
272	272	created		new entry	2024-10-12 08:07:53.538469-05	system
273	273	created		new entry	2024-10-12 08:07:53.538469-05	system
274	274	created		new entry	2024-10-12 08:07:53.538469-05	system
275	275	created		new entry	2024-10-12 08:07:53.538469-05	system
276	276	created		new entry	2024-10-12 08:07:53.538469-05	system
277	277	created		new entry	2024-10-12 08:07:53.538469-05	system
278	278	created		new entry	2024-10-12 08:07:53.538469-05	system
279	279	created		new entry	2024-10-12 08:07:53.538469-05	system
280	280	created		new entry	2024-10-12 08:07:53.538469-05	system
281	281	created		new entry	2024-10-12 08:07:53.538469-05	system
282	282	created		new entry	2024-10-12 08:07:53.538469-05	system
283	283	created		new entry	2024-10-12 08:07:53.538469-05	system
284	284	created		new entry	2024-10-12 08:07:53.538469-05	system
285	274	type	CM Packaging-Label		2024-10-12 08:07:53.538469-05	system
286	274	phx_class	A		2024-10-12 08:07:53.538469-05	system
287	274	theoretical_qty	1385.0	0.0	2024-10-12 08:07:53.538469-05	system
288	274	date_counted	2024-10-07 00:00:00	2024-10-07	2024-10-12 08:07:53.538469-05	system
289	274	uom	units		2024-10-12 08:07:53.538469-05	system
290	274	ranking	0	None	2024-10-12 08:07:53.538469-05	system
291	274	subtype	TA Skincare Cleanser Labels	TA Alternative Labels for CM Cosmetics	2024-10-12 08:07:53.538469-05	system
292	275	type	CM Packaging-Label		2024-10-12 08:07:53.538469-05	system
293	275	date_counted	2024-10-07 00:00:00	2024-10-07	2024-10-12 08:07:53.538469-05	system
294	275	uom	units		2024-10-12 08:07:53.538469-05	system
295	275	ranking	0	None	2024-10-12 08:07:53.538469-05	system
296	275	subtype	TA Skincare Cleanser Labels	TA Alternative Labels for CM Cosmetics	2024-10-12 08:07:53.538469-05	system
297	243	type	Label		2024-10-12 08:07:53.538469-05	system
298	243	phx_class	C		2024-10-12 08:07:53.538469-05	system
299	243	theoretical_qty	4470.0	0.0	2024-10-12 08:07:53.538469-05	system
300	243	date_counted	2024-10-07 00:00:00	2024-10-07	2024-10-12 08:07:53.538469-05	system
301	243	uom	units		2024-10-12 08:07:53.538469-05	system
302	243	ranking	0	None	2024-10-12 08:07:53.538469-05	system
303	243	subtype	TA Milia Labels	TA Alternative Labels for CM Cosmetics	2024-10-12 08:07:53.538469-05	system
304	285	created		new entry	2024-10-12 08:07:53.538469-05	system
305	286	created		new entry	2024-10-12 08:07:53.538469-05	system
306	287	created		new entry	2024-10-12 08:07:53.538469-05	system
307	288	created		new entry	2024-10-12 08:07:53.538469-05	system
308	289	created		new entry	2024-10-12 08:07:53.538469-05	system
309	290	created		new entry	2024-10-12 08:07:53.538469-05	system
310	291	created		new entry	2024-10-12 08:07:53.538469-05	system
311	292	created		new entry	2024-10-12 08:07:53.538469-05	system
312	293	created		new entry	2024-10-12 08:07:53.538469-05	system
313	294	created		new entry	2024-10-12 08:07:53.538469-05	system
314	295	created		new entry	2024-10-12 08:07:53.538469-05	system
315	296	created		new entry	2024-10-12 08:07:53.538469-05	system
316	297	created		new entry	2024-10-12 08:07:53.538469-05	system
317	298	created		new entry	2024-10-12 08:07:53.538469-05	system
318	299	created		new entry	2024-10-12 08:07:53.538469-05	system
319	300	created		new entry	2024-10-12 08:07:53.538469-05	system
320	301	created		new entry	2024-10-12 08:07:53.538469-05	system
321	302	created		new entry	2024-10-12 08:07:53.538469-05	system
322	303	created		new entry	2024-10-12 08:07:53.538469-05	system
323	304	created		new entry	2024-10-12 08:07:53.538469-05	system
324	305	created		new entry	2024-10-12 08:07:53.538469-05	system
325	306	created		new entry	2024-10-12 08:07:53.538469-05	system
326	307	created		new entry	2024-10-12 08:07:53.538469-05	system
327	308	created		new entry	2024-10-12 08:07:53.538469-05	system
328	309	created		new entry	2024-10-12 08:07:53.538469-05	system
329	310	created		new entry	2024-10-12 08:07:53.538469-05	system
330	311	created		new entry	2024-10-12 08:07:53.538469-05	system
331	312	created		new entry	2024-10-12 08:07:53.538469-05	system
332	313	created		new entry	2024-10-12 08:07:53.538469-05	system
333	314	created		new entry	2024-10-12 08:07:53.538469-05	system
334	315	created		new entry	2024-10-12 08:07:53.538469-05	system
335	316	created		new entry	2024-10-12 08:07:53.538469-05	system
336	317	created		new entry	2024-10-12 08:07:53.538469-05	system
337	318	created		new entry	2024-10-12 08:07:53.538469-05	system
338	319	created		new entry	2024-10-12 08:07:53.538469-05	system
\.


--
-- Data for Name: tampa_bom_inventory_history; Type: TABLE DATA; Schema: public; Owner: derrek
--

COPY public.tampa_bom_inventory_history (id, inventory_id, bom_id, type, theoretical_qty, actual_count, date_counted, recorded_at) FROM stdin;
1	\N	RM-PWD-Organic-Monk-Fruit-Extract-10%	Powder	0	0	2024-10-04 00:00:00	2024-10-12 08:07:53.538469-05
2	\N	RM-PWD-Monk-Fruit-Extract-5%	Powder	200	200	2024-10-04 00:00:00	2024-10-12 08:07:53.538469-05
3	\N	RM-PWD-Organic-Stevia-TSG90	Powder	114.76	114.76	2024-10-04 00:00:00	2024-10-12 08:07:53.538469-05
4	\N	RM-PWD-Spirulina-Organic	Powder	47.8	48.8	2024-10-04 00:00:00	2024-10-12 08:07:53.538469-05
5	\N	RM-PWD-Black-Tea-Extract	Powder	-7.04	0.96	2024-10-04 00:00:00	2024-10-12 08:07:53.538469-05
6	\N	RM-PWD-Black-Tea-Extract-Iced	Powder	0	0	2024-10-04 00:00:00	2024-10-12 08:07:53.538469-05
7	\N	RM-PWD-Stevia-SG95RA60	Powder	385.37	85.37	2024-08-19 00:00:00	2024-10-12 08:07:53.538469-05
8	\N	RM-PWD-Stevia-Monk-Fruit-Stevia-Blend	Powder	47.49	47.49	2024-10-04 00:00:00	2024-10-12 08:07:53.538469-05
9	\N	RM-PWD-Magnesium-Bisglycinate-Chelate	Powder	157.95	157.95	2024-10-04 00:00:00	2024-10-12 08:07:53.538469-05
10	\N	RM-PWD-Shilajith	Powder	-11.91	8.09	2024-10-04 00:00:00	2024-10-12 08:07:53.538469-05
11	\N	RM-PWD-Pu-erh-Tea	Powder	48.24	48.24	2024-10-04 00:00:00	2024-10-12 08:07:53.538469-05
12	\N	RM-PWD-MyoInositol	Powder	56.71	56.71	2024-10-04 00:00:00	2024-10-12 08:07:53.538469-05
13	\N	RM-PWD-AlphaGPC	Powder	1.88	1.88	2024-10-04 00:00:00	2024-10-12 08:07:53.538469-05
14	\N	RM-PWD-Citicoline-Sodium	Powder	10	10	2024-10-04 00:00:00	2024-10-12 08:07:53.538469-05
15	\N	RM-PWD-Cordyceps-Militaris-Organic	Powder	73.8	73.8	2024-10-04 00:00:00	2024-10-12 08:07:53.538469-05
16	\N	RM-PWD-Tea-MatchGreen	Powder	85.34	85.34	2024-10-04 00:00:00	2024-10-12 08:07:53.538469-05
17	\N	RM-PWD-Tea-Sencha-Green-Tea-Extract	Powder	140.54	140.54	2024-10-04 00:00:00	2024-10-12 08:07:53.538469-05
18	\N	RM-PWD-BetaAlanine	Powder	111.47	111.47	2024-10-04 00:00:00	2024-10-12 08:07:53.538469-05
19	\N	RM-PWD-ALCAR	Powder	25	25	2024-10-04 00:00:00	2024-10-12 08:07:53.538469-05
20	\N	RM-PWD-Green-Coffee-Bean-Extract	Powder	62.19	62.19	2024-10-04 00:00:00	2024-10-12 08:07:53.538469-05
21	\N	RM-PWD-DHM	Powder	-0.49	39.51	2024-10-04 00:00:00	2024-10-12 08:07:53.538469-05
22	\N	RM-PWD-Longjack-200:1	Powder	50	50	2024-10-04 00:00:00	2024-10-12 08:07:53.538469-05
23	\N	RM-PWD-L-Citrulline-Malate-2:1	Powder	202.83	203.83	2024-10-04 00:00:00	2024-10-12 08:07:53.538469-05
24	\N	RM-PWD-L-Theanine	Powder	25	25	2024-10-04 00:00:00	2024-10-12 08:07:53.538469-05
25	\N	RM-PWD-AgmatineSulfate	Powder	0	0	2024-10-04 00:00:00	2024-10-12 08:07:53.538469-05
26	\N	RM-PWD-AscorbicAcid	Powder	0	0	2024-10-04 00:00:00	2024-10-12 08:07:53.538469-05
27	\N	RM-PWD-Methylene-Blue	Powder	1.5	1.5	2024-08-19 00:00:00	2024-10-12 08:07:53.538469-05
28	\N	RM-PWD-Wheat-Grass-Organic	Powder	497.14	497.14	2024-10-04 00:00:00	2024-10-12 08:07:53.538469-05
29	\N	RM-PURIFIED-WATER	Ingredient	402.461	405	2024-10-04 00:00:00	2024-10-12 08:07:53.538469-05
30	\N	RM-PWD-Potassium-Sorbate	Powder	7.82	7.82	2024-08-19 00:00:00	2024-10-12 08:07:53.538469-05
31	\N	RM-PWD-Potassium-Sorbate-Granulated	Powder	30.81	30.81	2024-10-04 00:00:00	2024-10-12 08:07:53.538469-05
32	\N	RM-PWD-SALICYLIC-ACID	Powder	73.91	74.91	2024-08-19 00:00:00	2024-10-12 08:07:53.538469-05
33	\N	RM-PWD-CitricAcid	Powder	108.38	108.38	2024-10-04 00:00:00	2024-10-12 08:07:53.538469-05
34	\N	RM-MENTHOL	Ingredient	10.68	10.68	2024-10-04 00:00:00	2024-10-12 08:07:53.538469-05
35	\N	RM-PWD-DL-Panthenol	Powder	25.0974	26.45	2024-10-04 00:00:00	2024-10-12 08:07:53.538469-05
36	\N	RM-PWD-Silica	Powder	0.8559	0.9	2024-10-04 00:00:00	2024-10-12 08:07:53.538469-05
37	\N	RM-Hydrolized-Keratin	Ingredient	13.4216	13.62	2024-10-04 00:00:00	2024-10-12 08:07:53.538469-05
38	\N	RM-Hydrolyzed-Silk-Protein	Ingredient	26.9008	27	2024-10-04 00:00:00	2024-10-12 08:07:53.538469-05
39	\N	RM-Aloe-Vera-Juice	Ingredient	42.934	43	2024-08-19 00:00:00	2024-10-12 08:07:53.538469-05
40	\N	RM-Witch-Hazel-Distillate	Ingredient	19.2603	20	2024-08-19 00:00:00	2024-10-12 08:07:53.538469-05
41	\N	RM-Polysorbate-20	Ingredient	307.0893	307.42	2024-08-19 00:00:00	2024-10-12 08:07:53.538469-05
42	\N	RM-Polysorbate-80	Ingredient	68.99	68.99	2024-08-19 00:00:00	2024-10-12 08:07:53.538469-05
43	\N	RM-PWD-Organic-Citric-Acid	Ingredient	5	5	2024-10-04 00:00:00	2024-10-12 08:07:53.538469-05
44	\N	RM-PWD-Organic-Sugar-Cane-Alcohol-190	Ingredient	0	0	2024-10-04 00:00:00	2024-10-12 08:07:53.538469-05
45	\N	RM-PWD-Stevia-Flavor-Toffee	Ingredient	160.54	160.54	2024-10-04 00:00:00	2024-10-12 08:07:53.538469-05
46	\N	RM-PWD-Stevia-Flavor-Caramel	Ingredient	252.43	252.43	2024-10-04 00:00:00	2024-10-12 08:07:53.538469-05
47	\N	RM-PWD-Stevia-Flavor-Vanilla	Ingredient	190.54	190.54	2024-10-04 00:00:00	2024-10-12 08:07:53.538469-05
48	\N	RM-PWD-Stevia-Flavor-Chocolate	Ingredient	126.54	126.54	2024-10-04 00:00:00	2024-10-12 08:07:53.538469-05
49	\N	RM-TA-EUCALYPTUS-ESSENTIAL-OIL-TMP	Ingredient	39.59	39.59	2024-08-19 00:00:00	2024-10-12 08:07:53.538469-05
50	\N	RM-TA-TEA-TREE-ESSENTIAL-OIL-TMP	Ingredient	30.46	30.46	2024-08-19 00:00:00	2024-10-12 08:07:53.538469-05
51	\N	RM-TA-PEPPERMINT-ESSENTIAL-OIL-TMP	Ingredient	25.63	25.63	2024-08-19 00:00:00	2024-10-12 08:07:53.538469-05
52	\N	RM-TA-LEMON-ESSENTIAL-OIL-TMP	Ingredient	47.168	47.19	2024-10-04 00:00:00	2024-10-12 08:07:53.538469-05
53	\N	RM-TA-LAVENDER-ESSENTIAL-OIL-TMP	Ingredient	7.16	7.16	2024-08-19 00:00:00	2024-10-12 08:07:53.538469-05
54	\N	RM-Clary-Sage-Essential-Oil	Ingredient	39	39	2024-10-04 00:00:00	2024-10-12 08:07:53.538469-05
55	\N	RM-Bamboo-Frangrance-Oil	Ingredient	17.6236	17.8	2024-10-04 00:00:00	2024-10-12 08:07:53.538469-05
56	\N	RM-Bergamot-Italian-Essential-Oil	Ingredient	15.48	15.48	2024-10-04 00:00:00	2024-10-12 08:07:53.538469-05
57	\N	RM-Chamomile-Blue-Essential-Oil	Ingredient	4.56	4.56	2024-10-04 00:00:00	2024-10-12 08:07:53.538469-05
58	\N	RM-Grapefruit-Pink-Essential-Oil	Ingredient	5.618	5.64	2024-10-04 00:00:00	2024-10-12 08:07:53.538469-05
59	\N	RM-Lemongrass-Essential-Oil	Ingredient	38.76	38.76	2024-10-04 00:00:00	2024-10-12 08:07:53.538469-05
60	\N	RM-Organic-Orange-Essential-Oil	Ingredient	33.4	33.4	2024-10-04 00:00:00	2024-10-12 08:07:53.538469-05
61	\N	RM-Geranium-Egyptian-Essential-Oil	Ingredient	4.52	4.52	2024-10-04 00:00:00	2024-10-12 08:07:53.538469-05
62	\N	RM-Argan-Oil	Ingredient	0.878	0.9	2024-10-04 00:00:00	2024-10-12 08:07:53.538469-05
63	\N	RM-Olive-Essential-Oil	Ingredient	2.86	2.86	2024-10-04 00:00:00	2024-10-12 08:07:53.538469-05
64	\N	RM-TA-JASMINE-VANILLA-NAT-FRAGRANCE-OIL	Ingredient	442	442	2024-10-04 00:00:00	2024-10-12 08:07:53.538469-05
65	\N	RM-Cashmere-Pear-Fragrance-Oil	Ingredient	14	14	2024-08-19 00:00:00	2024-10-12 08:07:53.538469-05
66	\N	RM-ROSE-WATER	Ingredient	5.25	5.25	2024-10-04 00:00:00	2024-10-12 08:07:53.538469-05
67	\N	RM-TEA-TREE-WATER	Ingredient	19.5103	20.25	2024-08-19 00:00:00	2024-10-12 08:07:53.538469-05
68	\N	RM-CLARY-SAGE-WATER	Ingredient	7	7	2024-08-19 00:00:00	2024-10-12 08:07:53.538469-05
69	\N	RM-Peppermint-Water	Ingredient	-0.7397	0	2024-10-04 00:00:00	2024-10-12 08:07:53.538469-05
70	\N	RM-EUCALYPTUS-WATER	Ingredient	5	5	2024-08-19 00:00:00	2024-10-12 08:07:53.538469-05
71	\N	RM-SPEARMINT-WATER	Ingredient	4.5	4.5	2024-08-19 00:00:00	2024-10-12 08:07:53.538469-05
72	\N	RM-LEMONGRASS-WATER	Ingredient	4.5	4.5	2024-08-19 00:00:00	2024-10-12 08:07:53.538469-05
73	\N	RM-ISO-ALCOHOL-99	Ingredient	885	885	2024-10-04 00:00:00	2024-10-12 08:07:53.538469-05
74	\N	RM-ISO-ALCOHOL-70	Ingredient	0	0	2024-10-04 00:00:00	2024-10-12 08:07:53.538469-05
75	\N	RM-Licorice-Root-Extract	Ingredient	6.2995	6.52	2024-10-04 00:00:00	2024-10-12 08:07:53.538469-05
76	\N	RM-Diheptyl-Succinate+Capryloyl-Glycerin/Sebacic-Acid Copolymer	Ingredient	-0.0441	0	2024-10-04 00:00:00	2024-10-12 08:07:53.538469-05
77	\N	RM-Euxyl-PE-9010	Ingredient	7.8016	8	2024-08-19 00:00:00	2024-10-12 08:07:53.538469-05
78	\N	RM-SODIUM-LACTATE	Ingredient	115.17	115.17	2024-08-19 00:00:00	2024-10-12 08:07:53.538469-05
79	\N	RM-Butylene-Glycol	Ingredient	520.65	520.65	2024-08-19 00:00:00	2024-10-12 08:07:53.538469-05
80	\N	RM-Cycomethicone-6	Ingredient	0	0	2024-08-19 00:00:00	2024-10-12 08:07:53.538469-05
81	\N	RM-Glycerin	Ingredient	89.32	89.32	2024-10-04 00:00:00	2024-10-12 08:07:53.538469-05
82	\N	RM-Acetylsalicylic-Acid	Ingredient	3.7	3.7	2024-08-19 00:00:00	2024-10-12 08:07:53.538469-05
83	\N	WL-Crepey-Lotion-8oz-HS	White Label	75	75	2024-08-19 00:00:00	2024-10-12 08:07:53.538469-05
84	\N	WL-Acne-Face-Cream-2oz-PLSF	White Label	0	0	2024-10-04 00:00:00	2024-10-12 08:07:53.538469-05
85	\N	WL-Acne-Face-Cream-2oz-Shay	White Label	123	123	2024-10-04 00:00:00	2024-10-12 08:07:53.538469-05
86	\N	WL-Scar-Cream-2oz-Shay	White Label	752	752	2024-08-19 00:00:00	2024-10-12 08:07:53.538469-05
87	\N	WL-Scar-Cream-2oz-PLSF	White Label	0	0	2024-10-04 00:00:00	2024-10-12 08:07:53.538469-05
88	\N	WL-Cucumber-Body-Lotion-8oz-Shay	White Label	75	75	2024-08-19 00:00:00	2024-10-12 08:07:53.538469-05
89	\N	WL-Body-Wash-8oz-Shay	White Label	0	0	2024-08-19 00:00:00	2024-10-12 08:07:53.538469-05
90	\N	WL-Body-Wash-8oz-PLSF	White Label	0	0	2024-10-04 00:00:00	2024-10-12 08:07:53.538469-05
91	\N	WL-Cystic-Spot-0.5oz-PLSF	White Label	0	0	2024-10-04 00:00:00	2024-10-12 08:07:53.538469-05
92	\N	WL-Invisible-Spot-Treatment-PLSF	White Label	0	0	2024-10-04 00:00:00	2024-10-12 08:07:53.538469-05
93	\N	WL-Four-In-One-8oz-PLSF	White Label	333	333	2024-10-04 00:00:00	2024-10-12 08:07:53.538469-05
94	\N	WL-Four-In-One-4oz-PLSF	White Label	0	0	2024-10-04 00:00:00	2024-10-12 08:07:53.538469-05
95	\N	WL-Retinol-Cream-2oz-PLSF	White Label	25	25	2024-10-04 00:00:00	2024-10-12 08:07:53.538469-05
96	\N	WL-Oil-Free-Skin-Repair-Serum-2oz-Shay	White Label	0	0	2024-10-04 00:00:00	2024-10-12 08:07:53.538469-05
97	\N	WL-Acne-Patches	White Label	0	0	2024-08-19 00:00:00	2024-10-12 08:07:53.538469-05
98	\N	WL-Skin-Vitamins-60-Nutrafill	White Label	0	0	2024-10-04 00:00:00	2024-10-12 08:07:53.538469-05
99	\N	WL-Hair-Savior-60-Norax	White Label	33	33	2024-10-04 00:00:00	2024-10-12 08:07:53.538469-05
100	\N	TA-Pimple-Tool-Kit	Ingredient	206	206	2024-10-04 00:00:00	2024-10-12 08:07:53.538469-05
101	\N	Scoop-.625cc	Scoop	7200	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
102	\N	Scoop-1.25cc	Scoop	3600	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
103	\N	PCH-5oz-TH-OrganicMonkFruit-Preprinted	container/Pouch	-1200	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
104	\N	PCH-5oz-NAT-OrganicMonkfruit-Preprinted	container/Pouch	10556	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
105	\N	PCH-5oz-NAT-OrganicStevia-Preprinted	container/Pouch	9700	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
106	\N	PCH-5oz-PS-OrganicMonkfruit-Preprinted	Label	9700	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
107	\N	PCH-5oz-PS-OrganicStevia-Preprinted	Label	6700	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
108	\N	PCH-5oz-WHYZ-OrganicMonkFruit-Preprinted	container/Pouch	0	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
109	\N	PCH-1oz-Stndup-WHITE-Matt	Container/Pouch	8000	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
110	\N	PCH-2oz-Stndup-WH-Matt	Container/Pouch	2100	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
111	\N	PCH-4oz-Stndup-WH-Matt	container/Pouch	7250	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
112	\N	PCH-5oz-Stndup-WH-Matt	Container/Pouch	8000	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
113	\N	PCH-8oz-Stndup-WH-Matt	container/Pouch	8200	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
114	\N	PCH-16oz-Stndup-WH-Matt	Eco Bags	3000	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
115	\N	PCH-24oz-Stndup-WH-Matt	container/Pouch	500	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
116	\N	PCH-5oz-Stndup-BLACK-Matt	Container/Pouch	2000	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
117	\N	PCH-1oz-Stndup-BLACK-Matt	Container/Pouch	4000	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
118	\N	PCH-4oz-TH-New-Preprinted	container/Pouch	3500	723	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
119	\N	PCH-5oz-TH-New-Preprinted	container/Pouch	-1853	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
120	\N	PCH-2oz-PS-Stndup-Matt	container/Pouch	16490	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
121	\N	PCH-5oz-PS-Stndup-Matt	Container/Pouch	22442	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
122	\N	PCH-8oz-PS-Stndup-Matt	container/Pouch	1800	809	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
123	\N	PCH-16oz-PS-Stndup-Matt	container/Pouch	0	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
124	\N	PCH-24oz-PS-Stndup-Matt	container/Pouch	1900	300	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
125	\N	BTL-2oz-Cosmo-White-20-410	Safety Shrink Band	7500	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
126	\N	BTL-4oz-Cosmo-White-24-410-HS	CM Packaging-Container	0	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
127	\N	BTL-4oz-Cosmo-White-20-410	Container/Pouch	17623	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
128	\N	BTL-8oz-Cosmo-White-24-410	container/Pouch	8920	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
129	\N	BTL-8oz-Cosmo-White-24-410-HS	CM Packaging-Container	0	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
130	\N	BTL-4oz-Cylinder-Round-White-24-410	Container/Pouch	-1012	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
131	\N	BTL-24-410-Cylinder-Round-8oz-White	Container/Pouch	4301	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
132	\N	BTL-2oz-Oval-Teardrop-White-20-410	Container/Pouch	24515	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
133	\N	BTL-16oz-Diamond-White-24-410	Container/Pouch	2781	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
134	\N	1/2oz-Thick-Wall-Jar+Lid-Black	Container/Pouch	432	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
135	\N	BOX-TA-Cystic-Spot-Covalence	CM-Box	0	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
136	\N	CAP-24-410-Drip-Tip	Top Cover	2513	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
137	\N	CAP-20-410-Drip-Tip	Top Cover	9500	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
138	\N	SPRAY-MIST-20-410-White-5.5-NEW	Top Cover	19716	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
139	\N	SPRAY-MIST-24-410-White-7.5"	Top Cover	21920	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
140	\N	TRIGGER-SPRAYER-24-410-7.75-Black	Top Cover	971	750	2024-08-19 00:00:00	2024-10-12 08:07:53.538469-05
141	\N	LID-89-400-Cap-F217-Liner-White-HS	CM Packaging-Top	420	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
142	\N	Safetry-Shrink-Dome-M1421CL-8oz	Safety Shrink Band	19951	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
143	\N	M1006CL-Dome-Shrink-Band 66X175	Safety Shrink Band	10866	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
144	\N	M172-Shrink-Band-118x70	Safety Shrink Band	20000	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
145	\N	M879CL-Dome-Shrink-Band 77X240	Safety Shrink Band	12451	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
146	\N	M1109CL-Safety-Shrink-Band-100x38mm	Safety Shrink Band	7871	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
147	\N	M1005CL-Dome-Shrink-Band 77X185	Safety Shrink Band	0	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
148	\N	M1612CL-Dome-Shrink-Band 100X180mm	Safety Shrink Band	0	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
149	\N	M15208CL-Clear-Perforated-Shrink-Band 152x150	Safety Shrink Band	10000	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
150	\N	M1151CL-Dome-Shrink-Band-52x143	safety Shrink Band	18600	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
151	\N	M139CL-Safety-Shrink-Band-75x28mm	Safety Shrink Band	14000	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
152	\N	Safetry-Shrink-M175-57x36	Safety Shrink Band	15000	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
153	\N	LABL-NS-Shrink-Sleeve-Liquid-Stevia-OG-US-2oz	Label	5736	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
154	\N	LABL-NS-Shrink-Sleeve-Liquid-Stevia-Vanilla-US-2oz	Label	3940	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
155	\N	LABL-NS-Shrink-Sleeve-Liquid-Stevia-Caramel-US-2oz	Label	4140	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
156	\N	LABL-NS-Shrink-Sleeve-Liquid-Stevia-Chocolate-US-2oz	Label	3736	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
157	\N	LABL-NS-Shrink-Sleeve-Liquid-Stevia-Toffee-US-2oz	Label	3940	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
158	\N	LABL-NS-Shrink-Sleeve-Monk-Fruit-Extract-US-2oz	Label	4200	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
159	\N	CLEARECOBAG-4X5	Eco Bags	1500	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
160	\N	CLEARECOBAG-6X8	Eco Bags	6150	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
161	\N	CLEARECOBAG-7.5X10	Eco Bags	0	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
162	\N	CLEARECOBAG-10.5X14	Eco Bags	0	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
163	\N	CLEARECOBAG-8.25x10.25	Eco Bags	2030	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
164	\N	LABL-NS-3.75x4.75-Liquid-Stevia-US-4oz	Label	-332	0	2024-08-19 00:00:00	2024-10-12 08:07:53.538469-05
165	\N	LABL-NS-6x5-Liquid-Stevia-US-8oz	Eco Bags	7585	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
166	\N	LABL-NS-6x5-Monk-Fruit-Liquid-US-8oz	Label	1000	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
167	\N	LABL-NS-6x5-Monk-Fruit-Liquid-Stevia-US-8oz	Label	2420	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
168	\N	LABL-NS-6x5-Organic-Liquid-Stevia-US-8oz	Label	0	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
169	\N	LABL-NS-2.875x3.750-Monk-Fruit-Stevia-Liquid-2oz	Label	3600	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
170	\N	LABL-NS-6.125x5-Monk-Fruit-Stevia-Liquid-2oz	Label	6500	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
171	\N	LABL-NS-6x5-Organic-Liquid-Monk-Fruit-US-8oz	Label	500	500	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
172	\N	LABL-WHYZ-6.125x5-Liquid-Stevia-Drops-8oz	Label	640	0	2024-08-19 00:00:00	2024-10-12 08:07:53.538469-05
173	\N	LABL-TN-3.75x2.875-Liquid-Stevia-Drops-2oz	Label	1000	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
174	\N	LABL-TN-6.125x5-Liquid-Stevia-Drops-8oz	Label	679	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
175	\N	LABL-TN-2.5x3.125-Monk-Fruit-Sweetener-1oz	Label	1000	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
176	\N	LABL-TN-2.5x3.125-Monk-Fruit-Sweetener-5oz	Label	1000	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
177	\N	LABL-TN-2.5x3.125-Monk-Fruit-Sweetener-1lb	Label	1000	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
178	\N	LABL-PS-3.75x3-Black-Tea-Iced-4oz	Label	1940	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
179	\N	LABL-PS-3.75x3-Black-Tea-125g	Label	310	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
180	\N	LABL-PS-3.75x3-Green-Tea-Extract-250g	Label	0	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
181	\N	LABL-PS-3.75x3-Shilajit-25g	Label	0	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
182	\N	LABL-PS-3.75x3-Shilajit-100g	Label	1730	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
183	\N	LABL-PS-3.75x3-Green-Coffee-Ext-150g	Label	1500	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
184	\N	LABL-PS-3.75x3-CDP-Choline-10g	Label	0	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
185	\N	LABL-PS-3.75x3-CDP-Choline-50g	Label	700	700	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
186	\N	LABL-PS-3.75x3-Vit-C-250g	Label	0	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
187	\N	LABL-PS-4x6-Vitamin-C-1kg	Label	0	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
188	\N	LABL-PS-3.75x3-Citrulline-Malate-250g	Label	0	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
189	\N	LABL-PS-3.75x3-Citrulline-Malate-1kg	Label	2620	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
190	\N	LABL-PS-3.75x3-Alpha-GPC-25g	Label	0	800	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
191	\N	LABL-PS-3.75x3-Alpha-GPC-100g	Label	1015	800	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
192	\N	LABL-PS-3.75x3-Theanine-100g	Label	0	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
193	\N	LABL-7X2.5-PS-Caffeine-L-Theanine	Label	1000	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
194	\N	LABL-PS-3.75x3-Monk-Fruit-Stevia-Blend-4X-4oz	Label	0	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
195	\N	LABL-PS-3.75x3-Myo-Inositol-1kg	Label	1020	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
196	\N	LABL-PS-3.75x3-Longjack-200:1-100g	Label	500	500	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
197	\N	LABL-PS-3.75x3-Longjack-100:1-25g	Label	0	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
198	\N	LABL-PS-3.75x3-Wheat-Grass-Org-150g	Label	1020	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
199	\N	LABL-PS-3.75x3-Wheatgrass-Powder-Org-8oz	Label	1030	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
200	\N	LABL-PS-3.75x3-Agmatine-100g	Label	0	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
201	\N	LABL-PS-3.75x3-Dihydromyricetin-DHM-100g	Label	980	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
202	\N	LABL-PS-3.75x4.75-Beta-Alanine-1kg	Label	1940	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
203	\N	LABL-PS-3.75x3-Beta-Alanine-1kg	Label	1940	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
204	\N	LABL-PS-3.75x4.75-Alcar-250g	Label	1490	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
205	\N	LABL-PS-3.75x4.75-Spirulina-Org-16oz	Label	828	828	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
206	\N	LABL-PS-3.75x3-Spirulina-Org-16oz	Label	1020	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
207	\N	LABL-PS-5.25x0.40-Methylene-Blue-5g	Label	200	200	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
208	\N	LABL-PS-3.75x2.875-Shrink-Sleeve-Liquid-Monk-Fruit-2oz	Label	1600	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
209	\N	LABL-TH-3.5x3-Black-Tea-4oz-Back	Label	-983	0	2024-08-19 00:00:00	2024-10-12 08:07:53.538469-05
210	\N	LABL-TH-3.75x3-Green-Tea-4oz	Label	1500	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
211	\N	LABL-TH-3.75x3-Matcha-Green-Tea-5oz-Organic-Back	Label	1030	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
212	\N	LABL-TH-3.75x3-Puerh-4oz	Label	1283	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
213	\N	LABL-TH-3.75x3-Monk-Stevia-Blend-4oz	Label	1020	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
214	\N	LABL-TH-3.75x3-Matcha-Green-Tea-Org-4oz	Label	550	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
215	\N	LABL-WHYZ-4x6-Beta-Alanine-350g	Label	1400	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
216	\N	LABL-WHYZ-4x6-Alcar-125g	Label	1450	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
217	\N	LABL-WHYZ-4x6-Shilajit-50g	Label	3660	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
218	\N	LABL-WHYZ-4x6-Myo-Inositol-8oz	Label	350	480	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
219	\N	LABL-WHYZ-4x6-Magnesium-Bisglycinate-10oz	Label	2040	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
220	\N	LABL-WHYZ-4x6-Green-Coffee-Bean-Powder-125g	Label	515	500	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
221	\N	LABL-WHYZ-4x6-Tongkat-Ali-Powder-4oz	Label	895	250	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
222	\N	LABL-WHYZ-4x6-Organic-WheatGrass-Powder-300g	Label	1020	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
223	\N	LABL-WHYZ-4x6-Organic-Cordyceps-Powder-200g	Label	1020	800	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
224	\N	LABL-WHYZ-4x6-Organic-Spirulina-Powder-250g	Label	3040	0	2024-08-19 00:00:00	2024-10-12 08:07:53.538469-05
225	\N	LABL-WHYZ-4x6-Monk-Fruit-Ext-5oz	Label	2800	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
226	\N	LABL-WHYZ-4x6-Organic-Stevia-8oz	Label	820	100	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
227	\N	LABL-WHYZ-4x6-Black-Tea-4.5oz	Label	0	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
228	\N	LABL-WHYZ-4x6-Organic-Matcha-Powder-125g	Label	0	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
229	\N	LABL-TN-2.5x3.125-Organic-Stevia-Extract-1oz	Label	800	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
230	\N	LABL-TN-4x5.5-Organic-Stevia-Extract-5oz	Label	1000	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
231	\N	LABL-TN-2.5x3.125-Organic-Monk-Fruit-1oz	Label	2000	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
232	\N	LABL-TN-4x5.5-Organic-Monk-Fruit-4.5oz	Label	2750	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
233	\N	LABL-NS-3.75x3-Monk-Fruit-4oz-Front	Label	1095	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
234	\N	LABL-NS-3.75x3-Monk-Fruit-4oz-Back	Label	1095	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
235	\N	LABL-NS-3.75x3-Stevia-Powder-4oz-Front	Label	923	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
236	\N	LABL-NS-3.75x3-Stevia-Powder-4oz-Back	Label	923	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
237	\N	LABL-TH-3.75x3-Monk-Fruit-Extract-4oz	Label	1950	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
238	\N	LABL-PS-3.75x3-Monk-Fruit-Extract-125g	Label	2100	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
239	\N	LABL-PS-3.75x3-Stevia-Powder-125g	Label	0	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
240	\N	LABL-TA-3.75x3-Milia-Patches-5pack	Label	8005	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
241	\N	LABL-TA-3.75x3-Milia-Patches	Label	6730	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
242	\N	LABL-TA-4.75x4.75-Milia-Kit-Bundle	Label	4735	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
243	\N	LABL-TA-5.8x0.625-Milia-Spot-Treatment-0.5oz	Label	4470	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
244	\N	LABL-TA-3.75x3-Milia	Label	2500	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
245	\N	LABL-TA-6.125X0.5625-Invis-Spot-Side	Label	5400	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
246	\N	LABL-TA-Face-Cream-Side-2oz	Label	2500	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
247	\N	LABL-TA-1.25x7.125-Retinol-Cream-2oz	Label	200	270	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
248	\N	LABL-TA-1.25x7.125-Scar-Cream-Side-PLSF	Label	2503	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
249	\N	LABL-TA-1.25x7.125-Scar-Cream-Side-Shay	Label	1999	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
250	\N	LABL-11.3125x1.625-Crepey-Skin-Cream-Side	Label	1600	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
251	\N	LABL-TA-Psoriasis-Side	Label	1050	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
252	\N	LABL-TA-Dermatitis-Side	Label	1500	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
253	\N	LABL-TA-Cucumber-Lotion-8oz	Label	1700	350	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
254	\N	LABL-TA-11.313x1.625-Rough-and-Bumpy-Skin-Lotion-8oz	Label	1020	650	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
255	\N	LABL-TA-3.75x4.75-Body-Spray-4oz	Label	4430	0	2024-08-19 00:00:00	2024-10-12 08:07:53.538469-05
256	\N	LABL-TA-3.5x4.75-Alc-Free-Pillow-Spray-4oz	Label	2014	520	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
257	\N	LABL-TA-5.93x2.37-Acne-Face-Spray-4oz	Label	1750	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
258	\N	LABL-TA-3.75x4.75-Toner-4oz	Label	615	350	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
259	\N	LABL-TA-3.75x4.75-Yoga-Mat-Spray-4oz	Label	405	250	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
260	\N	LABL-TA-3.75x4.75-Room-Spray-4oz	Label	1400	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
261	\N	LABL-TA-3.75x4.75-Sleep-Spray-4oz	Label	100	280	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
262	\N	LABL-TA-5.3x5.2-Sleep-Spray-Lavender-8oz	Label	1200	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
263	\N	LABL-TA-5.3125x5.25-Sleep-Spray-16oz	Label	619	500	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
264	\N	LABL-5.75X5.25-Linen-Spray-Lav-Wrap	Label	760	650	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
265	\N	LABL-TA-3.75x4.75-Air-Freshener-4oz	Label	300	350	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
266	\N	LABL-TA-3.75x4.75-Shower-Spray-4oz	Label	250	290	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
267	\N	LABL-TA-3.75x4.75-Shower-Spray-Xtra-Stre-4oz	Label	8170	50	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
268	\N	LABL-TA-Pillow-Spray	Label	-20	0	2024-08-19 00:00:00	2024-10-12 08:07:53.538469-05
269	\N	LABL-5.75X5-Hair-Growth-Bamb-Wrap	Label	53	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
270	\N	LABL-5.75X5-Hair-Growth-Grape-Wrap	Label	800	500	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
271	\N	LABL-5.75X5-Hair-Growth-Lav-Wrap	Label	893	600	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
272	\N	LABL-TA-5.75x4.75-Acne-Exfo-Body-Wash-8oz	Label	2178	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
273	\N	LABL-TA-5.75x4.75-Anti-Aging-Exfo-Body-Wash-8oz	Label	1000	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
274	\N	LABL-TA-Acne-Eliminating-Face-Cleanser-8oz-HS	CM Packaging-Label	1385	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
275	\N	LABL-TA-Acne-Eliminating-Face-Cleanser-3.4oz-HS	CM Packaging-Label	0	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
276	\N	LABL-TA-8.79x1.58-Four-In-One-Acne-Treatment-4oz	Label	1500	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
277	\N	LABL-TA-3.94x1.625-Deep-Wrinkle-Serum-1oz	Label	0	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
278	\N	LABL-TA-5.75x4.75-After-Shave-Razor-Bump-8oz	Label	1020	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
279	\N	LABL-TA-3.75x3-Acne-Patches	Label	8919	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
280	\N	LABL-TA-3.75x3-2Step-Cystic-Face-Wash-Bundle	Label	0	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
281	\N	LABL-TA-3.75x3-TA-2StepAcneKit-FCreamFWash3.4oz	Label	1053	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
282	\N	LABL-TA-3.75x3-5StepAcneKit	Label	900	900	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
283	\N	LABL-5.5x2-Skin-Savior-60	Label	515	515	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
284	\N	LABL-10.5905x1.6418-TA-Four-In-One-Acne-Treatment-8oz	Label	4930	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
285	\N	LABL-TA-Acne-Eliminating-Face-Cleanser-8oz-HS		0	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
286	\N	LABL-TA-Acne-Eliminating-Face-Cleanser-3.4oz-HS		0	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
287	\N	LABL-TA-5.8x0.625-Milia-Spot-Treatment-0.5oz		0	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
288	\N	LABL-TA-5.8x0.625-Cystic-Acne-Spot-0.5oz-Covalence	CM Packaging-Label	1880	800	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
289	\N	LABL-AY-Charcoal-To-Sparkle-Acne-Wash-3.4oz-HS	CM Packaging-Label	400	400	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
290	\N	LABL-AY-Charcoal-To-Sparkle-Acne-Wash-8oz-HS	CM Packaging-Label	2540	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
291	\N	LABL-AY-6.125x0.5625-Warrior-2-Spot-Jar	Label	3000	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
292	\N	LABL-AY-6.125x0.5625-Warrior-1-Spot-Jar	Label	649	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
293	\N	LABL-AY-3.75x3-Warrior-One-Front	Label	250	100	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
294	\N	LABL-AY-3.75x3-Warrior-Two-Front	Label	700	750	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
295	\N	LABL-AY-3.75x4.75-Day-Night-Acne-Kit-Front	Label	500	500	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
296	\N	LABL-AY-3.75x4.75-Day-Night-Acne-Kit-Back	Label	500	500	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
297	\N	LABL-AY-Crepe-Repair-Side	Label	12597	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
298	\N	LABL-AY-Scars-No-More-Side	Label	1500	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
299	\N	LABL-1.25x7.125-Breakout-Warrior-Acne-Cream-Side	Label	2054	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
300	\N	LABL-AY-7.125x3-Bootylicious-8oz	Label	2789	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
301	\N	LABL-AY-Celestial-Body-Acne-Body-Lotion-8oz	Label	1030	220	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
302	\N	LABL-8.79x1.58-AY-Exfoliate-Bad-Vibes-Acne-Scrub-4oz	Label	280	80	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
303	\N	LABL-10.5905x1.6418-AY-Stardust-Sulfur-Scrub-8oz	Label	515	292	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
304	\N	LABL-AY-Acne-Face-Spray-4oz	Label	400	400	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
305	\N	LABL-AY-Wild-God-Toner-4oz	Label	2400	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
306	\N	LABL-AY-Clear-Sleep-Pillow-Mist-4oz	Label	1537	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
307	\N	LABL-AY-3.75x4.75-Yoga-Mat-Spray-4oz	Label	984	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
308	\N	LABL-AY-5.75x4.75-Boho-Body-Wash-Side-8oz	Label	1320	0	2024-08-19 00:00:00	2024-10-12 08:07:53.538469-05
309	\N	LABL-AY-5.25x5.75-Shower-Spray-Euc-8oz	Label	400	400	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
310	\N	LABL-AY-3.75x4.75-Body-Spray-4oz	Label	3900	0	2024-08-19 00:00:00	2024-10-12 08:07:53.538469-05
311	\N	LABL-5.3125X5.25-AY-Reverse-Warrior-Body-Spray-8oz	Label	3173	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
312	\N	LABL-AY-7.5x5.5-Here-Comes-The-Sun-Room-Spray-16oz	Label	2857	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
313	\N	LABL-AY-0.625x6.188-Salicylic-Acid-Spot-0.5oz-PLSF	Label	0	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
314	\N	LABL-AY-1.25x7.125-Salicylic-Acid-Acne-Face-Cream-2oz-PLSF	Label	0	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
315	\N	LABL-AY-Sulfur-Bentonite-Clay-Face-Scrub-4oz-PLSF	Label	0	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
316	\N	LABL-NS-1.5X1.5-25OFF	Label	0	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
317	\N	LABL-WHYZ-1.5X1.5-25OFF	Label	0	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
318	\N	LABL-PS-1.5X1.5-25OFF	Label	0	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
319	\N	LABL-TH-1.5X1.5-25OFF	Label	0	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
320	\N	LABL-TA-1.5X1.5-25OFF	Label	2000	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
321	\N	LABL-AY-1.5X1.5-25OFF	Label	400	300	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
322	\N	INSRT-CYSTIC-3.5X2-INFOCARD	Label	800	0	2024-10-07 00:00:00	2024-10-12 08:07:53.538469-05
\.


--
-- Name: bom_change_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: derrek
--

SELECT pg_catalog.setval('public.bom_change_log_id_seq', 500, true);


--
-- Name: bom_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: derrek
--

SELECT pg_catalog.setval('public.bom_history_id_seq', 500, true);


--
-- Name: boms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: derrek
--

SELECT pg_catalog.setval('public.boms_id_seq', 545, true);


--
-- Name: finished_goods_change_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: derrek
--

SELECT pg_catalog.setval('public.finished_goods_change_log_id_seq', 1, false);


--
-- Name: finished_goods_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: derrek
--

SELECT pg_catalog.setval('public.finished_goods_history_id_seq', 1, false);


--
-- Name: finished_goods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: derrek
--

SELECT pg_catalog.setval('public.finished_goods_id_seq', 366, true);


--
-- Name: finished_goods_inventory_change_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: derrek
--

SELECT pg_catalog.setval('public.finished_goods_inventory_change_log_id_seq', 205, true);


--
-- Name: finished_goods_inventory_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: derrek
--

SELECT pg_catalog.setval('public.finished_goods_inventory_history_id_seq', 205, true);


--
-- Name: finished_goods_inventory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: derrek
--

SELECT pg_catalog.setval('public.finished_goods_inventory_id_seq', 205, true);


--
-- Name: inventory_fba_id_seq; Type: SEQUENCE SET; Schema: public; Owner: derrek
--

SELECT pg_catalog.setval('public.inventory_fba_id_seq', 1, false);


--
-- Name: sales_and_traffic_id_seq; Type: SEQUENCE SET; Schema: public; Owner: derrek
--

SELECT pg_catalog.setval('public.sales_and_traffic_id_seq', 1, false);


--
-- Name: tampa_bom_inventory_change_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: derrek
--

SELECT pg_catalog.setval('public.tampa_bom_inventory_change_log_id_seq', 338, true);


--
-- Name: tampa_bom_inventory_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: derrek
--

SELECT pg_catalog.setval('public.tampa_bom_inventory_history_id_seq', 322, true);


--
-- Name: tampa_bom_inventory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: derrek
--

SELECT pg_catalog.setval('public.tampa_bom_inventory_id_seq', 319, true);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: derrek
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: bom_change_log bom_change_log_pkey; Type: CONSTRAINT; Schema: public; Owner: derrek
--

ALTER TABLE ONLY public.bom_change_log
    ADD CONSTRAINT bom_change_log_pkey PRIMARY KEY (id);


--
-- Name: bom_history bom_history_pkey; Type: CONSTRAINT; Schema: public; Owner: derrek
--

ALTER TABLE ONLY public.bom_history
    ADD CONSTRAINT bom_history_pkey PRIMARY KEY (id);


--
-- Name: boms boms_pkey; Type: CONSTRAINT; Schema: public; Owner: derrek
--

ALTER TABLE ONLY public.boms
    ADD CONSTRAINT boms_pkey PRIMARY KEY (id);


--
-- Name: finished_goods_change_log finished_goods_change_log_pkey; Type: CONSTRAINT; Schema: public; Owner: derrek
--

ALTER TABLE ONLY public.finished_goods_change_log
    ADD CONSTRAINT finished_goods_change_log_pkey PRIMARY KEY (id);


--
-- Name: finished_goods_history finished_goods_history_pkey; Type: CONSTRAINT; Schema: public; Owner: derrek
--

ALTER TABLE ONLY public.finished_goods_history
    ADD CONSTRAINT finished_goods_history_pkey PRIMARY KEY (id);


--
-- Name: finished_goods_inventory_change_log finished_goods_inventory_change_log_pkey; Type: CONSTRAINT; Schema: public; Owner: derrek
--

ALTER TABLE ONLY public.finished_goods_inventory_change_log
    ADD CONSTRAINT finished_goods_inventory_change_log_pkey PRIMARY KEY (id);


--
-- Name: finished_goods_inventory_history finished_goods_inventory_history_pkey; Type: CONSTRAINT; Schema: public; Owner: derrek
--

ALTER TABLE ONLY public.finished_goods_inventory_history
    ADD CONSTRAINT finished_goods_inventory_history_pkey PRIMARY KEY (id);


--
-- Name: finished_goods_inventory finished_goods_inventory_pkey; Type: CONSTRAINT; Schema: public; Owner: derrek
--

ALTER TABLE ONLY public.finished_goods_inventory
    ADD CONSTRAINT finished_goods_inventory_pkey PRIMARY KEY (id);


--
-- Name: finished_goods finished_goods_pkey; Type: CONSTRAINT; Schema: public; Owner: derrek
--

ALTER TABLE ONLY public.finished_goods
    ADD CONSTRAINT finished_goods_pkey PRIMARY KEY (id);


--
-- Name: inventory_fba inventory_fba_pkey; Type: CONSTRAINT; Schema: public; Owner: derrek
--

ALTER TABLE ONLY public.inventory_fba
    ADD CONSTRAINT inventory_fba_pkey PRIMARY KEY (id);


--
-- Name: sales_and_traffic sales_and_traffic_pkey; Type: CONSTRAINT; Schema: public; Owner: derrek
--

ALTER TABLE ONLY public.sales_and_traffic
    ADD CONSTRAINT sales_and_traffic_pkey PRIMARY KEY (id);


--
-- Name: tampa_bom_inventory_change_log tampa_bom_inventory_change_log_pkey; Type: CONSTRAINT; Schema: public; Owner: derrek
--

ALTER TABLE ONLY public.tampa_bom_inventory_change_log
    ADD CONSTRAINT tampa_bom_inventory_change_log_pkey PRIMARY KEY (id);


--
-- Name: tampa_bom_inventory_history tampa_bom_inventory_history_pkey; Type: CONSTRAINT; Schema: public; Owner: derrek
--

ALTER TABLE ONLY public.tampa_bom_inventory_history
    ADD CONSTRAINT tampa_bom_inventory_history_pkey PRIMARY KEY (id);


--
-- Name: tampa_bom_inventory tampa_bom_inventory_pkey; Type: CONSTRAINT; Schema: public; Owner: derrek
--

ALTER TABLE ONLY public.tampa_bom_inventory
    ADD CONSTRAINT tampa_bom_inventory_pkey PRIMARY KEY (id);


--
-- Name: ix_bom_change_log_id; Type: INDEX; Schema: public; Owner: derrek
--

CREATE INDEX ix_bom_change_log_id ON public.bom_change_log USING btree (id);


--
-- Name: ix_bom_history_id; Type: INDEX; Schema: public; Owner: derrek
--

CREATE INDEX ix_bom_history_id ON public.bom_history USING btree (id);


--
-- Name: ix_boms_bom_id; Type: INDEX; Schema: public; Owner: derrek
--

CREATE UNIQUE INDEX ix_boms_bom_id ON public.boms USING btree (bom_id);


--
-- Name: ix_boms_id; Type: INDEX; Schema: public; Owner: derrek
--

CREATE INDEX ix_boms_id ON public.boms USING btree (id);


--
-- Name: ix_finished_goods_change_log_id; Type: INDEX; Schema: public; Owner: derrek
--

CREATE INDEX ix_finished_goods_change_log_id ON public.finished_goods_change_log USING btree (id);


--
-- Name: ix_finished_goods_history_id; Type: INDEX; Schema: public; Owner: derrek
--

CREATE INDEX ix_finished_goods_history_id ON public.finished_goods_history USING btree (id);


--
-- Name: ix_finished_goods_id; Type: INDEX; Schema: public; Owner: derrek
--

CREATE INDEX ix_finished_goods_id ON public.finished_goods USING btree (id);


--
-- Name: ix_finished_goods_inventory_change_log_id; Type: INDEX; Schema: public; Owner: derrek
--

CREATE INDEX ix_finished_goods_inventory_change_log_id ON public.finished_goods_inventory_change_log USING btree (id);


--
-- Name: ix_finished_goods_inventory_history_id; Type: INDEX; Schema: public; Owner: derrek
--

CREATE INDEX ix_finished_goods_inventory_history_id ON public.finished_goods_inventory_history USING btree (id);


--
-- Name: ix_finished_goods_inventory_id; Type: INDEX; Schema: public; Owner: derrek
--

CREATE INDEX ix_finished_goods_inventory_id ON public.finished_goods_inventory USING btree (id);


--
-- Name: ix_finished_goods_inventory_isku; Type: INDEX; Schema: public; Owner: derrek
--

CREATE INDEX ix_finished_goods_inventory_isku ON public.finished_goods_inventory USING btree (isku);


--
-- Name: ix_finished_goods_isku; Type: INDEX; Schema: public; Owner: derrek
--

CREATE UNIQUE INDEX ix_finished_goods_isku ON public.finished_goods USING btree (isku);


--
-- Name: ix_inventory_fba_asin; Type: INDEX; Schema: public; Owner: derrek
--

CREATE INDEX ix_inventory_fba_asin ON public.inventory_fba USING btree (asin);


--
-- Name: ix_inventory_fba_date; Type: INDEX; Schema: public; Owner: derrek
--

CREATE INDEX ix_inventory_fba_date ON public.inventory_fba USING btree (date);


--
-- Name: ix_inventory_fba_fnsku; Type: INDEX; Schema: public; Owner: derrek
--

CREATE INDEX ix_inventory_fba_fnsku ON public.inventory_fba USING btree (fnsku);


--
-- Name: ix_inventory_fba_id; Type: INDEX; Schema: public; Owner: derrek
--

CREATE INDEX ix_inventory_fba_id ON public.inventory_fba USING btree (id);


--
-- Name: ix_sales_and_traffic_date; Type: INDEX; Schema: public; Owner: derrek
--

CREATE INDEX ix_sales_and_traffic_date ON public.sales_and_traffic USING btree (date);


--
-- Name: ix_sales_and_traffic_id; Type: INDEX; Schema: public; Owner: derrek
--

CREATE INDEX ix_sales_and_traffic_id ON public.sales_and_traffic USING btree (id);


--
-- Name: ix_tampa_bom_inventory_bom_id; Type: INDEX; Schema: public; Owner: derrek
--

CREATE INDEX ix_tampa_bom_inventory_bom_id ON public.tampa_bom_inventory USING btree (bom_id);


--
-- Name: ix_tampa_bom_inventory_change_log_id; Type: INDEX; Schema: public; Owner: derrek
--

CREATE INDEX ix_tampa_bom_inventory_change_log_id ON public.tampa_bom_inventory_change_log USING btree (id);


--
-- Name: ix_tampa_bom_inventory_history_id; Type: INDEX; Schema: public; Owner: derrek
--

CREATE INDEX ix_tampa_bom_inventory_history_id ON public.tampa_bom_inventory_history USING btree (id);


--
-- Name: ix_tampa_bom_inventory_id; Type: INDEX; Schema: public; Owner: derrek
--

CREATE INDEX ix_tampa_bom_inventory_id ON public.tampa_bom_inventory USING btree (id);


--
-- Name: bom_change_log bom_change_log_bom_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: derrek
--

ALTER TABLE ONLY public.bom_change_log
    ADD CONSTRAINT bom_change_log_bom_id_fkey FOREIGN KEY (bom_id) REFERENCES public.boms(id);


--
-- Name: bom_history bom_history_bom_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: derrek
--

ALTER TABLE ONLY public.bom_history
    ADD CONSTRAINT bom_history_bom_id_fkey FOREIGN KEY (bom_id) REFERENCES public.boms(id);


--
-- Name: finished_goods_change_log finished_goods_change_log_finished_goods_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: derrek
--

ALTER TABLE ONLY public.finished_goods_change_log
    ADD CONSTRAINT finished_goods_change_log_finished_goods_id_fkey FOREIGN KEY (finished_goods_id) REFERENCES public.finished_goods(id);


--
-- Name: finished_goods_history finished_goods_history_finished_goods_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: derrek
--

ALTER TABLE ONLY public.finished_goods_history
    ADD CONSTRAINT finished_goods_history_finished_goods_id_fkey FOREIGN KEY (finished_goods_id) REFERENCES public.finished_goods(id);


--
-- Name: finished_goods_inventory_change_log finished_goods_inventory_change_log_inventory_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: derrek
--

ALTER TABLE ONLY public.finished_goods_inventory_change_log
    ADD CONSTRAINT finished_goods_inventory_change_log_inventory_id_fkey FOREIGN KEY (inventory_id) REFERENCES public.finished_goods_inventory(id);


--
-- Name: finished_goods_inventory_history finished_goods_inventory_history_inventory_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: derrek
--

ALTER TABLE ONLY public.finished_goods_inventory_history
    ADD CONSTRAINT finished_goods_inventory_history_inventory_id_fkey FOREIGN KEY (inventory_id) REFERENCES public.finished_goods_inventory(id);


--
-- Name: finished_goods_inventory finished_goods_inventory_isku_fkey; Type: FK CONSTRAINT; Schema: public; Owner: derrek
--

ALTER TABLE ONLY public.finished_goods_inventory
    ADD CONSTRAINT finished_goods_inventory_isku_fkey FOREIGN KEY (isku) REFERENCES public.finished_goods(isku);


--
-- Name: tampa_bom_inventory tampa_bom_inventory_bom_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: derrek
--

ALTER TABLE ONLY public.tampa_bom_inventory
    ADD CONSTRAINT tampa_bom_inventory_bom_id_fkey FOREIGN KEY (bom_id) REFERENCES public.boms(bom_id);


--
-- Name: tampa_bom_inventory_change_log tampa_bom_inventory_change_log_inventory_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: derrek
--

ALTER TABLE ONLY public.tampa_bom_inventory_change_log
    ADD CONSTRAINT tampa_bom_inventory_change_log_inventory_id_fkey FOREIGN KEY (inventory_id) REFERENCES public.tampa_bom_inventory(id);


--
-- Name: tampa_bom_inventory_history tampa_bom_inventory_history_inventory_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: derrek
--

ALTER TABLE ONLY public.tampa_bom_inventory_history
    ADD CONSTRAINT tampa_bom_inventory_history_inventory_id_fkey FOREIGN KEY (inventory_id) REFERENCES public.tampa_bom_inventory(id);


--
-- PostgreSQL database dump complete
--

