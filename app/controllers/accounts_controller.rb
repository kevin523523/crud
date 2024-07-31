class AccountsController < ApplicationController
    before_action :set_account, only: [:show,:edit,:update,:destroy]
    def index
        @accounts= Account.order('created_at DESC')
    end

    def new
        @account = Account.new
    end

    def create
        @account = Account.new(account_params)
    
        if @account.save
          redirect_to root_path, success: 'Account created successfully'
        else
          render :new, error: 'Something went wrong'
        end
    end

    def show
        @courses = @account.courses.order('created_at DESC')
    end

    def edit
    end

    def update
        if @account.update(account_params)
            redirect_to account_path(@account.id),success: 'Account was updated successfully'
        else
            render :edit, error: 'Something went wrong'
        end
    end

    def destroy
        @account.destroy
        respond_to do |format|
          format.html { redirect_to accounts_url, notice: 'Account was successfully destroyed.' }
          format.json { head :no_content }
        end
    end


    private

    def set_account
        @account = Account.find(params[:id])
        rescue ActiveRecord::RecordNotFound
        redirect_to root_path, alert: 'Account not found'
    end
    
    def account_params
        params.require(:account).permit(:name, :workflow_state,:root_account_id)
    end

end

