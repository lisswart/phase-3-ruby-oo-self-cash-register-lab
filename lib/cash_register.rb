class CashRegister
    attr_accessor :total, :items, :discount, :last_transaction

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, amount, quantity = 1)
        self.total += amount * quantity
        quantity.times do
            self.items << title
        end
        self.last_transaction = amount * quantity
    end

    def apply_discount
        if discount != 0
            self.total -= (self.discount.to_f / 100) * self.total
            "After the discount, the total comes to $#{self.total.to_i}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total -= self.last_transaction
    end

end

register = CashRegister.new