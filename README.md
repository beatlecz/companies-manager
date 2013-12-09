companies-manager
=================

## Companies

### GET companies list
```
curl -i \
  http://localhost:3000/companies
```

### POST new company
``` 
curl -i \
  -H "Content-Type: application/json" \
  -X POST -d '{"name":"Test company", "address":"Test street","city":"Testown","country":"Test Country"}' \
  http://localhost:3000/companies
```

### GET detail
```
curl -i \
  http://localhost:3000/companies/1
```

### POST update company
```
curl -i \
  -H "Content-Type: application/json" \
  -X POST -d '{"phone":"1234567","email":"test@test.com"}' \
  http://localhost:3000/companies/1
```

### DELETE company
```
curl -i \
  -X DELETE \
  http://localhost:3000/companies/1
```

## Owners/Directors

### GET owners list
```
curl -i \
  http://localhost:3000/companies/1/owners
```

### POST new owner
``` 
curl -i \
  -H "Content-Type: application/json" \
  -X POST -d '{"name":"Test owner"}' \
  http://localhost:3000/companies
```

### GET owner detail
```
curl -i \
  http://localhost:3000/companies/1/owners/1
```

### POST update owner
```
curl -i \
  -H "Content-Type: application/json" \
  -X POST -d '{"name":"update owner"}' \
  http://localhost:3000/companies/1/owners/1
```

### DELETE owner
```
curl -i \
  -X DELETE \
  http://localhost:3000/companies/1/owners/1
```

### POST attachement for owner
```
curl -i \
  --form "file=@filename.txt" \
  http://localhost:3000/companies/1/owners/1/attachment
```
