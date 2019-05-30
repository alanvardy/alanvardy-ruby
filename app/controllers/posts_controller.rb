# frozen_string_literal: true

require 'will_paginate/array'

class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  before_action :authentication_required!, except: %i[index list show]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all.order(created_at: :desc).paginate(page: params[:page], per_page: 3)
  end

  def list
    @posts = Post.all.order(created_at: :asc)
  end

  # GET /posts/1
  # GET /posts/1.json
  def show; end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit; end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        flash[:success] = 'Post was successfully saved.'
        format.html { redirect_to @post }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        flash[:success] = 'Post was successfully updated.'
        format.html { redirect_to @post }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      flash[:info] = 'Post was successfully destroyed.'
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:title, :content, :user_id, :tag_list, :tag, { tag_ids: [] }, :tag_ids)
  end
end
