require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe QuestionsController do
  
  # integrate_views
  #   
     def sign_in_as(user)
       @controller.current_user = user
       return user
     end
  #   
     before(:each) do
       sign_in_as(@user = Factory(:email_confirmed_user))
     end
  # 
     def mock_question(stubs={})
       @mock_question ||= mock_model(Question, stubs)
     end
     
     def mock_prompt(stubs={})
       @mock_prompt ||= mock_model(Prompt, stubs)
     end
     
     def mock_appearance(stubs={})
       @mock_appearance||= mock_model(Appearance, stubs)
     end
  # 
  #   describe "GET index" do
  #     it "assigns all questions as @questions" do
  #       Question.stub!(:find).with(:all).and_return([mock_question])
  #       get :index
  #       assigns[:questions].should == [mock_question]
  #     end
  #   end
  # 
     describe "GET show normal" do
       before(:each) do
         Question.stub!(:find).with("37").and_return(mock_question)
	 mock_question.stub!(:picked_prompt).and_return(mock_prompt)
       end

       it "assigns the requested question as @question" do
         Question.stub!(:find).with("37").and_return(mock_question)
	 #TODO it shouldn't call this unless we are generating an appearance, right?

         get :show, :id => "37"
         assigns[:question].should equal(mock_question)
         assigns[:prompt].should equal(mock_prompt)
         assigns[:a].should be_nil
       end

       #TODO this is not a particularly intutive param to pass in order to create an appearance
       it "creates an appearance when a visitor identifier is a param" do
	 @user.stub!(:record_appearance).with("somelongunique32charstring", mock_prompt).and_return(mock_appearance)
         get :show, :id => "37", :visitor_identifier => "somelongunique32charstring"
         assigns[:question].should equal(mock_question)
         assigns[:prompt].should equal(mock_prompt)
         assigns[:a].should equal(mock_appearance)

       end
     end
  # 
  #   describe "GET new" do
  #     it "assigns a new question as @question" do
  #       Question.stub!(:new).and_return(mock_question)
  #       get :new
  #       assigns[:question].should equal(mock_question)
  #     end
  #   end
  # 
  #   describe "GET edit" do
  #     it "assigns the requested question as @question" do
  #       Question.stub!(:find).with("37").and_return(mock_question)
  #       get :edit, :id => "37"
  #       assigns[:question].should equal(mock_question)
  #     end
  #   end
  # 
  #   describe "POST create" do
  # 
  #     describe "with valid params" do
  #       it "assigns a newly created question as @question" do
  #         Question.stub!(:new).with({'these' => 'params'}).and_return(mock_question(:save => true))
  #         post :create, :question => {:these => 'params'}
  #         assigns[:question].should equal(mock_question)
  #       end
  # 
  #       it "redirects to the created question" do
  #         Question.stub!(:new).and_return(mock_question(:save => true))
  #         post :create, :question => {}
  #         response.should redirect_to(question_url(mock_question))
  #       end
  #     end
  # 
  #     describe "with invalid params" do
  #       it "assigns a newly created but unsaved question as @question" do
  #         Question.stub!(:new).with({'these' => 'params'}).and_return(mock_question(:save => false))
  #         post :create, :question => {:these => 'params'}
  #         assigns[:question].should equal(mock_question)
  #       end
  # 
  #       it "re-renders the 'new' template" do
  #         Question.stub!(:new).and_return(mock_question(:save => false))
  #         post :create, :question => {}
  #         response.should render_template('new')
  #       end
  #     end
  # 
  #   end
  # 
  #   describe "PUT update" do
  # 
  #     describe "with valid params" do
  #       it "updates the requested question" do
  #         Question.should_receive(:find).with("37").and_return(mock_question)
  #         mock_question.should_receive(:update_attributes).with({'these' => 'params'})
  #         put :update, :id => "37", :question => {:these => 'params'}
  #       end
  # 
  #       it "assigns the requested question as @question" do
  #         Question.stub!(:find).and_return(mock_question(:update_attributes => true))
  #         put :update, :id => "1"
  #         assigns[:question].should equal(mock_question)
  #       end
  # 
  #       it "redirects to the question" do
  #         Question.stub!(:find).and_return(mock_question(:update_attributes => true))
  #         put :update, :id => "1"
  #         response.should redirect_to(question_url(mock_question))
  #       end
  #     end
  # 
  #     describe "with invalid params" do
  #       it "updates the requested question" do
  #         Question.should_receive(:find).with("37").and_return(mock_question)
  #         mock_question.should_receive(:update_attributes).with({'these' => 'params'})
  #         put :update, :id => "37", :question => {:these => 'params'}
  #       end
  # 
  #       it "assigns the question as @question" do
  #         Question.stub!(:find).and_return(mock_question(:update_attributes => false))
  #         put :update, :id => "1"
  #         assigns[:question].should equal(mock_question)
  #       end
  # 
  #       it "re-renders the 'edit' template" do
  #         Question.stub!(:find).and_return(mock_question(:update_attributes => false))
  #         put :update, :id => "1"
  #         response.should render_template('edit')
  #       end
  #     end
  # 
  #   end
  # 
  #   describe "DELETE destroy" do
  #     it "destroys the requested question" do
  #       Question.should_receive(:find).with("37").and_return(mock_question)
  #       mock_question.should_receive(:destroy)
  #       delete :destroy, :id => "37"
  #     end
  # 
  #     it "redirects to the questions list" do
  #       Question.stub!(:find).and_return(mock_question(:destroy => true))
  #       delete :destroy, :id => "1"
  #       response.should redirect_to(questions_url)
  #     end
  #   end
  
end
