class ResourcesController < ApplicationController
    before_action :authenticate_user!
    before_action :find_resource, only: [:show, :edit, :update, :destroy]
    
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
        @resource = Resource.new(resource_params)
        @resource.user_id = current_user.id
        # @resource.resource_id = @resource.id
  
        if @resource.save
            redirect_to resource_path(current_user, @resource), notice: 'Resource created.'
        else
            @errors = @resource.errors.full_messages
            render :new
        end
    end
  
    def update
        if @resource.update(resource_params)
            redirect_to user_resource_path(current_user, @resource), notice: 'Resource updated.'
        else
            render :edit
        end
      end
    end
  
    def destroy
        @resource.destroy
        respond_to do |format|
        redirect_to resources_url(current_user), notice: "Resource deleted."
    end

    private
      def find_resource
        @resource = Resource.find(params[:id])
      end

      def resource_params
        params.require(:resource).permit(:grade_level, :subject, :assignment, :user_id, :parent_id, :student_id)
      end
  end
