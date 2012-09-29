# Run this app from root with:
#
#   elixir -pa ebin --no-halt examples/simple.exs
#
Dynamo.start(:prod, __FILE__)

defmodule MyApp do
  use Dynamo.Router
  use Dynamo.App

  config :dynamo,
    compile_on_demand: false

  get "/foo/bar" do
    conn.resp_body("Hello World!")
  end
end

Code.prepend_path("deps/ranch/ebin")
Code.prepend_path("deps/cowboy/ebin")

MyApp.start.run port: 3030