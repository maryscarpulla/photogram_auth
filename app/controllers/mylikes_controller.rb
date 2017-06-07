class MylikesController < ApplicationController
  def index

    @mylikes = Mylike.where(:user_id => current_user.id)

    render("mylikes/index.html.erb")
  end

  def show
    @mylike = Mylike.find(params[:id])

    render("mylikes/show.html.erb")
  end

  def new
    @mylike = Mylike.new

    render("mylikes/new.html.erb")
  end

  def create
    @mylike = Mylike.new

    @mylike.user_id = params[:user_id]
    @mylike.photo_id = params[:photo_id]

    save_status = @mylike.save

    if save_status == true
      redirect_to("/mylikes/#{@mylike.id}", :notice => "Mylike created successfully.")
    else
      render("mylikes/new.html.erb")
    end
  end

  def edit
    @mylike = Mylike.find(params[:id])

    render("mylikes/edit.html.erb")
  end

  def update
    @mylike = Mylike.find(params[:id])

    @mylike.user_id = params[:user_id]
    @mylike.photo_id = params[:photo_id]

    save_status = @mylike.save

    if save_status == true
      redirect_to("/mylikes/#{@mylike.id}", :notice => "Mylike updated successfully.")
    else
      render("mylikes/edit.html.erb")
    end
  end

  def destroy
    @mylike = Mylike.find(params[:id])

    @mylike.destroy

    if URI(request.referer).path == "/mylikes/#{@mylike.id}"
      redirect_to("/", :notice => "Mylike deleted.")
    else
      redirect_to(:back, :notice => "Mylike deleted.")
    end
  end
end
