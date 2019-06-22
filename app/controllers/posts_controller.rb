# typed: true

require 'will_paginate/array'

class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  before_action :authentication_required!, except: %i[index list show]

  # GET /posts
  def index
    @posts = Post.all.order(created_at: :desc).paginate(page: params[:page], per_page: 3)
  end

  def list
    @posts = Post.all.order(created_at: :asc)
  end

  # GET /posts/1
  def show; end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit; end

  # POST /posts
  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = 'Post was successfully saved.'
      redirect_to @post
    else
      render :new
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      flash[:success] = 'Post was successfully updated.'
      redirect_to @post
    else
      render :edit
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy

    flash[:info] = 'Post was successfully destroyed.'
    redirect_to posts_url
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(
      :title, :content, :user_id, :tag_list, :tag, { tag_ids: [] }, :tag_ids
    )
  end
end
