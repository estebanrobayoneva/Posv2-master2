require 'test_helper'

class DetailPurchaseReceiptsControllerTest < ActionController::TestCase
  setup do
    @detail_purchase_receipt = detail_purchase_receipts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:detail_purchase_receipts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create detail_purchase_receipt" do
    assert_difference('DetailPurchaseReceipt.count') do
      post :create, detail_purchase_receipt: { cantidad: @detail_purchase_receipt.cantidad, valor_final: @detail_purchase_receipt.valor_final, valor_unitario: @detail_purchase_receipt.valor_unitario }
    end

    assert_redirected_to detail_purchase_receipt_path(assigns(:detail_purchase_receipt))
  end

  test "should show detail_purchase_receipt" do
    get :show, id: @detail_purchase_receipt
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @detail_purchase_receipt
    assert_response :success
  end

  test "should update detail_purchase_receipt" do
    patch :update, id: @detail_purchase_receipt, detail_purchase_receipt: { cantidad: @detail_purchase_receipt.cantidad, valor_final: @detail_purchase_receipt.valor_final, valor_unitario: @detail_purchase_receipt.valor_unitario }
    assert_redirected_to detail_purchase_receipt_path(assigns(:detail_purchase_receipt))
  end

  test "should destroy detail_purchase_receipt" do
    assert_difference('DetailPurchaseReceipt.count', -1) do
      delete :destroy, id: @detail_purchase_receipt
    end

    assert_redirected_to detail_purchase_receipts_path
  end
end
