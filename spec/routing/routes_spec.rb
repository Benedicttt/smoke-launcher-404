require 'rails_helper'
  RSpec.describe :launcher, type: :routing do
    context "request", :type => :request do

      context 'homepage 200' do
        it "renders the index template" do
          expect(get: '/homepage').to route_to("homepage#homepage")
        end

        it "http code" do
          get '/homepage'
          expect(response).to have_http_status(200)
        end
      end

      context '/smoke_binomo 200' do
        it '' do
          expect(get: "/binomo/smoke_binomo" ).to route_to("binomo/smoke_binomo#smoke_binomo")
        end
        it '' do
          expect(post: "/binomo/smoke_binomo" ).to route_to("binomo/smoke_binomo#create")
        end
        it '' do
          get "/binomo/smoke_binomo"
          expect(response).to have_http_status(200)
        end
      end

      context '/smoke_binpartner 200' do
        it '' do
          expect(get: "/binpartner/smoke_binpartner" ).to route_to("binpartner/smoke_binpartner#smoke_binpartner")
        end
        it '' do
          expect(post: "/binpartner/smoke_binpartner" ).to route_to("binpartner/smoke_binpartner#create")
        end
        it '' do
          get "/binpartner/smoke_binpartner"
          expect(response).to have_http_status(200)
        end
      end

      context '/api_request 200' do
        it '/homepage/api_request' do
          expect(get: "/homepage/api_request" ).to route_to("homepage/api_request#api_request")
        end

        it '/homepage/api_request' do
          expect(post: "/homepage/api_request" ).to route_to("homepage/api_request#create")
        end
        it '/api_request' do
          get "/homepage/api_request"
          expect(response).to have_http_status(200)
        end
      end

      context '/need_link 200' do
        it '/need_link' do
          expect(get: "/homepage/need_link" ).to route_to("homepage/need_link#need_link")
        end

        it '/need_link' do
          get "/homepage/need_link"
          expect(response).to have_http_status(200)
        end

        it '/status' do
          get "/homepage/status_code_pages"
          expect(response).to have_http_status(200)
        end

        it '/status_code_pages' do
          expect(post: "/homepage/status_code_pages" ).to route_to("homepage/status_code_pages#create")
        end
      end
    end
  end
