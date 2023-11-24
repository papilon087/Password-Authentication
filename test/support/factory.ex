defmodule RealDealApi.Support.Factory do
  alias RealDealApi.Accounts.Account
  use ExMachina.Ecto, repo: RealDealApi.Repo

  def account_factory do
    %Account{
      email: Faker.Internet.email(),
      hash_password: Faker.Internet.slug()
    }
  end
end
