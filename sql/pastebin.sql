--
-- PostgreSQL database dump
--

SET client_encoding = 'SQL_ASCII';
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'Standard public schema';


--
-- Name: plperl; Type: PROCEDURAL LANGUAGE; Schema: -; Owner: 
--

CREATE PROCEDURAL LANGUAGE plperl;


--
-- Name: plpgsql; Type: PROCEDURAL LANGUAGE; Schema: -; Owner: 
--

CREATE PROCEDURAL LANGUAGE plpgsql;


SET search_path = public, pg_catalog;

--
-- Name: gtsvector_in(cstring); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION gtsvector_in(cstring) RETURNS gtsvector
    AS '$libdir/tsearch2', 'gtsvector_in'
    LANGUAGE c STRICT;


ALTER FUNCTION public.gtsvector_in(cstring) OWNER TO pastebin;

--
-- Name: gtsvector_out(gtsvector); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION gtsvector_out(gtsvector) RETURNS cstring
    AS '$libdir/tsearch2', 'gtsvector_out'
    LANGUAGE c STRICT;


ALTER FUNCTION public.gtsvector_out(gtsvector) OWNER TO pastebin;

--
-- Name: gtsvector; Type: TYPE; Schema: public; Owner: pastebin
--

CREATE TYPE gtsvector (
    INTERNALLENGTH = variable,
    INPUT = gtsvector_in,
    OUTPUT = gtsvector_out,
    ALIGNMENT = int4,
    STORAGE = plain
);


ALTER TYPE public.gtsvector OWNER TO pastebin;

--
-- Name: lquery_in(cstring); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION lquery_in(cstring) RETURNS lquery
    AS '$libdir/ltree', 'lquery_in'
    LANGUAGE c STRICT;


ALTER FUNCTION public.lquery_in(cstring) OWNER TO pastebin;

--
-- Name: lquery_out(lquery); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION lquery_out(lquery) RETURNS cstring
    AS '$libdir/ltree', 'lquery_out'
    LANGUAGE c STRICT;


ALTER FUNCTION public.lquery_out(lquery) OWNER TO pastebin;

--
-- Name: lquery; Type: TYPE; Schema: public; Owner: pastebin
--

CREATE TYPE lquery (
    INTERNALLENGTH = variable,
    INPUT = lquery_in,
    OUTPUT = lquery_out,
    ALIGNMENT = int4,
    STORAGE = extended
);


ALTER TYPE public.lquery OWNER TO pastebin;

--
-- Name: ltree_in(cstring); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION ltree_in(cstring) RETURNS ltree
    AS '$libdir/ltree', 'ltree_in'
    LANGUAGE c STRICT;


ALTER FUNCTION public.ltree_in(cstring) OWNER TO pastebin;

--
-- Name: ltree_out(ltree); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION ltree_out(ltree) RETURNS cstring
    AS '$libdir/ltree', 'ltree_out'
    LANGUAGE c STRICT;


ALTER FUNCTION public.ltree_out(ltree) OWNER TO pastebin;

--
-- Name: ltree; Type: TYPE; Schema: public; Owner: pastebin
--

CREATE TYPE ltree (
    INTERNALLENGTH = variable,
    INPUT = ltree_in,
    OUTPUT = ltree_out,
    ALIGNMENT = int4,
    STORAGE = extended
);


ALTER TYPE public.ltree OWNER TO pastebin;

--
-- Name: ltree_gist_in(cstring); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION ltree_gist_in(cstring) RETURNS ltree_gist
    AS '$libdir/ltree', 'ltree_gist_in'
    LANGUAGE c STRICT;


ALTER FUNCTION public.ltree_gist_in(cstring) OWNER TO pastebin;

--
-- Name: ltree_gist_out(ltree_gist); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION ltree_gist_out(ltree_gist) RETURNS cstring
    AS '$libdir/ltree', 'ltree_gist_out'
    LANGUAGE c STRICT;


ALTER FUNCTION public.ltree_gist_out(ltree_gist) OWNER TO pastebin;

--
-- Name: ltree_gist; Type: TYPE; Schema: public; Owner: pastebin
--

CREATE TYPE ltree_gist (
    INTERNALLENGTH = variable,
    INPUT = ltree_gist_in,
    OUTPUT = ltree_gist_out,
    ALIGNMENT = int4,
    STORAGE = plain
);


ALTER TYPE public.ltree_gist OWNER TO pastebin;

--
-- Name: ltxtq_in(cstring); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION ltxtq_in(cstring) RETURNS ltxtquery
    AS '$libdir/ltree', 'ltxtq_in'
    LANGUAGE c STRICT;


ALTER FUNCTION public.ltxtq_in(cstring) OWNER TO pastebin;

--
-- Name: ltxtq_out(ltxtquery); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION ltxtq_out(ltxtquery) RETURNS cstring
    AS '$libdir/ltree', 'ltxtq_out'
    LANGUAGE c STRICT;


ALTER FUNCTION public.ltxtq_out(ltxtquery) OWNER TO pastebin;

--
-- Name: ltxtquery; Type: TYPE; Schema: public; Owner: pastebin
--

CREATE TYPE ltxtquery (
    INTERNALLENGTH = variable,
    INPUT = ltxtq_in,
    OUTPUT = ltxtq_out,
    ALIGNMENT = int4,
    STORAGE = extended
);


ALTER TYPE public.ltxtquery OWNER TO pastebin;

--
-- Name: tsquery_in(cstring); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION tsquery_in(cstring) RETURNS tsquery
    AS '$libdir/tsearch2', 'tsquery_in'
    LANGUAGE c STRICT;


ALTER FUNCTION public.tsquery_in(cstring) OWNER TO pastebin;

--
-- Name: tsquery_out(tsquery); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION tsquery_out(tsquery) RETURNS cstring
    AS '$libdir/tsearch2', 'tsquery_out'
    LANGUAGE c STRICT;


ALTER FUNCTION public.tsquery_out(tsquery) OWNER TO pastebin;

--
-- Name: tsquery; Type: TYPE; Schema: public; Owner: pastebin
--

CREATE TYPE tsquery (
    INTERNALLENGTH = variable,
    INPUT = tsquery_in,
    OUTPUT = tsquery_out,
    ALIGNMENT = int4,
    STORAGE = plain
);


ALTER TYPE public.tsquery OWNER TO pastebin;

--
-- Name: tsvector_in(cstring); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION tsvector_in(cstring) RETURNS tsvector
    AS '$libdir/tsearch2', 'tsvector_in'
    LANGUAGE c STRICT;


ALTER FUNCTION public.tsvector_in(cstring) OWNER TO pastebin;

--
-- Name: tsvector_out(tsvector); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION tsvector_out(tsvector) RETURNS cstring
    AS '$libdir/tsearch2', 'tsvector_out'
    LANGUAGE c STRICT;


ALTER FUNCTION public.tsvector_out(tsvector) OWNER TO pastebin;

--
-- Name: tsvector; Type: TYPE; Schema: public; Owner: pastebin
--

CREATE TYPE tsvector (
    INTERNALLENGTH = variable,
    INPUT = tsvector_in,
    OUTPUT = tsvector_out,
    ALIGNMENT = int4,
    STORAGE = extended
);


ALTER TYPE public.tsvector OWNER TO pastebin;

--
-- Name: statinfo; Type: TYPE; Schema: public; Owner: pastebin
--

CREATE TYPE statinfo AS (
	word text,
	ndoc integer,
	nentry integer
);


ALTER TYPE public.statinfo OWNER TO pastebin;

--
-- Name: tokenout; Type: TYPE; Schema: public; Owner: pastebin
--

CREATE TYPE tokenout AS (
	tokid integer,
	token text
);


ALTER TYPE public.tokenout OWNER TO pastebin;

--
-- Name: tokentype; Type: TYPE; Schema: public; Owner: pastebin
--

CREATE TYPE tokentype AS (
	tokid integer,
	alias text,
	descr text
);


ALTER TYPE public.tokentype OWNER TO pastebin;

--
-- Name: tsdebug; Type: TYPE; Schema: public; Owner: pastebin
--

CREATE TYPE tsdebug AS (
	ts_name text,
	tok_type text,
	description text,
	token text,
	dict_name text[],
	tsvector tsvector
);


ALTER TYPE public.tsdebug OWNER TO pastebin;

--
-- Name: _get_parser_from_curcfg(); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION _get_parser_from_curcfg() RETURNS text
    AS $$ select prs_name from pg_ts_cfg where oid = show_curcfg() $$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public._get_parser_from_curcfg() OWNER TO pastebin;

--
-- Name: _lt_q_regex(ltree[], lquery[]); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION _lt_q_regex(ltree[], lquery[]) RETURNS boolean
    AS '$libdir/ltree', '_lt_q_regex'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public._lt_q_regex(ltree[], lquery[]) OWNER TO pastebin;

--
-- Name: _lt_q_rregex(lquery[], ltree[]); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION _lt_q_rregex(lquery[], ltree[]) RETURNS boolean
    AS '$libdir/ltree', '_lt_q_rregex'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public._lt_q_rregex(lquery[], ltree[]) OWNER TO pastebin;

--
-- Name: _ltq_extract_regex(ltree[], lquery); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION _ltq_extract_regex(ltree[], lquery) RETURNS ltree
    AS '$libdir/ltree', '_ltq_extract_regex'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public._ltq_extract_regex(ltree[], lquery) OWNER TO pastebin;

--
-- Name: _ltq_regex(ltree[], lquery); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION _ltq_regex(ltree[], lquery) RETURNS boolean
    AS '$libdir/ltree', '_ltq_regex'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public._ltq_regex(ltree[], lquery) OWNER TO pastebin;

--
-- Name: _ltq_rregex(lquery, ltree[]); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION _ltq_rregex(lquery, ltree[]) RETURNS boolean
    AS '$libdir/ltree', '_ltq_rregex'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public._ltq_rregex(lquery, ltree[]) OWNER TO pastebin;

--
-- Name: _ltree_compress(internal); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION _ltree_compress(internal) RETURNS internal
    AS '$libdir/ltree', '_ltree_compress'
    LANGUAGE c;


ALTER FUNCTION public._ltree_compress(internal) OWNER TO pastebin;

--
-- Name: _ltree_consistent(internal, internal, smallint); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION _ltree_consistent(internal, internal, smallint) RETURNS boolean
    AS '$libdir/ltree', '_ltree_consistent'
    LANGUAGE c;


ALTER FUNCTION public._ltree_consistent(internal, internal, smallint) OWNER TO pastebin;

--
-- Name: _ltree_extract_isparent(ltree[], ltree); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION _ltree_extract_isparent(ltree[], ltree) RETURNS ltree
    AS '$libdir/ltree', '_ltree_extract_isparent'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public._ltree_extract_isparent(ltree[], ltree) OWNER TO pastebin;

--
-- Name: _ltree_extract_risparent(ltree[], ltree); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION _ltree_extract_risparent(ltree[], ltree) RETURNS ltree
    AS '$libdir/ltree', '_ltree_extract_risparent'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public._ltree_extract_risparent(ltree[], ltree) OWNER TO pastebin;

--
-- Name: _ltree_isparent(ltree[], ltree); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION _ltree_isparent(ltree[], ltree) RETURNS boolean
    AS '$libdir/ltree', '_ltree_isparent'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public._ltree_isparent(ltree[], ltree) OWNER TO pastebin;

--
-- Name: _ltree_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION _ltree_penalty(internal, internal, internal) RETURNS internal
    AS '$libdir/ltree', '_ltree_penalty'
    LANGUAGE c STRICT;


ALTER FUNCTION public._ltree_penalty(internal, internal, internal) OWNER TO pastebin;

--
-- Name: _ltree_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION _ltree_picksplit(internal, internal) RETURNS internal
    AS '$libdir/ltree', '_ltree_picksplit'
    LANGUAGE c;


ALTER FUNCTION public._ltree_picksplit(internal, internal) OWNER TO pastebin;

--
-- Name: _ltree_r_isparent(ltree, ltree[]); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION _ltree_r_isparent(ltree, ltree[]) RETURNS boolean
    AS '$libdir/ltree', '_ltree_r_isparent'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public._ltree_r_isparent(ltree, ltree[]) OWNER TO pastebin;

--
-- Name: _ltree_r_risparent(ltree, ltree[]); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION _ltree_r_risparent(ltree, ltree[]) RETURNS boolean
    AS '$libdir/ltree', '_ltree_r_risparent'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public._ltree_r_risparent(ltree, ltree[]) OWNER TO pastebin;

--
-- Name: _ltree_risparent(ltree[], ltree); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION _ltree_risparent(ltree[], ltree) RETURNS boolean
    AS '$libdir/ltree', '_ltree_risparent'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public._ltree_risparent(ltree[], ltree) OWNER TO pastebin;

