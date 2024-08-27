SELECT * FROM crime_scene_report WHERE type = 'murder' AND city = 'SQL City' AND date = '20180115'

--Security footage shows that there were 2 witnesses. The first witness lives at the last house on "Northwestern Dr". 
--The second witness, named Annabel, lives somewhere on "Franklin Ave".

--Testigo 1

SELECT * FROM person WHERE address_street_name = 'Northwestern Dr' ORDER BY address_number DESC
-- 14887	Morty Schapiro	118009	4919	Northwestern Dr	111564949
SELECT * FROM interview WHERE person_id = '14887'
-- Oí un disparo y luego vi a un hombre salir corriendo. Tenía una bolsa con la inscripción 
--"Get Fit Now Gym". El número de socio de la bolsa empezaba con "48Z". Solo los miembros Gold tienen esas bolsas. 
--El hombre se subió a un coche con una matrícula que decía "H42W".

--Testigo 2

SELECT * FROM person WHERE address_street_name = 'Franklin Ave' AND name LIKE '%Annabel%'
-- 16371	Annabel Miller	490173	103	Franklin Ave	318771143
SELECT * FROM interview WHERE person_id = '16371'
-- Vi ocurrir el asesinato y reconocí al asesino en mi gimnasio cuando estaba entrenando la semana pasada, el 9 de enero.


-- Sospechoso
SELECT * FROM drivers_license WHERE plate_number LIKE '%H42W%'
--id	age	height	eye_color	hair_color	gender	plate_number	car_make	car_model
--423327	30	70	brown	brown	male	0H42W2	Chevrolet	Spark LS
--664760	21	71	black	black	male	4H42WR	Nissan	Altima
--183779	21	65	blue	blonde	female	H42W0X	Toyota	Prius

SELECT * FROM facebook_event_checkin WHERE person_id IN (19948, 99602) AND date = '20180115'

SELECT * FROM get_fit_now_member WHERE membership_status = 'gold'

SELECT * FROM get_fit_now_check_in WHERE check_in_date = '20180115'

--membership_id	check_in_date	check_in_time	check_out_time
--D2KY6	20180115	746	836
--344VM	20180115	1087	1195
--3BRSC	20180115	354	825
--HM6U8	20180115	525	800

SELECT * FROM get_fit_now_member WHERE membership_status = 'gold' AND id IN ('D2KY6', '344VM', '3BRSC', 'HM6U8') 
--id	person_id	name	membership_start_date	membership_status
--3BRSC	19948	Taylor Skyes	20180314	gold
--D2KY6	99602	Joline Hollering	20170220	gold

SELECT * FROM person WHERE person_id IN (19948, 99602)
--id	name	license_id	address_number	address_street_name	ssn
--19948	Taylor Skyes	946454	2527	Flay St	335326372
--99602	Joline Hollering	383435	3021	Celilo St	226217805

SELECT * FROM person WHERE person_id IN (28819, 67318)
--id	name	license_id	address_number	address_street_name	ssn
--28819	Joe Germuska	173289	111	Fisk Rd	138909730
--67318	Jeremy Bowers	423327	530	Washington Pl, Apt 3A	871539279
SELECT * FROM facebook_event_checkin WHERE person_id IN (67318) AND date = '20180115'
SELECT * FROM get_fit_now_check_in WHERE check_in_date = '20180109'

--id	person_id	name	membership_start_date	membership_status
--48Z7A	28819	Joe Germuska	20160305	gold
--48Z55	67318	Jeremy Bowers	20160101	gold

--id	person_id	name	membership_start_date	membership_status
--90081	16371	Annabel Miller	20160208	gold

--Murder
--48Z55	67318	Jeremy Bowers	20160101	gold

--valor
--¡Felicitaciones, encontraste al asesino! Pero espera, hay más... Si crees que estás preparado para un desafío,
-- intenta consultar la transcripción de la entrevista del asesino para encontrar al verdadero villano detrás de este crimen.
-- Si te sientes especialmente seguro de tus habilidades con SQL, intenta completar este paso final con no más de 2 consultas.
-- Usa esta misma declaración INSERT con tu nuevo sospechoso para comprobar tu respuesta.


--id_persona	transcripción
--67318	Me contrató una mujer con mucho dinero. No sé su nombre, pero sé que mide entre 1,65 y 1,70 m. Es pelirroja y conduce un Tesla Model S.
-- Sé que asistió al concierto sinfónico SQL tres veces en diciembre de 2017.

SELECT * FROM drivers_license WHERE car_make like '%Tesla%' AND car_model = 'Model S' AND hair_color = 'red' AND gender = 'female'
--  id	age	height	eye_color	hair_color	gender	plate_number	car_make	car_model
--  202298	68	66	green	red	female	500123	Tesla	Model S
--  291182	65	66	blue	red	female	08CM64	Tesla	Model S
--  918773	48	65	black	red	female	917UU3	Tesla	Model S

SELECT * FROM person WHERE license_id IN (202298, 291182,918773)
--id	name	license_id	address_number	address_street_name	ssn
--78881	Red Korb	918773	107	Camerata Dr	961388910
--90700	Regina George	291182	332	Maple Ave	337169072


--Murder Brain
--99716	Miranda Priestly	202298	1883	Golden Ave	987756388

--valor
--¡Felicitaciones! ¡Has encontrado al cerebro detrás del asesinato! Todos en SQL City te aclaman como el mejor detective de SQL de todos los tiempos. ¡Es hora de descorchar el champán!
