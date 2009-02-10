namespace :server do
  desc "Start server but don't autobuild"
  task :start do
    server = Webby::AutoBuilder::WebServer.new.start
    Launchy.open("http://localhost:#{::Webby.site.heel_port}")
    server.join
  end

end  # namespace :deploy