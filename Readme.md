Тесты написаны для системы автоматизации библиотечного архива: https://github.com/Kilka0s0Tomatami/AutomaticInformationSystemLibrary2

Видео работы сервиса: https://www.youtube.com/watch?v=bQBFLgVioQc

# **Требования и тест-кейсы**

## ФУНКЦИОНАЛЬНЫЕ ТРЕБОВАНИЯ

## Функциональные требования

### ПОЛЬ-001: Регистрация и авторизация
- **User story:** Я, как пользователь, хочу зарегистрироваться и войти в систему, чтобы получить доступ к своим данным и функциям.
- **Обоснование необходимости:** Регистрация и авторизация обеспечивают безопасный доступ к системе и защиту персональных данных.
- **Критерии приемки:**
  - **Регистрация:**
    - При пустых полях формы система отображает ошибку: «Заполните все обязательные поля».
    - После успешной регистрации пользователь получает подтверждение.
  - **Авторизация:**
    - При вводе неверного пароля система отображает ошибку: «Неверный пароль».
    - При вводе несуществующих данных система отображает ошибку: «Пользователь не найден».

### ПОЛЬ-002: Резервирование книг
- **User story:** Я, как пользователь, хочу резервировать доступные книги, чтобы гарантировать их получение.
- **Обоснование необходимости:** Функционал резервирования упрощает процесс выдачи книг и предотвращает конфликты.
- **Критерии приемки:**
  - **Резервирование:**
    - При попытке зарезервировать уже занятую книгу система отображает ошибку: «Книга недоступна».
    - При резервировании несуществующей книги система отображает ошибку: «Книга не найдена».
  - **Отображение зарезервированных книг:**
    - Список всех зарезервированных пользователем книг, с указанием сроков ожидания.

### ПОЛЬ-003: Управление библиотечной картой
- **User story:** Я, как пользователь, хочу создавать и редактировать библиотечную карту, чтобы корректировать свои данные.
- **Обоснование необходимости:** Функционал позволяет пользователям получить доступ к дополнительному функционалу.
- **Критерии приемки:**
  - **Создание карты:**
    - Обязательные поля: номер карты, дата окончания действия.
    - При вводе некорректных данных система отображает ошибку.
  - **Редактирование карты:**
    - Пользователь может изменить контактные данные.
    - После изменения данных пользователь должен получить подтверждение.
    - При вводе некорректных данных система отображает ошибку.

### ПОЛЬ-003: Оплата штрафов
- **User story:** Я, как пользователь, хочу оплачивать свои штрафы, чтобы иметь возможность продолжать использовать функционал библиотеки.
- **Обоснование необходимости:** Функционал позволяет пользователям оплачивать штрафы, чтобы получить доступ к функционалу, заблокированному за задолжности.
- **Критерии приемки:**
  - **Просмотр штрафов:**
    - Пользователю должны отображаться все штрафы, с информацией о сумме штрафа и причине получения штрафа.
  - **Оплата штрафа:**
    - Пользователь может оплатить штрафы.
    - После оплаты пользователь должен получить подтверждение.

### БИБ-001: Управление экземплярами книг
- **User story:** Я, как библиотекарь, хочу управлять экземплярами книг (добавлять, редактировать, удалять), чтобы поддерживать актуальность каталога.
- **Обоснование необходимости:** Функционал позволяет библиотекарю корректировать данные о книгах и их доступности.
- **Критерии приемки:**
  - **Добавление экземпляра:**
    - При вводе некорректных данных система отображает ошибку.
  - **Удаление экземпляра:**
    - При попытке удалить несуществующий экземпляр система отображает ошибку: «Экземпляр не найден».

