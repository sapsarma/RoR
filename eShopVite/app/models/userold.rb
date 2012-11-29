class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
 EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

 attr_accessible   :provider, :uid, :name, :address, :dob, :emailid, :firstname, :lastname, :password, :phone, :sex, :password_confirmation

 has_many :itemservice
  
  validates :emailid, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
  validates :firstname, :presence => true
  validates :lastname,  :presence => true
  validates :dob,       :presence => true
  validates :password, :confirmation => true #password_confirmation attr

  validates_length_of :password, :in => 6..20, :on => :create


  def self.authenticate(email, password)
    user = find_by_emailid(email)
    if user && user.password == BCrypt::Engine.hash_secret(password, user.salt)
      user
    else
      nil
    end
  end


def self.create_with_omniauth(auth)
  create! do |user|
    user.provider = auth["provider"]
    user.uid = auth["uid"]
    user.name = auth["info"]["name"]
  end
end

before_save :encrypt_password
after_save :clear_password

	def encrypt_password
		 if password.present?
			self.salt = BCrypt::Engine.generate_salt
			self.password= BCrypt::Engine.hash_secret(password, salt)
		end
	end

	def clear_password
		self.password = nil
	end

end
