class MicropostController < ActionController::Base
  def index
    @microposts = Micropost.all
  end

  def new
    @micropost = Micropost.new
  end

  def create
    @micropost = Micropost.new(params.require(:micropost).permit(:title, :content))

    #binding.pry

    if @micropost.save
      redirect_to micropost_index_path
    else
      render 'new'
    end
  end

  def show

  end

  def edit

  end

  def update

  end

  def destroy

  end
end