--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: players; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE players (
    id integer NOT NULL,
    team_id integer,
    name character varying(200),
    field_position_id integer,
    club character varying(100)
);


ALTER TABLE public.players OWNER TO postgres;

--
-- Name: players_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE players_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.players_id_seq OWNER TO postgres;

--
-- Name: players_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE players_id_seq OWNED BY players.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY players ALTER COLUMN id SET DEFAULT nextval('players_id_seq'::regclass);


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY players (id, team_id, name, field_position_id, club) FROM stdin;
1	7	Claudio BRAVO	1	Real Sociedad (ESP)
2	7	Eugenio MENA	2	Santos FC (BRA)
3	7	Miiko ALBORNOZ	2	Malmo FF (SWE)
4	7	Mauricio ISLA	2	Juventus FC (ITA)
5	7	Francisco SILVA	3	CA Osasuna (ESP)
6	7	Carlos CARMONA	3	Atalanta Bergamo (ITA)
7	7	Alexis SANCHEZ	4	FC Barcelona (ESP)
8	7	Arturo VIDAL	3	Juventus FC (ITA)
9	7	Mauricio PINILLA	4	Cagliari Calcio (ITA)
10	7	Jorge VALDIVIA	3	Palmeiras (BRA)
11	7	Eduardo VARGAS	4	Valencia CF (ESP)
12	7	Cristopher TOSELLI	1	CD Universidad Catolica (CHI)
13	7	Jose ROJAS	2	Club Universidad de Chile (CHI)
14	7	Fabian ORELLANA	4	Celta Vigo (ESP)
15	7	Jean BEAUSEJOUR	3	Wigan Athletic FC (ENG)
16	7	Felipe GUTIERREZ	3	FC Twente (NED)
17	7	Gary MEDEL	2	Cardiff City FC (WAL)
18	7	Gonzalo JARA	2	Nottingham Forest FC (ENG)
19	7	Jose FUENZALIDA	3	CSD Colo-Colo (CHI)
20	7	Charles ARANGUIZ	3	SC Internacional (BRA)
21	7	Marcelo DIAZ	3	FC Basel (SUI)
22	7	Esteban PAREDES	4	CSD Colo-Colo (CHI)
23	7	Johnny HERRERA	1	Club Universidad de Chile (CHI)
25	3	Jose CORONA	1	Cruz Azul FC (MEX)
26	3	Francisco RODRIGUEZ	2	Club America (MEX)
27	3	Carlos SALCIDO	2	Tigres UANL (MEX)
28	3	Rafael MARQUEZ	2	Club Leon (MEX)
29	3	Diego REYES	2	FC Porto (POR)
30	3	Hector HERRERA	3	FC Porto (POR)
31	3	Miguel LAYUN	2	Club America (MEX)
32	3	Marco FABIAN	3	Cruz Azul FC (MEX)
33	3	Raul JIMENEZ	4	Club America (MEX)
34	3	Giovani DOS SANTOS	4	Villarreal CF (ESP)
35	3	Alan PULIDO	4	Tigres UANL (MEX)
36	3	Alfredo TALAVERA	1	Deportivo Toluca FC (MEX)
37	3	Guillermo OCHOA	1	AC Ajaccio (FRA)
38	3	Javier HERNANDEZ	4	Manchester United FC (ENG)
39	3	Hector MORENO	2	RCD Espanyol (ESP)
40	3	Miguel PONCE	2	Deportivo Toluca FC (MEX)
41	3	Isaac BRIZUELA	3	Deportivo Toluca FC (MEX)
42	3	Andres GUARDADO	2	Bayer 04 Leverkusen (GER)
43	3	Oribe PERALTA	4	Club Santos Laguna (MEX)
44	3	Javier AQUINO	3	Villarreal CF (ESP)
45	3	Carlos PENA	3	Club Leon (MEX)
46	3	Paul AGUILAR	2	Club America (MEX)
47	3	Jose VAZQUEZ	3	Club Leon (MEX)
49	20	Luis LOPEZ	1	Real Espana (HON)
50	20	Osman CHAVEZ	2	Qingdao Jonoon FC (CHN)
51	20	Maynor FIGUEROA	2	Hull City FC (ENG)
52	20	Juan MONTES	2	CD Motagua (HON)
53	20	Victor BERNARDEZ	2	San Jose Earthquakes (USA)
54	20	Juan Carlos GARCIA	2	Wigan Athletic FC (ENG)
55	20	Emilio IZAGUIRRE	3	Celtic FC (SCO)
56	20	Wilson PALACIOS	3	Stoke City FC (ENG)
57	20	Jerry PALACIOS	3	LD Alajuelense (CRC)
58	20	Marvin CHAVEZ	3	CD Chivas USA (USA)
59	20	Jerry BENGTSON	4	New England Revolution (USA)
60	20	Edder DELGADO	3	Real Espana (HON)
61	20	Carlo COSTLY	4	Real Espana (HON)
62	20	Boniek GARCIA	3	Houston Dynamo (USA)
63	20	Roger ESPINOZA	3	Wigan Athletic FC (ENG)
64	20	Rony MARTINEZ	4	CD Real Sociedad (HON)
65	20	Andy NAJAR	3	RSC Anderlecht (BEL)
66	20	Noel VALLADARES	1	CD Olimpia (HON)
67	20	Luis GARRIDO	3	CD Olimpia (HON)
68	20	Jorge CLAROS	3	CD Motagua (HON)
69	20	Brayan BECKELES	2	CD Olimpia (HON)
70	20	Donis ESCOBER	1	CD Olimpia (HON)
71	20	Mario MARTINEZ	3	Real Espana (HON)
73	14	Keylor NAVAS	1	Levante UD (ESP)
74	14	Johnny ACOSTA	2	LD Alajuelense (CRC)
75	14	Giancarlo GONZALEZ	2	Columbus Crew (USA)
76	14	Michael UMANA	2	Deportivo Saprissa (CRC)
77	14	Celso BORGES	3	AIK Solna (SWE)
78	14	Oscar DUARTE	2	Club Brugge KV (BEL)
79	14	Christian BOLANOS	3	FC Kobenhavn (DEN)
80	14	Heiner MORA	2	Deportivo Saprissa (CRC)
81	14	Joel CAMPBELL	4	Olympiacos Piraeus FC (GRE)
82	14	Bryan RUIZ	4	PSV Eindhoven (NED)
83	14	Michael BARRANTES	3	Aalesunds FK (NOR)
84	14	Waylon FRANCIS	2	Columbus Crew (USA)
85	14	Oscar GRANADOS	3	CS Herediano (CRC)
86	14	Randall BRENES	4	CSD Cartagines (CRC)
87	14	Junior DIAZ	2	FSV Mainz 05 (GER)
88	14	Cristian GAMBOA	2	Rosenborg BK (NOR)
89	14	Yeltsin TEJEDA	3	Deportivo Saprissa (CRC)
90	14	Patrick PEMBERTON	1	LD Alajuelense (CRC)
91	14	Roy MILLER	2	New York Red Bulls (USA)
92	14	Diego CALVO	3	Valerenga IF (NOR)
93	14	Marcos URENA	4	Kuban Krasnodar (RUS)
94	14	Jose CUBERO	3	CS Herediano (CRC)
95	14	Daniel CAMBRONERO	1	CS Herediano (CRC)
97	18	Maximo BANGUERA	1	Barcelona SC (ECU)
98	18	Jorge GUAGUA	2	CS Emelec (ECU)
99	18	Frickson ERAZO	2	CR Flamengo (BRA)
100	18	Juan PAREDES	2	Barcelona SC (ECU)
101	18	Alex IBARRA	3	Vitesse Arnheim (NED)
102	18	Cristhian NOBOA	3	FC Dynamo Moscow (RUS)
103	18	Jefferson MONTERO	3	CA Monarcas Morelia (MEX)
104	18	Edison MENDEZ	3	Independiente Santa Fe (COL)
105	18	Joao ROJAS	4	Cruz Azul FC (MEX)
106	18	Walter AYOVI	3	CF Pachuca (MEX)
107	18	Felipe CAICEDO	4	Al Jazira SCC (UAE)
108	18	Adrian BONE	1	CD El Nacional (ECU)
109	18	Enner VALENCIA	4	CF Pachuca (MEX)
110	18	Segundo CASTILLO	3	Al Hilal FC (KSA)
111	18	Michael ARROYO	3	Atlante FC (MEX)
112	18	Antonio VALENCIA	3	Manchester United FC (ENG)
113	18	Jaimen AYOVI	4	Club Tijuana (MEX)
114	18	Oscar BAGUI	2	CS Emelec (ECU)
115	18	Luis SARITAMA	3	Barcelona SC (ECU)
116	18	Fidel MARTINEZ	3	Club Tijuana (MEX)
117	18	Gabriel ACHILIER	2	CS Emelec (ECU)
118	18	Alexander DOMINGUEZ	1	LDU Quito (ECU)
119	18	Carlos GRUEZO	3	VfB Stuttgart (GER)
121	1	JEFFERSON	1	Botafogo FR (BRA)
122	1	DANI ALVES	2	FC Barcelona (ESP)
123	1	THIAGO SILVA	2	Paris Saint-Germain FC (FRA)
124	1	DAVID LUIZ	2	Chelsea FC (ENG)
125	1	FERNANDINHO	3	Manchester City FC (ENG)
126	1	MARCELO	2	Real Madrid CF (ESP)
127	1	HULK	4	FC Zenit St. Petersburg (RUS)
128	1	PAULINHO	3	Tottenham Hotspur FC (ENG)
129	1	FRED	4	Fluminense FC (BRA)
130	1	NEYMAR	4	FC Barcelona (ESP)
131	1	OSCAR	3	Chelsea FC (ENG)
132	1	JULIO CESAR	1	Toronto FC (CAN)
133	1	DANTE	2	FC Bayern Muenchen (GER)
134	1	MAXWELL	2	Paris Saint-Germain FC (FRA)
135	1	HENRIQUE	2	SSC Napoli (ITA)
136	1	RAMIRES	3	Chelsea FC (ENG)
137	1	LUIZ GUSTAVO	3	VfL Wolfsburg (GER)
138	1	HERNANES	3	FC Internazionale (ITA)
139	1	WILLIAN	3	Chelsea FC (ENG)
140	1	BERNARD	4	Shakhtar Donetsk (UKR)
141	1	JO	4	Atletico Mineiro (BRA)
142	1	VICTOR	1	Atletico Mineiro (BRA)
143	1	MAICON	2	AS Roma (ITA)
145	21	Sergio ROMERO	1	AS Monaco (FRA)
146	21	Ezequiel GARAY	2	SL Benfica (POR)
147	21	Hugo CAMPAGNARO	2	FC Internazionale (ITA)
148	21	Pablo ZABALETA	2	Manchester City FC (ENG)
149	21	Fernando GAGO	3	CA Boca Juniors (ARG)
150	21	Lucas BIGLIA	3	SS Lazio (ITA)
151	21	Angel DI MARIA	3	Real Madrid CF (ESP)
152	21	Enzo PEREZ	3	SL Benfica (POR)
153	21	Gonzalo HIGUAIN	4	SSC Napoli (ITA)
154	21	Lionel MESSI	4	FC Barcelona (ESP)
155	21	Maxi RODRIGUEZ	3	CA Newells Old Boys (ARG)
156	21	Agustin ORION	1	CA Boca Juniors (ARG)
157	21	Augusto FERNANDEZ	3	Celta Vigo (ESP)
158	21	Javier MASCHERANO	3	FC Barcelona (ESP)
159	21	Martin DEMICHELIS	2	Manchester City FC (ENG)
160	21	Marcos ROJO	2	Sporting CP (POR)
161	21	Federico FERNANDEZ	2	SSC Napoli (ITA)
162	21	Rodrigo PALACIO	4	FC Internazionale (ITA)
163	21	Ricardo ALVAREZ	3	FC Internazionale (ITA)
164	21	Sergio AGUERO	4	Manchester City FC (ENG)
165	21	Mariano ANDUJAR	1	Calcio Catania (ITA)
166	21	Ezequiel LAVEZZI	4	Paris Saint-Germain FC (FRA)
167	21	Jose Maria BASANTA	2	CF Monterrey (MEX)
169	15	Joe HART	1	Manchester City FC (ENG)
170	15	Glen JOHNSON	2	Liverpool FC (ENG)
171	15	Leighton BAINES	2	Everton FC (ENG)
172	15	Steven GERRARD	3	Liverpool FC (ENG)
173	15	Gary CAHILL	2	Chelsea FC (ENG)
174	15	Phil JAGIELKA	2	Everton FC (ENG)
175	15	Jack WILSHERE	3	Arsenal FC (ENG)
176	15	Frank LAMPARD	3	Chelsea FC (ENG)
177	15	Daniel STURRIDGE	4	Liverpool FC (ENG)
178	15	Wayne ROONEY	4	Manchester United FC (ENG)
179	15	Danny WELBECK	4	Manchester United FC (ENG)
180	15	Chris SMALLING	2	Manchester United FC (ENG)
181	15	Ben FOSTER	1	West Bromwich Albion FC (ENG)
182	15	Jordan HENDERSON	3	Liverpool FC (ENG)
183	15	Alex OXLADE CHAMBERLAIN	3	Arsenal FC (ENG)
184	15	Phil JONES	2	Manchester United FC (ENG)
185	15	James MILNER	3	Manchester City FC (ENG)
186	15	Rickie LAMBERT	4	Southampton FC (ENG)
187	15	Raheem STERLING	3	Liverpool FC (ENG)
188	15	Adam LALLANA	3	Southampton FC (ENG)
189	15	Ross BARKLEY	3	Everton FC (ENG)
190	15	Fraser FORSTER	1	Celtic FC (SCO)
191	15	Luke SHAW	2	Southampton FC (ENG)
193	29	Thibaut COURTOIS	1	Atletico Madrid (ESP)
194	29	Toby ALDERWEIRELD	2	Atletico Madrid (ESP)
195	29	Thomas VERMAELEN	2	Arsenal FC (ENG)
196	29	Vincent KOMPANY	2	Manchester City FC (ENG)
197	29	Jan VERTONGHEN	2	Tottenham Hotspur FC (ENG)
198	29	Axel WITSEL	3	FC Zenit St. Petersburg (RUS)
199	29	Kevin DE BRUYNE	3	VfL Wolfsburg (GER)
200	29	Marouane FELLAINI	3	Manchester United FC (ENG)
201	29	Romelu LUKAKU	4	Everton FC (ENG)
202	29	Eden HAZARD	3	Chelsea FC (ENG)
203	29	Kevin MIRALLAS	4	Everton FC (ENG)
204	29	Simon MIGNOLET	1	Liverpool FC (ENG)
205	29	Sammy BOSSUT	1	SV Zulte Waregem (BEL)
206	29	Dries MERTENS	3	SSC Napoli (ITA)
207	29	Daniel VAN BUYTEN	2	FC Bayern Muenchen (GER)
208	29	Steven DEFOUR	3	FC Porto (POR)
209	29	Divock ORIGI	4	Lille OSC (FRA)
210	29	Nicolas LOMBAERTS	2	FC Zenit St. Petersburg (RUS)
211	29	Moussa DEMBELE	3	Tottenham Hotspur FC (ENG)
212	29	Adnan JANUZAJ	3	Manchester United FC (ENG)
213	29	Anthony VANDEN BORRE	2	RSC Anderlecht (BEL)
214	29	Nacer CHADLI	3	Tottenham Hotspur FC (ENG)
215	29	Laurent CIMAN	2	Standard Liege (BEL)
217	25	Manuel NEUER	1	FC Bayern Muenchen (GER)
218	25	Kevin GROSSKREUTZ	2	Borussia Dortmund (GER)
219	25	Matthias GINTER	2	SC Freiburg (GER)
220	25	Benedikt HOEWEDES	2	FC Schalke 04 (GER)
221	25	Mats HUMMELS	2	Borussia Dortmund (GER)
222	25	Sami KHEDIRA	3	Real Madrid CF (ESP)
223	25	Bastian SCHWEINSTEIGER	3	FC Bayern Muenchen (GER)
224	25	Mesut OEZIL	3	Arsenal FC (ENG)
225	25	Andre SCHUERRLE	4	Chelsea FC (ENG)
226	25	Lukas PODOLSKI	4	Arsenal FC (ENG)
227	25	Miroslav KLOSE	4	SS Lazio (ITA)
228	25	Ron-Robert ZIELER	1	Hannover 96 (GER)
229	25	Thomas MUELLER	4	FC Bayern Muenchen (GER)
230	25	Julian DRAXLER	3	FC Schalke 04 (GER)
231	25	Erik DURM	2	Borussia Dortmund (GER)
232	25	Philipp LAHM	3	FC Bayern Muenchen (GER)
233	25	Per MERTESACKER	2	Arsenal FC (ENG)
234	25	Toni KROOS	3	FC Bayern Muenchen (GER)
235	25	Mario GOETZE	4	FC Bayern Muenchen (GER)
236	25	Jerome BOATENG	2	FC Bayern Muenchen (GER)
237	25	Marco REUS	4	Borussia Dortmund (GER)
238	25	Roman WEIDENFELLER	1	Borussia Dortmund (GER)
239	25	Christoph KRAMER	3	Borussia Moenchengladbach (GER)
241	19	Hugo LLORIS	1	Tottenham Hotspur FC (ENG)
242	19	Mathieu DEBUCHY	2	Newcastle United FC (ENG)
243	19	Patrice EVRA	2	Manchester United FC (ENG)
244	19	Raphael VARANE	2	Real Madrid CF (ESP)
245	19	Mamadou SAKHO	2	Liverpool FC (ENG)
246	19	Yohan CABAYE	3	Paris Saint-Germain FC (FRA)
247	19	Franck RIBERY	4	FC Bayern Muenchen (GER)
248	19	Mathieu VALBUENA	3	Olympique Marseille (FRA)
249	19	Olivier GIROUD	4	Arsenal FC (ENG)
250	19	Karim BENZEMA	4	Real Madrid CF (ESP)
251	19	Antoine GRIEZMANN	4	Real Sociedad (ESP)
252	19	Rio MAVUBA	3	Lille OSC (FRA)
253	19	Eliaquim MANGALA	2	FC Porto (POR)
254	19	Blaise MATUIDI	3	Paris Saint-Germain FC (FRA)
255	19	Bacary SAGNA	2	Arsenal FC (ENG)
256	19	Stephane RUFFIER	1	AS Saint-Etienne (FRA)
257	19	Lucas DIGNE	2	Paris Saint-Germain FC (FRA)
258	19	Moussa SISSOKO	3	Newcastle United FC (ENG)
259	19	Paul POGBA	3	Juventus FC (ITA)
260	19	Loic REMY	4	Newcastle United FC (ENG)
261	19	Laurent KOSCIELNY	2	Arsenal FC (ENG)
262	19	Clement GRENIER	3	Olympique Lyonnais (FRA)
263	19	Mickael LANDREAU	1	SC Bastia (FRA)
265	17	Diego BENAGLIO	1	VfL Wolfsburg (GER)
266	17	Stephan LICHTSTEINER	2	Juventus FC (ITA)
267	17	Reto ZIEGLER	2	US Sassuolo (ITA)
268	17	Philippe SENDEROS	2	Valencia CF (ESP)
269	17	Steve VON BERGEN	2	BSC Young Boys (SUI)
270	17	Michael LANG	2	Grasshopper Club (SUI)
271	17	Tranquillo BARNETTA	3	Eintracht Frankfurt (GER)
272	17	Gokhan INLER	3	SSC Napoli (ITA)
273	17	Haris SEFEROVIC	4	Real Sociedad (ESP)
274	17	Granit XHAKA	3	Borussia Moenchengladbach (GER)
275	17	Valon BEHRAMI	3	SSC Napoli (ITA)
276	17	Yann SOMMER	1	FC Basel (SUI)
277	17	Ricardo RODRIGUEZ	2	VfL Wolfsburg (GER)
278	17	Valentin STOCKER	3	FC Basel (SUI)
279	17	Blerim DZEMAILI	3	SSC Napoli (ITA)
280	17	Gelson FERNANDES	3	SC Freiburg (GER)
281	17	Mario GAVRANOVIC	4	FC Zuerich (SUI)
282	17	Admir MEHMEDI	4	SC Freiburg (GER)
283	17	Josip DRMIC	4	1. FC Nuernberg (GER)
284	17	Johan DJOUROU	2	Hamburger SV (GER)
285	17	Roman BUERKI	1	Grasshopper Club (SUI)
286	17	Fabian SCHAER	2	FC Basel (SUI)
287	17	Xherdan SHAQIRI	3	FC Bayern Muenchen (GER)
289	2	Stipe PLETIKOSA	1	FC Rostov (RUS)
290	2	Sime VRSALJKO	2	Genoa CFC (ITA)
291	2	Danijel PRANJIC	2	Panathinaikos FC (GRE)
292	2	Ivan PERISIC	3	VfL Wolfsburg (GER)
293	2	Vedran CORLUKA	2	FC Lokomotiv Moscow (RUS)
294	2	Dejan LOVREN	2	Southampton FC (ENG)
295	2	Ivan RAKITIC	3	Sevilla FC (ESP)
296	2	Ognjen VUKOJEVIC	3	FC Dynamo Kyiv (UKR)
297	2	Nikica JELAVIC	4	Hull City FC (ENG)
298	2	Luka MODRIC	3	Real Madrid CF (ESP)
299	2	Darijo SRNA	2	Shakhtar Donetsk (UKR)
300	2	Oliver ZELENIKA	1	NK Lokomotiva Zagreb (CRO)
301	2	Gordon SCHILDENFELD	2	Panathinaikos FC (GRE)
302	2	Marcelo BROZOVIC	3	GNK Dinamo Zagreb (CRO)
303	2	Ivan MOCINIC	3	HNK Rijeka (CRO)
304	2	Ante REBIC	4	ACF Fiorentina (ITA)
305	2	Mario MANDZUKIC	4	FC Bayern Muenchen (GER)
306	2	Ivica OLIC	4	VfL Wolfsburg (GER)
307	2	SAMMIR	3	Getafe CF (ESP)
308	2	Mateo KOVACIC	3	FC Internazionale (ITA)
309	2	Domagoj VIDA	2	FC Dynamo Kyiv (UKR)
310	2	EDUARDO	4	Shakhtar Donetsk (UKR)
311	2	Danijel SUBASIC	1	AS Monaco (FRA)
313	22	Asmir BEGOVIC	1	Stoke City FC (ENG)
314	22	Avdija VRSAJEVIC	3	HNK Hajduk Split (CRO)
315	22	Ermin BICAKCIC	2	Eintracht Braunschweig (GER)
316	22	Emir SPAHIC	2	Bayer 04 Leverkusen (GER)
317	22	Sead KOLASINAC	2	FC Schalke 04 (GER)
318	22	Ognjen VRANJES	2	Elazigspor (TUR)
319	22	Muhamed BESIC	3	Ferencvarosi TC (HUN)
320	22	Miralem PJANIC	3	AS Roma (ITA)
321	22	Vedad IBISEVIC	4	VfB Stuttgart (GER)
322	22	Zvjezdan MISIMOVIC	3	Guizhou Renhe FC (CHN)
323	22	Edin DZEKO	4	Manchester City FC (ENG)
324	22	Jasmin FEJZIC	1	VfR Aalen (GER)
325	22	Mensur MUJDZA	3	SC Freiburg (GER)
326	22	Tino Sven SUSIC	3	HNK Hajduk Split (CRO)
327	22	Toni SUNJIC	2	FC Zorya Lugansk (UKR)
328	22	Senad LULIC	3	SS Lazio (ITA)
329	22	Senijad IBRICIC	3	Kayseri Erciyesspor (TUR)
330	22	Haris MEDUNJANIN	3	Gaziantepspor (TUR)
331	22	Edin VISCA	4	Istanbul BBSK (TUR)
332	22	Izet HAJROVIC	3	Galatasaray SK (TUR)
333	22	Anel HADZIC	3	SK Sturm Graz (AUT)
334	22	Asmir AVDUKIC	1	FK Borac Banja Luka (BIH)
335	22	Sejad SALIHOVIC	3	TSG 1899 Hoffenheim (GER)
337	16	Gianluigi BUFFON	1	Juventus FC (ITA)
338	16	Mattia DE SCIGLIO	2	AC Milan (ITA)
339	16	Giorgio CHIELLINI	2	Juventus FC (ITA)
340	16	Matteo DARMIAN	2	Torino FC (ITA)
341	16	THIAGO MOTTA	3	Paris Saint-Germain FC (FRA)
342	16	Antonio CANDREVA	3	SS Lazio (ITA)
343	16	Ignazio ABATE	2	AC Milan (ITA)
344	16	Claudio MARCHISIO	3	Juventus FC (ITA)
345	16	Mario BALOTELLI	4	AC Milan (ITA)
346	16	Antonio CASSANO	4	Parma FC (ITA)
347	16	Alessio CERCI	4	Torino FC (ITA)
348	16	Salvatore SIRIGU	1	Paris Saint-Germain FC (FRA)
349	16	Mattia PERIN	1	Genoa CFC (ITA)
350	16	Alberto AQUILANI	3	ACF Fiorentina (ITA)
351	16	Andrea BARZAGLI	2	Juventus FC (ITA)
352	16	Daniele DE ROSSI	3	AS Roma (ITA)
353	16	Ciro IMMOBILE	4	Torino FC (ITA)
354	16	Marco PAROLO	3	Parma FC (ITA)
355	16	Leonardo BONUCCI	2	Juventus FC (ITA)
356	16	Gabriel PALETTA	2	Parma FC (ITA)
357	16	Andrea PIRLO	3	Juventus FC (ITA)
358	16	Lorenzo INSIGNE	4	SSC Napoli (ITA)
359	16	Marco VERRATTI	3	Paris Saint-Germain FC (FRA)
361	5	Iker CASILLAS	1	Real Madrid CF (ESP)
362	5	Raul ALBIOL	2	SSC Napoli (ITA)
363	5	Gerard PIQUE	2	FC Barcelona (ESP)
364	5	Javi MARTINEZ	3	FC Bayern Muenchen (GER)
365	5	JUANFRAN	2	Atletico Madrid (ESP)
366	5	Andres INIESTA	3	FC Barcelona (ESP)
367	5	David VILLA	4	Atletico Madrid (ESP)
368	5	Xavi HERNANDEZ	3	FC Barcelona (ESP)
369	5	Fernando TORRES	4	Chelsea FC (ENG)
370	5	Cesc FABREGAS	3	FC Barcelona (ESP)
371	5	Pedro RODRIGUEZ	4	FC Barcelona (ESP)
372	5	David DE GEA	1	Manchester United FC (ENG)
373	5	Juan MATA	4	Manchester United FC (ENG)
374	5	Xabi ALONSO	3	Real Madrid CF (ESP)
375	5	Sergio RAMOS	2	Real Madrid CF (ESP)
376	5	Sergio BUSQUETS	3	FC Barcelona (ESP)
377	5	KOKE	3	Atletico Madrid (ESP)
378	5	Jordi ALBA	2	FC Barcelona (ESP)
379	5	Diego COSTA	4	Atletico Madrid (ESP)
380	5	Santi CAZORLA	3	Arsenal FC (ENG)
381	5	David SILVA	3	Manchester City FC (ENG)
382	5	Cesar AZPILICUETA	3	Chelsea FC (ENG)
383	5	Pepe REINA	1	SSC Napoli (ITA)
385	26	EDUARDO	1	Sporting Braga (POR)
386	26	BRUNO ALVES	2	Fenerbahce SK (TUR)
387	26	PEPE	2	Real Madrid CF (ESP)
388	26	MIGUEL VELOSO	3	FC Dynamo Kyiv (UKR)
389	26	FABIO COENTRAO	2	Real Madrid CF (ESP)
390	26	WILLIAM	3	Sporting CP (POR)
391	26	CRISTIANO RONALDO	4	Real Madrid CF (ESP)
392	26	JOAO MOUTINHO	3	AS Monaco (FRA)
393	26	HUGO ALMEIDA	4	Besiktas JK (TUR)
394	26	VIEIRINHA	4	VfL Wolfsburg (GER)
395	26	EDER	4	Sporting Braga (POR)
396	26	RUI PATRICIO	1	Sporting CP (POR)
397	26	RICARDO COSTA	2	Valencia CF (ESP)
398	26	LUIS NETO	2	FC Zenit St. Petersburg (RUS)
399	26	RAFA	4	Sporting Braga (POR)
400	26	RAUL MEIRELES	3	Fenerbahce SK (TUR)
401	26	NANI	4	Manchester United FC (ENG)
402	26	VARELA	4	FC Porto (POR)
403	26	ANDRE ALMEIDA	2	SL Benfica (POR)
404	26	RUBEN AMORIM	3	SL Benfica (POR)
405	26	JOAO PEREIRA	2	Valencia CF (ESP)
406	26	BETO	1	Sevilla FC (ESP)
407	26	HELDER POSTIGA	4	SS Lazio (ITA)
408	26	PAULO BENTO	5	(POR)
409	10	Orestis KARNEZIS	1	Granada CF (ESP)
410	10	Ioannis MANIATIS	3	Olympiacos Piraeus FC (GRE)
411	10	Georgios TZAVELAS	2	PAOK FC (GRE)
412	10	Konstantinos MANOLAS	2	Olympiacos Piraeus FC (GRE)
413	10	Vangelis MORAS	2	Hellas Verona FC (ITA)
414	10	Alexandros TZIOLIS	3	Kayserispor (TUR)
415	10	Georgios SAMARAS	4	Celtic FC (SCO)
416	10	Panagiotis KONE	3	Bologna FC (ITA)
417	10	Konstantinos MITROGLOU	4	Fulham FC (ENG)
418	10	Georgios KARAGOUNIS	3	Fulham FC (ENG)
419	10	Loukas VYNTRA	2	Levante UD (ESP)
420	10	Panagiotis GLYKOS	1	PAOK FC (GRE)
421	10	Stefanos KAPINO	1	Panathinaikos FC (GRE)
422	10	Dimitrios SALPINGIDIS	4	PAOK FC (GRE)
423	10	Vasileios TOROSIDIS	2	AS Roma (ITA)
424	10	Lazaros CHRISTODOULOPOULOS	3	Bologna FC (ITA)
425	10	Theofanis GEKAS	4	Konyaspor (TUR)
426	10	Ioannis FETFATZIDIS	4	Genoa CFC (ITA)
427	10	Sokratis PAPASTATHOPOULOS	2	Borussia Dortmund (GER)
428	10	Jose CHOLEVAS	2	Olympiacos Piraeus FC (GRE)
429	10	Konstantinos KATSOURANIS	3	PAOK FC (GRE)
430	10	Andreas SAMARIS	3	Olympiacos Piraeus FC (GRE)
431	10	Panagiotis TACHTSIDIS	3	Torino FC (ITA)
433	30	Cedric SI MOHAMMED	1	CS Constantine (ALG)
434	30	Madjid BOUGUERRA	2	Lekhwiya SC (QAT)
435	30	Faouzi GHOULAM	2	SSC Napoli (ITA)
436	30	Esseid BELKALEM	2	Watford FC (ENG)
437	30	Rafik HALLICHE	2	Academica Coimbra (POR)
438	30	Djamel MESBAH	2	AS Livorno (ITA)
439	30	Hassan YEBDA	3	Udinese Calcio (ITA)
440	30	Medhi LACEN	3	Getafe CF (ESP)
441	30	Nabil GHILAS	4	FC Porto (POR)
442	30	Sofiane FEGHOULI	4	Valencia CF (ESP)
443	30	Yacine BRAHIMI	3	Granada CF (ESP)
444	30	Carl MEDJANI	2	Valenciennes FC (FRA)
445	30	Islam SLIMANI	4	Sporting CP (POR)
446	30	Nabil BENTALEB	3	Tottenham Hotspur FC (ENG)
447	30	El Arabi SOUDANI	4	GNK Dinamo Zagreb (CRO)
448	30	Mohamed ZEMMAMOUCHE	1	USM Alger (ALG)
449	30	Liassine CADAMURO	2	RCD Mallorca (ESP)
450	30	Abdelmoumene DJABOU	4	Club Africain (TUN)
451	30	Saphir TAIDER	3	FC Internazionale (ITA)
452	30	Aissa MANDI	2	Stade de Reims (FRA)
453	30	Riyad MAHREZ	4	Leicester City FC (ENG)
454	30	Mehdi MOSTEFA	3	AC Ajaccio (FRA)
455	30	Rais MBOLHI	1	CSKA Sofia (BUL)
457	23	Rahman AHMADI	1	Sepahan FC (IRN)
458	23	Khosro HEYDARI	4	Esteghlal Tehran FC (IRN)
459	23	Ehsan HAJI SAFI	3	Sepahan FC (IRN)
460	23	Jalal HOSSEINI	2	Perspolis FC (IRN)
461	23	Amirhossein SADEGHI	2	Esteghlal Tehran FC (IRN)
462	23	Javad NEKOUNAM	3	Kuwait SC (KUW)
463	23	Masoud SHOJAEI	4	UD Las Palmas (ESP)
464	23	Reza HAGHIGHI	3	Perspolis FC (IRN)
465	23	Alireza JAHAN BAKHSH	4	NEC Nijmegen (NED)
466	23	Karim ANSARI FARD	4	Tractor Sazi Tabriz FC (IRN)
467	23	Ghasem HADADIFAR	3	Zob Ahan Isfahan FC (IRN)
468	23	Alireza HAGHIGHI	1	Sporting Covilha (POR)
469	23	Hossein MAHINI	2	Perspolis FC (IRN)
470	23	Andranik TIMOTIAN	3	Esteghlal Tehran FC (IRN)
471	23	Pejman MONTAZERI	2	Umm Salal SC (QAT)
472	23	Reza GHOOCHANNEJAD	4	Charlton Athletic FC (ENG)
473	23	Ahmad ALNAMEH	2	Naft Tehran FC (IRN)
474	23	Bakhtiar RAHMANI	3	Foolad Khuzestan FC (IRN)
475	23	Hashem BEIKZADEH	3	Esteghlal Tehran FC (IRN)
476	23	Steven BEITASHOUR	2	Vancouver Whitecaps FC (CAN)
477	23	Ashkan DEJAGAH	4	Fulham FC (ENG)
478	23	Daniel DAVARI	1	Eintracht Braunschweig (GER)
479	23	Mehrdad POOLADI	2	Perspolis FC (IRN)
481	27	Stephen ADAMS	1	Aduana Stars (GHA)
482	27	Samuel INKOOM	2	FC Platanias (GRE)
483	27	Asamoah GYAN	4	Al Ain FC (UAE)
484	27	Daniel OPARE	2	Standard Liege (BEL)
485	27	Michael ESSIEN	3	AC Milan (ITA)
486	27	Acquah AFRIYIE	3	Parma FC (ITA)
487	27	Christian ATSU	3	Vitesse Arnheim (NED)
488	27	Emmanuel AGYEMANG BADU	3	Udinese Calcio (ITA)
489	27	Kevin Prince BOATENG	4	FC Schalke 04 (GER)
490	27	Andre AYEW	3	Olympique Marseille (FRA)
491	27	Sulley MUNTARI	3	AC Milan (ITA)
492	27	Adam KWARASEY	1	Stromsgodset IF (NOR)
493	27	Jordan AYEW	4	FC Sochaux-Montbéliard (FRA)
494	27	Albert ADOMAH	3	Middlesbrough FC (ENG)
495	27	Rashid SUMAILA	2	Mamelodi Sundowns FC (RSA)
496	27	Fatawu DAUDA	1	Orlando Pirates (RSA)
497	27	Mohammed RABIU	3	Kuban Krasnodar (RUS)
498	27	Majeed WARIS	4	Valenciennes FC (FRA)
499	27	Jonathan MENSAH	2	Evian TG FC (FRA)
500	27	Kwadwo ASAMOAH	3	Juventus FC (ITA)
501	27	John BOYE	2	Stade Rennais FC (FRA)
502	27	Mubarak WAKASO	3	FC Rubin Kazan (RUS)
503	27	Harrison AFFUL	2	Esperance Sportive de Tunis (TUN)
505	24	Vincent ENYEAMA	1	Lille OSC (FRA)
506	24	Joseph YOBO	2	Norwich City FC (ENG)
507	24	Uwa ECHIEJILE	2	AS Monaco (FRA)
508	24	Ruben GABRIEL	3	KV Waasland-Beveren (BEL)
509	24	Efe AMBROSE	2	Celtic FC (SCO)
510	24	Azubuike EGWUEKWE	2	Warri Wolves FC (NGA)
511	24	Ahmed MUSA	4	CSKA Moscow (RUS)
432	10	Fernando SANTOS	5	(POR)
512	24	Peter ODEMWINGIE	4	Stoke City FC (ENG)
513	24	Emmanuel EMENIKE	4	Fenerbahce SK (TUR)
514	24	John Obi MIKEL	3	Chelsea FC (ENG)
515	24	Victor MOSES	4	Liverpool FC (ENG)
516	24	Ebenezer ODUNLAMI	2	Sunshine Stars FC (NGA)
517	24	Juwon OSHANIWA	2	FC Ashdod (ISR)
518	24	Godfrey OBOABONA	2	Caykur Rizespor (TUR)
519	24	Ramon AZEEZ	3	UD Almeria (ESP)
520	24	Austine EJIDE	1	Hapoel Be'er Sheva FC (ISR)
521	24	Ogenyi ONAZI	3	SS Lazio (ITA)
522	24	Michael BABATUNDE	4	FC Volyn Lutsk (UKR)
523	24	Uche NWOFOR	4	SC Heerenveen (NED)
524	24	Okechukwu UCHEBO	4	Cercle Brugge (BEL)
525	24	Chigozie AGBIM	1	Enugu Rangers FC (NGA)
526	24	Kenneth OMERUO	2	Middlesbrough FC (ENG)
527	24	Shola AMEOBI	4	Newcastle United FC (ENG)
529	4	Loic FEUDJOU	1	Coton Sport FC (CMR)
530	4	Benoit ASSOU EKOTTO	2	Queens Park Rangers FC (ENG)
531	4	Nicolas NKOULOU	2	Olympique Marseille (FRA)
532	4	Cedric DJEUGOUE	2	Coton Sport FC (CMR)
533	4	Dany NOUNKEU	2	Besiktas JK (TUR)
534	4	Alexandre SONG	3	FC Barcelona (ESP)
535	4	Landry NGUEMO	3	FC Girondins Bordeaux (FRA)
536	4	Benjamin MOUKANDJO	4	AS Nancy (FRA)
537	4	Samuel ETOO	4	Chelsea FC (ENG)
538	4	Vincent ABOUBAKAR	4	FC Lorient (FRA)
539	4	Jean MAKOUN	3	Stade Rennais FC (FRA)
540	4	Henri BEDIMO	2	Olympique Lyonnais (FRA)
541	4	Eric CHOUPO MOTING	4	FSV Mainz 05 (GER)
542	4	Aurelien CHEDJOU	2	Galatasaray SK (TUR)
543	4	Pierre WEBO	4	Fenerbahce SK (TUR)
544	4	Charles ITANDJE	1	Konyaspor (TUR)
545	4	Stephane MBIA	3	Sevilla FC (ESP)
546	4	Enoh EYONG	3	Antalyaspor AS (TUR)
547	4	Fabrice OLINGA	4	SV Zulte Waregem (BEL)
548	4	Edgar SALLI	3	RC Lens (FRA)
549	4	Joel MATIP	3	FC Schalke 04 (GER)
550	4	Allan NYOM	2	Granada CF (ESP)
551	4	Sammy NDJOCK	1	Fethiyespor (TUR)
553	12	Eiji KAWASHIMA	1	Standard Liege (BEL)
554	12	Atsuto UCHIDA	2	FC Schalke 04 (GER)
555	12	Gotoku SAKAI	2	VfB Stuttgart (GER)
556	12	Keisuke HONDA	4	AC Milan (ITA)
557	12	Yuto NAGATOMO	2	FC Internazionale (ITA)
558	12	Masato MORISHIGE	2	FC Tokyo (JPN)
559	12	Yasuhito ENDO	3	Gamba Osaka (JPN)
560	12	Hiroshi KIYOTAKE	4	1. FC Nuernberg (GER)
561	12	Shinji OKAZAKI	4	FSV Mainz 05 (GER)
562	12	Shinji KAGAWA	4	Manchester United FC (ENG)
563	12	Yoichiro KAKITANI	4	Cerezo Osaka (JPN)
564	12	Shusaku NISHIKAWA	1	Urawa Red Diamonds (JPN)
565	12	Yoshito OKUBO	4	Kawasaki Frontale (JPN)
566	12	Toshihiro AOYAMA	3	Sanfrecce Hiroshima (JPN)
567	12	Yasuyuki KONNO	2	Gamba Osaka (JPN)
568	12	Hotaru YAMAGUCHI	3	Cerezo Osaka (JPN)
569	12	Makoto HASEBE	3	1. FC Nuernberg (GER)
570	12	Yuya OSAKO	4	TSV 1860 Muenchen (GER)
571	12	Masahiko INOHA	2	Jubilo Iwata (JPN)
572	12	Manabu SAITO	4	Yokohama F-Marinos (JPN)
573	12	Hiroki SAKAI	2	Hannover 96 (GER)
574	12	Maya YOSHIDA	2	Southampton FC (ENG)
575	12	Shuichi GONDA	1	FC Tokyo (JPN)
577	32	JUNG Sungryong	1	Suwon Bluewings FC (KOR)
578	32	KIM Changsoo	2	Kashiwa Reysol (JPN)
579	32	YUN Sukyoung	2	Queens Park Rangers FC (ENG)
580	32	KWAK Taehwi	2	Al Hilal FC (KSA)
581	32	KIM Younggwon	2	Guangzhou Evergrande FC (CHN)
582	32	HWANG Seokho	2	Sanfrecce Hiroshima (JPN)
583	32	KIM Bokyung	3	Cardiff City FC (WAL)
584	32	HA Daesung	3	Beijing Guoan (CHN)
585	32	SON Heungmin	3	Bayer 04 Leverkusen (GER)
586	32	PARK Chuyoung	4	Watford FC (ENG)
587	32	LEE Keunho	4	Sangju Sangmu FC (KOR)
588	32	LEE Yong	2	Ulsan Hyundai FC (KOR)
589	32	KOO Jacheol	4	FSV Mainz 05 (GER)
590	32	HAN Kookyoung	3	Kashiwa Reysol (JPN)
591	32	PARK Jongwoo	3	Guangzhou R&F FC (CHN)
592	32	KI Sungyueng	3	Sunderland AFC (ENG)
593	32	LEE Chungyong	3	Bolton Wanderers FC (ENG)
594	32	KIM Shinwook	4	Ulsan Hyundai FC (KOR)
595	32	JI Dongwon	3	FC Augsburg (GER)
596	32	HONG Jeongho	2	FC Augsburg (GER)
597	32	KIM Seunggyu	1	Ulsan Hyundai FC (KOR)
598	32	PARK Jooho	2	FSV Mainz 05 (GER)
599	32	LEE Bumyoung	1	Busan IPark FC (KOR)
601	31	Igor AKINFEEV	1	CSKA Moscow (RUS)
602	31	Aleksei KOZLOV	2	FC Dynamo Moscow (RUS)
603	31	Georgy SHCHENNIKOV	2	CSKA Moscow (RUS)
604	31	Sergey IGNASHEVICH	2	CSKA Moscow (RUS)
605	31	Andrey SEMENOV	2	FC Terek Grozny (RUS)
606	31	Maksim KANUNNIKOV	4	FK Amkar Perm (RUS)
607	31	Igor DENISOV	3	FC Dynamo Moscow (RUS)
608	31	Denis GLUSHAKOV	3	FC Spartak Moscow (RUS)
609	31	Alexander KOKORIN	4	FC Dynamo Moscow (RUS)
610	31	Alan DZAGOEV	3	CSKA Moscow (RUS)
611	31	Aleksandr KERZHAKOV	4	FC Zenit St. Petersburg (RUS)
612	31	Yury LODYGIN	1	FC Zenit St. Petersburg (RUS)
613	31	Vladimir GRANAT	2	FC Dynamo Moscow (RUS)
614	31	Vasily BEREZUTSKIY	2	CSKA Moscow (RUS)
615	31	Roman SHIROKOV	3	FC Krasnodar (RUS)
616	31	Sergey RYZHIKOV	1	FC Rubin Kazan (RUS)
617	31	Oleg SHATOV	3	FC Zenit St. Petersburg (RUS)
618	31	Yury ZHIRKOV	4	FC Dynamo Moscow (RUS)
619	31	Alexander SAMEDOV	4	FC Lokomotiv Moscow (RUS)
620	31	Victor FAYZULIN	3	FC Zenit St. Petersburg (RUS)
621	31	Alexey IONOV	4	FC Dynamo Moscow (RUS)
622	31	Andrey ESHCHENKO	2	FC Anzhi Makhachkala (RUS)
623	31	Dmitry KOMBAROV	2	FC Spartak Moscow (RUS)
625	28	Tim HOWARD	1	Everton FC (ENG)
626	28	DeAndre YEDLIN	2	Seattle Sounders FC (USA)
627	28	Omar GONZALEZ	2	Los Angeles Galaxy (USA)
628	28	Michael BRADLEY	3	Toronto FC (CAN)
629	28	Matt BESLER	2	Sporting Kansas City (USA)
630	28	John BROOKS	2	Hertha BSC (GER)
631	28	DaMarcus BEASLEY	2	Puebla FC (MEX)
632	28	Clint DEMPSEY	4	Seattle Sounders FC (USA)
633	28	Aron JOHANNSSON	4	AZ Alkmaar (NED)
634	28	Mix DISKERUD	3	Rosenborg BK (NOR)
635	28	Alejandro BEDOYA	3	FC Nantes (FRA)
636	28	Brad GUZAN	1	Aston Villa FC (ENG)
637	28	Jermaine JONES	3	Besiktas JK (TUR)
638	28	Brad DAVIS	3	Houston Dynamo (USA)
639	28	Kyle BECKERMAN	3	Real Salt Lake (USA)
640	28	Julian GREEN	3	FC Bayern Muenchen (GER)
641	28	Jozy ALTIDORE	4	Sunderland AFC (ENG)
642	28	Chris WONDOLOWSKI	4	San Jose Earthquakes (USA)
643	28	Graham ZUSI	3	Sporting Kansas City (USA)
644	28	Geoff CAMERON	2	Stoke City FC (ENG)
645	28	Timmy CHANDLER	2	1. FC Nuernberg (GER)
646	28	Nick RIMANDO	1	Real Salt Lake (USA)
647	28	Fabian JOHNSON	2	TSG 1899 Hoffenheim (GER)
649	9	David OSPINA	1	OGC Nice (FRA)
650	9	Cristian ZAPATA	2	AC Milan (ITA)
651	9	Mario YEPES	2	Atalanta Bergamo (ITA)
652	9	Santiago ARIAS	2	PSV Eindhoven (NED)
653	9	Aldo RAMIREZ	3	CA Monarcas Morelia (MEX)
654	9	Carlos SANCHEZ	3	Elche CF (ESP)
655	9	Pablo ARMERO	2	West Ham United FC (ENG)
656	9	Abel AGUILAR	3	Toulouse FC (FRA)
657	9	Teofilo GUTIERREZ	4	CA River Plate (ARG)
658	9	James RODRIGUEZ	3	AS Monaco (FRA)
659	9	Juan CUADRADO	3	ACF Fiorentina (ITA)
660	9	Camilo VARGAS	1	Independiente Santa Fe (COL)
661	9	Fredy GUARIN	3	FC Internazionale (ITA)
662	9	Victor IBARBO	4	Cagliari Calcio (ITA)
663	9	Alexander MEJIA	3	Atletico Nacional (COL)
664	9	Eder BALANTA	2	CA River Plate (ARG)
665	9	Carlos BACCA	4	Sevilla FC (ESP)
666	9	Juan ZUNIGA	2	SSC Napoli (ITA)
667	9	Adrian RAMOS	4	Hertha BSC (GER)
668	9	Juan QUINTERO	3	FC Porto (POR)
669	9	Jackson MARTINEZ	4	FC Porto (POR)
670	9	Faryd MONDRAGON	1	Deportivo Cali (COL)
671	9	Carlos VALDES	2	CA San Lorenzo de Almagro (ARG)
673	13	Fernando MUSLERA	1	Galatasaray SK (TUR)
674	13	Diego LUGANO	2	West Bromwich Albion FC (ENG)
675	13	Diego GODIN	2	Atletico Madrid (ESP)
676	13	Jorge FUCILE	2	FC Porto (POR)
677	13	Walter GARGANO	3	Parma FC (ITA)
678	13	Alvaro PEREIRA	3	Sao Paulo FC (BRA)
679	13	Cristian RODRIGUEZ	3	Atletico Madrid (ESP)
680	13	Abel HERNANDEZ	4	US Citta di Palermo (ITA)
681	13	Luis SUAREZ	4	Liverpool FC (ENG)
682	13	Diego FORLAN	4	Cerezo Osaka (JPN)
683	13	Cristhian STUANI	4	RCD Espanyol (ESP)
684	13	Rodrigo MUNOZ	1	Club Libertad (PAR)
685	13	Jose GIMENEZ	2	Atletico Madrid (ESP)
686	13	Nicolas LODEIRO	3	Botafogo FR (BRA)
687	13	Diego PEREZ	3	Bologna FC (ITA)
688	13	Maximiliano PEREIRA	2	SL Benfica (POR)
689	13	Egidio AREVALO	3	CA Monarcas Morelia (MEX)
690	13	Gaston RAMIREZ	3	Southampton FC (ENG)
691	13	Sebastian COATES	2	Club Nacional de Football (URU)
692	13	Alvaro GONZALEZ	3	SS Lazio (ITA)
693	13	Edinson CAVANI	4	Paris Saint-Germain FC (FRA)
694	13	Martin CACERES	2	Juventus FC (ITA)
695	13	Martin SILVA	1	CR Vasco da Gama (BRA)
697	6	Jasper CILLESSEN	1	AFC Ajax (NED)
698	6	Ron VLAAR	2	Aston Villa FC (ENG)
699	6	Stefan DE VRIJ	2	Feyenoord Rotterdam (NED)
700	6	Bruno MARTINS INDI	2	Feyenoord Rotterdam (NED)
701	6	Daley BLIND	2	AFC Ajax (NED)
702	6	Nigel DE JONG	3	AC Milan (ITA)
703	6	Daryl JANMAAT	2	Feyenoord Rotterdam (NED)
704	6	Jonathan DE GUZMAN	3	Swansea City AFC (WAL)
705	6	Robin VAN PERSIE	4	Manchester United FC (ENG)
706	6	Wesley SNEIJDER	3	Galatasaray SK (TUR)
707	6	Arjen ROBBEN	4	FC Bayern Muenchen (GER)
708	6	Paul VERHAEGH	2	FC Augsburg (GER)
709	6	Joel VELTMAN	2	AFC Ajax (NED)
710	6	Terence KONGOLO	2	Feyenoord Rotterdam (NED)
711	6	Dirk KUYT	4	Fenerbahce SK (TUR)
712	6	Jordy CLASIE	3	Feyenoord Rotterdam (NED)
713	6	Jeremain LENS	4	FC Dynamo Kyiv (UKR)
714	6	Leroy FER	3	Norwich City FC (ENG)
715	6	Klaas Jan HUNTELAAR	4	FC Schalke 04 (GER)
716	6	Georginio WIJNALDUM	3	PSV Eindhoven (NED)
717	6	Memphis DEPAY	4	PSV Eindhoven (NED)
718	6	Michel VORM	1	Swansea City AFC (WAL)
719	6	Tim KRUL	1	Newcastle United FC (ENG)
721	11	Boubacar BARRY	1	KSC Lokeren (BEL)
722	11	Ousmane DIARRASSOUBA	2	Caykur Rizespor (TUR)
723	11	Arthur BOKA	2	VfB Stuttgart (GER)
724	11	Kolo TOURE	2	Liverpool FC (ENG)
725	11	Didier ZOKORA	2	Trabzonspor (TUR)
726	11	Mathis BOLLY	3	Fortuna Duesseldorf (GER)
727	11	Jean Daniel AKPA	2	Toulouse FC (FRA)
728	11	Salomon KALOU	4	Lille OSC (FRA)
729	11	Ismael TIOTE	3	Newcastle United FC (ENG)
730	11	GERVINHO	4	AS Roma (ITA)
731	11	Didier DROGBA	4	Galatasaray SK (TUR)
732	11	Wilfried BONY	4	Swansea City AFC (WAL)
733	11	Konan YA	3	Hannover 96 (GER)
734	11	Ismael DIOMANDE	3	AS Saint-Etienne (FRA)
735	11	Max GRADEL	3	AS Saint-Etienne (FRA)
736	11	Sylvain GBOHOUO	1	Sewe Sport (CIV)
737	11	Serge AURIER	2	Toulouse FC (FRA)
738	11	Constant DJAKPA	2	Eintracht Frankfurt (GER)
739	11	Yaya TOURE	3	Manchester City FC (ENG)
740	11	Die SEREY	3	FC Basel (SUI)
741	11	Giovanni SIO	4	FC Basel (SUI)
742	11	Souleymane BAMBA	2	Trabzonspor (TUR)
743	11	Sayouba MANDE	1	Stabaek IF (NOR)
745	8	Maty RYAN	1	Club Brugge KV (BEL)
746	8	Ivan FRANJIC	2	Brisbane Roar FC (AUS)
747	8	Jason DAVIDSON	2	SC Heracles Almelo (NED)
748	8	Tim CAHILL	4	New York Red Bulls (USA)
749	8	Mark MILLIGAN	3	Melbourne Victory FC (AUS)
750	8	Matthew SPIRANOVIC	2	Western Sydney Wanderers FC (AUS)
751	8	Mathew LECKIE	4	FSV Frankfurt (GER)
752	8	Bailey WRIGHT	2	Preston North End FC (ENG)
753	8	Adam TAGGART	4	Newcastle United Jets FC (AUS)
754	8	Ben HALLORAN	4	Fortuna Duesseldorf (GER)
755	8	Tommy OAR	3	FC Utrecht (NED)
756	8	Mitch LANGERAK	1	Borussia Dortmund (GER)
757	8	Oliver BOZANIC	3	FC Luzern (SUI)
758	8	James TROISI	3	Melbourne Victory FC (AUS)
759	8	Mile JEDINAK	3	Crystal Palace FC (ENG)
760	8	James HOLLAND	3	FK Austria Wien (AUT)
761	8	Matt McKAY	3	Brisbane Roar FC (AUS)
762	8	Eugen GALEKOVIC	1	Adelaide United FC (AUS)
763	8	Ryan McGOWAN	2	Shandong Luneng Taishan FC (CHN)
764	8	Dario VIDOSIC	3	FC Sion (SUI)
765	8	Massimo LUONGO	3	Swindon Town FC (ENG)
766	8	Alex WILKINSON	2	Jeonbuk Hyundai Motors FC (KOR)
767	8	Mark BRESCIANO	3	Al Gharafa SC (QAT)
24	7	Jorge SAMPAOLI	5	(ARG)
48	3	Miguel HERRERA	5	(MEX)
72	20	Luis SUAREZ	5	(COL)
96	14	Jorge Luis PINTO	5	(COL)
120	18	Reinaldo RUEDA	5	(COL)
144	1	Luiz Felipe SCOLARI	5	(BRA)
168	21	Alejandro SABELLA	5	(ARG)
192	15	Roy HODGSON	5	(ENG)
216	29	Marc WILMOTS	5	(BEL)
240	25	Joachim LOEW	5	(GER)
264	19	Didier DESCHAMPS	5	(FRA)
288	17	Ottmar HITZFELD	5	(GER)
312	2	Niko KOVAC	5	(CRO)
336	22	Safet SUSIC	5	(BIH)
360	16	Cesare PRANDELLI	5	(ITA)
384	5	Vicente DEL BOSQUE	5	(ESP)
456	30	Vahid HALILHODZIC	5	(BIH)
480	23	Carlos QUEIROZ	5	(POR)
504	27	Akwasi APPIAH	5	(GHA)
528	24	Stephen KESHI	5	(NGA)
552	4	Volker FINKE	5	(GER)
576	12	Alberto ZACCHERONI	5	(ITA)
600	32	Myungbo HONG	5	(KOR)
624	31	Fabio CAPELLO	5	(ITA)
648	28	Juergen KLINSMANN	5	(GER)
672	9	Jose PEKERMAN	5	(ARG)
696	13	Oscar TABAREZ	5	(URU)
720	6	Louis VAN GAAL	5	(NED)
744	11	Sabri LAMOUCHI	5	(FRA)
768	8	Ange POSTECOGLOU	5	(AUS)
\.


--
-- Name: players_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('players_id_seq', 768, true);


--
-- Name: players_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY players
    ADD CONSTRAINT players_pkey PRIMARY KEY (id);


--
-- Name: players_field_position_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY players
    ADD CONSTRAINT players_field_position_id_fkey FOREIGN KEY (field_position_id) REFERENCES field_position(id);


--
-- Name: players_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY players
    ADD CONSTRAINT players_team_id_fkey FOREIGN KEY (team_id) REFERENCES team(id);


--
-- Name: players; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE players FROM PUBLIC;
REVOKE ALL ON TABLE players FROM postgres;
GRANT ALL ON TABLE players TO postgres;
GRANT ALL ON TABLE players TO scraper;


--
-- Name: players_id_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE players_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE players_id_seq FROM postgres;
GRANT ALL ON SEQUENCE players_id_seq TO postgres;
GRANT SELECT,USAGE ON SEQUENCE players_id_seq TO scraper;


--
-- PostgreSQL database dump complete
--

