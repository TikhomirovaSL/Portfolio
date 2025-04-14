select 
	flight_id as 'ID', 
	flight_number as 'Flight Number', 
	a.airport_name as 'From', 
	a1.airport_name as 'To',
	concat(departure_date, ' ', departure_time) as 'Departure time', 
	concat(arrival_date, ' ', arrival_time) as 'Arrival time',
	flight_charge as 'Flight Charge', 
	a2.model as 'Aircraft',
	concat(number_of_seats - count(DISTINCT passenger_id),'/', number_of_seats) as 'Available Seats'
from 
	flight f 
	left join passenger p
	on f.flight_id = p.flight_flight_id 
	left join airport a 
	on f.departure_airport_airport_id = a.airport_id
	left join airport a1 
	on f.destination_airport_airport_id = a1.airport_id  
	left join aircraft a2 
	on f.aircraft_aircraft_id = a2.aircraft_id 
where 
	a.airport_name is not null 
	and a1.airport_name is not null 
	and departure_date is not null
	and departure_time is not null
group by 
	f.flight_id, 
	flight_number, 
	a.airport_name, 
	a1.airport_name, 
	flight_charge, 
	a2.model,
	concat(departure_date, departure_time),
	concat(arrival_date, arrival_time),
	number_of_seats
order by f.flight_id ASC 





SELECT airport_id, airport_name 
from airport a 
where airport_name  is not null


SELECT flight_id, departure_airport_airport_id, destination_airport_airport_id, aircraft_aircraft_id 
from flight f 
where departure_airport_airport_id is not null and destination_airport_airport_id is not null



select 
	flight_flight_id, 
	count(*) as num_passengers
from 
	passenger p 
group by 
	flight_flight_id
-- having count(flight_flight_id) > 1

select *
from passenger p 
where flight_flight_id = '2'

select *
from aircraft a 


SELECT 
	f.flight_id, 
	count(DISTINCT passenger_id) as num_passengers,
	number_of_seats,
	(number_of_seats - (count(DISTINCT passenger_id)))
from 
	flight f 
	join aircraft a 
	on f.aircraft_aircraft_id = a.aircraft_id 
	join passenger p 
	on f.flight_id = p.flight_flight_id
group by f.flight_id, number_of_seats

select f.flight_id, passenger_id, number_of_seats
from 
	flight f 
	join aircraft a 
	on f.aircraft_aircraft_id = a.aircraft_id 
	join passenger p 
	on f.flight_id = p.flight_flight_id

