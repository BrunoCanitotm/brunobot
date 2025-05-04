defmodule BrunobotTest do
  use ExUnit.Case
  doctest Brunobot

  test "greets the world" do
    assert Brunobot.hello() == :world
  end
end
