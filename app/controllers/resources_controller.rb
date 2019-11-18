class ResourcesController < ApplicationController
  before_action :find_resource, only: [:show, :edit, :update, :destroy]  
  before_action :authenticate_user!
    
    def index
      # @resources = Resource.all
      @resources = current_user.resources.all.order("created_at DESC")
    end
  
    def show
      @messages = Message.where(resource_id: @resource.id).order("created_at DESC")
    end
  
    def new
      @resource = current_user.resources.build
    end
  
    def edit
    end
  
    def create
      @resource = current_user.resources.build(resource_params)
      # @resource.resource_id = @resource.id
  
      if @resource.save
          redirect_to @resource
      else
          render 'new'
      end
    end
  
    def update
        if @resource.update(resource_params)
            redirect_to @resource
        else
            render 'edit'
        end
    end
  
    def destroy
        @resource.destroy
        redirect_to @resource
    end

    private
      def find_resource
        @resource = Resource.find(params[:id])
      end

      def resource_params
        params.require(:resource).permit(:grade_level, :subject, :assignment)
      end
end
