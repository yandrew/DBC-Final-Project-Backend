dir = File.expand_path(File.join(File.dirname(__FILE__), '../../', 'config'))
require 'httparty'
require 'pp'
require 'yaml'
config = YAML::load(File.read(File.join(dir, 'cloudinary.yml')))

@file = File.expand_path(File.join(File.dirname(__FILE__), '../../public/samples/category_accessories.jpg'))

module ImageHelper
	class ProductImage
		include HTTParty
		base_uri 'api.cloudinary.com/v1_1/'

		def initialize(env)
      @options = {api_key: env['api_key'], api_secret:env['api_secret']}
    end

    def post
    	options = @options
    	self.class.post('v1_1/dbc/image/upload', options)
    end

    def get
    end
	end
	class UserAvatar
		include HTTParty
	end



end
p @file
p config['development']
image = ImageHelper::ProductImage.new(config['development'])
a = image.post
p a


