# Welcome to Napa

To launch the app locally:

- create hutt gemset
- bundle install
- `napa server`
- `localhost:9393/vin_number/WDD2073221F053316` Return Vin info or launch a scrap if it is not present in the db

This query displays the results

`select v.id, v.vin, p.vin_number_id, p.name, p.value from vin_numbers v inner join properties p on v.id = p.vin_number_id;`