### БИБ-002: Управление изданиями книг
- **User story:** Я, как библиотекарь, хочу добавлять и редактировать издания книг, чтобы обеспечить точность информации в каталоге.
- **Обоснование необходимости:** Функционал помогает поддерживать структурированный и полный каталог изданий.
- **Критерии приемки:**
  - **Добавление издания:**
    - При пустом заголовке система отображает ошибку: «Заполните название издания».
  - **Поиск издания:**
    - Поиск издания по любым характеристикам издания.
    - В случае отсутствия найденных изданий, сообщить об этом.
  - **Редактирование издания:**
    - Возможность изменения любых полей выбранного издания.

### АДМ-001: Управление пользователями
- **User story:** Я, как администратор, хочу управлять пользователями (добавлять, удалять, редактировать), чтобы контролировать их доступ и данные в системе.
- **Обоснование необходимости:** Функционал управления пользователями позволяет администратору поддерживать целостность системы, устранять ошибки и обеспечивать безопасность данных.
- **Критерии приемки:**
  - **Создание пользователя:**
    - При попытке создать пользователя с уже существующим именем система отображает ошибку: «Имя пользователя уже занято».
    - Поля имени, email и пароля обязательны для заполнения.
  - **Удаление пользователя:**
    - При попытке удалить несуществующего пользователя система отображает ошибку: «Пользователь не найден».
  - **Редактирование пользователя:**
    - Администратор может изменить роль пользователя (например, на администратора или библиотекаря).
    - При попытке установить недопустимую роль система отображает ошибку.

### АДМ-002: Управление библиотечными картами
- **User story:** Я, как администратор, хочу управлять библиотечными картами пользователей (создавать, редактировать, удалять), чтобы обеспечить корректную работу системы учета.
- **Обоснование необходимости:** Функционал позволяет администратору поддерживать актуальность данных о пользователях и их правах.
- **Критерии приемки:**
  - **Создание карты:**
    - При вводе некорректных данных система отображает ошибку.
  - **Обновление данных:**
    - При попытке обновить несуществующую карту система отображает ошибку: «Карта не найдена».

## Нефункциональные требования

### Производительность
- Время отклика системы не должно превышать 2 секунд для 95% запросов.
- Система должна выдерживать до 500 одновременных пользователей.

### Надежность
- Доступность системы — 99,9% в год.
- Резервное копирование данных выполняется ежедневно.

### Безопасность
- Данные пользователей хранятся в зашифрованном виде.
- Авторизация администратора защищена двухфакторной аутентификацией.

### Масштабируемость
- Система поддерживает добавление новых модулей (например, уведомлений или аналитики) без перестройки архитектуры.

### Поддержка
- Обновления системы выполняются без прерывания работы.



# **Тест-сьюты**

## Тест-сьют авторизации

| Номер | Описание | Шаги достижения | Ожидаемый результат |
|-------|----------|-----------------|---------------------|
| 1 | Регистрация нового пользователя | 1. Открыть форму регистрации.<br>2. Ввести уникальное имя пользователя.<br>3. Ввести валидный email.<br>4. Ввести надежный пароль.<br>5. Нажать кнопку "Зарегистрироваться". | 1. Пользователь успешно зарегистрирован.<br>2. Система отображает подтверждение успешной регистрации.<br>3. Пользователь перенаправлен на страницу входа или авторизован автоматически. |
| 2 | Регистрация пользователя с уже существующим именем | 1. Открыть форму регистрации.<br>2. Ввести имя пользователя "testuser".<br>3. Ввести валидный email.<br>4. Ввести надежный пароль.<br>5. Нажать кнопку "Зарегистрироваться". | 1. Регистрация не завершается.<br>2. Система отображает сообщение об ошибке: "Имя пользователя уже занято".<br>3. Пользователь остается на странице регистрации. |
| 3 | Вход зарегистрированного пользователя | 1. Открыть форму входа.<br>2. Ввести имя пользователя "testuser".<br>3. Ввести пароль "Password123".<br>4. Нажать кнопку "Войти". | 1. Пользователь успешно авторизован.<br>2. Пользователь перенаправлен на главную страницу.<br>3. Отображаются элементы интерфейса для авторизованного пользователя. |
| 4 | Вход с неверным паролем | 1. Открыть форму входа.<br>2. Ввести имя пользователя "testuser".<br>3. Ввести неверный пароль "wrongpassword".<br>4. Нажать кнопку "Войти". | 1. Авторизация не выполнена.<br>2. Система отображает сообщение об ошибке: "Неверный пароль".<br>3. Пользователь остается на странице входа. |
| 5 | Вход несуществующего пользователя | 1. Открыть форму входа.<br>2. Ввести имя пользователя "nonexistentuser".<br>3. Ввести любой пароль.<br>4. Нажать кнопку "Войти". | 1. Авторизация не выполнена.<br>2. Система отображает сообщение об ошибке: "Пользователь не найден".<br>3. Пользователь остается на странице входа. |

