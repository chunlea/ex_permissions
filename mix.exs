defmodule Permissions.MixProject do
  use Mix.Project

  def project do
    [
      app: :permissions,
      version: "0.1.0",
      elixir: "~> 1.8",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      maintainers: ["Chunlea Ju"],
      description: "WIP 🚧 A permissions library for Elixir with saving permission in binary bits",
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/chunlea/ex_permissions"}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev}
    ]
  end
end
