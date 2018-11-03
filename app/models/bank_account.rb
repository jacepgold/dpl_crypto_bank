# == Schema Information
#
# Table name: bank_accounts
#
#  id             :integer          not null, primary key
#  name           :string           not null
#  balance        :float            default(0.0)
#  account_number :integer          not null
#  active         :boolean          default(TRUE)
#  user_id        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class BankAccount < ApplicationRecord
  belongs_to :user
  validates_presence_of :name, :account_number
  validates_uniqueness_of :account_number, message: 'Your account number needs to be unique'
end
