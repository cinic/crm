set :stage, :staging
set :rvm_type, :user
set :deploy_to, '/home/deployer/crm/staging'
set :app_name, "crm"
set :user, "deployer"

# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary
# server in each group is considered to be the first
# unless any hosts have the primary property set.
role :app, %w{95.85.53.122}
role :web, %w{95.85.53.122}
role :db,  %w{95.85.53.122}

# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server
# definition into the server list. The second argument
# something that quacks like a hash can be used to set
# extended properties on the server.
server '95.85.53.122', user: 'deployer', roles: %w{web app db}, primary: :true

# you can set custom ssh options
# it's possible to pass any option but you need to keep in mind that net/ssh understand limited list of options
# you can see them in [net/ssh documentation](http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start)
# set it globally
#  set :ssh_options, {
#    keys: %w(/home/rlisowski/.ssh/id_rsa),
#    forward_agent: false,
#    auth_methods: %w(password)
#  }
set :ssh_options, {
   user: "deployer",
   keys: %w(~/.ssh/id_rsa),
   port: 2605,
   forward_agent: false,
   auth_methods: %w(publickey)
}
# and/or per server
# server 'example.com',
#   user: 'user_name',
#   roles: %w{web app},
#   ssh_options: {
#     user: 'user_name', # overrides user setting above
#     keys: %w(/home/user_name/.ssh/id_rsa),
#     forward_agent: false,
#     auth_methods: %w(publickey password)
#     # password: 'please use keys'
#   }
# setting per server overrides global ssh_options

fetch(:default_env).merge!(rails_env: :staging)
