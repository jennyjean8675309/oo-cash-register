class CashRegister
    attr_reader :discount
    attr_accessor :total, :items, :transactions

    def initialize(discount=nil)
        @total = 0
        @discount = discount
        @items = []
        @transactions = []
    end

    def add_item(title, price, quantity=1)
        quantity.times do
            self.items << title
            self.transactions << price * quantity
        end
        self.total += price * quantity
    end

    def apply_discount
        if self.discount
            self.total = (self.total - (self.total * discount/100))
            "After the discount, the total comes to $#{self.total}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        last_transaction = self.transactions.pop
        self.total = self.total - last_transaction
    end
end
