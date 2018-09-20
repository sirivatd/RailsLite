require 'json'

class Session
  # find the cookie for this app
  # deserialize the cookie into a hash
  
  def initialize(req)
    cookies = req.cookies
    # @session ||= cookies[:_rails_lite_app]
    # p cookies
    # p cookies['_rails_lite_app']
    if cookies['_rails_lite_app']
      @session = JSON.parse(cookies['_rails_lite_app'])
    else
      @session = {}
    end
  end

  def [](key)
    @session[key]
  end

  def []=(key, val)
    @session[key] = val
  end

  # serialize the hash into json and save in a cookie
  # add to the responses cookies
  def store_session(res)
    res.set_cookie('_rails_lite_app', {path: '/', value: @session.to_json})
  end
end
