require 'swagger_helper'

describe 'Resources API' do

  path '/resource' do
    post 'Create a resource' do
        tags 'Resources'
        consumes 'application/json'
        produces 'application/json'
        parameter name: :data, in: :body, schema: {
            type: :object,
            properties: {
                name: {type: :string}
            },
            required: [ 'name' ]
        }
        response '200', 'Resources' do
            examples 'application/json' => {
                success: 'true',
                message: 'Resource created'
            }
            let(:data) { {name: "Filter"} }
            run_test!
        end
    end
  end

  path '/resources?id= ' do
    get 'Shows a resource with provided resource_id ' do
        tags 'Resources'
        produces 'application/json'
        parameter name: :id, :in => :query, :type => :number, :description => 'Resource id'
        response '200', 'Resources' do
            examples 'application/json' => {
                id: 1,
                name: 'dashboard'
            }
            let(:id) {1}
            run_test!
        end
    end
  end

  path '/resources?id= ' do
    delete 'Deletes a Resource with provided resource_id ' do
        tags 'Resources'
        produces 'application/json'
        parameter name: :id, :in => :query, :type => :number, :description => 'resource id'
        response '200', 'Resources' do
            examples 'application/json' => {
                success: 'true', 
                message: 'Resource deleted'
            }
            let(:id) {10}
            run_test!
        end
    end
  end



end
