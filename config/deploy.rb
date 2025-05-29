set :application, "archives"
set :repo_url, "git://github.com/danbooru/archives.git"
set :deploy_to, "/var/www/archives"
set :rbenv_type, :user
set :rbenv_ruby, "3.4.4"
set :linked_files, fetch(:linked_files, []).push(".env")
