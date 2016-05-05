require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

  let(:valid_attributes){
    {
      title: "Hello sahu", description: "Google sjhsadj fais jfdklas"
    }
  }

  let(:valid_comment_attributes){
    {
       description: "Google sjhsadj fais jfdklas"
    }
  }
  let(:invalid_attributes){
    {
      title: nil, description: nil
    }
  }

  let(:invalid_comment_attributes){
    {
       description: nil
    }
  }


  let(:valid_session){
    {}
  }

  describe "POST #create" do
    context "with valid params" do

      it "creates a new Comment" do
        post1 = Post.create!(valid_attributes)
        expect {
          post :create, {:comment => valid_comment_attributes, post_id: post1.id}, valid_session
        }.to change(Comment, :count).by(1)
      end

      it "assigns a newly created comment as @comment" do
        post1 = Post.create!(valid_attributes)
        post :create, {:comment => valid_comment_attributes, post_id: post1.id}, valid_session
        expect(assigns(:comment)).to be_a(Comment)
        expect(assigns(:comment)).to be_persisted
      end

      it "redirects to the last post" do
        post1 = Post.create!(valid_attributes)
        post :create, {:comment => valid_comment_attributes, post_id: post1.id}, valid_session
        expect(response).to redirect_to(post1)
      end
    end

      context "with invalid params" do

        it "assigns a newly created but unsaved post as @post" do
          post1 = Post.create!(valid_attributes)
          post :create, {:comment => invalid_comment_attributes, post_id: post1.id}, valid_session
          expect(assigns(:comment)).to be_a_new(Comment)
        end

        # it "re renders the new template" do
        #   post1 = Post.create!(valid_attributes)
        #   post :create, {:comment => invalid_comment_attributes, post_id: post1.id}, valid_session
        #   expect(response).to render_template("create")
        # end

      end
  end

  describe "GET #edit" do
    it "assigns the requested comment as @comment" do
      post1 = Post.create! valid_attributes
      comment = post1.comments.create! valid_comment_attributes
      get :edit, { post_id: post1.id, :id => comment.to_param}, valid_session
      expect(assigns(:comment)).to eq(comment)
    end
  end

  describe "PUT #update" do

    context "with valid params" do

      let(:new_attributes){
          {
            description: " 23423432 Google sjhsadj fais jfdklas"
          }
      }

      it "assign the requsted comment as @comment" do
        post1 = Post.create!(valid_attributes)
        comment = post1.comments.create!(valid_comment_attributes)
        put :update, { :id => comment.to_param, :comment => valid_attributes, post_id: post1.id }, valid_session
        expect(assigns(:comment)).to eq(comment)
      end

      it "updates the requested comment" do
        post1 = Post.create!(valid_attributes)
        comment = post1.comments.create!(valid_comment_attributes)
        put :update, { :id => comment.to_param, :comment => new_attributes, post_id: post1.id }, valid_session
        comment.reload
        expect(comment.description).to eq(new_attributes[:description])
      end

      it "redirects to the commented post" do
        post1 = Post.create!(valid_attributes)
        comment = post1.comments.create!(valid_comment_attributes)
        put :update, { :id => comment.to_param, :comment => valid_attributes, post_id: post1.id }, valid_session
        expect(response).to redirect_to(post1)
      end

    end

    context "with invalid params" do

      it 'assign the comment to @comment' do
        post1 = Post.create!(valid_attributes)
        comment = post1.comments.create!(valid_comment_attributes)
        put :update, { :id => comment.to_param, :comment => invalid_comment_attributes, post_id: post1.id }, valid_session
        expect(assigns(:comment)).to eq(comment)
      end

      it 're render to edit' do
        post1 = Post.create!(valid_attributes)
        comment = post1.comments.create!(valid_comment_attributes)
        put :update, { :id => comment.to_param, :comment => invalid_comment_attributes, post_id: post1.id }, valid_session
        expect(response).to render_template("edit")
      end

    end

  end

  describe "DELETE #destroy" do

    it "destroy the requested comment" do
      post1 = Post.create! valid_attributes
      comment = post1.comments.create! valid_comment_attributes
      expect{
          delete :destroy, { :post_id => post1.id, :id => comment.to_param }, valid_session
        }.to change(Comment, :count).by(-1)
    end

    it "redirects to the post" do
      post1 = Post.create!(valid_attributes)
      comment = post1.comments.create! valid_comment_attributes
      delete :destroy, { :post_id => post1.id, :id => comment.to_param }, valid_session
      expect(response).to redirect_to(post1)
    end

  end

end
