import requests
import json

API_URL = "https://akabab.github.io/superhero-api/api/all.json"

def tallest_superhero(gender: str, work: bool, url: str = API_URL) -> dict:
    if not isinstance(gender, str):
        return json.dumps({
            "status": "400 Bad requests",
            "message": "Parameter 'gender' was wrong type"
        })
    
    if not isinstance(work, bool):
        return json.dumps({
            "status": "400 Bad requests",
            "message": "Parameter 'work' was wrong type"
        })
    
    response = requests.get(url)
    superheroes = response.json()

    if not isinstance(superheroes, list):
        return json.dumps({
            "status": "400 Bad requests",
            "message": "Incorrect URL!"
        })
        

    filtered_superheroes = [
        superhero for superhero in superheroes 
        if superhero.get('appearance', {}).get('gender') == gender 
        and ((superhero.get('work', {}).get('occupation') not in ['-']) == work)
    ]

    if not filtered_superheroes:
        not_info_tallest_superhero = {
            "status": "404 Not found",
            "message": "Superhero with given parameters was not found"
        }
        not_info_tallest_superhero_json = json.dumps(not_info_tallest_superhero)
        return not_info_tallest_superhero_json
    
    tallest_superhero = max(filtered_superheroes, key=lambda superhero: superhero.get('appearance', {}).get('height', [0])[1])

    info_tallest_superhero = {
        "status": "200 OK",
        "id": tallest_superhero['id'],
        "name": tallest_superhero['name'],
        "height": tallest_superhero['appearance']['height'][1]
    }
    info_tallest_superhero_json = json.dumps(info_tallest_superhero)
    return info_tallest_superhero_json

if __name__ == '__main__':
    gender = 'Male'
    work = True
    result = tallest_superhero(gender, work)
    print(result)

