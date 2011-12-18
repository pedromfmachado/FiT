debug na consola correr com:
  - rake db:test:load                         ----> load do schema
  - rake db:fixtures:load RAILS_ENV=test      ----> load das fixtures
  - rails console test                        ----> correr na consola (opcional)

iniciar o servidor:
  - rails server -e test

limpar com:
  - rake db:test:purge

