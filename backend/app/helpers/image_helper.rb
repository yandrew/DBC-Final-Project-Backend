dir = File.expand_path(File.join(File.dirname(__FILE__), '../../', 'config'))
require 'httparty'
require 'json'
require 'yaml'
config = YAML::load(File.read(File.join(dir, 'cloudinary.yml')))

file = File.expand_path(File.join(File.dirname(__FILE__), '../../public/samples/category_accessories.jpg'))

module ImageHelper
	class ProductImage
		include HTTParty

		def initialize(a,b)
      self.class.get('http://' + a + ':' + b + '@api.cloudinary.com/v1_1/dbc/resources/image')
    end

    def post(options = {})
    	self.class.post('https://api.cloudinary.com/v1_1/dbc/image/upload/file', options)
    end

    def get
    end
	end
	class UserAvatar
		include HTTParty
	end



end
file

image = ImageHelper::ProductImage.new((config['production']['api_key']), (config['production']['api_secret']))
response = image.post(file: '../rgrewal.jpg')

p JSON.parse(response)
# curl 'https://327488173822848:oydSjVr3iz4rGAGIo0JjreJRrgo@api.cloudinary.com/v1_1/dbc/resources/image'