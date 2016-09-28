require 'rails_helper'

describe Administrator::AuthorsController do
  before(:each) do
    @author = create(:author)
  end

  it 'should get index' do
    get :index
    expect(response.status).to eq 200
    expect(assigns(:authors)).to match_array(@author)
  end

  it 'should get new' do
    get :new
    expect(response.status).to eq 200
  end

  it 'should create author' do
    expect do
      post :create, author: { active: @author.active, email: @author.email, name: @author.name }
    end.to change { Author.count }.by(1)

    expect(response).to redirect_to(administrator_author_path(assigns(:author)))
  end

  it 'should show author' do
    get :show, id: @author
    expect(response.status).to eq 200
  end

  it 'should get edit' do
    get :edit, id: @author
    expect(response.status).to eq 200
  end

  it 'should update author' do
    patch :update, id: @author, author: { active: @author.active, email: @author.email, name: @author.name }

    expect(response).to redirect_to(administrator_author_path(assigns(:author)))
  end

  it 'should destroy author' do
    expect do
      delete :destroy, id: @author
    end.to change { Author.count }.by(-1)

    expect(response).to redirect_to(administrator_authors_path)
  end
end