## Тест-сьют пользователя

| Номер | Описание | Шаги достижения | Ожидаемый результат |
|-------|----------|-----------------|---------------------|
| 6 | Создание пользователя с существующим именем | 1. Перейти в раздел управления пользователями.<br>2. Выбрать "Создать пользователя".<br>3. Ввести имя пользователя "existinguser".<br>4. Заполнить остальные обязательные поля.<br>5. Нажать кнопку "Создать". | 1. Пользователь не создан.<br>2. Система отображает сообщение об ошибке: "Имя пользователя уже занято". |
| 7 | Создание пользователя с пустыми полями | 1. Перейти в раздел управления пользователями.<br>2. Выбрать "Создать пользователя".<br>3. Оставить поля имени, email и пароля пустыми.<br>4. Нажать кнопку "Создать". | 1. Пользователь не создан.<br>2. Система отображает сообщение об ошибке: "Заполните все обязательные поля". |
| 8 | Удаление несуществующего пользователя | 1. Перейти в раздел управления пользователями.<br>2. Выбрать "Удалить пользователя".<br>3. Ввести ID пользователя 9999.<br>4. Нажать кнопку "Удалить". | 1. Система отображает сообщение об ошибке: "Пользователь не найден". |
| 9 | Обновление роли пользователя на недопустимую | 1. Перейти в раздел управления пользователями.<br>2. Найти пользователя с ID 1001.<br>3. Выбрать "Редактировать".<br>4. Изменить роль на недопустимое значение (например, "superuser").<br>5. Нажать кнопку "Сохранить". | 1. Изменения не сохранены.<br>2. Система отображает сообщение об ошибке о недопустимой роли. |
| 10 | Создание библиотечной карты | 1. Перейти в личный кабинет.<br>2. Выбрать "Создать библиотечную карту".<br>3. Ввести корректный номер карты.<br>4. Ввести корректную дату окончания действия.<br>5. Нажать кнопку "Создать". | 1. Библиотечная карта успешно создана.<br>2. Система отображает подтверждение создания карты.<br>3. Информация о карте отображается в личном кабинете. |
| 11 | Обновление информации библиотечной карты | 1. Перейти в личный кабинет.<br>2. Выбрать "Редактировать библиотечную карту".<br>3. Изменить контактные данные.<br>4. Нажать кнопку "Сохранить". | 1. Данные карты успешно обновлены.<br>2. Система отображает подтверждение обновления.<br>3. Обновленная информация отображается в личном кабинете. |
| 12 | Создание библиотечной карты с некорректными данными | 1. Перейти в личный кабинет.<br>2. Выбрать "Создать библиотечную карту".<br>3. Ввести некорректный номер карты (например, буквы вместо цифр).<br>4. Ввести корректную дату окончания действия.<br>5. Нажать кнопку "Создать". | 1. Библиотечная карта не создана.<br>2. Система отображает сообщение об ошибке о неверном формате номера. |
| 13 | Обновление несуществующей библиотечной карты | 1. Перейти в раздел управления библиотечными картами.<br>2. Выбрать "Обновить карту".<br>3. Ввести ID карты 9999.<br>4. Нажать кнопку "Найти". | 1. Система отображает сообщение об ошибке: "Карта не найдена". |
| 14 | Успешное резервирование книги | 1. Найти книгу с ID 1001 в каталоге.<br>2. Нажать кнопку "Зарезервировать".<br>3. Подтвердить резервирование. | 1. Книга успешно зарезервирована.<br>2. Система отображает подтверждение.<br>3. Книга появляется в списке зарезервированных книг пользователя. |
| 15 | Резервирование уже зарезервированной книги | 1. Найти книгу с ID 1002 в каталоге.<br>2. Нажать кнопку "Зарезервировать". | 1. Система отображает сообщение об ошибке: "Книга недоступна". |
| 16 | Резервирование несуществующей книги | 1. Попытаться найти и зарезервировать книгу с ID 9999. | 1. Система отображает сообщение об ошибке: "Книга не найдена". |
| 17 | Успешная оплата штрафа | 1. Перейти в раздел "Штрафы".<br>2. Выбрать штраф в размере 100 рублей.<br>3. Нажать кнопку "Оплатить".<br>4. Подтвердить оплату. | 1. Штраф успешно оплачен.<br>2. Система отображает подтверждение оплаты.<br>3. Штраф исчезает из списка штрафов пользователя. |
| 18 | Оплата штрафа с недостаточными средствами | 1. Перейти в раздел "Штрафы".<br>2. Выбрать штраф в размере 500 рублей.<br>3. Нажать кнопку "Оплатить".<br>4. Подтвердить оплату. | 1. Оплата не проходит.<br>2. Система отображает сообщение о недостаточности средств.<br>3. Штраф остается в списке штрафов. |
| 19 | Оплата штрафа для несуществующего пользователя | 1. Перейти в раздел управления штрафами.<br>2. Попытаться оплатить штраф для пользователя с ID 9999. | 1. Система отображает сообщение об ошибке: "Пользователь не найден". |

