module Example
  class HelloWorld < Grape::API
    get '/hello_world' do
      { message: 'hello world' }
    end
  end
end
