# Building/running
Prereq: Docker has to be installed. 
You'll probably have to login in the docker CLI with `docker login -u your_username`

Then run this 

```
git clone https://github.com/kay-gg/test
cd ./test
docker compose up --build
```

After that, type in your webbrowser `localhost:8080`

First page is just showing how to put text on screen,

`localhost:8080/test` Shows the server getting a user from the database
