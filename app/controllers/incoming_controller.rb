class IncomingController < ApplicationController

   skip_before_action :verify_authenticity_token, only: [:create]
   skip_before_action :authenticate_user!

   def create
     # Take a look at these in your server logs
     # to get a sense of what you're dealing with.
     puts "INCOMING PARAMS HERE: #{params}"

     user = User.find_by(email: params[:sender])
     if user
       topic = Topic.find_or_create_by(title: params[:subject])
       bookmark = topic.bookmarks.find_or_create_by(url: params['stripped-text'])    
       head 200
     else
       head 401
     end

   end
end
