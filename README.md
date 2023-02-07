# Docker compose service for Laravel

if you think Sail is very heavy and slow, you can use this repo instead that.

## How to use

Note that for using this repo you should have docker knowledge.

Clone this repo and run.

`bash build.bash [directory-name | .]`

use . for current directory. if use dot ensure that current directory is empty

and then go to root directory and run `docker compose up`

**Note:** if your Os is windows you should use this repo or any other docker base project in WSL (Linux) directory.

## witch version?

this repo support laravel 9 and php 8.1 for now. but higher versions add soon.

## use artisan commands

for using artisan command you should enter the Laravel container by this command.

`docker exec -it -u www-data [container ID or Name] bash`

