require 'open-uri'

class FullContact

  API_KEY = '413171cce3659632'

  def self.raw_json(email)
    # https://api.fullcontact.com/v2/person.json?email=cory@lanou.com&apiKey=413171cce3659632
    url =
      "https://api.fullcontact.com/v2/person.json?" +
      {
        email: email,
        apiKey: API_KEY
      }.to_param

    begin
      open(url).read
    rescue
      { status: 500 }.to_json
    end
  end

  def self.twitter(email)
    response = raw_json(email)
    response = ActiveSupport::JSON.decode(response)
    if response['status'] == 200
      twitter_profile = response['socialProfiles'].select{|p| p['type'] == 'twitter'}
      twitter_profile.first if twitter_profile.present?
    end
  end

  def self.twitter_json(email)
    response = twitter(email)
    response.to_json if response.present?
  end

  def self.twitter_url(email)
    response = twitter_json(email)
    if response.present?
      ActiveSupport::JSON.decode(response)['url']
    end
  end

end

