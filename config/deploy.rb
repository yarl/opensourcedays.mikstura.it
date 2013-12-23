set :application, 'opensourcedays'
set :repo_url, 'https://github.com/miksturait/opensourcedays.mikstura.it.git'

set :deploy_to, '/srv/mikstura.it/opensourcedays'

namespace :deploy do
  after :finishing, 'deploy:cleanup'
  task :restart do
    # nothing
  end
end
