defmodule PhxLiveStorybookSample.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the PubSub system
      {Phoenix.PubSub, name: PhxLiveStorybookSample.PubSub},
      # Start the Endpoint (http/https)
      PhxLiveStorybookSampleWeb.Endpoint
      # Start a worker by calling: PhxLiveStorybookSample.Worker.start_link(arg)
      # {PhxLiveStorybookSample.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PhxLiveStorybookSample.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PhxLiveStorybookSampleWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
