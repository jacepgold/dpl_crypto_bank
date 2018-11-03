# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Associations
  has_many :bank_accounts, dependent: :destroy
  # Validations

  # Instance Methods
  def display_name
    "#{self.last_name}, #{self.first_name}"
  end

  # Class Methods (Scopes)
  # useage: User.all.by_email
  def self.by_email
    order(:email)
  end

  # Callbacks
  # before_create
  after_create :default_bank_account
  
  
  # before_save
  # after_save
  # before_validation
  # after_validation
  private
    def default_bank_account
      account_number = rand(5000...1000000)
      if BankAccount.find_by(account_number: account_number)
        default_bank_account
      else
        self.bank_accounts.create(name: 'Default Account', account_number: account_number)
      end
    end
end
