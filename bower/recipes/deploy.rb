node[:deploy].each do |application, deploy|
  if deploy[:application_type] != 'nodejs'
    Chef::Log.debug("Skipping application #{application} as it is not a nodejs app")
    next
  end

  execute 'update bower' do
    command 'npm update -g bower'
    user 'root'
  end

  execute 'bower install' do
    command 'bower install --allow-root'
    cwd deploy[:current_path]
    only_if do ::File.exists?("#{deploy[:deploy_to]}/bower.json") end
  end
end
