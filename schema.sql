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

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO derrek;

--
-- Name: bom_change_log; Type: TABLE; Schema: public; Owner: derrek
--

CREATE TABLE public.bom_change_log (
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

CREATE TABLE public.bom_history (
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

CREATE TABLE public.boms (
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

CREATE TABLE public.finished_goods (
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

CREATE TABLE public.finished_goods_change_log (
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

CREATE TABLE public.finished_goods_history (
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

CREATE TABLE public.finished_goods_inventory (
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

CREATE TABLE public.finished_goods_inventory_change_log (
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

CREATE TABLE public.finished_goods_inventory_history (
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

CREATE TABLE public.inventory_fba (
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

CREATE TABLE public.sales_and_traffic (
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

CREATE TABLE public.tampa_bom_inventory (
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

CREATE TABLE public.tampa_bom_inventory_change_log (
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

CREATE TABLE public.tampa_bom_inventory_history (
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

