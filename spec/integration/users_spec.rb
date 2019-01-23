require 'swagger_helper'

describe 'Users API' do

  path 'users' do

    post 'Create a user' do
        tags 'Users'
        consumes 'application/json'
        produces 'application/json'
        parameter name: :body, in: :body, :description => 'User Details', schema: {
            type: :object,
            properties:{
                user:{
                    type: :object
                    properties: {
                        name: {type: :string},
                        phone: {type: :string},
                    }
                }
            }
        }
      response '200', 'User created' do
        examples 'application/json' => {
            success: 'true',
            message: 'User created'
        }
        let(:user) {
            let(:name) {"shallini"}
            let(:phone) {"1010101099"}
        }
        run_test!
      end
    end
  end
end
