defmodule PragmaticStudioPhoenixLiveViewCourse.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      PragmaticStudioPhoenixLiveViewCourseWeb.Telemetry,
      # Start the Ecto repository
      PragmaticStudioPhoenixLiveViewCourse.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: PragmaticStudioPhoenixLiveViewCourse.PubSub},
      # Start Finch
      {Finch, name: PragmaticStudioPhoenixLiveViewCourse.Finch},
      # Start the Endpoint (http/https)
      PragmaticStudioPhoenixLiveViewCourseWeb.Endpoint
      # Start a worker by calling: PragmaticStudioPhoenixLiveViewCourse.Worker.start_link(arg)
      # {PragmaticStudioPhoenixLiveViewCourse.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PragmaticStudioPhoenixLiveViewCourse.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PragmaticStudioPhoenixLiveViewCourseWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
