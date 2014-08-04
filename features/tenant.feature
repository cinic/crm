# language: ru
Свойство: Создание нанимателя
  Предыстория:
    Допустим пользователь залогинен
      И он на странице создания нанимателя
  
  Сценарий: Неудачное создание нанимателя
    Если пользователь отправляет не всю информацию о нанимателе
    То он снова видит страницу добавления нанимателя с тайтлом "Новый наниматель"

  Сценарий: Удачное создание нанимателя
    Если пользователь отправляет валидную информацию о нанимателя
    То он видит страницу "Наниматель" с идентификатором