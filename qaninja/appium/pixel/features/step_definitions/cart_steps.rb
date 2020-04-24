# frozen_string_literal: true

Dado("que eu quero comprar {string} do {string}") do |game, cat|
  @screen.home.choose_cat(cat)
  @screen.product.go_to(game)
end

Quando("eu adiciono este item ao carrinho") do
  @screen.product.add_to_cart
end

Quando ("preciso fazer login para adiciona o produto") do
  @screen.accept_popup
  @screen.login.with(@user[:email], @user[:pass])
  @screen.product.add_to_cart
end

Então("devo ver o alerta {string}") do |mensagem_esperada|
  expect(@screen.popup.text).to eql mensagem_esperada
end
Dado ("que eu adicionei os seguintes itens no meu carrinho:") do |table|
  products = table.hashes
  products.each do |product|
    @screen.home.choose_cat(product["categoria"])
    @screen.product.go_to(product["produto"])
    @screen.product.add_to_cart
    @screen.accept_popup
    2.times { @screen.home.go_back }
  end
  @screen.home.go_to_cart
  @screen.cart.refresh
end

Quando("eu finalizo a minha compra com a conta:") do |table|
  @screen.cart.checkout
  @screen.paypal_login(table.rows_hash)
  @screen.pay_pal
  @screen.wait_popup("Pixel")
end