--
-- Name: _ltree_same(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION _ltree_same(internal, internal, internal) RETURNS internal
    AS '$libdir/ltree', '_ltree_same'
    LANGUAGE c;


ALTER FUNCTION public._ltree_same(internal, internal, internal) OWNER TO pastebin;

--
-- Name: _ltree_union(internal, internal); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION _ltree_union(internal, internal) RETURNS integer
    AS '$libdir/ltree', '_ltree_union'
    LANGUAGE c;


ALTER FUNCTION public._ltree_union(internal, internal) OWNER TO pastebin;

--
-- Name: _ltxtq_exec(ltree[], ltxtquery); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION _ltxtq_exec(ltree[], ltxtquery) RETURNS boolean
    AS '$libdir/ltree', '_ltxtq_exec'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public._ltxtq_exec(ltree[], ltxtquery) OWNER TO pastebin;

--
-- Name: _ltxtq_extract_exec(ltree[], ltxtquery); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION _ltxtq_extract_exec(ltree[], ltxtquery) RETURNS ltree
    AS '$libdir/ltree', '_ltxtq_extract_exec'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public._ltxtq_extract_exec(ltree[], ltxtquery) OWNER TO pastebin;

--
-- Name: _ltxtq_rexec(ltxtquery, ltree[]); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION _ltxtq_rexec(ltxtquery, ltree[]) RETURNS boolean
    AS '$libdir/ltree', '_ltxtq_rexec'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public._ltxtq_rexec(ltxtquery, ltree[]) OWNER TO pastebin;

--
-- Name: concat(tsvector, tsvector); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION concat(tsvector, tsvector) RETURNS tsvector
    AS '$libdir/tsearch2', 'concat'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.concat(tsvector, tsvector) OWNER TO pastebin;

--
-- Name: dex_init(internal); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION dex_init(internal) RETURNS internal
    AS '$libdir/tsearch2', 'dex_init'
    LANGUAGE c;


ALTER FUNCTION public.dex_init(internal) OWNER TO pastebin;

--
-- Name: dex_lexize(internal, internal, integer); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION dex_lexize(internal, internal, integer) RETURNS internal
    AS '$libdir/tsearch2', 'dex_lexize'
    LANGUAGE c STRICT;


ALTER FUNCTION public.dex_lexize(internal, internal, integer) OWNER TO pastebin;

--
-- Name: exectsq(tsvector, tsquery); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION exectsq(tsvector, tsquery) RETURNS boolean
    AS '$libdir/tsearch2', 'exectsq'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.exectsq(tsvector, tsquery) OWNER TO pastebin;

--
-- Name: FUNCTION exectsq(tsvector, tsquery); Type: COMMENT; Schema: public; Owner: pastebin
--

COMMENT ON FUNCTION exectsq(tsvector, tsquery) IS 'boolean operation with text index';


--
-- Name: get_covers(tsvector, tsquery); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION get_covers(tsvector, tsquery) RETURNS text
    AS '$libdir/tsearch2', 'get_covers'
    LANGUAGE c STRICT;


ALTER FUNCTION public.get_covers(tsvector, tsquery) OWNER TO pastebin;

--
-- Name: gtsvector_compress(internal); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION gtsvector_compress(internal) RETURNS internal
    AS '$libdir/tsearch2', 'gtsvector_compress'
    LANGUAGE c;


ALTER FUNCTION public.gtsvector_compress(internal) OWNER TO pastebin;

--
-- Name: gtsvector_consistent(gtsvector, internal, integer); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION gtsvector_consistent(gtsvector, internal, integer) RETURNS boolean
    AS '$libdir/tsearch2', 'gtsvector_consistent'
    LANGUAGE c;


ALTER FUNCTION public.gtsvector_consistent(gtsvector, internal, integer) OWNER TO pastebin;

--
-- Name: gtsvector_decompress(internal); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION gtsvector_decompress(internal) RETURNS internal
    AS '$libdir/tsearch2', 'gtsvector_decompress'
    LANGUAGE c;


ALTER FUNCTION public.gtsvector_decompress(internal) OWNER TO pastebin;

--
-- Name: gtsvector_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION gtsvector_penalty(internal, internal, internal) RETURNS internal
    AS '$libdir/tsearch2', 'gtsvector_penalty'
    LANGUAGE c STRICT;


ALTER FUNCTION public.gtsvector_penalty(internal, internal, internal) OWNER TO pastebin;

--
-- Name: gtsvector_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION gtsvector_picksplit(internal, internal) RETURNS internal
    AS '$libdir/tsearch2', 'gtsvector_picksplit'
    LANGUAGE c;


ALTER FUNCTION public.gtsvector_picksplit(internal, internal) OWNER TO pastebin;

--
-- Name: gtsvector_same(gtsvector, gtsvector, internal); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION gtsvector_same(gtsvector, gtsvector, internal) RETURNS internal
    AS '$libdir/tsearch2', 'gtsvector_same'
    LANGUAGE c;


ALTER FUNCTION public.gtsvector_same(gtsvector, gtsvector, internal) OWNER TO pastebin;

--
-- Name: gtsvector_union(internal, internal); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION gtsvector_union(internal, internal) RETURNS integer[]
    AS '$libdir/tsearch2', 'gtsvector_union'
    LANGUAGE c;


ALTER FUNCTION public.gtsvector_union(internal, internal) OWNER TO pastebin;

--
-- Name: gtsvector_union(bytea, internal); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION gtsvector_union(bytea, internal) RETURNS integer[]
    AS '$libdir/tsearch2', 'gtsvector_union'
    LANGUAGE c;


ALTER FUNCTION public.gtsvector_union(bytea, internal) OWNER TO pastebin;

--
-- Name: headline(oid, text, tsquery, text); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION headline(oid, text, tsquery, text) RETURNS text
    AS '$libdir/tsearch2', 'headline'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.headline(oid, text, tsquery, text) OWNER TO pastebin;

--
-- Name: headline(oid, text, tsquery); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION headline(oid, text, tsquery) RETURNS text
    AS '$libdir/tsearch2', 'headline'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.headline(oid, text, tsquery) OWNER TO pastebin;

--
-- Name: headline(text, text, tsquery, text); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION headline(text, text, tsquery, text) RETURNS text
    AS '$libdir/tsearch2', 'headline_byname'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.headline(text, text, tsquery, text) OWNER TO pastebin;

--
-- Name: headline(text, text, tsquery); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION headline(text, text, tsquery) RETURNS text
    AS '$libdir/tsearch2', 'headline_byname'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.headline(text, text, tsquery) OWNER TO pastebin;

--
-- Name: headline(text, tsquery, text); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION headline(text, tsquery, text) RETURNS text
    AS '$libdir/tsearch2', 'headline_current'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.headline(text, tsquery, text) OWNER TO pastebin;

--
-- Name: headline(text, tsquery); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION headline(text, tsquery) RETURNS text
    AS '$libdir/tsearch2', 'headline_current'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.headline(text, tsquery) OWNER TO pastebin;

--
-- Name: index(ltree, ltree); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION "index"(ltree, ltree) RETURNS integer
    AS '$libdir/ltree', 'ltree_index'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public."index"(ltree, ltree) OWNER TO pastebin;

--
-- Name: index(ltree, ltree, integer); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION "index"(ltree, ltree, integer) RETURNS integer
    AS '$libdir/ltree', 'ltree_index'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public."index"(ltree, ltree, integer) OWNER TO pastebin;

--
-- Name: lca(ltree[]); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION lca(ltree[]) RETURNS ltree
    AS '$libdir/ltree', '_lca'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.lca(ltree[]) OWNER TO pastebin;

--
-- Name: lca(ltree, ltree); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION lca(ltree, ltree) RETURNS ltree
    AS '$libdir/ltree', 'lca'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.lca(ltree, ltree) OWNER TO pastebin;

--
-- Name: lca(ltree, ltree, ltree); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION lca(ltree, ltree, ltree) RETURNS ltree
    AS '$libdir/ltree', 'lca'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.lca(ltree, ltree, ltree) OWNER TO pastebin;

--
-- Name: lca(ltree, ltree, ltree, ltree); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION lca(ltree, ltree, ltree, ltree) RETURNS ltree
    AS '$libdir/ltree', 'lca'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.lca(ltree, ltree, ltree, ltree) OWNER TO pastebin;

--
-- Name: lca(ltree, ltree, ltree, ltree, ltree); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION lca(ltree, ltree, ltree, ltree, ltree) RETURNS ltree
    AS '$libdir/ltree', 'lca'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.lca(ltree, ltree, ltree, ltree, ltree) OWNER TO pastebin;

--
-- Name: lca(ltree, ltree, ltree, ltree, ltree, ltree); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION lca(ltree, ltree, ltree, ltree, ltree, ltree) RETURNS ltree
    AS '$libdir/ltree', 'lca'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.lca(ltree, ltree, ltree, ltree, ltree, ltree) OWNER TO pastebin;

--
-- Name: lca(ltree, ltree, ltree, ltree, ltree, ltree, ltree); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION lca(ltree, ltree, ltree, ltree, ltree, ltree, ltree) RETURNS ltree
    AS '$libdir/ltree', 'lca'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.lca(ltree, ltree, ltree, ltree, ltree, ltree, ltree) OWNER TO pastebin;

--
-- Name: lca(ltree, ltree, ltree, ltree, ltree, ltree, ltree, ltree); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION lca(ltree, ltree, ltree, ltree, ltree, ltree, ltree, ltree) RETURNS ltree
    AS '$libdir/ltree', 'lca'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.lca(ltree, ltree, ltree, ltree, ltree, ltree, ltree, ltree) OWNER TO pastebin;

--
-- Name: length(tsvector); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION length(tsvector) RETURNS integer
    AS '$libdir/tsearch2', 'tsvector_length'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.length(tsvector) OWNER TO pastebin;

--
-- Name: lexize(oid, text); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION lexize(oid, text) RETURNS text[]
    AS '$libdir/tsearch2', 'lexize'
    LANGUAGE c STRICT;


ALTER FUNCTION public.lexize(oid, text) OWNER TO pastebin;

--
-- Name: lexize(text, text); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION lexize(text, text) RETURNS text[]
    AS '$libdir/tsearch2', 'lexize_byname'
    LANGUAGE c STRICT;


ALTER FUNCTION public.lexize(text, text) OWNER TO pastebin;

--
-- Name: lexize(text); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION lexize(text) RETURNS text[]
    AS '$libdir/tsearch2', 'lexize_bycurrent'
    LANGUAGE c STRICT;


ALTER FUNCTION public.lexize(text) OWNER TO pastebin;

--
-- Name: lt_q_regex(ltree, lquery[]); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION lt_q_regex(ltree, lquery[]) RETURNS boolean
    AS '$libdir/ltree', 'lt_q_regex'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.lt_q_regex(ltree, lquery[]) OWNER TO pastebin;

--
-- Name: lt_q_rregex(lquery[], ltree); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION lt_q_rregex(lquery[], ltree) RETURNS boolean
    AS '$libdir/ltree', 'lt_q_rregex'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.lt_q_rregex(lquery[], ltree) OWNER TO pastebin;

--
-- Name: ltq_regex(ltree, lquery); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION ltq_regex(ltree, lquery) RETURNS boolean
    AS '$libdir/ltree', 'ltq_regex'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.ltq_regex(ltree, lquery) OWNER TO pastebin;

--
-- Name: ltq_rregex(lquery, ltree); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION ltq_rregex(lquery, ltree) RETURNS boolean
    AS '$libdir/ltree', 'ltq_rregex'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.ltq_rregex(lquery, ltree) OWNER TO pastebin;

--
-- Name: ltree2text(ltree); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION ltree2text(ltree) RETURNS text
    AS '$libdir/ltree', 'ltree2text'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.ltree2text(ltree) OWNER TO pastebin;

--
-- Name: ltree_addltree(ltree, ltree); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION ltree_addltree(ltree, ltree) RETURNS ltree
    AS '$libdir/ltree', 'ltree_addltree'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.ltree_addltree(ltree, ltree) OWNER TO pastebin;

--
-- Name: ltree_addtext(ltree, text); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION ltree_addtext(ltree, text) RETURNS ltree
    AS '$libdir/ltree', 'ltree_addtext'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.ltree_addtext(ltree, text) OWNER TO pastebin;

--
-- Name: ltree_cmp(ltree, ltree); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION ltree_cmp(ltree, ltree) RETURNS integer
    AS '$libdir/ltree', 'ltree_cmp'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.ltree_cmp(ltree, ltree) OWNER TO pastebin;

--
-- Name: ltree_compress(internal); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION ltree_compress(internal) RETURNS internal
    AS '$libdir/ltree', 'ltree_compress'
    LANGUAGE c;


ALTER FUNCTION public.ltree_compress(internal) OWNER TO pastebin;

--
-- Name: ltree_consistent(internal, internal, smallint); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION ltree_consistent(internal, internal, smallint) RETURNS boolean
    AS '$libdir/ltree', 'ltree_consistent'
    LANGUAGE c;


ALTER FUNCTION public.ltree_consistent(internal, internal, smallint) OWNER TO pastebin;

--
-- Name: ltree_decompress(internal); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION ltree_decompress(internal) RETURNS internal
    AS '$libdir/ltree', 'ltree_decompress'
    LANGUAGE c;


ALTER FUNCTION public.ltree_decompress(internal) OWNER TO pastebin;

--
-- Name: ltree_eq(ltree, ltree); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION ltree_eq(ltree, ltree) RETURNS boolean
    AS '$libdir/ltree', 'ltree_eq'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.ltree_eq(ltree, ltree) OWNER TO pastebin;

--
-- Name: ltree_ge(ltree, ltree); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION ltree_ge(ltree, ltree) RETURNS boolean
    AS '$libdir/ltree', 'ltree_ge'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.ltree_ge(ltree, ltree) OWNER TO pastebin;

--
-- Name: ltree_gt(ltree, ltree); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION ltree_gt(ltree, ltree) RETURNS boolean
    AS '$libdir/ltree', 'ltree_gt'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.ltree_gt(ltree, ltree) OWNER TO pastebin;

--
-- Name: ltree_isparent(ltree, ltree); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION ltree_isparent(ltree, ltree) RETURNS boolean
    AS '$libdir/ltree', 'ltree_isparent'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.ltree_isparent(ltree, ltree) OWNER TO pastebin;

--
-- Name: ltree_le(ltree, ltree); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION ltree_le(ltree, ltree) RETURNS boolean
    AS '$libdir/ltree', 'ltree_le'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.ltree_le(ltree, ltree) OWNER TO pastebin;

--
-- Name: ltree_lt(ltree, ltree); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION ltree_lt(ltree, ltree) RETURNS boolean
    AS '$libdir/ltree', 'ltree_lt'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.ltree_lt(ltree, ltree) OWNER TO pastebin;

--
-- Name: ltree_ne(ltree, ltree); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION ltree_ne(ltree, ltree) RETURNS boolean
    AS '$libdir/ltree', 'ltree_ne'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.ltree_ne(ltree, ltree) OWNER TO pastebin;

--
-- Name: ltree_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION ltree_penalty(internal, internal, internal) RETURNS internal
    AS '$libdir/ltree', 'ltree_penalty'
    LANGUAGE c STRICT;


ALTER FUNCTION public.ltree_penalty(internal, internal, internal) OWNER TO pastebin;

--
-- Name: ltree_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION ltree_picksplit(internal, internal) RETURNS internal
    AS '$libdir/ltree', 'ltree_picksplit'
    LANGUAGE c;


ALTER FUNCTION public.ltree_picksplit(internal, internal) OWNER TO pastebin;

--
-- Name: ltree_risparent(ltree, ltree); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION ltree_risparent(ltree, ltree) RETURNS boolean
    AS '$libdir/ltree', 'ltree_risparent'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.ltree_risparent(ltree, ltree) OWNER TO pastebin;

--
-- Name: ltree_same(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION ltree_same(internal, internal, internal) RETURNS internal
    AS '$libdir/ltree', 'ltree_same'
    LANGUAGE c;


ALTER FUNCTION public.ltree_same(internal, internal, internal) OWNER TO pastebin;

--
-- Name: ltree_textadd(text, ltree); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION ltree_textadd(text, ltree) RETURNS ltree
    AS '$libdir/ltree', 'ltree_textadd'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.ltree_textadd(text, ltree) OWNER TO pastebin;

--
-- Name: ltree_union(internal, internal); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION ltree_union(internal, internal) RETURNS integer
    AS '$libdir/ltree', 'ltree_union'
    LANGUAGE c;


ALTER FUNCTION public.ltree_union(internal, internal) OWNER TO pastebin;

--
-- Name: ltxtq_exec(ltree, ltxtquery); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION ltxtq_exec(ltree, ltxtquery) RETURNS boolean
    AS '$libdir/ltree', 'ltxtq_exec'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.ltxtq_exec(ltree, ltxtquery) OWNER TO pastebin;

--
-- Name: ltxtq_rexec(ltxtquery, ltree); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION ltxtq_rexec(ltxtquery, ltree) RETURNS boolean
    AS '$libdir/ltree', 'ltxtq_rexec'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.ltxtq_rexec(ltxtquery, ltree) OWNER TO pastebin;

--
-- Name: nlevel(ltree); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION nlevel(ltree) RETURNS integer
    AS '$libdir/ltree', 'nlevel'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.nlevel(ltree) OWNER TO pastebin;

--
-- Name: parse(oid, text); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION parse(oid, text) RETURNS SETOF tokenout
    AS '$libdir/tsearch2', 'parse'
    LANGUAGE c STRICT;


ALTER FUNCTION public.parse(oid, text) OWNER TO pastebin;

--
-- Name: parse(text, text); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION parse(text, text) RETURNS SETOF tokenout
    AS '$libdir/tsearch2', 'parse_byname'
    LANGUAGE c STRICT;


ALTER FUNCTION public.parse(text, text) OWNER TO pastebin;

--
-- Name: parse(text); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION parse(text) RETURNS SETOF tokenout
    AS '$libdir/tsearch2', 'parse_current'
    LANGUAGE c STRICT;


ALTER FUNCTION public.parse(text) OWNER TO pastebin;

--
-- Name: plperl_call_handler(); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION plperl_call_handler() RETURNS language_handler
    AS '$libdir/plperl', 'plperl_call_handler'
    LANGUAGE c;


ALTER FUNCTION public.plperl_call_handler() OWNER TO pastebin;

--
-- Name: plpgsql_call_handler(); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION plpgsql_call_handler() RETURNS language_handler
    AS '$libdir/plpgsql', 'plpgsql_call_handler'
    LANGUAGE c;


ALTER FUNCTION public.plpgsql_call_handler() OWNER TO pastebin;

--
-- Name: prsd_end(internal); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION prsd_end(internal) RETURNS void
    AS '$libdir/tsearch2', 'prsd_end'
    LANGUAGE c;


ALTER FUNCTION public.prsd_end(internal) OWNER TO pastebin;

--
-- Name: prsd_getlexeme(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION prsd_getlexeme(internal, internal, internal) RETURNS integer
    AS '$libdir/tsearch2', 'prsd_getlexeme'
    LANGUAGE c;


ALTER FUNCTION public.prsd_getlexeme(internal, internal, internal) OWNER TO pastebin;

--
-- Name: prsd_headline(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION prsd_headline(internal, internal, internal) RETURNS internal
    AS '$libdir/tsearch2', 'prsd_headline'
    LANGUAGE c;


ALTER FUNCTION public.prsd_headline(internal, internal, internal) OWNER TO pastebin;

--
-- Name: prsd_lextype(internal); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION prsd_lextype(internal) RETURNS internal
    AS '$libdir/tsearch2', 'prsd_lextype'
    LANGUAGE c;


ALTER FUNCTION public.prsd_lextype(internal) OWNER TO pastebin;

--
-- Name: prsd_start(internal, integer); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION prsd_start(internal, integer) RETURNS internal
    AS '$libdir/tsearch2', 'prsd_start'
    LANGUAGE c;


ALTER FUNCTION public.prsd_start(internal, integer) OWNER TO pastebin;

--
-- Name: querytree(tsquery); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION querytree(tsquery) RETURNS text
    AS '$libdir/tsearch2', 'tsquerytree'
    LANGUAGE c STRICT;


ALTER FUNCTION public.querytree(tsquery) OWNER TO pastebin;

--
-- Name: rank(real[], tsvector, tsquery); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION rank(real[], tsvector, tsquery) RETURNS real
    AS '$libdir/tsearch2', 'rank'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.rank(real[], tsvector, tsquery) OWNER TO pastebin;

--
-- Name: rank(real[], tsvector, tsquery, integer); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION rank(real[], tsvector, tsquery, integer) RETURNS real
    AS '$libdir/tsearch2', 'rank'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.rank(real[], tsvector, tsquery, integer) OWNER TO pastebin;

--
-- Name: rank(tsvector, tsquery); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION rank(tsvector, tsquery) RETURNS real
    AS '$libdir/tsearch2', 'rank_def'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.rank(tsvector, tsquery) OWNER TO pastebin;

--
-- Name: rank(tsvector, tsquery, integer); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION rank(tsvector, tsquery, integer) RETURNS real
    AS '$libdir/tsearch2', 'rank_def'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.rank(tsvector, tsquery, integer) OWNER TO pastebin;

--
-- Name: rank_cd(integer, tsvector, tsquery); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION rank_cd(integer, tsvector, tsquery) RETURNS real
    AS '$libdir/tsearch2', 'rank_cd'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.rank_cd(integer, tsvector, tsquery) OWNER TO pastebin;

--
-- Name: rank_cd(integer, tsvector, tsquery, integer); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION rank_cd(integer, tsvector, tsquery, integer) RETURNS real
    AS '$libdir/tsearch2', 'rank_cd'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.rank_cd(integer, tsvector, tsquery, integer) OWNER TO pastebin;

--
-- Name: rank_cd(tsvector, tsquery); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION rank_cd(tsvector, tsquery) RETURNS real
    AS '$libdir/tsearch2', 'rank_cd_def'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.rank_cd(tsvector, tsquery) OWNER TO pastebin;

--
-- Name: rank_cd(tsvector, tsquery, integer); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION rank_cd(tsvector, tsquery, integer) RETURNS real
    AS '$libdir/tsearch2', 'rank_cd_def'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.rank_cd(tsvector, tsquery, integer) OWNER TO pastebin;

--
-- Name: reset_tsearch(); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION reset_tsearch() RETURNS void
    AS '$libdir/tsearch2', 'reset_tsearch'
    LANGUAGE c STRICT;


ALTER FUNCTION public.reset_tsearch() OWNER TO pastebin;

--
-- Name: rexectsq(tsquery, tsvector); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION rexectsq(tsquery, tsvector) RETURNS boolean
    AS '$libdir/tsearch2', 'rexectsq'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.rexectsq(tsquery, tsvector) OWNER TO pastebin;

--
-- Name: FUNCTION rexectsq(tsquery, tsvector); Type: COMMENT; Schema: public; Owner: pastebin
--

COMMENT ON FUNCTION rexectsq(tsquery, tsvector) IS 'boolean operation with text index';


--
-- Name: set_curcfg(integer); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION set_curcfg(integer) RETURNS void
    AS '$libdir/tsearch2', 'set_curcfg'
    LANGUAGE c STRICT;


ALTER FUNCTION public.set_curcfg(integer) OWNER TO pastebin;

--
-- Name: set_curcfg(text); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION set_curcfg(text) RETURNS void
    AS '$libdir/tsearch2', 'set_curcfg_byname'
    LANGUAGE c STRICT;


ALTER FUNCTION public.set_curcfg(text) OWNER TO pastebin;

--
-- Name: set_curdict(integer); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION set_curdict(integer) RETURNS void
    AS '$libdir/tsearch2', 'set_curdict'
    LANGUAGE c STRICT;


ALTER FUNCTION public.set_curdict(integer) OWNER TO pastebin;

--
-- Name: set_curdict(text); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION set_curdict(text) RETURNS void
    AS '$libdir/tsearch2', 'set_curdict_byname'
    LANGUAGE c STRICT;


ALTER FUNCTION public.set_curdict(text) OWNER TO pastebin;

--
-- Name: set_curprs(integer); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION set_curprs(integer) RETURNS void
    AS '$libdir/tsearch2', 'set_curprs'
    LANGUAGE c STRICT;


ALTER FUNCTION public.set_curprs(integer) OWNER TO pastebin;

--
-- Name: set_curprs(text); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION set_curprs(text) RETURNS void
    AS '$libdir/tsearch2', 'set_curprs_byname'
    LANGUAGE c STRICT;


ALTER FUNCTION public.set_curprs(text) OWNER TO pastebin;

--
-- Name: setweight(tsvector, "char"); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION setweight(tsvector, "char") RETURNS tsvector
    AS '$libdir/tsearch2', 'setweight'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.setweight(tsvector, "char") OWNER TO pastebin;

--
-- Name: show_curcfg(); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION show_curcfg() RETURNS oid
    AS '$libdir/tsearch2', 'show_curcfg'
    LANGUAGE c STRICT;


ALTER FUNCTION public.show_curcfg() OWNER TO pastebin;

--
-- Name: snb_en_init(internal); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION snb_en_init(internal) RETURNS internal
    AS '$libdir/tsearch2', 'snb_en_init'
    LANGUAGE c;


ALTER FUNCTION public.snb_en_init(internal) OWNER TO pastebin;

--
-- Name: snb_lexize(internal, internal, integer); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION snb_lexize(internal, internal, integer) RETURNS internal
    AS '$libdir/tsearch2', 'snb_lexize'
    LANGUAGE c STRICT;


ALTER FUNCTION public.snb_lexize(internal, internal, integer) OWNER TO pastebin;

--
-- Name: snb_ru_init(internal); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION snb_ru_init(internal) RETURNS internal
    AS '$libdir/tsearch2', 'snb_ru_init'
    LANGUAGE c;


ALTER FUNCTION public.snb_ru_init(internal) OWNER TO pastebin;

--
-- Name: spell_init(internal); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION spell_init(internal) RETURNS internal
    AS '$libdir/tsearch2', 'spell_init'
    LANGUAGE c;


ALTER FUNCTION public.spell_init(internal) OWNER TO pastebin;

--
-- Name: spell_lexize(internal, internal, integer); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION spell_lexize(internal, internal, integer) RETURNS internal
    AS '$libdir/tsearch2', 'spell_lexize'
    LANGUAGE c STRICT;


ALTER FUNCTION public.spell_lexize(internal, internal, integer) OWNER TO pastebin;

--
-- Name: stat(text); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION stat(text) RETURNS SETOF statinfo
    AS '$libdir/tsearch2', 'ts_stat'
    LANGUAGE c STRICT;


ALTER FUNCTION public.stat(text) OWNER TO pastebin;

--
-- Name: stat(text, text); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION stat(text, text) RETURNS SETOF statinfo
    AS '$libdir/tsearch2', 'ts_stat'
    LANGUAGE c STRICT;


ALTER FUNCTION public.stat(text, text) OWNER TO pastebin;

--
-- Name: strip(tsvector); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION strip(tsvector) RETURNS tsvector
    AS '$libdir/tsearch2', 'strip'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.strip(tsvector) OWNER TO pastebin;

--
-- Name: subltree(ltree, integer, integer); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION subltree(ltree, integer, integer) RETURNS ltree
    AS '$libdir/ltree', 'subltree'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.subltree(ltree, integer, integer) OWNER TO pastebin;

--
-- Name: subpath(ltree, integer, integer); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION subpath(ltree, integer, integer) RETURNS ltree
    AS '$libdir/ltree', 'subpath'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.subpath(ltree, integer, integer) OWNER TO pastebin;

--
-- Name: subpath(ltree, integer); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION subpath(ltree, integer) RETURNS ltree
    AS '$libdir/ltree', 'subpath'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.subpath(ltree, integer) OWNER TO pastebin;

--
-- Name: syn_init(internal); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION syn_init(internal) RETURNS internal
    AS '$libdir/tsearch2', 'syn_init'
    LANGUAGE c;


ALTER FUNCTION public.syn_init(internal) OWNER TO pastebin;

--
-- Name: syn_lexize(internal, internal, integer); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION syn_lexize(internal, internal, integer) RETURNS internal
    AS '$libdir/tsearch2', 'syn_lexize'
    LANGUAGE c STRICT;


ALTER FUNCTION public.syn_lexize(internal, internal, integer) OWNER TO pastebin;

--
-- Name: text2ltree(text); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION text2ltree(text) RETURNS ltree
    AS '$libdir/ltree', 'text2ltree'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.text2ltree(text) OWNER TO pastebin;

--
-- Name: to_tsquery(oid, text); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION to_tsquery(oid, text) RETURNS tsquery
    AS '$libdir/tsearch2', 'to_tsquery'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.to_tsquery(oid, text) OWNER TO pastebin;

--
-- Name: to_tsquery(text, text); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION to_tsquery(text, text) RETURNS tsquery
    AS '$libdir/tsearch2', 'to_tsquery_name'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.to_tsquery(text, text) OWNER TO pastebin;

--
-- Name: to_tsquery(text); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION to_tsquery(text) RETURNS tsquery
    AS '$libdir/tsearch2', 'to_tsquery_current'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.to_tsquery(text) OWNER TO pastebin;

--
-- Name: to_tsvector(oid, text); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION to_tsvector(oid, text) RETURNS tsvector
    AS '$libdir/tsearch2', 'to_tsvector'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.to_tsvector(oid, text) OWNER TO pastebin;

--
-- Name: to_tsvector(text, text); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION to_tsvector(text, text) RETURNS tsvector
    AS '$libdir/tsearch2', 'to_tsvector_name'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.to_tsvector(text, text) OWNER TO pastebin;

--
-- Name: to_tsvector(text); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION to_tsvector(text) RETURNS tsvector
    AS '$libdir/tsearch2', 'to_tsvector_current'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.to_tsvector(text) OWNER TO pastebin;

--
-- Name: token_type(integer); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION token_type(integer) RETURNS SETOF tokentype
    AS '$libdir/tsearch2', 'token_type'
    LANGUAGE c STRICT;


ALTER FUNCTION public.token_type(integer) OWNER TO pastebin;

--
-- Name: token_type(text); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION token_type(text) RETURNS SETOF tokentype
    AS '$libdir/tsearch2', 'token_type_byname'
    LANGUAGE c STRICT;


ALTER FUNCTION public.token_type(text) OWNER TO pastebin;

--
-- Name: token_type(); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION token_type() RETURNS SETOF tokentype
    AS '$libdir/tsearch2', 'token_type_current'
    LANGUAGE c STRICT;


ALTER FUNCTION public.token_type() OWNER TO pastebin;

--
-- Name: ts_debug(text); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION ts_debug(text) RETURNS SETOF tsdebug
    AS $_$
select 
        m.ts_name,
        t.alias as tok_type,
        t.descr as description,
        p.token,
        m.dict_name,
        strip(to_tsvector(p.token)) as tsvector
from
        parse( _get_parser_from_curcfg(), $1 ) as p,
        token_type() as t,
        pg_ts_cfgmap as m,
        pg_ts_cfg as c
where
        t.tokid=p.tokid and
        t.alias = m.tok_alias and 
        m.ts_name=c.ts_name and 
        c.oid=show_curcfg() 
$_$
    LANGUAGE sql STRICT;


ALTER FUNCTION public.ts_debug(text) OWNER TO pastebin;

--
-- Name: tsearch2(); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION tsearch2() RETURNS "trigger"
    AS '$libdir/tsearch2', 'tsearch2'
    LANGUAGE c;


ALTER FUNCTION public.tsearch2() OWNER TO pastebin;

--
-- Name: tsvector_cmp(tsvector, tsvector); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION tsvector_cmp(tsvector, tsvector) RETURNS integer
    AS '$libdir/tsearch2', 'tsvector_cmp'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.tsvector_cmp(tsvector, tsvector) OWNER TO pastebin;

--
-- Name: tsvector_eq(tsvector, tsvector); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION tsvector_eq(tsvector, tsvector) RETURNS boolean
    AS '$libdir/tsearch2', 'tsvector_eq'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.tsvector_eq(tsvector, tsvector) OWNER TO pastebin;

--
-- Name: tsvector_ge(tsvector, tsvector); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION tsvector_ge(tsvector, tsvector) RETURNS boolean
    AS '$libdir/tsearch2', 'tsvector_ge'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.tsvector_ge(tsvector, tsvector) OWNER TO pastebin;

--
-- Name: tsvector_gt(tsvector, tsvector); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION tsvector_gt(tsvector, tsvector) RETURNS boolean
    AS '$libdir/tsearch2', 'tsvector_gt'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.tsvector_gt(tsvector, tsvector) OWNER TO pastebin;

--
-- Name: tsvector_le(tsvector, tsvector); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION tsvector_le(tsvector, tsvector) RETURNS boolean
    AS '$libdir/tsearch2', 'tsvector_le'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.tsvector_le(tsvector, tsvector) OWNER TO pastebin;

--
-- Name: tsvector_lt(tsvector, tsvector); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION tsvector_lt(tsvector, tsvector) RETURNS boolean
    AS '$libdir/tsearch2', 'tsvector_lt'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.tsvector_lt(tsvector, tsvector) OWNER TO pastebin;

--
-- Name: tsvector_ne(tsvector, tsvector); Type: FUNCTION; Schema: public; Owner: pastebin
--

CREATE FUNCTION tsvector_ne(tsvector, tsvector) RETURNS boolean
    AS '$libdir/tsearch2', 'tsvector_ne'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.tsvector_ne(tsvector, tsvector) OWNER TO pastebin;

--
-- Name: <; Type: OPERATOR; Schema: public; Owner: pastebin
--

CREATE OPERATOR < (
    PROCEDURE = tsvector_lt,
    LEFTARG = tsvector,
    RIGHTARG = tsvector,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.< (tsvector, tsvector) OWNER TO pastebin;

--
-- Name: <; Type: OPERATOR; Schema: public; Owner: pastebin
--

CREATE OPERATOR < (
    PROCEDURE = ltree_lt,
    LEFTARG = ltree,
    RIGHTARG = ltree,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.< (ltree, ltree) OWNER TO pastebin;

--
-- Name: <=; Type: OPERATOR; Schema: public; Owner: pastebin
--

CREATE OPERATOR <= (
    PROCEDURE = tsvector_le,
    LEFTARG = tsvector,
    RIGHTARG = tsvector,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.<= (tsvector, tsvector) OWNER TO pastebin;

--
-- Name: <=; Type: OPERATOR; Schema: public; Owner: pastebin
--

CREATE OPERATOR <= (
    PROCEDURE = ltree_le,
    LEFTARG = ltree,
    RIGHTARG = ltree,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.<= (ltree, ltree) OWNER TO pastebin;

--
-- Name: <>; Type: OPERATOR; Schema: public; Owner: pastebin
--

CREATE OPERATOR <> (
    PROCEDURE = tsvector_ne,
    LEFTARG = tsvector,
    RIGHTARG = tsvector,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);


ALTER OPERATOR public.<> (tsvector, tsvector) OWNER TO pastebin;

--
-- Name: <>; Type: OPERATOR; Schema: public; Owner: pastebin
--

CREATE OPERATOR <> (
    PROCEDURE = ltree_ne,
    LEFTARG = ltree,
    RIGHTARG = ltree,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);


ALTER OPERATOR public.<> (ltree, ltree) OWNER TO pastebin;

--
-- Name: <@; Type: OPERATOR; Schema: public; Owner: pastebin
--

CREATE OPERATOR <@ (
    PROCEDURE = ltree_risparent,
    LEFTARG = ltree,
    RIGHTARG = ltree,
    COMMUTATOR = @>,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.<@ (ltree, ltree) OWNER TO pastebin;

--
-- Name: <@; Type: OPERATOR; Schema: public; Owner: pastebin
--

CREATE OPERATOR <@ (
    PROCEDURE = _ltree_r_isparent,
    LEFTARG = ltree,
    RIGHTARG = ltree[],
    COMMUTATOR = @>,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.<@ (ltree, ltree[]) OWNER TO pastebin;

--
-- Name: <@; Type: OPERATOR; Schema: public; Owner: pastebin
--

CREATE OPERATOR <@ (
    PROCEDURE = _ltree_risparent,
    LEFTARG = ltree[],
    RIGHTARG = ltree,
    COMMUTATOR = @>,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.<@ (ltree[], ltree) OWNER TO pastebin;

--
-- Name: =; Type: OPERATOR; Schema: public; Owner: pastebin
--

CREATE OPERATOR = (
    PROCEDURE = tsvector_eq,
    LEFTARG = tsvector,
    RIGHTARG = tsvector,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel,
    SORT1 = <,
    SORT2 = <,
    LTCMP = <,
    GTCMP = >
);


ALTER OPERATOR public.= (tsvector, tsvector) OWNER TO pastebin;

--
-- Name: =; Type: OPERATOR; Schema: public; Owner: pastebin
--

CREATE OPERATOR = (
    PROCEDURE = ltree_eq,
    LEFTARG = ltree,
    RIGHTARG = ltree,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel,
    SORT1 = <,
    SORT2 = <,
    LTCMP = <,
    GTCMP = >
);


ALTER OPERATOR public.= (ltree, ltree) OWNER TO pastebin;

--
-- Name: >; Type: OPERATOR; Schema: public; Owner: pastebin
--

CREATE OPERATOR > (
    PROCEDURE = tsvector_gt,
    LEFTARG = tsvector,
    RIGHTARG = tsvector,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.> (tsvector, tsvector) OWNER TO pastebin;

--
-- Name: >; Type: OPERATOR; Schema: public; Owner: pastebin
--

CREATE OPERATOR > (
    PROCEDURE = ltree_gt,
    LEFTARG = ltree,
    RIGHTARG = ltree,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.> (ltree, ltree) OWNER TO pastebin;

--
-- Name: >=; Type: OPERATOR; Schema: public; Owner: pastebin
--

CREATE OPERATOR >= (
    PROCEDURE = tsvector_ge,
    LEFTARG = tsvector,
    RIGHTARG = tsvector,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.>= (tsvector, tsvector) OWNER TO pastebin;

--
-- Name: >=; Type: OPERATOR; Schema: public; Owner: pastebin
--

CREATE OPERATOR >= (
    PROCEDURE = ltree_ge,
    LEFTARG = ltree,
    RIGHTARG = ltree,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.>= (ltree, ltree) OWNER TO pastebin;

--
-- Name: ?; Type: OPERATOR; Schema: public; Owner: pastebin
--

CREATE OPERATOR ? (
    PROCEDURE = lt_q_regex,
    LEFTARG = ltree,
    RIGHTARG = lquery[],
    COMMUTATOR = ?,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.? (ltree, lquery[]) OWNER TO pastebin;

--
-- Name: ?; Type: OPERATOR; Schema: public; Owner: pastebin
--

CREATE OPERATOR ? (
    PROCEDURE = lt_q_rregex,
    LEFTARG = lquery[],
    RIGHTARG = ltree,
    COMMUTATOR = ?,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.? (lquery[], ltree) OWNER TO pastebin;

--
-- Name: ?; Type: OPERATOR; Schema: public; Owner: pastebin
--

CREATE OPERATOR ? (
    PROCEDURE = _lt_q_regex,
    LEFTARG = ltree[],
    RIGHTARG = lquery[],
    COMMUTATOR = ?,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.? (ltree[], lquery[]) OWNER TO pastebin;

--
-- Name: ?; Type: OPERATOR; Schema: public; Owner: pastebin
--

CREATE OPERATOR ? (
    PROCEDURE = _lt_q_rregex,
    LEFTARG = lquery[],
    RIGHTARG = ltree[],
    COMMUTATOR = ?,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.? (lquery[], ltree[]) OWNER TO pastebin;

--
-- Name: ?<@; Type: OPERATOR; Schema: public; Owner: pastebin
--

CREATE OPERATOR ?<@ (
    PROCEDURE = _ltree_extract_risparent,
    LEFTARG = ltree[],
    RIGHTARG = ltree
);


ALTER OPERATOR public.?<@ (ltree[], ltree) OWNER TO pastebin;

--
-- Name: ?@; Type: OPERATOR; Schema: public; Owner: pastebin
--

CREATE OPERATOR ?@ (
    PROCEDURE = _ltxtq_extract_exec,
    LEFTARG = ltree[],
    RIGHTARG = ltxtquery
);


ALTER OPERATOR public.?@ (ltree[], ltxtquery) OWNER TO pastebin;

--
-- Name: ?@>; Type: OPERATOR; Schema: public; Owner: pastebin
--

CREATE OPERATOR ?@> (
    PROCEDURE = _ltree_extract_isparent,
    LEFTARG = ltree[],
    RIGHTARG = ltree
);


ALTER OPERATOR public.?@> (ltree[], ltree) OWNER TO pastebin;

--
-- Name: ?~; Type: OPERATOR; Schema: public; Owner: pastebin
--

CREATE OPERATOR ?~ (
    PROCEDURE = _ltq_extract_regex,
    LEFTARG = ltree[],
    RIGHTARG = lquery
);


ALTER OPERATOR public.?~ (ltree[], lquery) OWNER TO pastebin;

--
-- Name: @; Type: OPERATOR; Schema: public; Owner: pastebin
--

CREATE OPERATOR @ (
    PROCEDURE = ltxtq_exec,
    LEFTARG = ltree,
    RIGHTARG = ltxtquery,
    COMMUTATOR = @,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.@ (ltree, ltxtquery) OWNER TO pastebin;

--
-- Name: @; Type: OPERATOR; Schema: public; Owner: pastebin
--

CREATE OPERATOR @ (
    PROCEDURE = ltxtq_rexec,
    LEFTARG = ltxtquery,
    RIGHTARG = ltree,
    COMMUTATOR = @,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.@ (ltxtquery, ltree) OWNER TO pastebin;

--
-- Name: @; Type: OPERATOR; Schema: public; Owner: pastebin
--

CREATE OPERATOR @ (
    PROCEDURE = _ltxtq_exec,
    LEFTARG = ltree[],
    RIGHTARG = ltxtquery,
    COMMUTATOR = @,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.@ (ltree[], ltxtquery) OWNER TO pastebin;

--
-- Name: @; Type: OPERATOR; Schema: public; Owner: pastebin
--

CREATE OPERATOR @ (
    PROCEDURE = _ltxtq_rexec,
    LEFTARG = ltxtquery,
    RIGHTARG = ltree[],
    COMMUTATOR = @,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.@ (ltxtquery, ltree[]) OWNER TO pastebin;

--
-- Name: @>; Type: OPERATOR; Schema: public; Owner: pastebin
--

CREATE OPERATOR @> (
    PROCEDURE = ltree_isparent,
    LEFTARG = ltree,
    RIGHTARG = ltree,
    COMMUTATOR = <@,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.@> (ltree, ltree) OWNER TO pastebin;

--
-- Name: @>; Type: OPERATOR; Schema: public; Owner: pastebin
--

CREATE OPERATOR @> (
    PROCEDURE = _ltree_isparent,
    LEFTARG = ltree[],
    RIGHTARG = ltree,
    COMMUTATOR = <@,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.@> (ltree[], ltree) OWNER TO pastebin;

--
-- Name: @>; Type: OPERATOR; Schema: public; Owner: pastebin
--

CREATE OPERATOR @> (
    PROCEDURE = _ltree_r_risparent,
    LEFTARG = ltree,
    RIGHTARG = ltree[],
    COMMUTATOR = <@,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.@> (ltree, ltree[]) OWNER TO pastebin;

--
-- Name: @@; Type: OPERATOR; Schema: public; Owner: pastebin
--

CREATE OPERATOR @@ (
    PROCEDURE = rexectsq,
    LEFTARG = tsquery,
    RIGHTARG = tsvector,
    COMMUTATOR = @@,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.@@ (tsquery, tsvector) OWNER TO pastebin;

--
-- Name: @@; Type: OPERATOR; Schema: public; Owner: pastebin
--

CREATE OPERATOR @@ (
    PROCEDURE = exectsq,
    LEFTARG = tsvector,
    RIGHTARG = tsquery,
    COMMUTATOR = @@,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.@@ (tsvector, tsquery) OWNER TO pastebin;

--
-- Name: ^<@; Type: OPERATOR; Schema: public; Owner: pastebin
--

CREATE OPERATOR ^<@ (
    PROCEDURE = ltree_risparent,
    LEFTARG = ltree,
    RIGHTARG = ltree,
    COMMUTATOR = ^@>,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.^<@ (ltree, ltree) OWNER TO pastebin;

--
-- Name: ^<@; Type: OPERATOR; Schema: public; Owner: pastebin
--

CREATE OPERATOR ^<@ (
    PROCEDURE = _ltree_r_isparent,
    LEFTARG = ltree,
    RIGHTARG = ltree[],
    COMMUTATOR = ^@>,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.^<@ (ltree, ltree[]) OWNER TO pastebin;

--
-- Name: ^<@; Type: OPERATOR; Schema: public; Owner: pastebin
--

CREATE OPERATOR ^<@ (
    PROCEDURE = _ltree_risparent,
    LEFTARG = ltree[],
    RIGHTARG = ltree,
    COMMUTATOR = ^@>,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.^<@ (ltree[], ltree) OWNER TO pastebin;

--
-- Name: ^?; Type: OPERATOR; Schema: public; Owner: pastebin
--

CREATE OPERATOR ^? (
    PROCEDURE = lt_q_regex,
    LEFTARG = ltree,
    RIGHTARG = lquery[],
    COMMUTATOR = ^?,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.^? (ltree, lquery[]) OWNER TO pastebin;

--
-- Name: ^?; Type: OPERATOR; Schema: public; Owner: pastebin
--

CREATE OPERATOR ^? (
    PROCEDURE = lt_q_rregex,
    LEFTARG = lquery[],
    RIGHTARG = ltree,
    COMMUTATOR = ^?,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.^? (lquery[], ltree) OWNER TO pastebin;

--
-- Name: ^?; Type: OPERATOR; Schema: public; Owner: pastebin
--

CREATE OPERATOR ^? (
    PROCEDURE = _lt_q_regex,
    LEFTARG = ltree[],
    RIGHTARG = lquery[],
    COMMUTATOR = ^?,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.^? (ltree[], lquery[]) OWNER TO pastebin;

--
-- Name: ^?; Type: OPERATOR; Schema: public; Owner: pastebin
--

CREATE OPERATOR ^? (
    PROCEDURE = _lt_q_rregex,
    LEFTARG = lquery[],
    RIGHTARG = ltree[],
    COMMUTATOR = ^?,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.^? (lquery[], ltree[]) OWNER TO pastebin;

--
-- Name: ^@; Type: OPERATOR; Schema: public; Owner: pastebin
--

CREATE OPERATOR ^@ (
    PROCEDURE = ltxtq_exec,
    LEFTARG = ltree,
    RIGHTARG = ltxtquery,
    COMMUTATOR = ^@,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.^@ (ltree, ltxtquery) OWNER TO pastebin;

--
-- Name: ^@; Type: OPERATOR; Schema: public; Owner: pastebin
--

CREATE OPERATOR ^@ (
    PROCEDURE = ltxtq_rexec,
    LEFTARG = ltxtquery,
    RIGHTARG = ltree,
    COMMUTATOR = ^@,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.^@ (ltxtquery, ltree) OWNER TO pastebin;

--
-- Name: ^@; Type: OPERATOR; Schema: public; Owner: pastebin
--

CREATE OPERATOR ^@ (
    PROCEDURE = _ltxtq_exec,
    LEFTARG = ltree[],
    RIGHTARG = ltxtquery,
    COMMUTATOR = ^@,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.^@ (ltree[], ltxtquery) OWNER TO pastebin;

--
-- Name: ^@; Type: OPERATOR; Schema: public; Owner: pastebin
--

CREATE OPERATOR ^@ (
    PROCEDURE = _ltxtq_rexec,
    LEFTARG = ltxtquery,
    RIGHTARG = ltree[],
    COMMUTATOR = ^@,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.^@ (ltxtquery, ltree[]) OWNER TO pastebin;

--
-- Name: ^@>; Type: OPERATOR; Schema: public; Owner: pastebin
--

CREATE OPERATOR ^@> (
    PROCEDURE = ltree_isparent,
    LEFTARG = ltree,
    RIGHTARG = ltree,
    COMMUTATOR = ^<@,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.^@> (ltree, ltree) OWNER TO pastebin;

--
-- Name: ^@>; Type: OPERATOR; Schema: public; Owner: pastebin
--

CREATE OPERATOR ^@> (
    PROCEDURE = _ltree_isparent,
    LEFTARG = ltree[],
    RIGHTARG = ltree,
    COMMUTATOR = ^<@,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.^@> (ltree[], ltree) OWNER TO pastebin;

--
-- Name: ^@>; Type: OPERATOR; Schema: public; Owner: pastebin
--

CREATE OPERATOR ^@> (
    PROCEDURE = _ltree_r_risparent,
    LEFTARG = ltree,
    RIGHTARG = ltree[],
    COMMUTATOR = ^<@,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.^@> (ltree, ltree[]) OWNER TO pastebin;

--
-- Name: ^~; Type: OPERATOR; Schema: public; Owner: pastebin
--

CREATE OPERATOR ^~ (
    PROCEDURE = ltq_regex,
    LEFTARG = ltree,
    RIGHTARG = lquery,
    COMMUTATOR = ^~,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.^~ (ltree, lquery) OWNER TO pastebin;

--
-- Name: ^~; Type: OPERATOR; Schema: public; Owner: pastebin
--

CREATE OPERATOR ^~ (
    PROCEDURE = ltq_rregex,
    LEFTARG = lquery,
    RIGHTARG = ltree,
    COMMUTATOR = ^~,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.^~ (lquery, ltree) OWNER TO pastebin;

--
-- Name: ^~; Type: OPERATOR; Schema: public; Owner: pastebin
--

CREATE OPERATOR ^~ (
    PROCEDURE = _ltq_regex,
    LEFTARG = ltree[],
    RIGHTARG = lquery,
    COMMUTATOR = ^~,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.^~ (ltree[], lquery) OWNER TO pastebin;

--
-- Name: ^~; Type: OPERATOR; Schema: public; Owner: pastebin
--

CREATE OPERATOR ^~ (
    PROCEDURE = _ltq_rregex,
    LEFTARG = lquery,
    RIGHTARG = ltree[],
    COMMUTATOR = ^~,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.^~ (lquery, ltree[]) OWNER TO pastebin;

--
-- Name: ||; Type: OPERATOR; Schema: public; Owner: pastebin
--

CREATE OPERATOR || (
    PROCEDURE = concat,
    LEFTARG = tsvector,
    RIGHTARG = tsvector
);


ALTER OPERATOR public.|| (tsvector, tsvector) OWNER TO pastebin;

--
-- Name: ||; Type: OPERATOR; Schema: public; Owner: pastebin
--

CREATE OPERATOR || (
    PROCEDURE = ltree_addltree,
    LEFTARG = ltree,
    RIGHTARG = ltree
);


ALTER OPERATOR public.|| (ltree, ltree) OWNER TO pastebin;

--
-- Name: ||; Type: OPERATOR; Schema: public; Owner: pastebin
--

CREATE OPERATOR || (
    PROCEDURE = ltree_addtext,
    LEFTARG = ltree,
    RIGHTARG = text
);


ALTER OPERATOR public.|| (ltree, text) OWNER TO pastebin;

--
-- Name: ||; Type: OPERATOR; Schema: public; Owner: pastebin
--

CREATE OPERATOR || (
    PROCEDURE = ltree_textadd,
    LEFTARG = text,
    RIGHTARG = ltree
);


ALTER OPERATOR public.|| (text, ltree) OWNER TO pastebin;

--
-- Name: ~; Type: OPERATOR; Schema: public; Owner: pastebin
--

CREATE OPERATOR ~ (
    PROCEDURE = ltq_regex,
    LEFTARG = ltree,
    RIGHTARG = lquery,
    COMMUTATOR = ~,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.~ (ltree, lquery) OWNER TO pastebin;

--
-- Name: ~; Type: OPERATOR; Schema: public; Owner: pastebin
--

CREATE OPERATOR ~ (
    PROCEDURE = ltq_rregex,
    LEFTARG = lquery,
    RIGHTARG = ltree,
    COMMUTATOR = ~,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.~ (lquery, ltree) OWNER TO pastebin;

--
-- Name: ~; Type: OPERATOR; Schema: public; Owner: pastebin
--

CREATE OPERATOR ~ (
    PROCEDURE = _ltq_regex,
    LEFTARG = ltree[],
    RIGHTARG = lquery,
    COMMUTATOR = ~,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.~ (ltree[], lquery) OWNER TO pastebin;

--
-- Name: ~; Type: OPERATOR; Schema: public; Owner: pastebin
--

CREATE OPERATOR ~ (
    PROCEDURE = _ltq_rregex,
    LEFTARG = lquery,
    RIGHTARG = ltree[],
    COMMUTATOR = ~,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.~ (lquery, ltree[]) OWNER TO pastebin;

--
-- Name: gist__ltree_ops; Type: OPERATOR CLASS; Schema: public; Owner: pastebin
--

CREATE OPERATOR CLASS gist__ltree_ops
    DEFAULT FOR TYPE ltree[] USING gist AS
    STORAGE ltree_gist ,
    OPERATOR 10 <@(ltree[],ltree) RECHECK ,
    OPERATOR 11 @>(ltree,ltree[]) RECHECK ,
    OPERATOR 12 ~(ltree[],lquery) RECHECK ,
    OPERATOR 13 ~(lquery,ltree[]) RECHECK ,
    OPERATOR 14 @(ltree[],ltxtquery) RECHECK ,
    OPERATOR 15 @(ltxtquery,ltree[]) RECHECK ,
    OPERATOR 16 ?(ltree[],lquery[]) RECHECK ,
    OPERATOR 17 ?(lquery[],ltree[]) RECHECK ,
    FUNCTION 1 _ltree_consistent(internal,internal,smallint) ,
    FUNCTION 2 _ltree_union(internal,internal) ,
    FUNCTION 3 _ltree_compress(internal) ,
    FUNCTION 4 ltree_decompress(internal) ,
    FUNCTION 5 _ltree_penalty(internal,internal,internal) ,
    FUNCTION 6 _ltree_picksplit(internal,internal) ,
    FUNCTION 7 _ltree_same(internal,internal,internal);


ALTER OPERATOR CLASS public.gist__ltree_ops USING gist OWNER TO pastebin;

--
-- Name: gist_ltree_ops; Type: OPERATOR CLASS; Schema: public; Owner: pastebin
--

CREATE OPERATOR CLASS gist_ltree_ops
    DEFAULT FOR TYPE ltree USING gist AS
    STORAGE ltree_gist ,
    OPERATOR 1 <(ltree,ltree) ,
    OPERATOR 2 <=(ltree,ltree) ,
    OPERATOR 3 =(ltree,ltree) ,
    OPERATOR 4 >=(ltree,ltree) ,
    OPERATOR 5 >(ltree,ltree) ,
    OPERATOR 10 @>(ltree,ltree) ,
    OPERATOR 11 <@(ltree,ltree) ,
    OPERATOR 12 ~(ltree,lquery) ,
    OPERATOR 13 ~(lquery,ltree) ,
    OPERATOR 14 @(ltree,ltxtquery) ,
    OPERATOR 15 @(ltxtquery,ltree) ,
    OPERATOR 16 ?(ltree,lquery[]) ,
    OPERATOR 17 ?(lquery[],ltree) ,
    FUNCTION 1 ltree_consistent(internal,internal,smallint) ,
    FUNCTION 2 ltree_union(internal,internal) ,
    FUNCTION 3 ltree_compress(internal) ,
    FUNCTION 4 ltree_decompress(internal) ,
    FUNCTION 5 ltree_penalty(internal,internal,internal) ,
    FUNCTION 6 ltree_picksplit(internal,internal) ,
    FUNCTION 7 ltree_same(internal,internal,internal);


ALTER OPERATOR CLASS public.gist_ltree_ops USING gist OWNER TO pastebin;

--
-- Name: gist_tsvector_ops; Type: OPERATOR CLASS; Schema: public; Owner: pastebin
--

CREATE OPERATOR CLASS gist_tsvector_ops
    DEFAULT FOR TYPE tsvector USING gist AS
    STORAGE gtsvector ,
    OPERATOR 1 @@(tsvector,tsquery) RECHECK ,
    FUNCTION 1 gtsvector_consistent(gtsvector,internal,integer) ,
    FUNCTION 2 gtsvector_union(internal,internal) ,
    FUNCTION 3 gtsvector_compress(internal) ,
    FUNCTION 4 gtsvector_decompress(internal) ,
    FUNCTION 5 gtsvector_penalty(internal,internal,internal) ,
    FUNCTION 6 gtsvector_picksplit(internal,internal) ,
    FUNCTION 7 gtsvector_same(gtsvector,gtsvector,internal);


ALTER OPERATOR CLASS public.gist_tsvector_ops USING gist OWNER TO pastebin;

--
-- Name: ltree_ops; Type: OPERATOR CLASS; Schema: public; Owner: pastebin
--

CREATE OPERATOR CLASS ltree_ops
    DEFAULT FOR TYPE ltree USING btree AS
    OPERATOR 1 <(ltree,ltree) ,
    OPERATOR 2 <=(ltree,ltree) ,
    OPERATOR 3 =(ltree,ltree) ,
    OPERATOR 4 >=(ltree,ltree) ,
    OPERATOR 5 >(ltree,ltree) ,
    FUNCTION 1 ltree_cmp(ltree,ltree);


ALTER OPERATOR CLASS public.ltree_ops USING btree OWNER TO pastebin;

--
-- Name: tsvector_ops; Type: OPERATOR CLASS; Schema: public; Owner: pastebin
--

CREATE OPERATOR CLASS tsvector_ops
    DEFAULT FOR TYPE tsvector USING btree AS
    OPERATOR 1 <(tsvector,tsvector) ,
    OPERATOR 2 <=(tsvector,tsvector) ,
    OPERATOR 3 =(tsvector,tsvector) ,
    OPERATOR 4 >=(tsvector,tsvector) ,
    OPERATOR 5 >(tsvector,tsvector) ,
    FUNCTION 1 tsvector_cmp(tsvector,tsvector);


ALTER OPERATOR CLASS public.tsvector_ops USING btree OWNER TO pastebin;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: account_apikeys; Type: TABLE; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE TABLE account_apikeys (
    acct_id integer NOT NULL,
    apikey character(32) NOT NULL,
    active boolean DEFAULT true
);


ALTER TABLE public.account_apikeys OWNER TO pastebin;

--
-- Name: account_guids; Type: TABLE; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE TABLE account_guids (
    acct_id integer NOT NULL,
    guid character(32) NOT NULL
);


ALTER TABLE public.account_guids OWNER TO pastebin;

--
-- Name: account_identifiers; Type: TABLE; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE TABLE account_identifiers (
    account_id integer NOT NULL,
    username text NOT NULL,
    pretty_name text
);


ALTER TABLE public.account_identifiers OWNER TO pastebin;

--
-- Name: account_settings; Type: TABLE; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE TABLE account_settings (
    acct_id integer,
    name character varying(64) NOT NULL,
    value text NOT NULL
);


ALTER TABLE public.account_settings OWNER TO pastebin;

--
-- Name: accounts; Type: TABLE; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE TABLE accounts (
    id serial NOT NULL,
    nickname text,
    email text,
    fullname text,
    country character(2),
    "language" character(2) DEFAULT 'en'::bpchar,
    timezone text DEFAULT 'America/Edmonton'::text,
    active boolean DEFAULT true NOT NULL,
    created timestamp with time zone,
    last_login timestamp with time zone,
    "admin" boolean
);


ALTER TABLE public.accounts OWNER TO pastebin;

SET default_with_oids = true;

--
-- Name: adv_auction_bidders; Type: TABLE; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE TABLE adv_auction_bidders (
    id serial NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    company text NOT NULL,
    "password" text NOT NULL,
    display_name text
);


ALTER TABLE public.adv_auction_bidders OWNER TO pastebin;

--
-- Name: adv_auction_bids; Type: TABLE; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE TABLE adv_auction_bids (
    auction integer NOT NULL,
    bidder integer NOT NULL,
    bid money NOT NULL,
    notes text,
    ts timestamp without time zone NOT NULL,
    CONSTRAINT adv_auction_bids_bid CHECK ((bid > '$1.00'::money))
);


ALTER TABLE public.adv_auction_bids OWNER TO pastebin;

--
-- Name: adv_auction_classes; Type: TABLE; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE TABLE adv_auction_classes (
    id serial NOT NULL,
    name text NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.adv_auction_classes OWNER TO pastebin;

--
-- Name: adv_auctions; Type: TABLE; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE TABLE adv_auctions (
    id serial NOT NULL,
    "class" integer NOT NULL,
    starts timestamp without time zone DEFAULT '-infinity'::timestamp without time zone NOT NULL,
    ends timestamp without time zone DEFAULT 'infinity'::timestamp without time zone NOT NULL,
    closed boolean DEFAULT false NOT NULL,
    opening_bid money DEFAULT '$1.00'::money NOT NULL,
    description text NOT NULL,
    period_start timestamp without time zone NOT NULL,
    period_length interval,
    period_end timestamp without time zone,
    title text NOT NULL
);


ALTER TABLE public.adv_auctions OWNER TO pastebin;

--
-- Name: advertisements; Type: TABLE; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE TABLE advertisements (
    id serial NOT NULL,
    weight double precision NOT NULL,
    image text NOT NULL,
    url text NOT NULL,
    description text NOT NULL,
    begins timestamp without time zone DEFAULT now() NOT NULL,
    expires timestamp without time zone DEFAULT 'infinity'::timestamp without time zone NOT NULL,
    prepaid_displays integer DEFAULT 0,
    total_displays integer DEFAULT 0 NOT NULL,
    total_clicks integer DEFAULT 0 NOT NULL,
    last_stats_update timestamp without time zone
);


ALTER TABLE public.advertisements OWNER TO pastebin;

--
-- Name: advertisement_selection; Type: VIEW; Schema: public; Owner: pastebin
--

CREATE VIEW advertisement_selection AS
    SELECT ad_ranks.id, ad_ranks.image, ad_ranks.url, ad_ranks.description FROM (SELECT (random() * advertisements.weight), advertisements.id, advertisements.image, advertisements.url, advertisements.description FROM advertisements WHERE (((now() >= (advertisements.begins)::timestamp with time zone) AND (now() <= (advertisements.expires)::timestamp with time zone)) AND (((advertisements.prepaid_displays < advertisements.total_displays) OR (advertisements.prepaid_displays = 0)) OR (advertisements.prepaid_displays IS NULL))) ORDER BY (random() * advertisements.weight) DESC) ad_ranks LIMIT 1;


ALTER TABLE public.advertisement_selection OWNER TO pastebin;

--
-- Name: advertisement_tracking; Type: TABLE; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE TABLE advertisement_tracking (
    id integer NOT NULL,
    ts timestamp without time zone DEFAULT now() NOT NULL,
    "action" character(1) NOT NULL,
    ip inet,
    user_agent text
);


ALTER TABLE public.advertisement_tracking OWNER TO pastebin;

SET default_with_oids = false;

--
-- Name: api_key; Type: TABLE; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE TABLE api_key (
    api_key character(32) NOT NULL,
    created timestamp with time zone DEFAULT '2006-09-02 01:58:52.578247-06'::timestamp with time zone NOT NULL,
    first_heard_paste timestamp with time zone,
    last_heard_paste timestamp with time zone,
    total_pastes integer DEFAULT 0 NOT NULL,
    revoked boolean DEFAULT false NOT NULL
);


ALTER TABLE public.api_key OWNER TO pastebin;

--
-- Name: banned_md5; Type: TABLE; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE TABLE banned_md5 (
    md5 character(32)
);


ALTER TABLE public.banned_md5 OWNER TO pastebin;

SET default_with_oids = true;

--
-- Name: bin; Type: TABLE; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE TABLE bin (
    id serial NOT NULL,
    poster text DEFAULT 'Anonymous'::text NOT NULL,
    remote text NOT NULL,
    content text,
    posted timestamp with time zone DEFAULT now(),
    "type" integer DEFAULT 1 NOT NULL,
    user_id integer,
    formatted_content text,
    highlighter_timestamp integer,
    expiry interval,
    expires timestamp with time zone,
    description text,
    poster_id integer,
    md5 character(32),
    cipher character varying(32),
    id_mask character varying(8),
    lang character(2),
    acct_id integer,
    active boolean DEFAULT true
);


ALTER TABLE public.bin OWNER TO pastebin;

SET default_with_oids = false;

--
-- Name: bin_content; Type: TABLE; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE TABLE bin_content (
    id integer NOT NULL,
    content text NOT NULL,
    description text
);


ALTER TABLE public.bin_content OWNER TO pastebin;

SET default_with_oids = true;

--
-- Name: bin_hits; Type: TABLE; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE TABLE bin_hits (
    bin_id integer NOT NULL,
    hits integer DEFAULT 0 NOT NULL,
    last_hit timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.bin_hits OWNER TO pastebin;

SET default_with_oids = false;

--
-- Name: bin_ltree; Type: TABLE; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE TABLE bin_ltree (
    bin_id integer NOT NULL,
    path ltree NOT NULL
);


ALTER TABLE public.bin_ltree OWNER TO pastebin;

--
-- Name: bin_metadata; Type: TABLE; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE TABLE bin_metadata (
    id integer DEFAULT 1 NOT NULL,
    user_id integer,
    poster_id integer,
    posted timestamp with time zone DEFAULT now() NOT NULL,
    "type" integer DEFAULT 1 NOT NULL,
    highlighter_timestamp integer,
    expiry interval,
    expires timestamp with time zone,
    poster character varying(32) DEFAULT 'Anonymous'::character varying NOT NULL,
    remote character varying(512) NOT NULL,
    md5 character(32),
    path ltree NOT NULL,
    hits integer DEFAULT 0 NOT NULL,
    last_hit timestamp with time zone DEFAULT now(),
    content_length integer,
    description_length integer,
    formatted_content_length integer,
    cipher character varying(32),
    id_mask character varying(8)
);


ALTER TABLE public.bin_metadata OWNER TO pastebin;

SET default_with_oids = true;

--
-- Name: types; Type: TABLE; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE TABLE types (
    id serial NOT NULL,
    name text NOT NULL,
    description text,
    "handler" text DEFAULT 'raw'::text NOT NULL,
    highlighter_name text
);


ALTER TABLE public.types OWNER TO pastebin;

--
-- Name: bin_metadata_recent_list; Type: VIEW; Schema: public; Owner: pastebin
--

CREATE VIEW bin_metadata_recent_list AS
    SELECT bin_metadata.id, bin_metadata.user_id, bin_metadata.poster, types.name, date_part('epoch'::text, bin_metadata.posted) AS posted, date_part('epoch'::text, bin_metadata.expires) AS expires FROM bin_metadata, types WHERE ((types.id = bin_metadata."type") AND ((bin_metadata.expires IS NULL) OR (bin_metadata.expires > now()))) ORDER BY bin_metadata.id DESC;


ALTER TABLE public.bin_metadata_recent_list OWNER TO pastebin;

SET default_with_oids = false;

--
-- Name: bin_password; Type: TABLE; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE TABLE bin_password (
    bin_id integer NOT NULL,
    "password" text
);


ALTER TABLE public.bin_password OWNER TO pastebin;

--
-- Name: bin_recent_list; Type: VIEW; Schema: public; Owner: pastebin
--

CREATE VIEW bin_recent_list AS
    SELECT bin.id, bin.poster, date_trunc('second'::text, age(now(), bin.posted)) AS age, types.name, date_part('epoch'::text, bin.posted) AS posted, date_part('epoch'::text, bin.expires) AS expires FROM bin, types WHERE ((((types.id = bin."type") AND (bin.user_id IS NULL)) AND ((bin.expires IS NULL) OR (bin.expires > now()))) AND (bin.id_mask IS NULL)) ORDER BY bin.id DESC LIMIT 15;


ALTER TABLE public.bin_recent_list OWNER TO pastebin;

SET default_with_oids = true;

--
-- Name: bin_tree; Type: TABLE; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE TABLE bin_tree (
    tree_id integer NOT NULL,
    bin_id integer NOT NULL,
    lft integer NOT NULL,
    rgt integer NOT NULL
);


ALTER TABLE public.bin_tree OWNER TO pastebin;

--
-- Name: bin_tree_depth; Type: VIEW; Schema: public; Owner: pastebin
--

CREATE VIEW bin_tree_depth AS
    SELECT a.tree_id, a.bin_id, a.lft, a.rgt, ((a.rgt - a.lft) / 2) AS children, (SELECT count(*) AS count FROM bin_tree b WHERE ((b.tree_id = a.tree_id) AND ((a.lft >= b.lft) AND (a.lft <= b.rgt)))) AS depth FROM bin_tree a ORDER BY a.lft;


ALTER TABLE public.bin_tree_depth OWNER TO pastebin;

--
-- Name: comment_tree_id_seq; Type: SEQUENCE; Schema: public; Owner: pastebin
--

CREATE SEQUENCE comment_tree_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.comment_tree_id_seq OWNER TO pastebin;

--
-- Name: comments; Type: TABLE; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE TABLE comments (
    id serial NOT NULL,
    tree_id integer DEFAULT nextval(('comment_tree_id_seq'::text)::regclass) NOT NULL,
    lft integer DEFAULT 1,
    rgt integer DEFAULT 2,
    name text,
    contact text,
    comment_type integer DEFAULT 1 NOT NULL,
    subject text,
    comments text,
    private_name boolean DEFAULT false,
    private_contact boolean DEFAULT true,
    private_comment boolean DEFAULT false,
    posted timestamp with time zone DEFAULT now() NOT NULL,
    removed boolean DEFAULT false NOT NULL,
    raw_comments text,
    bin_id integer,
    poll_id integer,
    path ltree
);


ALTER TABLE public.comments OWNER TO pastebin;

--
-- Name: comments_tree_depth; Type: VIEW; Schema: public; Owner: pastebin
--

CREATE VIEW comments_tree_depth AS
    SELECT a.tree_id, a.id, a.lft, a.rgt, ((a.rgt - a.lft) / 2) AS children, (SELECT count(*) AS count FROM comments b WHERE ((b.tree_id = a.tree_id) AND ((a.lft >= b.lft) AND (a.lft <= b.rgt)))) AS depth FROM comments a ORDER BY a.lft;


ALTER TABLE public.comments_tree_depth OWNER TO pastebin;

--
-- Name: draw_entries; Type: TABLE; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE TABLE draw_entries (
    cid integer,
    ip inet,
    pbentered integer,
    contact_name text,
    contact_info text,
    selection text,
    suggestion text,
    ts timestamp with time zone,
    country text,
    via text,
    forwarded_for text,
    user_agent text
);


ALTER TABLE public.draw_entries OWNER TO pastebin;

--
-- Name: email_confirm; Type: TABLE; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE TABLE email_confirm (
    user_id integer NOT NULL,
    confirm_code text NOT NULL,
    validity timestamp with time zone DEFAULT (now() + '3 days'::interval) NOT NULL,
    confirmed boolean DEFAULT false NOT NULL
);


ALTER TABLE public.email_confirm OWNER TO pastebin;

SET default_with_oids = false;

--
-- Name: irc_subscriptions; Type: TABLE; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE TABLE irc_subscriptions (
    server text NOT NULL,
    channel text NOT NULL,
    nick character varying(32),
    "owner" text,
    "password" character varying(16)
);


ALTER TABLE public.irc_subscriptions OWNER TO pastebin;

--
-- Name: jabber_notifier; Type: TABLE; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE TABLE jabber_notifier (
    id serial NOT NULL,
    jid text NOT NULL,
    name text,
    active boolean DEFAULT true NOT NULL,
    online boolean DEFAULT false,
    quiet boolean DEFAULT false
);


ALTER TABLE public.jabber_notifier OWNER TO pastebin;

--
-- Name: jabber_subscriptions; Type: TABLE; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE TABLE jabber_subscriptions (
    id integer NOT NULL,
    user_id integer
);


ALTER TABLE public.jabber_subscriptions OWNER TO pastebin;

--
-- Name: last_heard_ip; Type: TABLE; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE TABLE last_heard_ip (
    address inet NOT NULL,
    first_heard_comment timestamp with time zone,
    last_heard_comment timestamp with time zone,
    first_heard_paste timestamp with time zone,
    last_heard_paste timestamp with time zone,
    total_comments integer DEFAULT 0,
    total_pastes integer DEFAULT 0
);


ALTER TABLE public.last_heard_ip OWNER TO pastebin;

--
-- Name: paste_tag_array; Type: TABLE; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE TABLE paste_tag_array (
    bin_id integer NOT NULL,
    tag_ids integer[]
);


ALTER TABLE public.paste_tag_array OWNER TO pastebin;

--
-- Name: paste_tags; Type: TABLE; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE TABLE paste_tags (
    bin_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.paste_tags OWNER TO pastebin;

--
-- Name: pbguid_to_bin; Type: TABLE; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE TABLE pbguid_to_bin (
    pbguid character(32) NOT NULL,
    bin_id integer
);


ALTER TABLE public.pbguid_to_bin OWNER TO pastebin;

--
-- Name: period_statistics; Type: TABLE; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE TABLE period_statistics (
    weekday smallint,
    "hour" smallint,
    "month" smallint,
    "year" smallint,
    total integer,
    expiring integer,
    spam integer,
    removed integer
);


ALTER TABLE public.period_statistics OWNER TO pastebin;

SET default_with_oids = true;

--
-- Name: pg_ts_cfg; Type: TABLE; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE TABLE pg_ts_cfg (
    ts_name text NOT NULL,
    prs_name text NOT NULL,
    locale text
);


ALTER TABLE public.pg_ts_cfg OWNER TO pastebin;

--
-- Name: pg_ts_cfgmap; Type: TABLE; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE TABLE pg_ts_cfgmap (
    ts_name text NOT NULL,
    tok_alias text NOT NULL,
    dict_name text[]
);


ALTER TABLE public.pg_ts_cfgmap OWNER TO pastebin;

--
-- Name: pg_ts_dict; Type: TABLE; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE TABLE pg_ts_dict (
    dict_name text NOT NULL,
    dict_init regprocedure,
    dict_initoption text,
    dict_lexize regprocedure NOT NULL,
    dict_comment text
);


ALTER TABLE public.pg_ts_dict OWNER TO pastebin;

--
-- Name: pg_ts_parser; Type: TABLE; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE TABLE pg_ts_parser (
    prs_name text NOT NULL,
    prs_start regprocedure NOT NULL,
    prs_nexttoken regprocedure NOT NULL,
    prs_end regprocedure NOT NULL,
    prs_headline regprocedure NOT NULL,
    prs_lextype regprocedure NOT NULL,
    prs_comment text
);


ALTER TABLE public.pg_ts_parser OWNER TO pastebin;

--
-- Name: poll_answers; Type: TABLE; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE TABLE poll_answers (
    poll_id integer NOT NULL,
    answer integer NOT NULL
);


ALTER TABLE public.poll_answers OWNER TO pastebin;

--
-- Name: poll_questions; Type: TABLE; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE TABLE poll_questions (
    id serial NOT NULL,
    question text NOT NULL,
    answers text NOT NULL,
    active boolean DEFAULT true,
    start_time timestamp with time zone,
    end_time timestamp with time zone,
    description text,
    results text
);


ALTER TABLE public.poll_questions OWNER TO pastebin;

--
-- Name: posters; Type: TABLE; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE TABLE posters (
    id serial NOT NULL,
    username character varying(32) NOT NULL,
    "password" character varying(64) NOT NULL,
    fullname text,
    email text,
    url text,
    description text,
    created timestamp with time zone DEFAULT now() NOT NULL,
    disabled timestamp with time zone,
    active boolean DEFAULT true NOT NULL,
    private_username boolean DEFAULT false NOT NULL,
    private_fullname boolean DEFAULT true NOT NULL,
    private_email boolean DEFAULT true NOT NULL,
    private_url boolean DEFAULT true NOT NULL
);


ALTER TABLE public.posters OWNER TO pastebin;

SET default_with_oids = false;

--
-- Name: postkey_to_bin; Type: TABLE; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE TABLE postkey_to_bin (
    postkey_id integer,
    bin_id integer
);


ALTER TABLE public.postkey_to_bin OWNER TO pastebin;

--
-- Name: postkeys; Type: TABLE; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE TABLE postkeys (
    postkey_id serial NOT NULL,
    postkey character(40) NOT NULL,
    used integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.postkeys OWNER TO pastebin;

--
-- Name: removals; Type: TABLE; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE TABLE removals (
    bin_id integer NOT NULL,
    name text,
    reason text,
    removed boolean DEFAULT false NOT NULL,
    requested timestamp with time zone DEFAULT now(),
    remover text
);


ALTER TABLE public.removals OWNER TO pastebin;

--
-- Name: spammers; Type: TABLE; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE TABLE spammers (
    remote character varying(128) NOT NULL,
    expires timestamp with time zone DEFAULT (now() + '00:15:00'::interval) NOT NULL,
    hits integer DEFAULT 1,
    first_hit timestamp with time zone DEFAULT now(),
    period interval DEFAULT '00:15:00'::interval
);


ALTER TABLE public.spammers OWNER TO pastebin;

--
-- Name: sph_counter; Type: TABLE; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE TABLE sph_counter (
    counter_id integer NOT NULL,
    max_doc_id integer NOT NULL
);


ALTER TABLE public.sph_counter OWNER TO pastebin;

--
-- Name: statistics; Type: TABLE; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE TABLE "statistics" (
    total integer,
    expiring integer,
    spam integer,
    removed integer
);


ALTER TABLE public."statistics" OWNER TO pastebin;

--
-- Name: tags; Type: TABLE; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE TABLE tags (
    id serial NOT NULL,
    tag text NOT NULL
);


ALTER TABLE public.tags OWNER TO pastebin;

--
-- Name: trackbacks; Type: TABLE; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE TABLE trackbacks (
    id serial NOT NULL,
    url character varying(250),
    title character varying(250),
    excerpt character varying(1024),
    blog_name character varying(128),
    first_ping timestamp with time zone DEFAULT now(),
    last_ping timestamp with time zone DEFAULT now(),
    bin_id integer
);


ALTER TABLE public.trackbacks OWNER TO pastebin;

--
-- Name: tree_id_seq; Type: SEQUENCE; Schema: public; Owner: pastebin
--

CREATE SEQUENCE tree_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.tree_id_seq OWNER TO pastebin;

--
-- Name: type_statistics; Type: TABLE; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE TABLE type_statistics (
    type_id integer,
    total integer
);


ALTER TABLE public.type_statistics OWNER TO pastebin;

SET default_with_oids = true;

--
-- Name: user_viewers; Type: TABLE; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE TABLE user_viewers (
    id serial NOT NULL,
    parent_user integer NOT NULL,
    username character varying(32) NOT NULL,
    "password" text NOT NULL
);


ALTER TABLE public.user_viewers OWNER TO pastebin;

--
-- Name: users; Type: TABLE; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE TABLE users (
    id serial NOT NULL,
    username character varying(32) NOT NULL,
    "password" text NOT NULL,
    hostname character varying(32) NOT NULL,
    private boolean DEFAULT true,
    email text,
    active boolean,
    fullname text,
    notifier_method text,
    notifier_params text,
    title_name text
);


ALTER TABLE public.users OWNER TO pastebin;

--
-- Name: vhosts; Type: TABLE; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE TABLE vhosts (
    name character varying(128) NOT NULL,
    stylesheet text,
    advertisements boolean DEFAULT true NOT NULL,
    default_type integer
);


ALTER TABLE public.vhosts OWNER TO pastebin;

--
-- Name: account_apikeys_apikey_key; Type: CONSTRAINT; Schema: public; Owner: pastebin; Tablespace: 
--

ALTER TABLE ONLY account_apikeys
    ADD CONSTRAINT account_apikeys_apikey_key UNIQUE (apikey);


--
-- Name: account_guids_guid_key; Type: CONSTRAINT; Schema: public; Owner: pastebin; Tablespace: 
--

ALTER TABLE ONLY account_guids
    ADD CONSTRAINT account_guids_guid_key UNIQUE (guid);


--
-- Name: account_identifiers_username_key; Type: CONSTRAINT; Schema: public; Owner: pastebin; Tablespace: 
--

ALTER TABLE ONLY account_identifiers
    ADD CONSTRAINT account_identifiers_username_key UNIQUE (username);


--
-- Name: account_settings_acct_id_key; Type: CONSTRAINT; Schema: public; Owner: pastebin; Tablespace: 
--

ALTER TABLE ONLY account_settings
    ADD CONSTRAINT account_settings_acct_id_key UNIQUE (acct_id, name);


--
-- Name: accounts_id_key; Type: CONSTRAINT; Schema: public; Owner: pastebin; Tablespace: 
--

ALTER TABLE ONLY accounts
    ADD CONSTRAINT accounts_id_key UNIQUE (id);


--
-- Name: adv_auction_bidders_id_key; Type: CONSTRAINT; Schema: public; Owner: pastebin; Tablespace: 
--

ALTER TABLE ONLY adv_auction_bidders
    ADD CONSTRAINT adv_auction_bidders_id_key UNIQUE (id);


--
-- Name: adv_auction_classes_id_key; Type: CONSTRAINT; Schema: public; Owner: pastebin; Tablespace: 
--

ALTER TABLE ONLY adv_auction_classes
    ADD CONSTRAINT adv_auction_classes_id_key UNIQUE (id);


--
-- Name: adv_auction_classes_name_key; Type: CONSTRAINT; Schema: public; Owner: pastebin; Tablespace: 
--

ALTER TABLE ONLY adv_auction_classes
    ADD CONSTRAINT adv_auction_classes_name_key UNIQUE (name);


--
-- Name: adv_auctions_id_key; Type: CONSTRAINT; Schema: public; Owner: pastebin; Tablespace: 
--

ALTER TABLE ONLY adv_auctions
    ADD CONSTRAINT adv_auctions_id_key UNIQUE (id);


--
-- Name: advertisements_id_key; Type: CONSTRAINT; Schema: public; Owner: pastebin; Tablespace: 
--

ALTER TABLE ONLY advertisements
    ADD CONSTRAINT advertisements_id_key UNIQUE (id);


--
-- Name: api_key_api_key_key; Type: CONSTRAINT; Schema: public; Owner: pastebin; Tablespace: 
--

ALTER TABLE ONLY api_key
    ADD CONSTRAINT api_key_api_key_key UNIQUE (api_key);


--
-- Name: bin_hits_bin_id_key; Type: CONSTRAINT; Schema: public; Owner: pastebin; Tablespace: 
--

ALTER TABLE ONLY bin_hits
    ADD CONSTRAINT bin_hits_bin_id_key UNIQUE (bin_id);


--
-- Name: bin_ltree_path_key; Type: CONSTRAINT; Schema: public; Owner: pastebin; Tablespace: 
--

ALTER TABLE ONLY bin_ltree
    ADD CONSTRAINT bin_ltree_path_key UNIQUE (path);


--
-- Name: bin_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: pastebin; Tablespace: 
--

ALTER TABLE ONLY bin_metadata
    ADD CONSTRAINT bin_metadata_pkey PRIMARY KEY (id);


--
-- Name: bin_pkey; Type: CONSTRAINT; Schema: public; Owner: pastebin; Tablespace: 
--

ALTER TABLE ONLY bin
    ADD CONSTRAINT bin_pkey PRIMARY KEY (id);


--
-- Name: comments_id_key; Type: CONSTRAINT; Schema: public; Owner: pastebin; Tablespace: 
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_id_key UNIQUE (id);


--
-- Name: irc_subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: pastebin; Tablespace: 
--

ALTER TABLE ONLY irc_subscriptions
    ADD CONSTRAINT irc_subscriptions_pkey PRIMARY KEY (server, channel);


--
-- Name: jabber_notifier_id_key; Type: CONSTRAINT; Schema: public; Owner: pastebin; Tablespace: 
--

ALTER TABLE ONLY jabber_notifier
    ADD CONSTRAINT jabber_notifier_id_key UNIQUE (id);


--
-- Name: jabber_notifier_jid_key; Type: CONSTRAINT; Schema: public; Owner: pastebin; Tablespace: 
--

ALTER TABLE ONLY jabber_notifier
    ADD CONSTRAINT jabber_notifier_jid_key UNIQUE (jid);


--
-- Name: last_heard_ip_address_key; Type: CONSTRAINT; Schema: public; Owner: pastebin; Tablespace: 
--

ALTER TABLE ONLY last_heard_ip
    ADD CONSTRAINT last_heard_ip_address_key UNIQUE (address);


--
-- Name: paste_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: pastebin; Tablespace: 
--

ALTER TABLE ONLY paste_tags
    ADD CONSTRAINT paste_tags_pkey PRIMARY KEY (bin_id, tag_id);


--
-- Name: pg_ts_cfg_pkey; Type: CONSTRAINT; Schema: public; Owner: pastebin; Tablespace: 
--

ALTER TABLE ONLY pg_ts_cfg
    ADD CONSTRAINT pg_ts_cfg_pkey PRIMARY KEY (ts_name);


--
-- Name: pg_ts_cfgmap_pkey; Type: CONSTRAINT; Schema: public; Owner: pastebin; Tablespace: 
--

ALTER TABLE ONLY pg_ts_cfgmap
    ADD CONSTRAINT pg_ts_cfgmap_pkey PRIMARY KEY (ts_name, tok_alias);


--
-- Name: pg_ts_dict_pkey; Type: CONSTRAINT; Schema: public; Owner: pastebin; Tablespace: 
--

ALTER TABLE ONLY pg_ts_dict
    ADD CONSTRAINT pg_ts_dict_pkey PRIMARY KEY (dict_name);


--
-- Name: pg_ts_parser_pkey; Type: CONSTRAINT; Schema: public; Owner: pastebin; Tablespace: 
--

ALTER TABLE ONLY pg_ts_parser
    ADD CONSTRAINT pg_ts_parser_pkey PRIMARY KEY (prs_name);


--
-- Name: poll_questions_id_key; Type: CONSTRAINT; Schema: public; Owner: pastebin; Tablespace: 
--

ALTER TABLE ONLY poll_questions
    ADD CONSTRAINT poll_questions_id_key UNIQUE (id);


--
-- Name: posters_id_key; Type: CONSTRAINT; Schema: public; Owner: pastebin; Tablespace: 
--

ALTER TABLE ONLY posters
    ADD CONSTRAINT posters_id_key UNIQUE (id);


--
-- Name: posters_username_key; Type: CONSTRAINT; Schema: public; Owner: pastebin; Tablespace: 
--

ALTER TABLE ONLY posters
    ADD CONSTRAINT posters_username_key UNIQUE (username);


--
-- Name: postkeys_pkey; Type: CONSTRAINT; Schema: public; Owner: pastebin; Tablespace: 
--

ALTER TABLE ONLY postkeys
    ADD CONSTRAINT postkeys_pkey PRIMARY KEY (postkey);


--
-- Name: postkeys_postkey_id_key; Type: CONSTRAINT; Schema: public; Owner: pastebin; Tablespace: 
--

ALTER TABLE ONLY postkeys
    ADD CONSTRAINT postkeys_postkey_id_key UNIQUE (postkey_id);


--
-- Name: spammers_remote_key; Type: CONSTRAINT; Schema: public; Owner: pastebin; Tablespace: 
--

ALTER TABLE ONLY spammers
    ADD CONSTRAINT spammers_remote_key UNIQUE (remote);


--
-- Name: tags_pkey; Type: CONSTRAINT; Schema: public; Owner: pastebin; Tablespace: 
--

ALTER TABLE ONLY tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: tags_tag_key; Type: CONSTRAINT; Schema: public; Owner: pastebin; Tablespace: 
--

ALTER TABLE ONLY tags
    ADD CONSTRAINT tags_tag_key UNIQUE (tag);


--
-- Name: trackbacks_id_key; Type: CONSTRAINT; Schema: public; Owner: pastebin; Tablespace: 
--

ALTER TABLE ONLY trackbacks
    ADD CONSTRAINT trackbacks_id_key UNIQUE (id);


--
-- Name: types_id_key; Type: CONSTRAINT; Schema: public; Owner: pastebin; Tablespace: 
--

ALTER TABLE ONLY types
    ADD CONSTRAINT types_id_key UNIQUE (id);


--
-- Name: types_name_key; Type: CONSTRAINT; Schema: public; Owner: pastebin; Tablespace: 
--

ALTER TABLE ONLY types
    ADD CONSTRAINT types_name_key UNIQUE (name);


--
-- Name: user_viewers_id_key; Type: CONSTRAINT; Schema: public; Owner: pastebin; Tablespace: 
--

ALTER TABLE ONLY user_viewers
    ADD CONSTRAINT user_viewers_id_key UNIQUE (id);


--
-- Name: user_viewers_username_key; Type: CONSTRAINT; Schema: public; Owner: pastebin; Tablespace: 
--

ALTER TABLE ONLY user_viewers
    ADD CONSTRAINT user_viewers_username_key UNIQUE (username);


--
-- Name: users_hostname_key; Type: CONSTRAINT; Schema: public; Owner: pastebin; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_hostname_key UNIQUE (hostname);


--
-- Name: users_id_key; Type: CONSTRAINT; Schema: public; Owner: pastebin; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_id_key UNIQUE (id);


--
-- Name: users_username_key; Type: CONSTRAINT; Schema: public; Owner: pastebin; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: vhosts_name_key; Type: CONSTRAINT; Schema: public; Owner: pastebin; Tablespace: 
--

ALTER TABLE ONLY vhosts
    ADD CONSTRAINT vhosts_name_key UNIQUE (name);


--
-- Name: advertisements_begin_expires_idx; Type: INDEX; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE INDEX advertisements_begin_expires_idx ON advertisements USING btree (begins, expires);


--
-- Name: advertisements_prepaid_displays_idx; Type: INDEX; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE INDEX advertisements_prepaid_displays_idx ON advertisements USING btree (prepaid_displays);


--
-- Name: banned_md5_idx; Type: INDEX; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE UNIQUE INDEX banned_md5_idx ON banned_md5 USING btree (md5);


--
-- Name: bin_acct_id_idx; Type: INDEX; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE INDEX bin_acct_id_idx ON bin USING btree (acct_id) WHERE (acct_id IS NOT NULL);


--
-- Name: bin_exp_user_null_idx; Type: INDEX; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE INDEX bin_exp_user_null_idx ON bin USING btree (user_id, expires) WHERE ((user_id IS NULL) AND (expires IS NULL));


--
-- Name: bin_expires_idx; Type: INDEX; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE INDEX bin_expires_idx ON bin USING btree (expires);


--
-- Name: bin_hits_hits_idx; Type: INDEX; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE INDEX bin_hits_hits_idx ON bin_hits USING btree (hits);


--
-- Name: bin_htmp_id_idx; Type: INDEX; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE INDEX bin_htmp_id_idx ON bin USING hash (id);


--
-- Name: bin_id_expires_idx; Type: INDEX; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE INDEX bin_id_expires_idx ON bin USING btree (user_id, expires);


--
-- Name: bin_id_mask_idx; Type: INDEX; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE INDEX bin_id_mask_idx ON bin USING btree (id_mask);


--
-- Name: bin_lang_idx; Type: INDEX; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE INDEX bin_lang_idx ON bin USING btree (lang);


--
-- Name: bin_ltree_bin_id_idx; Type: INDEX; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE UNIQUE INDEX bin_ltree_bin_id_idx ON bin_ltree USING btree (bin_id);


--
-- Name: bin_ltree_path_gist; Type: INDEX; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE INDEX bin_ltree_path_gist ON bin_ltree USING gist (path);


--
-- Name: bin_md5_idx; Type: INDEX; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE INDEX bin_md5_idx ON bin USING btree (md5);


--
-- Name: bin_oid_idx; Type: INDEX; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE INDEX bin_oid_idx ON bin USING btree (oid);


--
-- Name: bin_remote_idx; Type: INDEX; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE INDEX bin_remote_idx ON bin USING btree (remote);


--
-- Name: bin_tree_bin_id_idx; Type: INDEX; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE INDEX bin_tree_bin_id_idx ON bin_tree USING btree (bin_id);


--
-- Name: bin_tree_rgt_idx; Type: INDEX; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE INDEX bin_tree_rgt_idx ON bin_tree USING btree (rgt);


--
-- Name: bin_tree_tid_lft_idx; Type: INDEX; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE INDEX bin_tree_tid_lft_idx ON bin_tree USING btree (tree_id, lft);


--
-- Name: bin_tree_tid_lr_idx; Type: INDEX; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE INDEX bin_tree_tid_lr_idx ON bin_tree USING btree (tree_id, lft, rgt);


--
-- Name: bin_tree_tid_rgt_idx; Type: INDEX; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE INDEX bin_tree_tid_rgt_idx ON bin_tree USING btree (tree_id, rgt);


--
-- Name: bin_uid_exp_nulls_idx; Type: INDEX; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE INDEX bin_uid_exp_nulls_idx ON bin USING btree (user_id, expires) WHERE ((user_id IS NULL) AND (expires IS NULL));


--
-- Name: bin_uid_expires_mask_idx; Type: INDEX; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE INDEX bin_uid_expires_mask_idx ON bin USING btree (user_id, expires, id_mask) WHERE (((user_id IS NOT NULL) AND (expires IS NULL)) AND (id_mask IS NULL));


--
-- Name: bin_user_id_idx; Type: INDEX; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE INDEX bin_user_id_idx ON bin USING btree (user_id);


--
-- Name: comment_bin_priv_lft_idx; Type: INDEX; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE INDEX comment_bin_priv_lft_idx ON comments USING btree (bin_id, lft);


--
-- Name: comments_lft_idx; Type: INDEX; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE INDEX comments_lft_idx ON comments USING btree (lft);


--
-- Name: comments_pid_idx; Type: INDEX; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE INDEX comments_pid_idx ON comments USING btree (poll_id);


--
-- Name: comments_tid_lft_rgt_idx; Type: INDEX; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE INDEX comments_tid_lft_rgt_idx ON comments USING btree (tree_id, lft, rgt);


--
-- Name: paste_tag_array_arr_idx; Type: INDEX; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE INDEX paste_tag_array_arr_idx ON paste_tag_array USING btree (tag_ids);


--
-- Name: paste_tag_array_id_idx; Type: INDEX; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE INDEX paste_tag_array_id_idx ON paste_tag_array USING btree (bin_id);


--
-- Name: pbguid_bin_id_idx; Type: INDEX; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE UNIQUE INDEX pbguid_bin_id_idx ON pbguid_to_bin USING btree (bin_id);


--
-- Name: pbguid_to_bin_pbguid_idx; Type: INDEX; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE INDEX pbguid_to_bin_pbguid_idx ON pbguid_to_bin USING btree (pbguid);


--
-- Name: poll_answers_hash_idx; Type: INDEX; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE INDEX poll_answers_hash_idx ON poll_answers USING hash (poll_id);


--
-- Name: poll_answers_pid_idx; Type: INDEX; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE INDEX poll_answers_pid_idx ON poll_answers USING btree (poll_id);


--
-- Name: poll_questions_active_idx; Type: INDEX; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE INDEX poll_questions_active_idx ON poll_questions USING btree (active);


--
-- Name: postkey_to_bin_pkid_idx; Type: INDEX; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE INDEX postkey_to_bin_pkid_idx ON postkey_to_bin USING btree (postkey_id);


--
-- Name: spammers_expires_idx; Type: INDEX; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE INDEX spammers_expires_idx ON spammers USING btree (expires);


--
-- Name: spammers_remote_expires_idx; Type: INDEX; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE INDEX spammers_remote_expires_idx ON spammers USING btree (remote, expires);


--
-- Name: trackbacks_bin_id_idx; Type: INDEX; Schema: public; Owner: pastebin; Tablespace: 
--

CREATE INDEX trackbacks_bin_id_idx ON trackbacks USING btree (bin_id);


--
-- Name: $1; Type: FK CONSTRAINT; Schema: public; Owner: pastebin
--

ALTER TABLE ONLY user_viewers
    ADD CONSTRAINT "$1" FOREIGN KEY (parent_user) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: $1; Type: FK CONSTRAINT; Schema: public; Owner: pastebin
--

ALTER TABLE ONLY advertisement_tracking
    ADD CONSTRAINT "$1" FOREIGN KEY (id) REFERENCES advertisements(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: $1; Type: FK CONSTRAINT; Schema: public; Owner: pastebin
--

ALTER TABLE ONLY adv_auctions
    ADD CONSTRAINT "$1" FOREIGN KEY ("class") REFERENCES adv_auction_classes(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: $1; Type: FK CONSTRAINT; Schema: public; Owner: pastebin
--

ALTER TABLE ONLY adv_auction_bids
    ADD CONSTRAINT "$1" FOREIGN KEY (auction) REFERENCES adv_auctions(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: $1; Type: FK CONSTRAINT; Schema: public; Owner: pastebin
--

ALTER TABLE ONLY email_confirm
    ADD CONSTRAINT "$1" FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: $1; Type: FK CONSTRAINT; Schema: public; Owner: pastebin
--

ALTER TABLE ONLY poll_answers
    ADD CONSTRAINT "$1" FOREIGN KEY (poll_id) REFERENCES poll_questions(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: $2; Type: FK CONSTRAINT; Schema: public; Owner: pastebin
--

ALTER TABLE ONLY adv_auction_bids
    ADD CONSTRAINT "$2" FOREIGN KEY (bidder) REFERENCES adv_auction_bidders(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: account_apikeys_acct_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pastebin
--

ALTER TABLE ONLY account_apikeys
    ADD CONSTRAINT account_apikeys_acct_id_fkey FOREIGN KEY (acct_id) REFERENCES accounts(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: account_guids_acct_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pastebin
--

ALTER TABLE ONLY account_guids
    ADD CONSTRAINT account_guids_acct_id_fkey FOREIGN KEY (acct_id) REFERENCES accounts(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: account_identifiers_account_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pastebin
--

ALTER TABLE ONLY account_identifiers
    ADD CONSTRAINT account_identifiers_account_id_fkey FOREIGN KEY (account_id) REFERENCES accounts(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: account_settings_acct_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pastebin
--

ALTER TABLE ONLY account_settings
    ADD CONSTRAINT account_settings_acct_id_fkey FOREIGN KEY (acct_id) REFERENCES accounts(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: bin_ltree_bin_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pastebin
--

ALTER TABLE ONLY bin_ltree
    ADD CONSTRAINT bin_ltree_bin_id_fkey FOREIGN KEY (bin_id) REFERENCES bin(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: jabber_subscriptions_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pastebin
--

ALTER TABLE ONLY jabber_subscriptions
    ADD CONSTRAINT jabber_subscriptions_id_fkey FOREIGN KEY (id) REFERENCES jabber_notifier(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: jabber_subscriptions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pastebin
--

ALTER TABLE ONLY jabber_subscriptions
    ADD CONSTRAINT jabber_subscriptions_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: paste_tags_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pastebin
--

ALTER TABLE ONLY paste_tags
    ADD CONSTRAINT paste_tags_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES tags(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: pbguid_to_bin_bin_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pastebin
--

ALTER TABLE ONLY pbguid_to_bin
    ADD CONSTRAINT pbguid_to_bin_bin_id_fkey FOREIGN KEY (bin_id) REFERENCES bin(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: postkey_to_bin_postkey_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pastebin
--

ALTER TABLE ONLY postkey_to_bin
    ADD CONSTRAINT postkey_to_bin_postkey_id_fkey FOREIGN KEY (postkey_id) REFERENCES postkeys(postkey_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: trackbacks_bin_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pastebin
--

ALTER TABLE ONLY trackbacks
    ADD CONSTRAINT trackbacks_bin_id_fkey FOREIGN KEY (bin_id) REFERENCES bin(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: type_statistics_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pastebin
--

ALTER TABLE ONLY type_statistics
    ADD CONSTRAINT type_statistics_type_id_fkey FOREIGN KEY (type_id) REFERENCES types(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: adv_auction_bidders; Type: ACL; Schema: public; Owner: pastebin
--

REVOKE ALL ON TABLE adv_auction_bidders FROM PUBLIC;
REVOKE ALL ON TABLE adv_auction_bidders FROM pastebin;
GRANT ALL ON TABLE adv_auction_bidders TO pastebin;


--
-- Name: adv_auction_bidders_id_seq; Type: ACL; Schema: public; Owner: pastebin
--

REVOKE ALL ON TABLE adv_auction_bidders_id_seq FROM PUBLIC;
REVOKE ALL ON TABLE adv_auction_bidders_id_seq FROM pastebin;
GRANT ALL ON TABLE adv_auction_bidders_id_seq TO pastebin;


--
-- Name: adv_auction_bids; Type: ACL; Schema: public; Owner: pastebin
--

REVOKE ALL ON TABLE adv_auction_bids FROM PUBLIC;
REVOKE ALL ON TABLE adv_auction_bids FROM pastebin;
GRANT ALL ON TABLE adv_auction_bids TO pastebin;


--
-- Name: adv_auction_classes; Type: ACL; Schema: public; Owner: pastebin
--

REVOKE ALL ON TABLE adv_auction_classes FROM PUBLIC;
REVOKE ALL ON TABLE adv_auction_classes FROM pastebin;
GRANT ALL ON TABLE adv_auction_classes TO pastebin;


--
-- Name: adv_auction_classes_id_seq; Type: ACL; Schema: public; Owner: pastebin
--

REVOKE ALL ON TABLE adv_auction_classes_id_seq FROM PUBLIC;
REVOKE ALL ON TABLE adv_auction_classes_id_seq FROM pastebin;
GRANT ALL ON TABLE adv_auction_classes_id_seq TO pastebin;


--
-- Name: adv_auctions; Type: ACL; Schema: public; Owner: pastebin
--

REVOKE ALL ON TABLE adv_auctions FROM PUBLIC;
REVOKE ALL ON TABLE adv_auctions FROM pastebin;
GRANT ALL ON TABLE adv_auctions TO pastebin;


--
-- Name: adv_auctions_id_seq; Type: ACL; Schema: public; Owner: pastebin
--

REVOKE ALL ON TABLE adv_auctions_id_seq FROM PUBLIC;
REVOKE ALL ON TABLE adv_auctions_id_seq FROM pastebin;
GRANT ALL ON TABLE adv_auctions_id_seq TO pastebin;


--
-- Name: advertisements; Type: ACL; Schema: public; Owner: pastebin
--

REVOKE ALL ON TABLE advertisements FROM PUBLIC;
REVOKE ALL ON TABLE advertisements FROM pastebin;
GRANT ALL ON TABLE advertisements TO pastebin;


--
-- Name: advertisement_selection; Type: ACL; Schema: public; Owner: pastebin
--

REVOKE ALL ON TABLE advertisement_selection FROM PUBLIC;
REVOKE ALL ON TABLE advertisement_selection FROM pastebin;
GRANT ALL ON TABLE advertisement_selection TO pastebin;


--
-- Name: advertisement_tracking; Type: ACL; Schema: public; Owner: pastebin
--

REVOKE ALL ON TABLE advertisement_tracking FROM PUBLIC;
REVOKE ALL ON TABLE advertisement_tracking FROM pastebin;
GRANT ALL ON TABLE advertisement_tracking TO pastebin;


--
-- Name: advertisements_id_seq; Type: ACL; Schema: public; Owner: pastebin
--

REVOKE ALL ON TABLE advertisements_id_seq FROM PUBLIC;
REVOKE ALL ON TABLE advertisements_id_seq FROM pastebin;
GRANT ALL ON TABLE advertisements_id_seq TO pastebin;


--
-- Name: bin_hits; Type: ACL; Schema: public; Owner: pastebin
--

REVOKE ALL ON TABLE bin_hits FROM PUBLIC;
REVOKE ALL ON TABLE bin_hits FROM pastebin;
GRANT ALL ON TABLE bin_hits TO pastebin;


--
-- Name: types; Type: ACL; Schema: public; Owner: pastebin
--

REVOKE ALL ON TABLE types FROM PUBLIC;
REVOKE ALL ON TABLE types FROM pastebin;
GRANT ALL ON TABLE types TO pastebin;


--
-- Name: bin_tree; Type: ACL; Schema: public; Owner: pastebin
--

REVOKE ALL ON TABLE bin_tree FROM PUBLIC;
REVOKE ALL ON TABLE bin_tree FROM pastebin;
GRANT ALL ON TABLE bin_tree TO pastebin;


--
-- Name: bin_tree_depth; Type: ACL; Schema: public; Owner: pastebin
--

REVOKE ALL ON TABLE bin_tree_depth FROM PUBLIC;
REVOKE ALL ON TABLE bin_tree_depth FROM pastebin;
GRANT ALL ON TABLE bin_tree_depth TO pastebin;


--
-- Name: comment_tree_id_seq; Type: ACL; Schema: public; Owner: pastebin
--

REVOKE ALL ON TABLE comment_tree_id_seq FROM PUBLIC;
REVOKE ALL ON TABLE comment_tree_id_seq FROM pastebin;
GRANT ALL ON TABLE comment_tree_id_seq TO pastebin;


--
-- Name: comments; Type: ACL; Schema: public; Owner: pastebin
--

REVOKE ALL ON TABLE comments FROM PUBLIC;
REVOKE ALL ON TABLE comments FROM pastebin;
GRANT ALL ON TABLE comments TO pastebin;


--
-- Name: comments_id_seq; Type: ACL; Schema: public; Owner: pastebin
--

REVOKE ALL ON TABLE comments_id_seq FROM PUBLIC;
REVOKE ALL ON TABLE comments_id_seq FROM pastebin;
GRANT ALL ON TABLE comments_id_seq TO pastebin;


--
-- Name: comments_tree_depth; Type: ACL; Schema: public; Owner: pastebin
--

REVOKE ALL ON TABLE comments_tree_depth FROM PUBLIC;
REVOKE ALL ON TABLE comments_tree_depth FROM pastebin;
GRANT ALL ON TABLE comments_tree_depth TO pastebin;


--
-- Name: draw_entries; Type: ACL; Schema: public; Owner: pastebin
--

REVOKE ALL ON TABLE draw_entries FROM PUBLIC;
REVOKE ALL ON TABLE draw_entries FROM pastebin;
GRANT ALL ON TABLE draw_entries TO pastebin;


--
-- Name: email_confirm; Type: ACL; Schema: public; Owner: pastebin
--

REVOKE ALL ON TABLE email_confirm FROM PUBLIC;
REVOKE ALL ON TABLE email_confirm FROM pastebin;
GRANT ALL ON TABLE email_confirm TO pastebin;


--
-- Name: pg_ts_cfg; Type: ACL; Schema: public; Owner: pastebin
--

REVOKE ALL ON TABLE pg_ts_cfg FROM PUBLIC;
REVOKE ALL ON TABLE pg_ts_cfg FROM pastebin;
GRANT ALL ON TABLE pg_ts_cfg TO pastebin;


--
-- Name: pg_ts_cfgmap; Type: ACL; Schema: public; Owner: pastebin
--

REVOKE ALL ON TABLE pg_ts_cfgmap FROM PUBLIC;
REVOKE ALL ON TABLE pg_ts_cfgmap FROM pastebin;
GRANT ALL ON TABLE pg_ts_cfgmap TO pastebin;


--
-- Name: pg_ts_dict; Type: ACL; Schema: public; Owner: pastebin
--

REVOKE ALL ON TABLE pg_ts_dict FROM PUBLIC;
REVOKE ALL ON TABLE pg_ts_dict FROM pastebin;
GRANT ALL ON TABLE pg_ts_dict TO pastebin;


--
-- Name: pg_ts_parser; Type: ACL; Schema: public; Owner: pastebin
--

REVOKE ALL ON TABLE pg_ts_parser FROM PUBLIC;
REVOKE ALL ON TABLE pg_ts_parser FROM pastebin;
GRANT ALL ON TABLE pg_ts_parser TO pastebin;


--
-- Name: poll_answers; Type: ACL; Schema: public; Owner: pastebin
--

REVOKE ALL ON TABLE poll_answers FROM PUBLIC;
REVOKE ALL ON TABLE poll_answers FROM pastebin;
GRANT ALL ON TABLE poll_answers TO pastebin;


--
-- Name: poll_questions; Type: ACL; Schema: public; Owner: pastebin
--

REVOKE ALL ON TABLE poll_questions FROM PUBLIC;
REVOKE ALL ON TABLE poll_questions FROM pastebin;
GRANT ALL ON TABLE poll_questions TO pastebin;


--
-- Name: poll_questions_id_seq; Type: ACL; Schema: public; Owner: pastebin
--

REVOKE ALL ON TABLE poll_questions_id_seq FROM PUBLIC;
REVOKE ALL ON TABLE poll_questions_id_seq FROM pastebin;
GRANT ALL ON TABLE poll_questions_id_seq TO pastebin;


--
-- Name: posters; Type: ACL; Schema: public; Owner: pastebin
--

REVOKE ALL ON TABLE posters FROM PUBLIC;
REVOKE ALL ON TABLE posters FROM pastebin;
GRANT ALL ON TABLE posters TO pastebin;


--
-- Name: posters_id_seq; Type: ACL; Schema: public; Owner: pastebin
--

REVOKE ALL ON TABLE posters_id_seq FROM PUBLIC;
REVOKE ALL ON TABLE posters_id_seq FROM pastebin;
GRANT ALL ON TABLE posters_id_seq TO pastebin;


--
-- Name: tree_id_seq; Type: ACL; Schema: public; Owner: pastebin
--

REVOKE ALL ON TABLE tree_id_seq FROM PUBLIC;
REVOKE ALL ON TABLE tree_id_seq FROM pastebin;
GRANT ALL ON TABLE tree_id_seq TO pastebin;


--
-- Name: types_id_seq; Type: ACL; Schema: public; Owner: pastebin
--

REVOKE ALL ON TABLE types_id_seq FROM PUBLIC;
REVOKE ALL ON TABLE types_id_seq FROM pastebin;
GRANT ALL ON TABLE types_id_seq TO pastebin;


--
-- Name: user_viewers; Type: ACL; Schema: public; Owner: pastebin
--

REVOKE ALL ON TABLE user_viewers FROM PUBLIC;
REVOKE ALL ON TABLE user_viewers FROM pastebin;
GRANT ALL ON TABLE user_viewers TO pastebin;


--
-- Name: user_viewers_id_seq; Type: ACL; Schema: public; Owner: pastebin
--

REVOKE ALL ON TABLE user_viewers_id_seq FROM PUBLIC;
REVOKE ALL ON TABLE user_viewers_id_seq FROM pastebin;
GRANT ALL ON TABLE user_viewers_id_seq TO pastebin;


--
-- Name: users; Type: ACL; Schema: public; Owner: pastebin
--

REVOKE ALL ON TABLE users FROM PUBLIC;
REVOKE ALL ON TABLE users FROM pastebin;
GRANT ALL ON TABLE users TO pastebin;


--
-- Name: users_id_seq; Type: ACL; Schema: public; Owner: pastebin
--

REVOKE ALL ON TABLE users_id_seq FROM PUBLIC;
REVOKE ALL ON TABLE users_id_seq FROM pastebin;
GRANT ALL ON TABLE users_id_seq TO pastebin;


--
-- Name: vhosts; Type: ACL; Schema: public; Owner: pastebin
--

REVOKE ALL ON TABLE vhosts FROM PUBLIC;
REVOKE ALL ON TABLE vhosts FROM pastebin;
GRANT ALL ON TABLE vhosts TO pastebin;


--
-- PostgreSQL database dump complete
--

