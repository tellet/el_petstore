# API tests

A Postman collection with API tests for https://petstore.swagger.io/

## Prerequisites
Docker
or
Neman
or
Postman Desktop

## Run the tests using Docker

Run Postman collection using `newman` in a docker container. In [project](.) directory run:
```shell
docker build -t postman-runner:latest .
docker run --rm postman-runner:latest run "./collections/PetStore_API_Tests.postman_collection.json" -e "./environments/PetStore_prod.postman_environment.json"
```

## Run the tests using newman

In [project](.) directory run:
```shell
newman run "./collections/PetStore_API_Tests.postman_collection.json" -e "./environments/PetStore_prod.postman_environment.json"
```

## Run the tests in Postman Desktop app

Open Postman.
Import collection and environment (File -> Import -> path to the file).
Click Runner. Select the collection and environment. Click Run.

## Testing Notes
The expected output should contain assertion errors (I created tests in such a way that some of them fail) and be something like this:
```shell
┌─────────────────────────┬─────────────────────┬────────────────────┐
│                         │            executed │             failed │
├─────────────────────────┼─────────────────────┼────────────────────┤
│              iterations │                   1 │                  0 │
├─────────────────────────┼─────────────────────┼────────────────────┤
│                requests │                   9 │                  0 │
├─────────────────────────┼─────────────────────┼────────────────────┤
│            test-scripts │                  14 │                  0 │
├─────────────────────────┼─────────────────────┼────────────────────┤
│      prerequest-scripts │                  11 │                  0 │
├─────────────────────────┼─────────────────────┼────────────────────┤
│              assertions │                  21 │                  5 │
├─────────────────────────┴─────────────────────┴────────────────────┤
│ total run duration: 2.7s                                           │
├────────────────────────────────────────────────────────────────────┤
│ total data received: 916B (approx)                                 │
├────────────────────────────────────────────────────────────────────┤
│ average response time: 226ms [min: 149ms, max: 834ms, s.d.: 214ms] │
└────────────────────────────────────────────────────────────────────┘

  #  failure                                    detail                                                                                                                                                                
                                                                                                                                                                                                                      
 1.  AssertionError                             Payload complies to schema
                                                expected data to satisfy schema but found following errors: 
                                                data should have required property 'code', data should have required property 'type', data should have required property 'message'
                                                at assertion:0 in test-script
                                                inside "Create pet: missing required field "name""
                                                                                                                                                                                                                      
 2.  AssertionError                             Status code is 400
                                                expected response to have status code 400 but got 200
                                                at assertion:1 in test-script
                                                inside "Create pet: missing required field "name""
                                                                                                                                                                                                                      
 3.  AssertionError                             Error message is as expected
                                                expected undefined to equal 'Missing required field: name'
                                                at assertion:2 in test-script
                                                inside "Create pet: missing required field "name""
                                                                                                                                                                                                                      
 4.  AssertionError                             Status code is 400
                                                expected response to have status code 400 but got 404
                                                at assertion:1 in test-script
                                                inside "Delete order: txt id"
                                                                                                                                                                                                                      
 5.  AssertionError                             Response contains expected data
                                                name is incorrect: expected 'doggie' to equal 'el-pet-9904ef74'
                                                at assertion:2 in test-script
                                                inside "Find pet by Id: complex example"

```