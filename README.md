#### OPEN TODO
Forked from [Bloc](https://github.com/Bloc/open-todo)

To sign up:
```
curl -v -H "Accept: application/json" -H "Content-type: application/json" -X POST -d '{"user":{"email":"member@example.com", "password":"helloworld"}}' http://localhost:3000/api/users
```

To log in:
```
curl -v -H "Accept: application/json" -H "Content-type: application/json" -X POST -d '{"session":{"email":"member@example.com", "password":"helloworld"}}' http://localhost:3000/api/sessions
```

To log out, replace :id with your user_id:
```
curl -i -H "Accept: application/json" -X DELETE http://localhost:3000/api/sessions/:id
```

Index of users:
```
curl -X GET http://localhost:3000/api/users
```

Create new list, replace :user_id with your id:
```
curl -v -H "Accept: application/json" -H "Content-type: application/json" -X POST -d '{"list":{"name":"New list", "permissions":"open"}}' http://localhost:3000/api/users/:user_id/lists
```

Show list:
```
curl -X GET http://localhost:3000/api/users/:user_id/lists/:id
```

List index:
```
curl -X GET http://localhost:3000/api/lists
```

Update List attributes:
```
curl -i -H "Accept: application/json" -X PUT -d '{"list":{"permissions":"viewable"}}' http://localhost:3000/api/users/:user_id/lists/:id
```

Delete list:
```
curl -i -H "Accept: application/json" -X DELETE http://localhost:3000/api/users/:user_id/lists/:id
```

Create todo item:
```
curl -v -H "Accept: application/json" -H "Content-type: application/json" -X POST -d '{"item":{"description":"New item"}}' http://localhost:3000/api/lists/:list_id/items
```

Delete todo item:
```
curl -i -H "Accept: application/json" -X DELETE http://localhost:3000/api/lists/:list_id/items/:id
```

View items in a list:
```
curl -X GET http://localhost:3000/api/lists/:list_id/items
```
