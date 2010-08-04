class UsersController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem
  ensure_application_is_installed_by_facebook_user
  def link_user_accounts
    #~ render :text => self.current_user and return
    
  if self.current_user.nil?
    #register with fb
    User.create_from_fb_connect(facebook_session.user)
  else
    #connect accounts
    self.current_user.link_fb_connect(facebook_session.user.id) unless self.current_user.fb_user_id == facebook_session.user.id
  end
  redirect_to '/'
end

def home
  @users = facebook_session.user.friends    
  @login_user = facebook_session.user
  
  #~ render :text => @login_user and return
  #~ @user = 1412752930   # ratnakar
  
  
  #~ @user = 1712994316  #which is ratnam raju id  and he is my friend
  
  ### to post a message on users wall
  
facebook_session = Facebooker::Session.create
facebook_session.permission_url('publish_stream')
facebook_session.post 'facebook.stream.publish', :uid => @login_user, :message => 'Hi, sarma, how r u?'




  #### end   
  
   #~ facebook_session.send_notification([@user], "Hi, Raju Sir... this is notification message from rails app")
  
  #~ facebook_session.permission_url('publish_stream')
  
  #~ @login_user.send_notification(@login_user,"Holy Smokes, something is due today!")
   
  #~ post_id = @login_user.publish_to(@login_user,
            #~ :message => 'Hi this is test')
            
  #~ @login_user.post("facebook.feed.publishTemplatizedAction",
  #~ :target_ids => "", :title_template => "Testing a News Feed post on a Page posted by {actor}",
  #~ :title_data => "{}", :body_template => "Check it out yo says {name}.", 
  #~ :body_data => "{\"name\": \"cbq\"}", :body_general => "Here is the body.", :page_actor_id => "YOUR_PAGE_ID")
  
  #~ fb_session.post "facebook.auth.getSession", :auth_token => "e4d5b0dd428152c66972765fccd10ab0" 
# => {"session_key"=>"xxxxxxxx", "expires"=>"0", "uid"=>"yyyyyy"}

  
  #~ @user = 
  #~ facebook_session.user = ''
end

def test_news_feed
     FacebookerPublisher.deliver_news_feed(facebook_session.user, " A reminder from Facebooker Tutorial ", 
       " Keep checking at #{link_to("Facebooker Tutorial", outline_path(:only_path => false))} as we are adding new lessons every week.")
   render :text =>  "Check your News Feed in a little while. You should might see a news item from Facebooker Tutorial." and return
     #~ redirect_to(:action => "news_feed")
end



def post_msg
  #~ fb_session = Facebooker::Session.create
  #~ fb_session.auth_token = "e4d5b0dd428152c66972765fccd10ab0" 
  
  #~ fb_session.post("facebook.feed.publishTemplatizedAction", 
  #~ :target_ids => "", :title_template => "Testing a News Feed post on a Page posted by {actor}", 
  #~ :title_data => "{}", :body_template => "Check it out yo says {name}.", 
  #~ :body_data => "{\"gopi krishna\": \"cbq\"}", :body_general => "Hi friends", 
  #~ :page_actor_id => "")
  
#~ fbsession = Facebooker::Session.create('3c13476c517c95651fa8435b904ffb72', '03bb3bcdfb2bb064a70e645ff965e464')
#~ fbuser = facebook_session.user

#requires "publish_stream" extended permission
#~ fbuser.publish_to(fbuser, :message => "This is a post")

#~ fbsession.send_notification(fbuser.id, "<fb:fbml>some sweet fbml</fb:fbml>")
  
end

  # render new.rhtml
  def new
    @user = User.new
  end
 
  def create
    logout_keeping_session!
    @user = User.new(params[:user])
    success = @user && @user.save
    if success && @user.errors.empty?
            # Protects against session fixation attacks, causes request forgery
      # protection if visitor resubmits an earlier form using back
      # button. Uncomment if you understand the tradeoffs.
      # reset session
      self.current_user = @user # !! now logged in
      redirect_back_or_default('/')
      flash[:notice] = "Thanks for signing up!  We're sending you an email with your activation code."
    else
      flash[:error]  = "We couldn't set up that account, sorry.  Please try again, or contact an admin (link is above)."
      render :action => 'new'
    end
  end
end
