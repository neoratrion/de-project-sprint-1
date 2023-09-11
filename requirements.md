  # Требования к целевой витрине
   - Витрина должна распологаться в схеме analisys
   - Витрина должна состоять из полей:
     - user_id
     - recency (число от 1 до 5)
     - frequency (число от 1 до 5)
     - monetary_value (число от 1 до 5)
   - Глубина данных в витрине: с начала 2022 года
   - Название витрины: dm_rfm_segments
   - Обновление данных не требуется
   - Успешно выполненнный заказ: заказ со статусом closed
   
# Используемые поля
  ### для recency:
  - orders.user_id
  - orders.order_ts
  - orders.status
  ### для frequency:
  - orders.user_id
  - orders.order_id
  - orders.order_ts
  - orders.status
  ### для monetary_value:
  - orders.user_id
  - orders.cost
  - orders.status