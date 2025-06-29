@appcontact_createcontact
Feature: create contact to app contact

  Background:
    * url baseUrl
    * header Accept = 'application/json'
    * def loginResult = call read('login.feature')
    * def token = loginResult.token
    * def email = 'user' + java.lang.System.currentTimeMillis() + '@mail.com'
    * def phone = Math.floor(Math.random() * 10000000000).toString()
    * header Authorization = 'Bearer ' + token
    

Scenario: Login y crear contacto

  # Crear contacto
  Given path '/contacts'
  And request
    """
    {
      "firstName": "Pruebas",
      "lastName": "UDEA",
      "birthdate": "1970-01-01",
      "email": "#(email)",
      "phone": "#(phone)",
      "street1": "Oriental Avenue",
      "street2": "Apartment A",
      "city": "Medellin",
      "stateProvince": "ANT",
      "postalCode": "12345",
      "country": "COL"
    }
    """
  When method POST
  Then status 201
  And match response ==
      """    {
      "_id": '#string',
      "firstName": '#string',
      "lastName": '#string',
      "birthdate": '#string',
      "email": '#string',
      "phone": '#string',
      "street1": '#string',
      "street2": '#string',
      "city": '#string',
      "stateProvince": '#string',
      "postalCode": '#string',
      "country": '#string',
      "owner": '#string',
      "__v": '#number'
      }
      """
