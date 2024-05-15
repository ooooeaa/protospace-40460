class PrototypesController < ApplicationController

 before_action :move_to_index, except: [:index, :show]

 def index
 @prototypes= Prototype.all 
end

def new
@prototypes = Prototype.new
end

def create
  @prototype = Prototype.new(prototype_params)
  if @prototype.save
    redirect_to action: :index
  else
    render :new
  end
end

def destroy
  prototype = Prototype.find(params[:id])
  prototype.destroy
  redirect_to root_path
end

def show
end

def edit
end

def update
end

private
def prototype_params
  params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
end

def move_to_index
  unless user_signed_in?
    redirect_to action: :index
  end
end

end
