# theMovieApp
## BDD Specs

### Story: User requests to see the Movies

### Narrative #1
```
As an online user
I want the app to automatically load the latest movies
So I can know what are the latest movies
```
### Scenarios (Acceptance criteria)
```
Given the user has connectivity
When the user requests to see the latest movies
Then the app should display the latest movies from remote
And replace the cached movies with new movies
```
### Narrative #2
```
As an offline user
I want the app to show the latest saved version of movies
So I can always see the latest movies even I am offline
```
### Scenarios (Acceptance criteria)
```
Given the user has no connectivity
When the user requests to see the lastest movies
Then the app should display the latest movie saved

Given the user has no connectivity
And the cache is empty
When the user requests to see the latest movies
Then the app should display an error message
```
### Load Movie Use Case
#### Data(Input):
* URL
#### Primary course(happy path):
1. Execute "Load movie items" command with above data.
2. System downloads data from the URL.
3. System validates downloaded data.
4. System creates movie items from valid data.
5. System delivers movie items.
#### Invalid data - error course(sad path):
1. System delivers error.
#### No connectivity - error course(sad path):
1. System delivers error.

### Load Movie from fallback (Cache) User Case
#### Data(Input):
* Max age
#### Primary course(happy path):
1. Execute "Retrive movie items" command with above data.
2. System fetches movie data from cache.
3. System creates movie items from cached data.
4. System delivers movie items.
#### No Cache course(sad path):
1. System delivers error.

### Save Movie Use Case
#### Data(Input):
* Movie items
#### Primary course(happy path):
1. Execute "Save movie items" command with above data.
2. System encodes feed items.
3. System timestamps the new cache.
4. System replaces the cache with new data.
5. System delivers a success message.
