defmodule TodoPhoenix_2.ItemControllerSpec do
  import TodoPhoenix_2.Factory
  use ESpec.Phoenix, controller: TodoPhoenix_2.ItemController

  describe "index" do
    let :item, do: build(:item)

    before do
      allow Repo |> to accept(:all, fn
        TodoPhoenix_2.Item -> [item]
      end)
    end

    subject do: action(:index)

    it do: should be_successful
    it do: should render_template("index.html")
    it do: should have_in_assigns(items: [item])
  end
end
