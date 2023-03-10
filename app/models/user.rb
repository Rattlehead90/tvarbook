class User < ApplicationRecord
  include Gravtastic
  gravtastic

  after_create :send_welcome_email

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[facebook]
  has_many :posts, dependent: :destroy

  paginates_per 10

  # Friendship mechanics
  has_many :invitations
  has_many :pending_invitations, -> { where confirmed: false }, class_name: 'Invitation',
                                                                foreign_key: 'friend_id'

  def friends
    invited_by_user = Invitation.where(user_id: id, confirmed: true).pluck(:friend_id)
    invite_user = Invitation.where(friend_id: id, confirmed: true).pluck(:user_id)
    ids = invited_by_user + invite_user
    User.where(id: ids)
  end

  def friends_with?(user)
    Invitation.request_confirmed?(id, user.id)
  end

  def requested_to_be_friends_with_by?
    arr = pending_invitations.map(&:user_id)
  end

  def send_invitation(user)
    invitations.create(friend_id: user.id)
  end

  # Likes and comments mechanics
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  # Omniauth

  def self.from_omniauth(auth)
    find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name # assuming the user model has a name
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

  # Mailer

  def send_welcome_email
    UserMailer.welcome_email(self).deliver_now
  end

  # Validations 

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }
  validates :last_name, length: { maximum: 75 }
  validates :dob, comparison: { greater_than: '31-12-1899'.to_date,
                               less_than: Time.now }
  COUNTRIES = ['cs', 'en_US', 'ru', 'uk', 'es', 'it', 'de', 'fr', 'en', 'pt']
  validates :country, inclusion: { in: COUNTRIES }
end
