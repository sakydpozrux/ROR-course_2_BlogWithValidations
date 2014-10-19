class MicropostController < ActionController::Base
  def index
    @microposts = Micropost.all.sort.reverse
  end

  def new
    @micropost = Micropost.new
  end

  def create
    @micropost = Micropost.new(micropost_params)

    if @micropost.save
      flash[:notice] = 'New micropost added!'
      redirect_to action: 'index'
    else
      flash[:notice] = 'Some kind of error happened when trying to save micropost. :('
      render action: 'new'
    end
  end

  def show
    @micropost = Micropost.find(params[:id])
  end

  def edit
    @micropost = Micropost.find(params[:id])
  end

  def update
    @micropost = Micropost.find(params[:id])

    if @micropost.update(micropost_params)
     flash[:notice] = 'Micropost edited!'
     redirect_to micropost_path(@micropost)
    else
     flash[:notice] = 'Some kind of error happened when trying to save micropost. :('
     render action: 'edit'
    end
  end

  def destroy
    @micropost = Micropost.find(params[:id])

    flash[:notice] = @micropost.destroy ? 'Micropost destroyed!' : 'Micropost still exists. :<'

    redirect_to micropost_index_path
  end

  private
  def micropost_params
    params.require(:micropost).permit([:title, :content])
  end
end