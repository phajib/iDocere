class MessagesController < ApplicationController
    before_action :authenticate_teacher!
    before_action :find_message, only: [:show, :edit, :update, :destroy]
  
    def index
      # @messages = Message.all
      # @messages = current_teacher.messages.all
      @messages = Message.all.order("created_at DESC")
    end
  
    def show
    end
  
    def new
      @message = current_teacher.messages.build
    end
  
    def edit
    end
  
    def create
        @message = Message.new(message_params)
        @message.teacher_id = current_teacher.id
        @message.resource_id = @resource.id
      
        if @message.save
            redirect_to root_path @message, notice: 'Message was successfully created.' }
        else
            @errors = @message.errors.full_messages
            render 'new'
        end
      end
    end
  
    def update
        if @message.update(message_params)
            redirect_to messages_path (current_user, @message), notice: 'Message was successfully updated.'
        else
            render 'edit'
        end
      end
    end
  
    def destroy
        @message.destroy
        redirect_to messages_url, notice: 'Message was successfully destroyed.'
    end
  
    private
      def find_message
        @message = Message.find(params[:id])
      end
  
      def message_params
        params.require(:message).permit(:title, :description)
      end
  end
  