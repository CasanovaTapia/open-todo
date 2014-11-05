#### OPEN TODO
Forked from [Bloc](https://github.com/Bloc/open-todo)

To sign up:
```
curl -v -H "Accept: application/json" -H "Content-type: application/json" -X POST -d '{"user":{"email":"member@example.com", "password":"helloworld"}}' http://localhost:3000/api/users
```

To log in:
```
curl -v -H "Accept: application/json" -H "Content-type: application/json" -X POST -d '{"user":{"email":"member@example.com", "password":"helloworld"}}' http://localhost:3000/api/sessions
```

Index of users:
```
curl -X GET http://localhost:3000/api/users
```
