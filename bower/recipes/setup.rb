node[:deploy].each do |application, deploy|
  if deploy[:application_type] != 'nodejs'
    Chef::Log.debug("Skipping application #{application} as it is not a nodejs app")
    next
  end

  execute 'install bower' do
    command 'npm install -g bower'
    user 'root'
  end
end