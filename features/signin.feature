# language: ru
Свойство: Авторизация
  Предыстория:
    Допустим пользователь имеет аккаунт
      И пользователь на странице входа
  
  Сценарий: Неудачный вход
    Если пользователь отправляет невалидную информацию
    То он должен видеть сообщение об ошибке

  Сценарий: Удачный вход
    Если пользователь отправляет валидную информацию
    То он видит страницу Дашбоард
      И он видит ссылку Выход