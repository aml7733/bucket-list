class BucketsController < ApplicationController
  before_action :authentcate_user!, except: [:home]
  before_action :find_bucket, only: [:show, :edit, :update, :destroy]

  def home
  end

  def index
    @buckets = current_user.buckets
  end

  def new
    @bucket = Bucket.new
  end

  def create
    @bucket = Bucket.new(bucket_params)
    if @bucket.save
      redirect_to bucket_path(@bucket), notice: "Bucket successfully created."
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @bucket.update(bucket_params)
    if @bucket.save
      redirect_to user_bucket_path(current_user, @bucket), notice: "Bucket successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @bucket.destroy
    redirect_to user_path(current_user)
  end

  private

  def bucket_params
    params.require(:bucket).permit(:name, :description, :user_id, item_ids:[], item_attributes: [:name]))
  end

  def find_bucket
    @bucket = Bucket.find_by(id: params[:id])
  end
end
