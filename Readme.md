# **Требования и тест-кейсы**

# ***ФУНКЦИОНАЛЬНЫЕ ТРЕБОВАНИЯ***

* ПОЛЬ-001: Регистрация и авторизация
User story:
Я, как пользователь, хочу зарегистрироваться и войти в систему, чтобы получить доступ к своим данным и функциям.

Обоснование необходимости:
Регистрация и авторизация обеспечивают безопасный доступ к системе и защиту персональных данных.

Критерии приемки:

Регистрация:
При пустых полях формы система отображает ошибку: «Заполните все обязательные поля».
После успешной регистрации пользователь получает подтверждение.

Авторизация:
При вводе неверного пароля система отображает ошибку: «Неверный пароль».
При вводе несуществующих данных система отображает ошибку: «Пользователь не найден».


ПОЛЬ-002: Резервирование книг
User story:
Я, как пользователь, хочу резервировать доступные книги, чтобы гарантировать их получение.

Обоснование необходимости:
Функционал резервирования упрощает процесс выдачи книг и предотвращает конфликты.

Критерии приемки:

Резервирование:
При попытке зарезервировать уже занятую книгу система отображает ошибку: «Книга недоступна».
При резервировании несуществующей книги система отображает ошибку: «Книга не найдена».

Отображение зарезервированных книг:
Список всех зарезервированных пользователем книг, с указанием сроков ожидания.


ПОЛЬ-003: Управление библиотечной картой
User story:
Я, как пользователь, хочу создавать и редактировать библиотечную карту, чтобы корректировать свои данные.

Обоснование необходимости:
Функционал позволяет пользователям получить доступ к дополнительному функционалу.

Критерии приемки:

Создание карты:
Обязательные поля: номер карты, дата окончания действия.
При вводе некорректных данных (например, неверный формат номера) система отображает ошибку.

Редактирование карты:
Пользователь может изменить контактные данные.
После изменения данных пользователь должен получить подтверждение
При вводе некорректных данных (например, неверный формат номера) система отображает ошибку.


ПОЛЬ-003: Оплата штрафов
User story:
Я, как пользователь, хочу оплачивать свои штрафы, чтобы иметь возможность продолжать использовать функционал библиотеки

Обоснование необходимости:
Функционал позволяет пользователям оплачивать штрафы, чтобы получить доступ к функционалу, заблокированному за задолжности.

Критерии приемки:

Просмотр штрафов
Пользователю должны отображаться все штрафы, с информацией о сумме штрафа и причине получения штрафа.

Оплата штрафа
Пользователь может оплатить штрафы.
После оплаты пользователь должен получить подтверждение.


БИБ-001: Управление экземплярами книг
User story:
Я, как библиотекарь, хочу управлять экземплярами книг (добавлять, редактировать, удалять), чтобы поддерживать актуальность каталога.

Обоснование необходимости:
Функционал позволяет библиотекарю корректировать данные о книгах и их доступности.

Критерии приемки:

Добавление экземпляра:
При вводе некорректных данных система отображает ошибку.

Удаление экземпляра:
При попытке удалить несуществующий экземпляр система отображает ошибку: «Экземпляр не найден».

БИБ-002: Управление изданиями книг
User story:
Я, как библиотекарь, хочу добавлять и редактировать издания книг, чтобы обеспечить точность информации в каталоге.

Обоснование необходимости:
Функционал помогает поддерживать структурированный и полный каталог изданий.

Критерии приемки:

Добавление издания:
При пустом заголовке система отображает ошибку: «Заполните название издания».

Поиск издания:
Поиск издания по любым характеристикам издания
В случае отсутствия найденных изданий, сообщить об этом

Редактирование издания:
Возможность изменения любых полей выбранного издания


АДМ-001: Управление пользователями
User story:
Я, как администратор, хочу управлять пользователями (добавлять, удалять, редактировать), чтобы контролировать их доступ и данные в системе.

Обоснование необходимости:
Функционал управления пользователями позволяет администратору поддерживать целостность системы, устранять ошибки и обеспечивать безопасность данных.

Критерии приемки:

Создание пользователя:
При попытке создать пользователя с уже существующим именем система отображает ошибку: «Имя пользователя уже занято».
Поля имени, email и пароля обязательны для заполнения.

Удаление пользователя:
При попытке удалить несуществующего пользователя система отображает ошибку: «Пользователь не найден».

Редактирование пользователя:
Администратор может изменить роль пользователя (например, на администратора или библиотекаря).
При попытке установить недопустимую роль система отображает ошибку.


АДМ-002: Управление библиотечными картами
User story:
Я, как администратор, хочу управлять библиотечными картами пользователей (создавать, редактировать, удалять), чтобы обеспечить корректную работу системы учета.

Обоснование необходимости:
Функционал позволяет администратору поддерживать актуальность данных о пользователях и их правах.

Критерии приемки:

Создание карты:
При вводе некорректных данных система отображает ошибку.

Обновление данных:
При попытке обновить несуществующую карту система отображает ошибку: «Карта не найдена».

НЕФУНКЦИОНАЛЬНЫЕ ТРЕБОВАНИЯ

Производительность:
Время отклика системы не должно превышать 2 секунд для 95% запросов.
Система должна выдерживать до 500 одновременных пользователей.

Надежность:
Доступность системы — 99,9% в год.
Резервное копирование данных выполняется ежедневно.

Безопасность:
Данные пользователей хранятся в зашифрованном виде.
Авторизация администратора защищена двухфакторной аутентификацией.

Масштабируемость:
Система поддерживает добавление новых модулей (например, уведомлений или аналитики) без перестройки архитектуры.

