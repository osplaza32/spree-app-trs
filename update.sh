#!/bin/bash

ENV=${1:-production}

echo '### Deteniendo Unicorn'
kill -s QUIT `cat shared/pids/unicorn.pid`

echo '### Limpiando repo local'
git clean -df && git reset --hard HEAD

echo '### Recibiendo cambios desde repositiorio'
git pull origin prod

echo '### Actualizando bundle'
bundle

echo '### Precompilando assets'
RAILS_ENV=$ENV rake assets:precompile

if [ $ENV = "staging" ]; then
  echo '### Copiando DB de produccion a staging'
  su -c "pg_dump -Fc trs_shop_production > /tmp/prod_dump.sql" postgres
  su -c "pg_restore -d trs_shop_staging -c < /tmp/prod_dump.sql" postgres
fi

echo '### Migrando DB'
RAILS_ENV=$ENV rake db:migrate

echo '### Levantando Unicorn actualizado'
RAILS_ENV=$ENV bundle exec unicorn -c config/unicorn.rb -E $ENV -D

echo '### Reiniciando Nginx'
service nginx restart