## Тест-сьюты библиотекаря

| Номер | Описание | Шаги достижения | Ожидаемый результат |
|-------|----------|-----------------|---------------------|
| 20 | Создание экземпляра книги с некорректными данными | 1. Перейти в раздел управления экземплярами книг.<br>2. Выбрать "Добавить экземпляр".<br>3. Ввести некорректные данные (например, несуществующий ISBN).<br>4. Нажать кнопку "Добавить". | 1. Экземпляр не создан.<br>2. Система отображает сообщение об ошибке некорректных данных. |
| 21 | Удаление несуществующего экземпляра книги | 1. Перейти в раздел управления экземплярами книг.<br>2. Попытаться удалить экземпляр с ID 9999. | 1. Система отображает сообщение об ошибке: "Экземпляр не найден". |
| 22 | Получение несуществующего экземпляра книги | 1. Перейти в раздел управления экземплярами книг.<br>2. Попытаться найти экземпляр с ID 9999. | 1. Система отображает сообщение: "Экземпляр не найден". |
| 23 | Размещение экземпляра книги в занятой ячейке | 1. Перейти в раздел управления экземплярами книг.<br>2. Выбрать существующий экземпляр.<br>3. Попытаться поместить его в ячейку A123.<br>4. Нажать кнопку "Сохранить". | 1. Изменения не сохраняются.<br>2. Система отображает сообщение об ошибке, что ячейка уже занята. |
| 24 | Добавление нового издания книги | 1. Перейти в раздел управления изданиями книг.<br>2. Выбрать "Добавить издание".<br>3. Заполнить все необходимые поля (название, ISBN, автор и т.д.).<br>4. Нажать кнопку "Добавить". | 1. Новое издание успешно создано.<br>2. Система отображает подтверждение.<br>3. Издание появляется в каталоге. |
| 25 | Редактирование издания книги | 1. Перейти в раздел управления изданиями книг.<br>2. Найти издание с ID 1001.<br>3. Выбрать "Редактировать".<br>4. Изменить данные (например, год издания).<br>5. Нажать кнопку "Сохранить". | 1. Издание успешно обновлено.<br>2. Система отображает подтверждение.<br>3. Обновленные данные отображаются в каталоге. |
| 26 | Добавление издания книги с пустым названием | 1. Перейти в раздел управления изданиями книг.<br>2. Выбрать "Добавить издание".<br>3. Оставить поле названия пустым.<br>4. Заполнить остальные поля.<br>5. Нажать кнопку "Добавить". | 1. Издание не создано.<br>2. Система отображает сообщение об ошибке: "Заполните название издания". |
| 27 | Редактирование несуществующего издания книги | 1. Перейти в раздел управления изданиями книг.<br>2. Попытаться найти и редактировать издание с ID 9999. | 1. Система отображает сообщение об ошибке: "Издание не найдено". |
| 28 | Удаление несуществующего издания книги | 1. Перейти в раздел управления изданиями книг.<br>2. Попытаться удалить издание с ID 9999. | 1. Система отображает сообщение об ошибке: "Издание не найдено". |
| 29 | Неавторизованное добавление издания книги | 1. Попытаться получить доступ к разделу управления изданиями книг.<br>2. Попытаться добавить новое издание. | 1. Доступ запрещен.<br>2. Система отображает сообщение об ошибке доступа или перенаправляет на страницу авторизации. |
| 30 | Неудачный вход с правами администратора | 1. Открыть страницу входа для администратора/библиотекаря.<br>2. Ввести неверные учетные данные.<br>3. Нажать кнопку "Войти". | 1. Авторизация не выполнена.<br>2. Система отображает сообщение об ошибке авторизации. |

