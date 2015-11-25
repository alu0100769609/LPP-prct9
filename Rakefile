require "bundler/gem_tasks"

task :default => :spec

desc "Ejecutar las espectativas de la clase Biblio_gem"
task :spec do
  sh "bundle exec rspec spec/biblio_gem_spec.rb"
  sh "bundle exec rspec spec/node_spec.rb"
  sh "bundle exec rspec spec/list_spec.rb"
end

task :biblio do
  sh "bundle exec rspec spec/biblio_gem_spec.rb"
end

task :node do
  sh "bundle exec rspec spec/node_spec.rb"
end

task :list do
    sh "bundle exec rspec spec/list_spec.rb"
end