Поддержка:
Обновления системы выполняются без прерывания работы.



### **Тест-кейсы**
| Номер | Описание | Шаги достижения | Ожидаемый результат |
|-------|--------------------------------------------------|------------------------------------------------|------------------------------------|
| 1 | Регистрация нового пользователя | 1. Перейти на страницу регистрации. <br> 2. Ввести уникальное имя пользователя, email и пароль. <br> 3. Нажать «Зарегистрироваться». | Пользователь успешно зарегистрирован. |
| 2 | Регистрация с уже существующим именем пользователя | 1. Перейти на страницу регистрации. <br> 2. Ввести уже зарегистрированное имя пользователя. <br> 3. Нажать «Зарегистрироваться». | Отображается ошибка «Имя пользователя уже занято». |
| 3 | Авторизация зарегистрированного пользователя | 1. Перейти на страницу входа. <br> 2. Ввести email и пароль. <br> 3. Нажать «Войти». | Пользователь успешно входит в систему. |
| 4 | Авторизация с неверным паролем | 1. Перейти на страницу входа. <br> 2. Ввести email и неверный пароль. <br> 3. Нажать «Войти». | Отображается ошибка «Неверный пароль». |
| 5 | Авторизация с несуществующим пользователем | 1. Перейти на страницу входа. <br> 2. Ввести несуществующий email и пароль. <br> 3. Нажать «Войти». | Отображается ошибка «Пользователь не найден». |

---
## **Тест сьют юзера**

### **Требования**
1. **Создание пользователя**  
   - Пользователь не может быть создан с уже существующим именем.
   - Поля имени, email и пароля обязательны для заполнения.
2. **Работа с библиотечными картами**  
   - Должна быть возможность создать библиотечную карту.
   - Должна быть возможность редактировать данные карты.
   - При вводе некорректных данных карта не создается.
   - Нельзя обновить несуществующую библиотечную карту.
3. **Резервирование книг**  
   - Пользователь должен иметь возможность зарезервировать доступную книгу.
   - Если книга уже зарезервирована, должна отображаться ошибка.
   - Нельзя резервировать несуществующую книгу.
4. **Оплата штрафов**  
   - Пользователь должен иметь возможность оплатить штраф.
   - Если средств недостаточно, должна отображаться ошибка.
   - Нельзя оплатить штраф за несуществующего пользователя.

### **Тест-кейсы**
| Номер | Описание | Шаги достижения | Ожидаемый результат |
|-------|--------------------------------------------------|------------------------------------------------|------------------------------------|
| 1 | Создание пользователя с уже существующим именем | 1. Попытаться создать нового пользователя с именем, которое уже используется. | Отображается ошибка. |
| 2 | Создание пользователя с пустыми полями | 1. Попытаться создать нового пользователя без заполнения полей. | Отображается ошибка. |
| 3 | Удаление несуществующего пользователя | 1. Попытаться удалить пользователя, которого нет в системе. | Отображается ошибка. |
| 4 | Обновление роли пользователя на недопустимую | 1. Попытаться обновить роль пользователя на несуществующую. | Отображается ошибка. |
| 5 | Создание библиотечной карты | 1. Перейти в личный кабинет. <br> 2. Создать новую библиотечную карту. | Карта успешно создана. |
| 6 | Обновление данных библиотечной карты | 1. Изменить данные в существующей библиотечной карте. | Данные успешно обновлены. |
| 7 | Резервирование книги | 1. Найти книгу и нажать «Резервировать». | Книга успешно зарезервирована. |
| 8 | Оплата штрафа | 1. Перейти в раздел штрафов. <br> 2. Оплатить штраф. | Оплата успешна. |

---
## **Тест сьюты библиотекаря**

### **Требования**
1. **Работа с экземплярами книг**  
   - Должна быть возможность добавить, редактировать, удалять и получать данные о книгах.
   - Нельзя удалить или получить данные о несуществующей книге.
2. **Работа с изданиями книг**  
   - Должна быть возможность добавить и редактировать издания книг.
   - Нельзя добавить издание книги с пустым заголовком.

### **Тест-кейсы**
| Номер | Описание | Шаги достижения | Ожидаемый результат |
|-------|--------------------------------------------------|------------------------------------------------|------------------------------------|
| 1 | Добавление экземпляра книги с некорректными данными | 1. Попытаться добавить экземпляр книги с некорректными данными. | Отображается ошибка. |
| 2 | Удаление несуществующего экземпляра книги | 1. Попытаться удалить экземпляр, которого нет в базе. | Отображается ошибка. |
| 3 | Добавление нового издания книги | 1. Добавить новое издание книги. | Издание успешно добавлено. |

---
## **Тест сьюты админа**

### **Требования**
1. **Работа с пользователями**  
   - Админ должен иметь возможность добавлять, удалять и редактировать пользователей.
   - Должна быть проверка на существование пользователя.
2. **Работа с книгами и библиотекарями**  
   - Админ должен иметь возможность управлять экземплярами книг.
   - Должна быть возможность управления правами библиотекарей.

### **Тест-кейсы**
| Номер | Описание | Шаги достижения | Ожидаемый результат |
|-------|--------------------------------------------------|------------------------------------------------|------------------------------------|
| 1 | Создание пользователя с уже существующим именем | 1. Попытаться создать нового пользователя с занятым именем. | Отображается ошибка. |
| 2 | Удаление несуществующего пользователя | 1. Попытаться удалить пользователя, которого нет. | Отображается ошибка. |
| 3 | Добавление нового издания книги | 1. Добавить новое издание книги. | Издание успешно добавлено. |

---
