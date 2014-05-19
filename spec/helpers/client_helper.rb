module ClientHelper
  def current_client
    DiscourseApi::Client.new('http://localhost', api_key, api_name)
  end

  def api_key
    'api_key'
  end
  
  def api_name
    'api_name'
  end
end
