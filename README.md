# Hike & Seed API

This API is intended for use with the Hike & Seed mobile app that I created for capstone project.

## Retrieve Data

  - Retrieve list of all hikes with seed data for that hike: http://localhost:3000/hikes

  - Retrieve specific hike: http://localhost:3000/hikes/:hike_id

## Send data

  - Add a hike with seeds data:
    - POST http://localhost:3000/hikes
    - required params:
      - name (string)
      - lat (string)
      - lon (string)
      - distance (float)
      - seeds (array of seed object)
        - required params for seed: nickname (string)

## Delete Data

  - Delete a hike, warning destroys all seed data for that hike
    - DELETE http://localhost:3000/hikes/:hike_id
