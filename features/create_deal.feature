# language: ru
Свойство: Создание сделки
  
  Сценарий: Неудачное создание сделки
    Если пользователь отправляет невалидную информацию о сделке
    То он должен видеть сообщение об ошибке

  Сценарий: Удачное создание сделки
    Если пользователь отправляет валидную информацию о сделке
    То он видит сообщение об успешно добавленой сделке
      И он видит идентификатор сделки