describe 'Product service', ->
  $httpBackend = null
  Product = null

  beforeEach ->
    module 'Shop'
    inject ($injector, _$httpBackend_)->
      Product = $injector.get("Product")
      $httpBackend = _$httpBackend_

  it "Fetches products from the backend", ->
    $httpBackend.expectGET("/shop/products").respond([{test : "cats"}])
    products = Product.all()
    $httpBackend.flush()
    expect(products[0].test).toEqual "cats"
