public virtual class ProductInformation {
    public Integer stock;
    public Decimal Price=0,discount=0,discountPrice,totalPrice;
    public String name,code;
    public ProductInformation(){}
    public ProductInformation(String code,String name,Decimal Price,Decimal discount,Integer stock){
        this.code = code;
        this.name = name;
        this.Price = Price;
        this.discount = discount;
        this.stock = stock;
        
    }
}