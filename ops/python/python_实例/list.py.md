```python
product_list = [
    ('iphone',5988),
    ('Watch',10600),
    ('iphone',5988),
    ('windows_10',5499),
]        #产品list
shopping_list =[]
salary = input("input your salary: ")
if salary.isdigit():   #判断是否是整数
    salary = int(salary)
    while True:
        for index, item in enumerate(product_list):
            #print(product_list.index(item),item)   #打印产品下标
            print(index,item)
        user_chioce = input("选择商品>>>： ")
        if user_chioce.isdigit():
            user_chioce = int(user_chioce)
            if user_chioce < len(product_list) and user_chioce > -1:    #选择商品下标
                p_item = product_list[user_chioce]
                if p_item[1] <= salary:         #商品价格小于等于工资
                    shopping_list.append(p_item)   #将商品放入购物车
                    salary -= p_item[1]        #扣钱
                    print("Added %s into shopping cart,your current balace is \033[31;1m%s\033[0m" %(p_item,salary))   #余额
                else:
                    print("\033[32;1m你的money不足\033[0m")   
            else:
                print("product_list code [%s] is not exist!!"% user_chioce)   #商品下标不存在
        elif user_chioce == 'q':   #选择退出；打印已购物品和余额
            print("-----------shopping list-----------")
            for p in shopping_list:
                print(p)
            print('Your current balance:', salary)
            exit()
        else:
            print('Invalid option. Please select again')
```