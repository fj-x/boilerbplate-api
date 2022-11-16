## Instalation
* Install docker
* Run database container: ``docker-compose up -d``
* Install dependencies ``docker exec app-test-php-fpm composer install``
* Create database: ``docker exec app-test-php-fpm bin/console doctrine:database:create``
* Run migrations: ``docker exec app-test-php-fpm bin/console doctrine:migrations:migrate``

### Quick start (drop this)
* https://symfony.com/doc/current/doctrine.html
* Look at `bin/console list make` to see what you can generate
* Create entity `bin/console make:entity`
* Create Migration `bin/console make:migration`
* Kint debug
