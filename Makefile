PHP_CONTAINER = app-test-php-fpm

# Run code style fixer
phpcs:
	docker exec $(PHP_CONTAINER) bash -c "./vendor/bin/php-cs-fixer --no-interaction --diff -v fix $*"

# Run mess detector
phpmd:
	docker exec $(PHP_CONTAINER) bash -c "./vendor/bin/phpmd $*"

# Run code analyzer
phpstan:
	docker exec $(PHP_CONTAINER) bash -c "php -d memory_limit=-1 ./vendor/bin/phpstan analyse -c ./phpstan.neon -l 6 src tests"

# Run copy-paste checker
phpcpd:
	docker exec $(PHP_CONTAINER) bash -c "php -d memory_limit=-1 ./vendor/bin/phpcpd src tests"

# Run tests
phpunit:
	docker exec $(PHP_CONTAINER) bash -c "bin/console --env=test cache:clear --no-interaction && ./vendor/bin/phpunit $*"

# Update database
prepare-db:
	docker $(PHP_CONTAINER) bin/console doc:sch:up --force

# Enter into php container
exec:
	docker exec -it $(PHP_CONTAINER) bash

static-check: phpcs phpstan phpcpd

.PHONY: phpunit phpcs phpstan prepare-db exec
