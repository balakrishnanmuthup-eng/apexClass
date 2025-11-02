public class SuperMarket extends ProductInformation{
    Map<String,List<ProductInformation>> productInformationMap = new Map<String,List<ProductInformation>>();
    List<ProductInformation> productList = new List<ProductInformation>();
    List<ProductInformation> productWithMapList = new List<ProductInformation>();
    public SuperMarket(){
        ProductInformation productList1 = new ProductInformation('P001','Laptop',50000,15,19);
        ProductInformation productList2 = new ProductInformation('P002','keyboard',1000,10,20);
        ProductInformation productList3 = new ProductInformation('P003','Mouse',500,5,20);
        productList.add(productList1);
        productList.add(productList2);
        productList.add(productList3);
        for(ProductInformation product : productList){
            productInformationMap.put(product.code,new List<ProductInformation>{product});
        } 
    }

    public void billingProduct(Integer quantity){
        for(List<ProductInformation> SingleProduct : productInformationMap.values()){
            productWithMapList.addAll(SingleProduct);
        }
        for(ProductInformation product : productWithMapList){
            if(quantity <= product.stock){
                discountPrice = (quantity * product.price) * (product.discount/100);
                totalPrice = (quantity * product.price) - discountPrice;
                product.stock -=  quantity;
                productInformationMap.put(product.code,new List<ProductInformation>{product});
                system.debug(' : : : : : : : :  : : : : : : Product Bill : : : : : : : : : : : : : : : ');
                system.debug(' :: Name           = ' + product.name);
                system.debug(' :: Name           = ' + product.code);
                system.debug(' :: Price          = ' + product.price);
                system.debug(' :: Discount       = ' + product.discount);
                system.debug(' :: Order quantity = ' + quantity);
                system.debug(' :: dicountPrice   = ' + discountPrice);
                system.debug(' :: Total Price    = ' + totalPrice);
            }else{
                system.debug(' : : : : : : : :  : : : : : : Product Bill : : : : : : : : : : : : : : : ');
                system.debug(' : : : : : Not Enough Stock Available : : : : : ');
            }  
        }
    }
    
    public void stockReorder(Integer reStock){
        for(ProductInformation product : productWithMapList){
            if(product.stock < 10){                                        // check need to reorder
                product.stock += reStock;
                if(product.stock <= 20){                                              // check limit of reorder stock
                    productInformationMap.put(product.code,new List<ProductInformation>{product});
                    system.debug(' : : : : : : : :  : : : : : : Reorder Products : : : : : : : : : : : : : : : ');
                    system.debug(' :: Product Name = '+ product.name);
                    system.debug(' :: Stock        = '+ product.stock);
                }else{
                    system.debug(' : : : : : : : : : : : : : : : : : :Reorder Products : : : : : : : : : : : : : : : : : : : ');
                    system.debug(' Reorder stock add to current stock its more than the Limit. order below or Equalthe Limit ');
                }
            }else {
                system.debug(' Already We Have Enough of Stock No need to Reorder');
            }
        } 
    }
    
    public void stockDisplay(){
        for(ProductInformation product : productWithMapList){
            system.debug(' : : : : : : : : : : :  : : Display Products : : : : : : : : : : : : :  ');
            system.debug(' :: Products Name    = ' + product.name); 
            system.debug(' :: Products Code    = ' + product.Code); 
            system.debug(' :: Available Stock  = ' + product.stock);
            system.debug(' :: dicountPrice     = ' + product.discountPrice);
            system.debug(' :: Total Price      = ' + product.totalPrice);
            
        }
    }
}