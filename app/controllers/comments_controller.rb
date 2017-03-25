class CommentsController < ApplicationController
    def create
        # render plain: params.inspect
        # c = Comment.new
        # c.username = params[:username]
        # c.email = params[:email]
        # c.content = params[:content]
        # c.issue_id = params[:issue_id]
        # c.save

        c = Comment.new(comment_params);
        c.save
        issue = Issue.find(params[:issue_id])
        redirect_to issue
    end


    # <ActionController::Parameters 
    # {"utf8"=>"✓", "authenticity_token"=>"oJT80J8ySDJpuZ/xx5YctGTMiSzG8E/9tZBhggUjGnB2e1/3/RCJFgE4ynCOpp37dKObZ25Bb+Qqkf0tsftWFg==",
    #  "username"=>"adfsf", "email"=>"afeiship@gmail.com", "content"=>"asdfsdf", "commit"=>"提交评论", 
    # "controller"=>"comments", "action"=>"create", "issue_id"=>"1"} permitted: false>
    private 
        def comment_params
            params.permit(:username, :email, :content, :issue_id)
        end
end
