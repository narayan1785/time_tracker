class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name,:last_name, :email, presence: true
  validates :email, uniqueness: true

  has_many :time_trackers

  def full_name
    "#{first_name} #{last_name}"
  end

  def is_clocked_in
    TimeTracker.where(day_in: DateTime.now.beginning_of_day..DateTime.now.end_of_day, user: self)
  end
end
