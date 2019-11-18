class MessagesController < ApplicationController
    before_action :find_message, only: [:show, :edit, :update, :destroy]
    # before_action :find_resource
    before_action :authenticate_user!
  
    def index
      # @messages = Message.all
      # @messages = current_user.messages.all
      @messages = Message.all.order("created_at DESC")
    end
  
    def show
    end
  
    def new
      @message = Message.new
      # @message = current_user.messages.build
    end
  
    def edit
    end
  
    def create
        @message = Message.new(message_params)
        @message.user_id = current_user.id
        @message.resource_id = @resource.id
      
        if @message.save
            redirect_to @resource
        else
            render 'new'
        end
    end
  
    def update
      @message.update(message_params)
    #     if @message.update(message_params)
    #         redirect_to messages_path(current_user, @messages), notice: 'Message was successfully updated.'
    #     else
    #         render 'edit'
    #     end
    end
  
    def destroy
        @message.destroy
        redirect_to @message
    end
  
    private
      def find_message
        @message = Message.find(params[:id])
      end
  
    # def find_resource
    #   @resource = Resource.find(params[:resource_id])
    # end

      def message_params
        params.require(:message).permit(:title, :description)
      end
end
