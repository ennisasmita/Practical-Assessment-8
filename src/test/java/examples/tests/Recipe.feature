Feature: Test Recipe

  Background:
    * url "https://api.spoonacular.com/"
    * def apiKey = '168d166ec30c4ba7a862783bf66382ec'
    * def hash = '1e074b8a4cadc10c60bc4d6ba0ee84e0c98e8a9b'
    * def username = 'ennisasmita'
    * def header = '{"Content-Type": "application/json"}'

  Scenario: Search Recipes by Nutrients
    Given path 'recipes/findByNutrients'
    And param hash = hash
    And param apiKey = apiKey
    And param minProtein = 30
    And param minCalories = 70
    When method get
    Then status 200
    And print 'Response:', response


  Scenario: Search Recipes by Ingredients
    Given path 'recipes/findByIngredients'
    And param hash = hash
    And param apiKey = apiKey
    And param ingredients = 'sugar'
    And param ranking = 1
    When method get
    Then status 200
    And print 'Response:', response

  Scenario: Get Random Recipes
    Given path 'recipes/random'
    And param hash = hash
    And param apiKey = apiKey
    And param exclude-tags = 'dairy'
    When method get
    Then status 200
    And print 'Response:', response

  Scenario: Analyze a Recipe Search Query
    Given path '/recipes/queries/analyze'
    And param apiKey = apiKey
    And param q = 'salmon with fusilli and no nuts'
    And request header
    When method get
    Then status 200
    And print 'Response:', response

  Scenario: Get Similar Recipes
    Given path '/recipes/715538/similar'
    And param apiKey = apiKey
    And request header
    When method get
    Then status 200
    And print 'Response:', response

  Scenario: Analyze Recipe
    Given path '/recipes/analyze'
    And param apiKey = apiKey
    And param language = 'en'
    And param includeNutrition = false
    And param includeTaste = false
    And request header
    And request {"title": "Spaghetti Carbonara","servings": 2,"ingredients": ["1 lb spaghetti","3.5 oz pancetta","2 Tbsps olive oil","1  egg","0.5 cup parmesan cheese"],"instructions": "Bring a large pot of water to a boil and season generously with salt. Add the pasta to the water once boiling and cook until al dente. Reserve 2 cups of cooking water and drain the pasta. "}
    When method post
    Then status 200
    And print 'Response:', response

  Scenario: Get Recipe Information Bulk
    Given path '/recipes/informationBulk'
    And param apiKey = apiKey
    And request header
    And param ids = 715538
    When method get
    Then status 200
    And print 'Response:', response



