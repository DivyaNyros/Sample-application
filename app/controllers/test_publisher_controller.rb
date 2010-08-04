class TestPublisherController < ApplicationController
require 'rubygems'
require 'twitter'
  #~ def publish_action_template
      #~ one_line_story_template "{*actor*} did stuff with {*friend*}"
      #~ one_line_story_template "{*actor*} did stuff"
      #~ short_story_template "{*actor*} has a title {*friend*}", render(:partial=>"short_body")
      #~ short_story_template "{*actor*} has a title", render(:partial=>"short_body")
      #~ full_story_template "{*actor*} has a title {*friend*}", render(:partial=>"full_body")
      #~ action_links action_link("My text {*template_var*}","{*link_url*}")
    #~ end

    #~ # To send a registered template, you need to create a method to set the data
    #~ # The publisher will look up the template id from the facebook_templates table
    #~ def publish_action(f)
      #~ send_as :user_action
      #~ from f
      #~ story_size SHORT # or ONE_LINE or FULL
      #~ data :friend=>"Mike"
    #~ end

    #~ # Provide a from user to send a general notification
    #~ # if from is nil, this will send an announcement
    #~ def notification(to,f)
      #~ send_as :notification
      #~ recipients to
      #~ from f
      #~ fbml "Not"
    #~ end

    #~ def email(to,f)
      #~ send_as :email
      #~ recipients to
      #~ from f
      #~ title "Email"
      #~ fbml 'text'
      #~ text fbml
    #~ end
    #~ # This will render the profile in /users/profile.fbml.erb
    #~ #   it will set @user to user_to_update in the template
    #~ #  The mobile profile will be rendered from the app/views/test_publisher/_mobile.erb
    #~ #   template
    #~ def profile_update(user_to_update,user_with_session_to_use)
      #~ send_as :profile
      #~ from user_with_session_to_use
      #~ recipients user_to_update
      #~ profile render(:file=>"users/profile.fbml.erb",:assigns=>{:user=>user_to_update})
      #~ profile_action "A string"
      #~ mobile_profile render(:partial=>"mobile",:assigns=>{:user=>user_to_update})
  #~ end

    #~ #  Update the given handle ref with the content from a
    #~ #   template
    #~ def ref_update(user)
      #~ send_as :ref
      #~ from user
      #~ fbml render(:file=>"users/profile",:assigns=>{:user=>user_to_update})
      #~ handle "a_ref_handle"
  #~ end

    #~ #  Publish a post into the stream on the user's Wall and News Feed.
    #~ def publish_stream(user_with_session_to_use, user_to_update, params)
      #~ send_as :publish_stream
      #~ from  user_with_session_to_use
      #~ target user_to_update
      #~ attachment params[:attachment]
      #~ message params[:message]
      #~ action_links params[:action_links]
    #~ end
    
    def test
         httpauth = Twitter::HTTPAuth.new('gopikushal', '<password>')
        @client = Twitter::Base.new(httpauth)
        
        #~ render :text => @client.friends_timeline.inspect and return
        
        #post message on wall
        
        #~ @client.update('Yep, I got my tweets into 
        #~ my rails application! it\'s work great')
        
        # followers
        #~ Twitter.follower_ids('gopikushal')
        
        @friends = Twitter.friend_ids('gopikushal')
    
        #~ render :text => @client.followers_count and return
        
       #~ render :text => @client.user_timeline.inspect and return  ## used to display total data
        
        ### list of tweets        
        #~ client.friends_timeline.each { |tweet| puts tweet.text }
    end

end
