require 'httparty'

class LdApi 
  include HTTParty
  format :json

  OPTIONS = {
    secret: '8dva9NuHjUvfZV9aLCdMyDQ5EWaHTb3XBQCt5OWGtD+oL3JN3+QnoS7TWRcsFQsnU4BaHDbmpnoflw9/L6b28Q==', 
    id: '7740569476399170'
  }

  def self.app_create_content(image_id, name, text)
    #response = get("#{OPTIONS.to_json}")
    response = get("http://api.globalhack4.test.lockerdome.com/app_create_content?%7B%22app_id%22:%22#{OPTIONS[:id]}%22,%22app_secret%22:%22#{OPTIONS[:secret]}%22,%22app_data%22:%7B%22image_id%22:%22#{image_id}%22%7D,%22name%22:%22#{URI.encode(name)}%20Content%22,%22text%22:%22#{URI.encode(text)}%22%7D")#
  end 

  def self.app_fetch_content
    response = get("http://api.globalhack4.test.lockerdome.com/app_fetch_content?%7B%22app_id%22:%22#{OPTIONS[:id]}%22,%22app_secret%22:%22#{OPTIONS[:secret]}%22,%22content_id%22:%227740904718729283%22%7D")#
  end

  def self.app_fetch_app_data
    response = get("http://api.globalhack4.test.lockerdome.com/app_fetch_content?%7B%22app_id%22:%22#{OPTIONS[:id]}%22,%22app_secret%22:%22#{OPTIONS[:secret]}%22,%22content_id%22:%227740904718729283%22%7D")#
    JSON.parse(response.body)["result"]["app_data"]
  end

  def self.app_destroy_all_data
    response = get("http://api.globalhack4.test.lockerdome.com/app_fetch_user_content?%7B%22app_id%22:%22#{OPTIONS[:id]}%22,%22app_secret%22:%22#{OPTIONS[:secret]}%22,%22created_by%22:%227740187291418625%22%7D")#
    response["result"].keys.each do |key|
      get("http://api.globalhack4.test.lockerdome.com/app_destroy_content?%7B%22app_id%22:%22#{OPTIONS[:id]}%22,%22app_secret%22:%22#{OPTIONS[:secret]}%22,%22content_id%22:%22#{key}%22%7D")#
    end
  end
  
end
