defmodule TPoo700T3Bst.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      TPoo700T3BstWeb.Telemetry,
      TPoo700T3Bst.Repo,
      {DNSCluster, query: Application.get_env(:t_poo_700_t3_bst, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: TPoo700T3Bst.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: TPoo700T3Bst.Finch},
      # Start a worker by calling: TPoo700T3Bst.Worker.start_link(arg)
      # {TPoo700T3Bst.Worker, arg},
      # Start to serve requests, typically the last entry
      TPoo700T3BstWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TPoo700T3Bst.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    TPoo700T3BstWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
