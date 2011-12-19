comandos:
  - rake db:test:load                         ----> load do schema
  - rake db:fixtures:load RAILS_ENV=test      ----> load das fixtures
  - rails console test                        ----> correr na consola
  - rails server -e test                      ----> correr o servidor

  - rake db:test:purge                        ----> apagar schema


############################
# notas sobre os fixtures:
  - todas as tabelas onde apareça staff_id ou admin_id, é para colocar o USER_ID, da tabela USERS
