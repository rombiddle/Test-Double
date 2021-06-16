# Swift version from [Mocks Aren't Stubs](https://martinfowler.com/articles/mocksArentStubs.html#RegularTests)

> We want to take an order object and fill it from a warehouse object. The order is very simple, with only one product and a quantity. The warehouse holds inventories of different products. When we ask an order to fill itself from a warehouse there are two possible responses. If there’s enough product in the warehouse to fill the order, the order becomes filled and the warehouse’s amount of the product is reduced by the appropriate amount. If there isn’t enough product in the warehouse then the order isn’t filled and nothing happens in the warehouse...