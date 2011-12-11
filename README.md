OmniAuth LinuxFr.org
====================

This is the official OmniAuth strategy for authenticating to LinuxFr.org.
To use it, you'll need to sign up for an OAuth2 Application ID and Secret
on the [LinuxFr.org Applications Page](https://linuxfr.org/account/applications).


Basic Usage
-----------

```ruby
#!/usr/bin/env ruby
# encoding: utf-8

require 'sinatra'
require 'omniauth'
require 'omniauth-linuxfr'


use Rack::Session::Cookie
use OmniAuth::Builder do
  provider :linuxfr, ENV['LINUXFR_KEY'], ENV['LINUXFR_SECRET']
end


get '/' do
  <<-HTML
    <a href="/auth/linuxfr">Se connecter avec LinuxFr.org</a>
  HTML
end

get '/auth/linuxfr/callback' do
  auth = request.env['omniauth.auth']

  <<-HTML
    <ul>
      <li>login: #{auth.info.login}</li>
      <li>email: #{auth.info.email}</li>
      <li>date:  #{auth.info.created_at}</li>
    </ul>
  HTML
end
```


Copyright
---------

The code is licensed as MIT. See the MIT-LICENSE file for the full license.

♡2011 by Bruno Michel. Copying is an act of love. Please copy and share.
