class ResourcesController < ApplicationController
  before_action :find_resource, only: [:show, :edit, :update, :destroy]  
  before_action :authenticate_user!
 
  def search
    if params[:search].present?
      # @resource = Resource.search(params[:search], index_name: [Resource.searchkick_index.name, Message.searchkick_index.name])
      @resources = Resource.search params[:search], where: { user_id: current_user.id }
      @messages = Message.search(params[:search])
      # Searchkick.multi_search([@resources, @messages])
      # @resources = Resource.search(params[:search])
    else
      flash[:notice] = "No Results Found"
      # @resources = current_user.resources.all.order("created_at DESC")
      @resources = Resource.all
      @messages = Message.all
    end
  end

  def last_weeks
    @resources = current_user.resources.all.last_weeks_resources
  end

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
        params.require(:resource).permit(:grade_level, :subject, :assignment, :resource_id)
      end
end
