class PrototypesController < ApplicationController

  before_action :move_to_index, except: [:index, :show]
 def index
 @prototypes= Prototype.all 
end

def new
@prototypes = Prototype.new
end

def create
  Prototype.create(prototype_params)
  if @prototype.save
    redirect_to @prototype, notice: 'Prototype was successfully created.'
  else
    render :new
  end
end

def destroy
  prototype = Prototype.find(params[:id])
  prototype.destroy
  redirect_to root_path
end

def move_to_index
  unless user_signed_in?
    redirect_to action: :index
  end
end

private
def prototype_params
  params.require(:prototype).permit(:catch_copy, :concept, :image, :title).merge(user_id: current_user.id)
end

def move_to_index
  unless user_signed_in?
    redirect_to action: :index
  end
end

end
