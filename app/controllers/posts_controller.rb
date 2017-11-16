class PostsController < ApplicationController

     def index
          @posts = Post.all
     end

     def new
          @post = Post.new
     end

     def edit
          @post = Post.find(params[:id])
     end

     def create
          @post = Post.new(post_params)
          if @post.save
               flash[:notice] = "Post was successfully submitted"
               redirect_to post_path(@post)
          else
               render 'new'
          end
     end

          def update
               @post =Post.find(params[:id])
               if @post.update(post_params)
                    flash[:notice] = "Post was updated and submitted"
                    redirect_to post_path(@post)
               else
                    render 'edit'
               end
          end

          def show
               @post = Post.find(params[:id])
          end

     private
     def post_params
          params.require(:post).permit(:content)
     end
end
