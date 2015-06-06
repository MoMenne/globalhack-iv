require 'httparty'

class LdApi 
  include HTTParty
  format :json

  OPTIONS = {
    

  }

  def self.app_create_content
    #response = get("#{OPTIONS.to_json}")
    response = get('http://api.globalhack4.test.lockerdome.com/app_create_content?%7B%22app_id%22:%227740569476399170%22,%22app_secret%22:%228dva9NuHjUvfZV9aLCdMyDQ5EWaHTb3XBQCt5OWGtD+oL3JN3+QnoS7TWRcsFQsnU4BaHDbmpnoflw9/L6b28Q==%22,%22app_data%22:%7B%22fun%22:%22times%22%7D,%22name%22:%22Some%20App%20Content%22,%22text%22:%22Short%20description%20of%20your%20content%22%7D')#
  end 



end
