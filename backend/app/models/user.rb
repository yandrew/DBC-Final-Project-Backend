class User < ActiveRecord::Base
  include BCrypt

	has_many :listings
	has_many :offers
	has_many :products
	has_many :products, through: :listings
	has_many :products, through: :offers

validates :username, :presence => {:message => "Type in username you must"}
  validates :username, :uniqueness => {:message => "Please stop trying to steal other people's usernames."}

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  # def create
  #   @user = User.new(params[:user])
  #   @user.password = params[:password]
  #   @user.save!
  # end

  # def self.login
  #   @user = User.find_by(username: params[:username])
  #   if @user.password == params[:password]
  #     give_token
  #     else
  #       redirect_to home_url
  #   end
  # end

end
