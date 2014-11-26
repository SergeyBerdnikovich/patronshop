ENV['GITHUB_ACCESS_TOKEN'] = 'bf81295a1c1e3e233dcdb6e1a21314ee5622b88c'
ENV['PULL_REQUEST_ID'] = '1'

namespace :pronto do
  task :run => :environment do
    Pronto.gem_names.each { |gem_name| require "pronto/#{gem_name}" }
    formatter = Pronto::Formatter::GithubPullRequestFormatter.new
    Pronto.run('origin/master', '.', formatter)
  end
end
