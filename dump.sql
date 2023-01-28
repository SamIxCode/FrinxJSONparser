--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.6 (Homebrew)

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
-- Name: interface_conf; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.interface_conf (
    id integer NOT NULL,
    connection integer,
    name character varying(255) NOT NULL,
    description character varying(255),
    config json,
    type character varying(50),
    infra_type character varying(50),
    port_channel_id integer,
    max_frame_size integer
);


--
-- Name: interface_conf_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.interface_conf_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: interface_conf_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.interface_conf_id_seq OWNED BY public.interface_conf.id;


--
-- Name: interface_conf id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.interface_conf ALTER COLUMN id SET DEFAULT nextval('public.interface_conf_id_seq'::regclass);


--
-- Data for Name: interface_conf; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.interface_conf (id, connection, name, description, config, type, infra_type, port_channel_id, max_frame_size) FROM stdin;
323	\N	BDI103	LAN VLAN113399	{"name": "103", "description": "LAN VLAN113399", "ipv6": {"traffic-filter": [{"direction": "in", "access-list": "ACL_CPE_PROT_VLAN113399_LAN_IN_V6"}], "address": {"prefix-list": [{"prefix": "2001:CCC:AAA::2/64"}]}}, "vrf": {"forwarding": "VLAN113399"}, "ip": {"redirects": false, "access-group": {"in": {"acl": {"acl-name": "ACL_CPE_PROT_VLAN113399_LAN_IN_V4", "in": [null]}}}, "address": {"primary": {"address": "20.30.140.1", "mask": "255.255.255.248"}}, "proxy-arp": false}}	\N	\N	\N	\N
324	\N	BDI102	LAN VLAN112233	{"name": "102", "description": "LAN VLAN112233", "ipv6": {"traffic-filter": [{"direction": "in", "access-list": "ACL_CPE_PROT_VLAN112233_LAN_IN_V6"}], "address": {"prefix-list": [{"prefix": "2001:CBA:CBA::1/64"}]}}, "vrf": {"forwarding": "VLAN112233"}, "ip": {"redirects": false, "access-group": {"in": {"acl": {"acl-name": "ACL_CPE_PROT_VLAN112233_LAN_IN_V4", "in": [null]}}}, "address": {"primary": {"address": "220.130.140.1", "mask": "255.255.255.248"}}, "proxy-arp": false}}	\N	\N	\N	\N
325	\N	BDI6	\N	{"name": "6", "vrf": {"forwarding": "MANAGEMENT"}, "ip": {"access-group": {"in": {"acl": {"acl-name": "ACL_INGRESS_MANAGEMENT", "in": [null]}}, "out": {"acl": {"acl-name": "ACL_EGRESS_MANAGEMENT", "out": [null]}}}, "address": {"primary": {"address": "192.168.165.150", "mask": "255.255.255.0"}}}}	\N	\N	\N	\N
326	\N	BDI1176	WAN Anti-DDoS	{"name": "1176", "description": "WAN Anti-DDoS", "ipv6": {"address": {"prefix-list": [{"prefix": "AAAA:BBBB:AAAA:1111::6/64"}]}}, "vrf": {"forwarding": "VLAN123456"}, "ip": {"redirects": false, "address": {"primary": {"address": "192.168.13.14", "mask": "255.255.255.248"}}, "proxy-arp": false}}	\N	\N	\N	\N
327	\N	BDI1199	WAN VLAN112233	{"name": "1199", "description": "WAN VLAN112233", "ipv6": {"traffic-filter": [{"direction": "in", "access-list": "ACL_CPE_PROT_VLAN112233_WAN_IN_V6"}], "address": {"prefix-list": [{"prefix": "2001:CCCC:CCCC::5/64"}, {"prefix": "2001:CCCC:CCCC::6/64"}]}}, "vrf": {"forwarding": "VLAN112233"}, "ip": {"redirects": false, "access-group": {"in": {"acl": {"acl-name": "ACL_CPE_PROT_VLAN112233_WAN_IN_V4", "in": [null]}}}, "address": {"secondary": [{"address": "10.100.0.5", "secondary": [null], "mask": "255.255.255.248"}], "primary": {"address": "10.100.0.6", "mask": "255.255.255.248"}}, "proxy-arp": false}}	\N	\N	\N	\N
328	\N	BDI2102	WAN VLAN113399	{"name": "2102", "description": "WAN VLAN113399", "ipv6": {"traffic-filter": [{"direction": "in", "access-list": "ACL_CPE_PROT_VLAN113399_WAN_IN_V6"}], "address": {"prefix-list": [{"prefix": "2001:8100:EA00::6/64"}]}}, "vrf": {"forwarding": "VLAN113399"}, "ip": {"redirects": false, "access-group": {"in": {"acl": {"acl-name": "ACL_CPE_PROT_VLAN113399_WAN_IN_V4", "in": [null]}}}, "address": {"primary": {"address": "192.100.0.6", "mask": "255.255.255.248"}}, "proxy-arp": false}}	\N	\N	\N	\N
329	\N	BDI1102	WAN VLAN123456	{"name": "1102", "description": "WAN VLAN123456", "ipv6": {"address": {"prefix-list": [{"prefix": "2001:CCCC:AAAA::6/64"}]}}, "vrf": {"forwarding": "VLAN123456"}, "ip": {"address": {"primary": {"address": "192.100.0.6", "mask": "255.255.255.248"}}}}	\N	\N	\N	\N
330	\N	BDI1405	\N	{"name": "1405", "vrf": {"forwarding": "VLAN372638"}, "ip": {"redirects": false, "access-group": {"in": {"acl": {"acl-name": "ingress-uplink-VLAN372638", "in": [null]}}, "out": {"acl": {"acl-name": "ingress-uplink-VLAN372638", "out": [null]}}}, "address": {"primary": {"address": "192.168.30.0", "mask": "255.255.255.248"}}, "proxy-arp": false}}	\N	\N	\N	\N
331	\N	BDI101	LAN VLAN123456	{"name": "101", "description": "LAN VLAN123456", "ipv6": {"traffic-filter": [{"direction": "in", "access-list": "ACL_CPE_PROT_VLAN123456_LAN_IN_V6"}], "address": {"prefix-list": [{"prefix": "2001:DBA:DBA::1/64"}]}}, "vrf": {"forwarding": "VLAN123456"}, "ip": {"redirects": false, "access-group": {"in": {"acl": {"acl-name": "ACL_CPE_PROT_VLAN123456_LAN_IN_V4", "in": [null]}}}, "address": {"primary": {"address": "10.130.140.1", "mask": "255.255.255.248"}}, "proxy-arp": false}}	\N	\N	\N	\N
332	\N	BDI100	\N	{"name": "100", "vrf": {"forwarding": "VLAN372638"}, "ip": {"redirects": false, "access-group": {"in": {"acl": {"acl-name": "anti-spoof-VLAN372638", "in": [null]}}}, "address": {"primary": {"address": "192.168.92.92", "mask": "255.255.255.0"}}, "proxy-arp": false}}	\N	\N	\N	\N
333	\N	Loopback999	test - JB Demo	{"name": 999, "description": "test - JB Demo"}	\N	\N	\N	\N
334	\N	Port-channel20	InternetPro-123.321.123	{"name": 20, "description": "InternetPro-123.321.123", "Cisco-IOS-XE-ethernet:service": {"instance": [{"id": 102, "l2protocol": {"peer": {"protocol": ["lacp"]}, "tunnel": {"protocol": ["stp"]}}, "bridge-domain": {"bridge-id": 102}, "ethernet-evc-name": "CI_VLAN112233", "encapsulation": {"untagged": {}}, "ethernet": [null]}]}, "storm-control": {"broadcast": {"level": {"threshold": {"rising-threshold": 10}}}, "unicast": {"level": {"threshold": {"rising-threshold": 10}}}}, "mtu": 9216, "Cisco-IOS-XE-policy:service-policy": {"input": "PM_UNI_ASSURED_200M_IN"}}	\N	\N	\N	\N
335	\N	Port-channel5	\N	{"name": 5, "Cisco-IOS-XE-ethernet:negotiation": {"auto": false}, "Cisco-IOS-XE-ethernet:service": {"instance": [{"id": 1, "encapsulation": {"dot1q": {"id": [6, 1405]}}, "trunk": [null], "ethernet": [null]}]}}	\N	\N	\N	\N
337	\N	TenGigabitEthernet0/0/2	InternetPro-111.333.999 Client name	{"name": "0/0/2", "description": "InternetPro-111.333.999 Client name", "keepalive": false, "Cisco-IOS-XE-ethernet:service": {"instance": [{"id": 103, "l2protocol": {"tunnel": {"protocol": ["stp"]}}, "bridge-domain": {"bridge-id": 103, "split-horizon": {"group": 3}}, "ethernet-evc-name": "CI_VLAN113399", "encapsulation": {"untagged": {}}, "ethernet": [null]}]}, "Cisco-IOS-XE-lldp:lldp": {"receive": false, "transmit": false}, "Cisco-IOS-XE-policy:service-policy": {"input": "PM_UNI_ASSURED_200Mb"}}	\N	\N	\N	\N
338	\N	TenGigabitEthernet0/0/3	Uplink to ED5 / 11	{"name": "0/0/3", "description": "Uplink to ED5 / 11", "Cisco-IOS-XE-ethernet:service": {"instance": [{"id": 4000, "description": "For untagged packets (LLDP) test", "l2protocol": {"peer": {"protocol": ["lldp"]}}, "bridge-domain": {"bridge-id": 4000}, "encapsulation": {"untagged": {}}, "ethernet": [null]}, {"id": 1, "bridge-domain": {"from-encapsulation": [null]}, "encapsulation": {"dot1q": {"id": [3131, 1176, 1199, 1102, 1405, 6, 2102]}}, "trunk": [null], "ethernet": [null], "rewrite": {"ingress": {"tag": {"pop": {"way": "1", "mode": "symmetric"}}}}}]}, "mtu": 9216, "Cisco-IOS-XE-policy:service-policy": {"input": "PM-ASSURED-IN", "output": "PM-NNI-100M-OUT"}}	\N	\N	\N	\N
336	\N	TenGigabitEthernet0/0/5	member of Portchannel20	{"name": "0/0/5", "description": "member of Portchannel20", "keepalive": false, "Cisco-IOS-XE-ethernet:channel-group": {"number": 20, "mode": "active"}, "mtu": 9216}	\N	\N	334	\N
339	\N	TenGigabitEthernet0/0/4	member of Portchannel20	{"name": "0/0/4", "description": "member of Portchannel20", "keepalive": false, "Cisco-IOS-XE-ethernet:channel-group": {"number": 20, "mode": "active"}, "mtu": 9216}	\N	\N	334	\N
340	\N	GigabitEthernet0/0/1	InternetPro-123.456.789 - Client name	{"name": "0/0/1", "description": "InternetPro-123.456.789 - Client name", "keepalive": false, "media-type": "rj45", "Cisco-IOS-XE-lldp:lldp": {"receive": false, "transmit": false}, "Cisco-IOS-XE-policy:service-policy": {"input": "PM_UNI_ASSURED_PIN_200Mb"}, "Cisco-IOS-XE-ethernet:negotiation": {"auto": true}, "Cisco-IOS-XE-ethernet:service": {"instance": [{"id": 101, "l2protocol": {"tunnel": {"protocol": ["stp"]}}, "bridge-domain": {"bridge-id": 101, "split-horizon": {"group": 3}}, "ethernet-evc-name": "CI_VLAN123456", "encapsulation": {"untagged": {}}, "ethernet": [null]}]}}	\N	\N	\N	\N
341	\N	GigabitEthernet0	\N	{"name": "0", "Cisco-IOS-XE-ethernet:negotiation": {"auto": true}, "vrf": {"forwarding": "Mgmt-intf"}, "ip": {"address": {"primary": {"address": "172.16.1.56", "mask": "255.255.254.0"}}}}	\N	\N	\N	\N
342	\N	GigabitEthernet0/0/0	VLAN372638 FRINX_LAB_IVP	{"name": "0/0/0", "description": "VLAN372638 FRINX_LAB_IVP", "keepalive": false, "media-type": "rj45", "load-interval": 30, "Cisco-IOS-XE-ethernet:negotiation": {"auto": true}, "Cisco-IOS-XE-ethernet:service": {"instance": [{"id": 100, "encapsulation": {"untagged": {}}, "bridge-domain": {"bridge-id": 100}, "ethernet": [null]}]}, "Cisco-IOS-XE-snmp:snmp": {"trap": {"link-status": false}}}	\N	\N	\N	\N
\.


--
-- Name: interface_conf_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.interface_conf_id_seq', 342, true);


--
-- Name: interface_conf interface_conf_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.interface_conf
    ADD CONSTRAINT interface_conf_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

