require 'rails_helper'

describe Administrator::PagesController do
  before(:each) do
    @page = create(:page)
  end

  it 'should get index' do
    get :index
    expect(response.status).to eq 200
    expect(assigns(:pages)).to match_array(@page)
  end

  it 'should get new' do
    get :new
    expect(response.status).to eq 200
  end

  it 'should create page' do
    expect do
      post :create, page: { author_id: Author.first.id, body: @page.body, published: @page.published, title: @page.title }
    end.to change { Page.count }.by(1)

    expect(response).to redirect_to(page_path(assigns(:page)))
  end

  it 'should get edit' do
    get :edit, id: @page
    expect(response.status).to eq 200
  end

  it 'should update page' do
    patch :update, id: @page, page: { author_id: Author.first.id, body: @page.body, published: @page.published, title: @page.title }

    expect(response).to redirect_to(page_path(assigns(:page)))
  end

  it 'should destroy page' do
    expect do
      delete :destroy, id: @page
    end.to change { Page.count }.by(-1)

    expect(response).to redirect_to(administrator_pages_path)
  end
end