## Тест-сьюты администратора

| Номер | Описание | Шаги достижения | Ожидаемый результат |
|-------|----------|-----------------|---------------------|
| 31 | Создание экземпляра книги с некорректными данными (Админ) | 1. Перейти в раздел управления экземплярами книг.<br>2. Выбрать "Добавить экземпляр".<br>3. Ввести некорректные данные (например, несуществующий ISBN).<br>4. Нажать кнопку "Добавить". | 1. Экземпляр не создан.<br>2. Система отображает сообщение об ошибке некорректных данных. |
| 32 | Удаление несуществующего экземпляра книги (Админ) | 1. Перейти в раздел управления экземплярами книг.<br>2. Попытаться удалить экземпляр с ID 9999. | 1. Система отображает сообщение об ошибке: "Экземпляр не найден". |
| 33 | Получение несуществующего экземпляра книги (Админ) | 1. Перейти в раздел управления экземплярами книг.<br>2. Попытаться найти экземпляр с ID 9999. | 1. Система отображает сообщение: "Экземпляр не найден". |
| 34 | Размещение экземпляра книги в занятой ячейке (Админ) | 1. Перейти в раздел управления экземплярами книг.<br>2. Выбрать существующий экземпляр.<br>3. Попытаться поместить его в ячейку A123.<br>4. Нажать кнопку "Сохранить". | 1. Изменения не сохраняются.<br>2. Система отображает сообщение об ошибке, что ячейка уже занята. |
| 35 | Создание пользователя с существующим именем (Админ) | 1. Перейти в раздел управления пользователями.<br>2. Выбрать "Создать пользователя".<br>3. Ввести имя пользователя "existinguser".<br>4. Заполнить остальные обязательные поля.<br>5. Нажать кнопку "Создать". | 1. Пользователь не создан.<br>2. Система отображает сообщение об ошибке: "Имя пользователя уже занято". |
| 36 | Добавление нового издания книги (Админ) | 1. Перейти в раздел управления изданиями книг.<br>2. Выбрать "Добавить издание".<br>3. Заполнить все необходимые поля (название, ISBN, автор и т.д.).<br>4. Нажать кнопку "Добавить". | 1. Новое издание успешно создано.<br>2. Система отображает подтверждение.<br>3. Издание появляется в каталоге. |
| 37 | Редактирование издания книги (Админ) | 1. Перейти в раздел управления изданиями книг.<br>2. Найти издание с ID 1001.<br>3. Выбрать "Редактировать".<br>4. Изменить данные (например, год издания).<br>5. Нажать кнопку "Сохранить". | 1. Издание успешно обновлено.<br>2. Система отображает подтверждение.<br>3. Обновленные данные отображаются в каталоге. |
| 38 | Добавление издания книги с пустым названием (Админ) | 1. Перейти в раздел управления изданиями книг.<br>2. Выбрать "Добавить издание".<br>3. Оставить поле названия пустым.<br>4. Заполнить остальные поля.<br>5. Нажать кнопку "Добавить". | 1. Издание не создано.<br>2. Система отображает сообщение об ошибке: "Заполните название издания". |
| 39 | Редактирование несуществующего издания книги (Админ) | 1. Перейти в раздел управления изданиями книг.<br>2. Попытаться найти и редактировать издание с ID 9999. | 1. Система отображает сообщение об ошибке: "Издание не найдено". |
| 40 | Удаление несуществующего издания книги (Админ) | 1. Перейти в раздел управления изданиями книг.<br>2. Попытаться удалить издание с ID 9999. | 1. Система отображает сообщение об ошибке: "Издание не найдено". |
| 41 | Проверка безопасности при неавторизованном добавлении издания | 1. Выйти из системы.<br>2. Войти под учетной записью тестового пользователя.<br>3. Попытаться получить доступ к разделу управления изданиями книг. | 1. Доступ запрещен.<br>2. Система отображает сообщение об ошибке доступа или перенаправляет на страницу авторизации. |
| 42 | Проверка безопасности админ-панели | 1. Попытаться получить прямой доступ к админ-панели через URL.<br>2. Ввести некорректные учетные данные для входа. | 1. Доступ к админ-панели не предоставлен.<br>2. Система перенаправляет на страницу входа или отображает сообщение об ошибке авторизации. |
| 43 | Повторная проверка создания пользователя с существующим именем | 1. Перейти в раздел управления пользователями.<br>2. Выбрать "Создать пользователя".<br>3. Ввести имя пользователя "existinguser".<br>4. Заполнить остальные обязательные поля.<br>5. Нажать кнопку "Создать". | 1. Пользователь не создан.<br>2. Система отображает сообщение об ошибке: "Имя пользователя уже занято". |
| 44 | Создание пользователя с пустыми полями (Админ) | 1. Перейти в раздел управления пользователями.<br>2. Выбрать "Создать пользователя".<br>3. Оставить обязательные поля (имя, email, пароль) пустыми.<br>4. Нажать кнопку "Создать". | 1. Пользователь не создан.<br>2. Система отображает сообщение об ошибке: "Заполните все обязательные поля". |
| 45 | Удаление несуществующего пользователя (Админ) | 1. Перейти в раздел управления пользователями.<br>2. Выбрать "Удалить пользователя".<br>3. Ввести ID пользователя 9999.<br>4. Нажать кнопку "Удалить". | 1. Система отображает сообщение об ошибке: "Пользователь не найден". |
| 46 | Обновление роли пользователя на недопустимую (Админ) | 1. Перейти в раздел управления пользователями.<br>2. Найти пользователя с ID 1001.<br>3. Выбрать "Редактировать".<br>4. Попытаться изменить роль на недопустимое значение (например, "superuser").<br>5. Нажать кнопку "Сохранить". | 1. Изменения не сохраняются.<br>2. Система отображает сообщение об ошибке о недопустимой роли. |
