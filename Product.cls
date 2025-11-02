public class Product {
    String productsCode,name;
    decimal price,discount,dicountPrice,totalPrice;
    Integer stock;
    public void products(String productsCode,String name,decimal price,decimal discount,Integer stock){
        this.productsCode = productsCode;
        this.name = name;
        this.price = price;
        this.discount = discount;
        this.stock = stock;
    }
    public void billing(Integer quantity){
        if(quantity <= this.stock){
            dicountPrice = (quantity * this.price) * this.discount;
            totalPrice = (quantity * this.price) - dicountPrice;
            this.stock-= quantity;
            system.debug(' : : : : : Product Bill : : : : : : ');
            system.debug(' :: Name = ' + this.name);
            system.debug(' :: Price = ' + this.price);
            system.debug(' :: Discount = ' + this.discount);
            system.debug(' :: Order quantity = ' + quantity);
            system.debug(' :: dicountPrice = ' + dicountPrice);
            system.debug(' :: Total Price = ' + totalPrice);
        }else{
            system.debug('Not Enough Stock Available');
        }
    }
    public void searchProduct(String searchCode){
        if(productsCode == searchCode){
            system.debug(' : : : : : Serched Products : : : : : : ');
            system.debug(' :: Products Name = ' + this.name); 
            system.debug(' :: Products Code = ' + this.productsCode); 
            system.debug(' :: Available Stock = ' + this.stock);    
        }else{
            system.debug(searchCode +' :: This Product is Not Available');
        }
    }
    public void displayReorder(Integer reStock){
        if(this.stock < 10){      // we check need to reorder
            this.stock += reStock;
            if(this.stock <= 20){     // check limit of reorder stock
                system.debug(' : : : : : Reorder Products : : : : : : ');
                system.debug(' :: Product Name = '+ this.name);
                system.debug(' :: Stock = '+ this.stock);
            }else{
                system.debug(' Reorder stock add to current stock its more than the Limit. order below or Equalthe Limit ');
            }
        }else {
            system.debug(' Already We Have Enough of Stock No need to Reorder');
        }
    }  
}