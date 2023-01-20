require "application_system_test_case"

class VendasTest < ApplicationSystemTestCase
  setup do
    @venda = vendas(:one)
  end

  test "visiting the index" do
    visit vendas_url
    assert_selector "h1", text: "Vendas"
  end

  test "should create venda" do
    visit vendas_url
    click_on "New venda"

    fill_in "Atendente", with: @venda.atendente_id
    fill_in "Cliente", with: @venda.cliente_id
    fill_in "Total", with: @venda.total
    click_on "Create Venda"

    assert_text "Venda was successfully created"
    click_on "Back"
  end

  test "should update Venda" do
    visit venda_url(@venda)
    click_on "Edit this venda", match: :first

    fill_in "Atendente", with: @venda.atendente_id
    fill_in "Cliente", with: @venda.cliente_id
    fill_in "Total", with: @venda.total
    click_on "Update Venda"

    assert_text "Venda was successfully updated"
    click_on "Back"
  end

  test "should destroy Venda" do
    visit venda_url(@venda)
    click_on "Destroy this venda", match: :first

    assert_text "Venda was successfully destroyed"
  end
end
