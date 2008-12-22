namespace :deploy do

  desc 'Rsync to local file system'
  task :rsyc_mac_local do
    sh "rsync -avz --delete --exclude .DS_Store  --exclude .cairn  #{SITE.output_dir}/ #{SITE.local_dir}"
  end

end  # namespace :deploy