# laravel-docker
docker service for run laravel in production and development

## how to use
+ first install laravel 9 but don't run **sail up**
  - `curl -s "https://laravel.build/example-app" | bash`
+ download repo and move files from src directory to project directory
+ run `docker compose up` or `docker compose up -d`

## how to run artisan commands
for run artisan commands you should enter to laravel container first
`docker exec -it -u www-data [container id or name] bash`
and then you can run artisan commands like laravel doc
for exit from container use **Ctrl+D**
