require 'swagger_helper'

describe 'Users API' do

  path '/users' do

    post 'Create a user' do
        tags 'Users'
        consumes 'application/json'
        produces 'application/json'
        parameter name: :body, in: :body, schema: {
            type: :object,
            properties: {
                user:{
                    type: :object
                    properties: {
                        name: {type: :string},
                        phone: {type: :string},
                    }
                }
            },
            required: [ 'name', 'phone' ]
        }
      response '200', 'User created' do
        examples 'application/json' => {
            success: 'true',
            message: 'User created'
        }
        let(:user) { { name: 'shalini', phone: '9988771122' } }
        run_test!
      end
    end
  end
end
