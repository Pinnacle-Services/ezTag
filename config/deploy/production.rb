# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary server in each group
# is considered to be the first unless any hosts have the primary
# property set.  Don't declare `role :all`, it's a meta role.

role :app, %w{deploy@66.228.40.139}
role :web, %w{deploy@66.228.40.139}
role :db,  %w{deploy@66.228.40.139}


# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server definition into the
# server list. The second argument is a, or duck-types, Hash and is
# used to set extended properties on the server.

server '66.228.40.139', user: 'deploy', roles: %w{web app}, my_property: :my_value


# Custom SSH Options
# ==================
# You may pass any option but keep in mind that net/ssh understands a
# limited set of options, consult[net/ssh documentation](http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start).
#
# Global options
# --------------
#  set :ssh_options, {
#    keys: %w(/home/rlisowski/.ssh/id_rsa),
#    forward_agent: false,
#    auth_methods: %w(password)
#  }
#
# And/or per server (overrides global)
# ------------------------------------
server '66.228.40.139',
  user: 'deploy',
  roles: %w{web app},
  ssh_options: {
    user: 'deploy', # overrides user setting above
    # keys: %w(/home/dongseop/.ssh/id_rsa),
    forward_agent: true,
    auth_methods: %w(publickey)
    # password: 'please use keys'
  }
