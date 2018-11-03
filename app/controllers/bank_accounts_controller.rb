class BankAccountsController < ApplicationController
  # before_action :set_bank_account, only: [:show, :edit, :update, :destroy]
  before_action :set_bank_account, except: [:index, :new, :create]

  def index
    @bank_accounts = current_user.bank_accounts
  end

  def show
  end

  def new
  end

  def create
    @bank_account = current_user.BankAccounts.create(bank_account_params)
    if @bank_account.save
      
    else

    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def bank_account_params
      params.require(:bank_account).permit(:name, :account_number, :active, :balace)
    end

    def set_bank_account
      # @bank_account = BankAccount.find(params[:id]) # PROBLEM! Not finding bank account associated with user
      @bank_account = current_user.bank_accounts.find(params[:id])
    end
end
