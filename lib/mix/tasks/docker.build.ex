defmodule Mix.Tasks.Docker.Build do
  use Mix.Task

  def run(args) do
    Mix.Task.run("docker", args)
  end
end
