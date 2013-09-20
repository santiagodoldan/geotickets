require 'rest_client'
require 'json'

class Feng

  def initialize(username, password, base_path)
    @username  = username
    @password  = password
    @base_path = base_path
    @client    = RestClient::Resource.new(@base_path)
  end

  def authenticate!
    @auth_response = @client['/index.php?c=access&a=login'].post({login: {username: @username, password: @password}}) { |response, request, result, &block|
      if [301, 302, 307].include? response.code
        response.follow_redirection(request, result, &block)
      else
        response.return!(request, result, &block)
      end
    }
  end

  def user_id
    @auth_response.cookies.select {|key, value| key.ends_with?("id") }.values[0]
  end

  def projects
    project_response = @client['/index.php?active_project=0&ajax=true&c=project&a=initial_list_projects&parent=0&_dc=1379093772831'].get({cookies: @auth_response.cookies})

    JSON.parse(project_response.body)
  end

  def add_hours(project_id, date, hours, description)
    options = {
      timeslot: {
        date: date.strftime("%m/%d/%Y"),
        project_id: project_id,
        hours: hours,
        description: description,
        user_id: user_id
      }
    }

    auth_options = {cookies: @auth_response.cookies}

    response = @client['index.php?active_project=0&ajax=true&c=time&a=add_project_timeslot&current=time-panel'].post(options, auth_options)

    JSON.parse(response)
  end

end